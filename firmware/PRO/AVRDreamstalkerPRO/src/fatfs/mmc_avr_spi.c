/*-----------------------------------------------------------------------*/
/* MMCv3/SDv1/SDv2 Controls via AVR SPI module                           */
/*-----------------------------------------------------------------------*/
/*
/  Copyright (C) 2016, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   any purpose as you like UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/-------------------------------------------------------------------------*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/power.h>

#include "core/spi_avr.h"
#include "ds_sdcard.h"
#include "mmc_avr.h"


/* Peripheral controls (Platform dependent) */

#define MMC_CD		(1)		/* Test if card detected.   yes:true, no:false, default:true */
#define MMC_WP		(0)		/* Test if write protected. yes:true, no:false, default:false */

#define	SPI_CLK_SLOW()	spi_set_clk(clock_div_128)		/* Set SPI clock for initialization (100-400kHz) */
#define	SPI_CLK_FAST()	spi_set_clk(clock_div_2)		/* Set SPI clock for read/write (20MHz max) */


/*---------------------------------------------------------------------------*/

/* Definitions for MMC/SDC command */
#define CMD0	(0)			/* GO_IDLE_STATE */
#define CMD1	(1)			/* SEND_OP_COND (MMC) */
#define	ACMD41	(0x80+41)	/* SEND_OP_COND (SDC) */
#define CMD8	(8)			/* SEND_IF_COND */
#define CMD9	(9)			/* SEND_CSD */
#define CMD10	(10)		/* SEND_CID */
#define CMD12	(12)		/* STOP_TRANSMISSION */
#define ACMD13	(0x80+13)	/* SD_STATUS (SDC) */
#define CMD16	(16)		/* SET_BLOCKLEN */
#define CMD17	(17)		/* READ_SINGLE_BLOCK */
#define CMD18	(18)		/* READ_MULTIPLE_BLOCK */
#define CMD23	(23)		/* SET_BLOCK_COUNT (MMC) */
#define	ACMD23	(0x80+23)	/* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24	(24)		/* WRITE_BLOCK */
#define CMD25	(25)		/* WRITE_MULTIPLE_BLOCK */
#define CMD32	(32)		/* ERASE_ER_BLK_START */
#define CMD33	(33)		/* ERASE_ER_BLK_END */
#define CMD38	(38)		/* ERASE */
#define	CMD48	(48)		/* READ_EXTR_SINGLE */
#define	CMD49	(49)		/* WRITE_EXTR_SINGLE */
#define CMD55	(55)		/* APP_CMD */
#define CMD58	(58)		/* READ_OCR */


static volatile DSTATUS Stat = STA_NOINIT;	/* Disk status */

/* 100Hz decrement timers */
static volatile BYTE Timer1;
static volatile UINT Timer2;

static BYTE CardType;			/* Card type flags (b0:MMC, b1:SDv1, b2:SDv2, b3:Block addressing) */



/*-----------------------------------------------------------------------*\
 * Power Control  (Platform dependent)
\*-----------------------------------------------------------------------*/

static
void power_on (void)
{
	/* nothing to do if no power controls */

	/* Enable SPI module in SPI mode 0 */
	spi_enable();
}


static
void power_off (void)
{
	/* nothing to do if no power controls */
}


/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (	/* 1:Ready, 0:Timeout */
	UINT wt			/* Timeout [ms] */
)
{
	BYTE d;


	wt /= 10;
	cli(); Timer2 = wt; sei();
	do {
		d = spi_xchg(0xFF);
		cli(); wt = Timer2; sei();
	} while (d != 0xFF && wt);

	return (d == 0xFF) ? 1 : 0;
}



/*-----------------------------------------------------------------------*/
/* Deselect the card and release SPI bus                                 */
/*-----------------------------------------------------------------------*/

static
void deselect (void)
{
	sd_card_cs_hi();
	spi_xchg(0xFF);	/* Dummy clock (force DO hi-z for multiple slave SPI) */
}



