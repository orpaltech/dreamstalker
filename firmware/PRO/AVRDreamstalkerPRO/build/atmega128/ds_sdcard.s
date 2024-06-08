	.file	"ds_sdcard.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_sdcard.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"sd_card_isr:F(0,1)=(0,1)",36,0,0,sd_card_isr
	.stabs	"void:t(0,1)",128,0,0,0
.global	sd_card_isr
	.type	sd_card_isr, @function
sd_card_isr:
	.stabn	68,0,49,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r28
	push r29
	rcall .
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 7 */
.L__stack_usage = 7
	.stabn	68,0,50,.LM1-.LFBB1
.LM1:
	lds r24,tick_counter
	subi r24,lo8(-(1))
	std Y+5,r24
	.stabn	68,0,50,.LM2-.LFBB1
.LM2:
	sts tick_counter,r24
	.stabn	68,0,50,.LM3-.LFBB1
.LM3:
	ldi r22,lo8(10)
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call rtc_msec_to_ticks
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,50,.LM4-.LFBB1
.LM4:
	ldd r18,Y+5
	mov r24,r18
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,50,.LM5-.LFBB1
.LM5:
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	cp r24,r18
	cpc r25,r19
	cpc r26,r20
	cpc r27,r21
	brne .L1
	.stabn	68,0,51,.LM6-.LFBB1
.LM6:
	sts tick_counter,__zero_reg__
/* epilogue start */
	.stabn	68,0,55,.LM7-.LFBB1
.LM7:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	.stabn	68,0,53,.LM8-.LFBB1
.LM8:
	jmp disk_timerproc
.L1:
/* epilogue start */
	.stabn	68,0,55,.LM9-.LFBB1
.LM9:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	sd_card_isr, .-sd_card_isr
.Lscope1:
	.stabs	"sd_card_cs_lo:F(0,1)",36,0,0,sd_card_cs_lo
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	sd_card_cs_lo
	.type	sd_card_cs_lo, @function
sd_card_cs_lo:
	.stabn	68,0,70,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,71,.LM11-.LFBB2
.LM11:
	cbi 0x18,0
/* epilogue start */
	.stabn	68,0,72,.LM12-.LFBB2
.LM12:
	ret
	.size	sd_card_cs_lo, .-sd_card_cs_lo
.Lscope2:
	.stabs	"sd_card_cs_hi:F(0,1)",36,0,0,sd_card_cs_hi
.global	sd_card_cs_hi
	.type	sd_card_cs_hi, @function
sd_card_cs_hi:
	.stabn	68,0,75,.LM13-.LFBB3
.LM13:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,76,.LM14-.LFBB3
.LM14:
	sbi 0x18,0
/* epilogue start */
	.stabn	68,0,77,.LM15-.LFBB3
.LM15:
	ret
	.size	sd_card_cs_hi, .-sd_card_cs_hi
.Lscope3:
	.stabs	"sd_card_cs_init:F(0,1)",36,0,0,sd_card_cs_init
.global	sd_card_cs_init
	.type	sd_card_cs_init, @function
sd_card_cs_init:
	.stabn	68,0,62,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,64,.LM17-.LFBB4
.LM17:
	sbi 0x17,0
	.stabn	68,0,66,.LM18-.LFBB4
.LM18:
	jmp sd_card_cs_hi
	.size	sd_card_cs_init, .-sd_card_cs_init
.Lscope4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"/sd/"
	.text
	.stabs	"sd_card_init:F(0,4)=eFalse:0,True:1,;",36,0,0,sd_card_init
	.stabs	" :T(0,5)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
	.stabs	"_Bool:t(0,4)",128,0,0,0
.global	sd_card_init
	.type	sd_card_init, @function
sd_card_init:
	.stabn	68,0,80,.LM19-.LFBB5
.LM19:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,83,.LM20-.LFBB5
.LM20:
	call spi_enable
	.stabn	68,0,85,.LM21-.LFBB5
.LM21:
	ldi r20,lo8(1)
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r24,lo8(fs)
	ldi r25,hi8(fs)
	call f_mount
	movw r18,r24
	.stabn	68,0,86,.LM22-.LFBB5
.LM22:
	ldi r24,lo8(1)
	or r18,r19
	breq .L7
	ldi r24,0
.L7:
/* epilogue start */
	.stabn	68,0,90,.LM23-.LFBB5
.LM23:
	ret
	.size	sd_card_init, .-sd_card_init
	.stabs	"FRESULT:t(0,6)=(0,5)",128,0,0,0
.Lscope5:
	.stabs	"sd_card_umount:F(0,1)",36,0,0,sd_card_umount
.global	sd_card_umount
	.type	sd_card_umount, @function
sd_card_umount:
	.stabn	68,0,93,.LM24-.LFBB6
.LM24:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,94,.LM25-.LFBB6
.LM25:
	ldi r20,0
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r25,0
	ldi r24,0
	jmp f_mount
	.size	sd_card_umount, .-sd_card_umount
.Lscope6:
	.local	tick_counter
	.comm	tick_counter,1,1
	.stabs	"tick_counter:S(0,2)",38,0,0,tick_counter
	.local	fs
	.comm	fs,560,1
	.stabs	"fs:S(0,7)=(0,8)=s560fs_type:(0,9)=(0,3),0,8;pdrv:(0,9),8,8;ldrv:(0,9),16,8;n_fats:(0,9),24,8;wflag:(0,9),32,8;fsi_flag:(0,9),40,8;id:(0,10)=(0,11)=(0,12)=r(0,12);0;65535;,48,16;n_rootdir:(0,10),64,16;csize:(0,10),80,16;last_clst:(0,13)=(0,14)=(0,15)=r(0,15);0;4294967295;,96,32;free_clst:(0,13),128,32;n_fatent:(0,13),160,32;fsize:(0,13),192,32;volbase:(0,16)=(0,13),224,32;fatbase:(0,16),256,32;dirbase:(0,16),288,32;database:(0,16),320,32;winsect:(0,16),352,32;win:(0,17)=ar(0,18)=r(0,18);0;65535;;0;511;(0,9),384,4096;;",40,0,0,fs
	.stabs	"FATFS:t(0,7)",128,0,0,0
	.stabs	"BYTE:t(0,9)",128,0,0,0
	.stabs	"WORD:t(0,10)",128,0,0,0
	.stabs	"uint16_t:t(0,11)",128,0,0,0
	.stabs	"unsigned int:t(0,12)",128,0,0,0
	.stabs	"DWORD:t(0,13)",128,0,0,0
	.stabs	"uint32_t:t(0,14)",128,0,0,0
	.stabs	"long unsigned int:t(0,15)",128,0,0,0
	.stabs	"LBA_t:t(0,16)",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