/*-----------------------------------------------------------------------*/
/* Select the card and wait for ready                                    */
/*-----------------------------------------------------------------------*/

static
int select (void)	/* 1:Successful, 0:Timeout */
{
	sd_card_cs_lo();
	spi_xchg(0xFF);	/* Dummy clock (force DO enabled) */

	if (wait_ready(500))
		return 1;	/* Leading busy check: Wait for card ready */

	deselect();		/* Timeout */
	return 0;
}



/*-----------------------------------------------------------------------*/
/* Receive a data packet from MMC                                        */
/*-----------------------------------------------------------------------*/

static
int rcvr_datablock (
	BYTE *buff,			/* Data buffer to store received data */
	UINT btr			/* Byte count (must be multiple of 4) */
)
{
	BYTE token;


	Timer1 = 20;
	do {							/* Wait for data packet in timeout of 200ms */
		token = spi_xchg(0xFF);
	} while ((token == 0xFF) && Timer1);
	if (token != 0xFE) return 0;	/* If not valid data token, retutn with error */

	spi_rcvr_multi(buff, btr);		/* Receive the data block into buffer */
	spi_xchg(0xFF);					/* Discard CRC */
	spi_xchg(0xFF);

	return 1;						/* Return with success */
}



/*-----------------------------------------------------------------------*/
/* Send a data packet to MMC                                             */
/*-----------------------------------------------------------------------*/

#if	_USE_WRITE
static
int xmit_datablock (
	const BYTE *buff,	/* 512 byte data block to be transmitted */
	BYTE token			/* Data/Stop token */
)
{
	BYTE resp;


	if (!wait_ready(500))
		return 0;		/* Leading busy check: Wait for card ready to accept data block */

	spi_xchg(token);					/* Xmit data token */
	if (token == 0xFD) return 1;		/* Do not send data if token is StopTran */

	spi_xmit_multi(buff, 512);			/* Data */
	spi_xchg(0xFF); spi_xchg(0xFF);		/* Dummy CRC */

	resp = spi_xchg(0xFF);				/* Receive data resp */

	return (resp & 0x1F) == 0x05 ? 1 : 0;	/* Data was accepted or not */

	/* Busy check is done at next transmission */
}
#endif



/*-----------------------------------------------------------------------*/
/* Send a command packet to MMC                                          */
/*-----------------------------------------------------------------------*/

static
BYTE send_cmd (		/* Returns R1 resp (bit7==1:Send failed) */
	BYTE cmd,		/* Command index */
	DWORD arg		/* Argument */
)
{
	BYTE n, res;


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
		cmd &= 0x7F;
		res = send_cmd(CMD55, 0);
		if (res > 1)
			return res;
	}

	/* Select the card and wait for ready except to stop multiple block read */
	if (cmd != CMD12) {
		deselect();
		if (!select()) return 0xFF;
	}

	/* Send command packet */
	spi_xchg(0x40 | cmd);				/* Start + Command index */
	spi_xchg((BYTE)(arg >> 24));		/* Argument[31..24] */
	spi_xchg((BYTE)(arg >> 16));		/* Argument[23..16] */
	spi_xchg((BYTE)(arg >> 8));			/* Argument[15..8] */
	spi_xchg((BYTE)arg);				/* Argument[7..0] */
	n = 0x01;							/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;			/* Valid CRC for CMD0(0) + Stop */
	if (cmd == CMD8) n = 0x87;			/* Valid CRC for CMD8(0x1AA) Stop */
	spi_xchg(n);

	/* Receive command response */
	if (cmd == CMD12) spi_xchg(0xFF);	/* Skip a stuff byte when stop reading */
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do
		res = spi_xchg(0xFF);
	while ((res & 0x80) && --n);

	return res;			/* Return with the response value */
}



/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS mmc_disk_initialize (void)
{
	BYTE n, cmd, ty, ocr[4];


	power_off();						/* Turn off the socket power to reset the card */
	for (Timer1 = 10; Timer1; ) ;		/* Wait for 100ms */
	if (Stat & STA_NODISK) return Stat;	/* No card in the socket? */

	power_on();							/* Turn on the socket power */
	SPI_CLK_SLOW();
	for (n = 10; n; n--) spi_xchg(0xFF);	/* 80 dummy clocks */

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {			/* Put the card SPI mode */
		Timer1 = 100;						/* Initialization timeout of 1000 msec */
		if (send_cmd(CMD8, 0x1AA) == 1) {	/* Is the card SDv2? */
			for (n = 0; n < 4; n++) ocr[n] = spi_xchg(0xFF);	/* Get trailing return value of R7 resp */
			if (ocr[2] == 0x01 && ocr[3] == 0xAA) {				/* The card can work at vdd range of 2.7-3.6V */
				while (Timer1 && send_cmd(ACMD41, 1UL << 30));	/* Wait for leaving idle state (ACMD41 with HCS bit) */
				if (Timer1 && send_cmd(CMD58, 0) == 0) {		/* Check CCS bit in the OCR */
					for (n = 0; n < 4; n++) ocr[n] = spi_xchg(0xFF);
					ty = (ocr[0] & 0x40) ? CT_SDC2 | CT_BLOCK : CT_SDC2;	/* Check if the card is SDv2 */
				}
			}
		} else {							/* SDv1 or MMCv3 */
			if (send_cmd(ACMD41, 0) <= 1) 	{
				ty = CT_SDC1; cmd = ACMD41;	/* SDv1 */
			} else {
				ty = CT_MMC3; cmd = CMD1;	/* MMCv3 */
			}
			while (Timer1 && send_cmd(cmd, 0));			/* Wait for leaving idle state */
			if (!Timer1 || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
				ty = 0;
		}
	}
	CardType = ty;
	deselect();

	if (ty) {			/* Initialization succeded */
		Stat &= ~STA_NOINIT;		/* Clear STA_NOINIT */
		SPI_CLK_FAST();
	} else {			/* Initialization failed */
		power_off();
	}

	return Stat;
}



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS mmc_disk_status (void)
{
	return Stat;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT mmc_disk_read (
	BYTE *buff,			/* Pointer to the data buffer to store read data */
	LBA_t sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..128) */
)
{
	BYTE cmd;
	DWORD sect = (DWORD)sector;

	SPI_CLK_FAST();

	if (!count) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;

	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert to byte address if needed */

	cmd = count > 1 ? CMD18 : CMD17;			/*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
	if (send_cmd(cmd, sect) == 0) {
		do {
			if (!rcvr_datablock(buff, 512)) break;
			buff += 512;
		} while (--count);
		if (cmd == CMD18) send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
DRESULT mmc_disk_write (
	const BYTE *buff,	/* Pointer to the data to be written */
	LBA_t sector,		/* Start sector number (LBA) */
	UINT count			/* Sector count (1..128) */
)
{
	DWORD sect = (DWORD)sector;

	SPI_CLK_FAST();
	
	if (!count) return RES_PARERR;
	if (Stat & STA_NOINIT) return RES_NOTRDY;
	if (Stat & STA_PROTECT) return RES_WRPRT;

	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert to byte address if needed */

	if (count == 1) {	/* Single block write */
		if ((send_cmd(CMD24, sect) == 0)	/* WRITE_BLOCK */
			&& xmit_datablock(buff, 0xFE)) {
			count = 0;
		}
	}
	else {				/* Multiple block write */
		if (CardType & CT_SDC) send_cmd(ACMD23, count);
		if (send_cmd(CMD25, sect) == 0) {	/* WRITE_MULTIPLE_BLOCK */
			do {
				if (!xmit_datablock(buff, 0xFC)) break;
				buff += 512;
			} while (--count);
			if (!xmit_datablock(0, 0xFD)) count = 1;	/* STOP_TRAN token */
		}
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}
#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

#if _USE_IOCTL
DRESULT mmc_disk_ioctl (
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT res;
	BYTE n, csd[16], *ptr = buff;
	DWORD csize;
#if FF_USE_TRIM
	LBA_t *range;
	DWORD st, ed;
#endif
#if _USE_ISDIO
	SDIO_CTRL *sdi;
	BYTE rc, *bp;
	UINT dc;
#endif

	SPI_CLK_FAST();

	if (Stat & STA_NOINIT) return RES_NOTRDY;

	res = RES_ERROR;
	switch (cmd) {
	case CTRL_SYNC :		/* Make sure that no pending write process. Do not remove this or written sector might not left updated. */
		if (select()) res = RES_OK;
		deselect();
		break;

	case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
		if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
			if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
				csize = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
				*(LBA_t*)buff = csize << 10;
			} else {					/* SDC ver 1.XX or MMC*/
				n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
				csize = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
				*(LBA_t*)buff = csize << (n - 9);
			}
			res = RES_OK;
		}
		deselect();
		break;

	case GET_BLOCK_SIZE :	/* Get erase block size in unit of sector (DWORD) */
		if (CardType & CT_SDC2) {	/* SDv2? */
			if (send_cmd(ACMD13, 0) == 0) {	/* Read SD status */
				spi_xchg(0xFF);
				if (rcvr_datablock(csd, 16)) {				/* Read partial block */
					for (n = 64 - 16; n; n--) spi_xchg(0xFF);	/* Purge trailing data */
					*(DWORD*)buff = 16UL << (csd[10] >> 4);
					res = RES_OK;
				}
			}
		} else {					/* SDv1 or MMCv3 */
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {	/* Read CSD */
				if (CardType & CT_SDC1) {	/* SDv1 */
					*(DWORD*)buff = (((csd[10] & 63) << 1) + ((WORD)(csd[11] & 128) >> 7) + 1) << ((csd[13] >> 6) - 1);
				} else {					/* MMCv3 */
					*(DWORD*)buff = ((WORD)((csd[10] & 124) >> 2) + 1) * (((csd[11] & 3) << 3) + ((csd[11] & 224) >> 5) + 1);
				}
				res = RES_OK;
			}
		}
		deselect();
		break;
#if FF_USE_TRIM
	case CTRL_TRIM:		/* Erase a block of sectors (used when _USE_TRIM in ffconf.h is 1) */
		if (!(CardType & CT_SDC)) break;				/* Check if the card is SDC */
		if (mmc_disk_ioctl(MMC_GET_CSD, csd)) break;	/* Get CSD */
		if (!(csd[10] & 0x40)) break;					/* Check if ERASE_BLK_EN = 1 */
		range = buff; st = (DWORD)range[0]; ed = (DWORD)range[1];	/* Load sector block */
		if (!(CardType & CT_BLOCK)) {
			st *= 512; ed *= 512;
		}
		if (send_cmd(CMD32, st) == 0 && send_cmd(CMD33, ed) == 0 && send_cmd(CMD38, 0) == 0 && wait_ready(60000)) {	/* Erase sector block */
			res = RES_OK;	/* FatFs does not check result of this command */
		}
		break;
#endif
	/* Following commands are never used by FatFs module */

	case MMC_GET_TYPE :		/* Get card type flags (1 byte) */
		*ptr = CardType;
		res = RES_OK;
		break;

	case MMC_GET_CSD :		/* Receive CSD as a data block (16 bytes) */
		if (send_cmd(CMD9, 0) == 0 && rcvr_datablock(ptr, 16)) {	/* READ_CSD */
			res = RES_OK;
		}
		deselect();
		break;

	case MMC_GET_CID :		/* Receive CID as a data block (16 bytes) */
		if (send_cmd(CMD10, 0) == 0 && rcvr_datablock(ptr, 16)) {	/* READ_CID */
			res = RES_OK;
		}
		deselect();
		break;

	case MMC_GET_OCR :		/* Receive OCR as an R3 resp (4 bytes) */
		if (send_cmd(CMD58, 0) == 0) {	/* READ_OCR */
			for (n = 4; n; n--) *ptr++ = spi_xchg(0xFF);
			res = RES_OK;
		}
		deselect();
		break;

	case MMC_GET_SDSTAT :	/* Receive SD statsu as a data block (64 bytes) */
		if (send_cmd(ACMD13, 0) == 0) {	/* SD_STATUS */
			spi_xchg(0xFF);
			if (rcvr_datablock(ptr, 64)) res = RES_OK;
		}
		deselect();
		break;

	case CTRL_POWER_OFF :	/* Power off */
		power_off();
		Stat |= STA_NOINIT;
		res = RES_OK;
		break;
#if _USE_ISDIO
	case ISDIO_READ:
		sdi = buff;
		if (send_cmd(CMD48, 0x80000000 | (DWORD)sdi->func << 28 | (DWORD)sdi->addr << 9 | ((sdi->ndata - 1) & 0x1FF)) == 0) {
			for (Timer1 = 100; (rc = spi_xchg(0xFF)) == 0xFF && Timer1; ) ;
			if (rc == 0xFE) {
				for (bp = sdi->data, dc = sdi->ndata; dc; dc--) *bp++ = spi_xchg(0xFF);
				for (dc = 514 - sdi->ndata; dc; dc--) spi_xchg(0xFF);
				res = RES_OK;
			}
		}
		deselect();
		break;

	case ISDIO_WRITE:
		sdi = buff;
		if (send_cmd(CMD49, 0x80000000 | (DWORD)sdi->func << 28 | (DWORD)sdi->addr << 9 | ((sdi->ndata - 1) & 0x1FF)) == 0) {
			spi_xchg(0xFF); spi_xchg(0xFE);
			for (bp = sdi->data, dc = sdi->ndata; dc; dc--) spi_xchg(*bp++);
			for (dc = 514 - sdi->ndata; dc; dc--) spi_xchg(0xFF);
			if ((spi_xchg(0xFF) & 0x1F) == 0x05) res = RES_OK;
		}
		deselect();
		break;

	case ISDIO_MRITE:
		sdi = buff;
		if (send_cmd(CMD49, 0x84000000 | (DWORD)sdi->func << 28 | (DWORD)sdi->addr << 9 | sdi->ndata >> 8) == 0) {
			spi_xchg(0xFF); spi_xchg(0xFE);
			spi_xchg(sdi->ndata);
			for (dc = 513; dc; dc--) spi_xchg(0xFF);
			if ((spi_xchg(0xFF) & 0x1F) == 0x05) res = RES_OK;
		}
		deselect();
		break;
#endif
	default:
		res = RES_PARERR;
	}

	return res;
}
#endif


/*-----------------------------------------------------------------------*\
 * Device Timer Interrupt Procedure
\*-----------------------------------------------------------------------*/

/* This function must be called in period of 10ms */
void mmc_disk_timerproc (void)
{
	BYTE b;
	UINT n;


	b = Timer1;				/* 100Hz decrement timer */
	if (b) Timer1 = --b;
	n = Timer2;
	if (n) Timer2 = --n;

	b = Stat;
	if (MMC_WP) {				/* Write protected */
		b |= STA_PROTECT;
	} else {					/* Write enabled */
		b &= ~STA_PROTECT;
	}
	if (MMC_CD) {				/* Card inserted */
		b &= ~STA_NODISK;
	} else {					/* Socket empty */
		b |= (STA_NODISK | STA_NOINIT);
	}
	Stat = b;				/* Update MMC status */
}

