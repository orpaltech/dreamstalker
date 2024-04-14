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
	.stabn	68,0,38,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,39,.LM1-.LFBB1
.LM1:
	lds r24,tick_counter
	subi r24,lo8(-(1))
	.stabn	68,0,39,.LM2-.LFBB1
.LM2:
	sts tick_counter,r24
	cpi r24,lo8(10)
	brne .L1
	.stabn	68,0,40,.LM3-.LFBB1
.LM3:
	sts tick_counter,__zero_reg__
	.stabn	68,0,42,.LM4-.LFBB1
.LM4:
	jmp disk_timerproc
.L1:
/* epilogue start */
	.stabn	68,0,44,.LM5-.LFBB1
.LM5:
	ret
	.size	sd_card_isr, .-sd_card_isr
.Lscope1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sd:"
	.text
	.stabs	"sd_card_init:F(0,2)=eFalse:0,True:1,;",36,0,0,sd_card_init
	.stabs	" :T(0,3)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
	.stabs	"_Bool:t(0,2)",128,0,0,0
	.stabs	"delay_mount:P(0,2)",64,0,0,24
.global	sd_card_init
	.type	sd_card_init, @function
sd_card_init:
	.stabn	68,0,51,.LM6-.LFBB2
.LM6:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,54,.LM7-.LFBB2
.LM7:
	ldi r20,lo8(1)
	eor r20,r24
	.stabn	68,0,54,.LM8-.LFBB2
.LM8:
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r24,lo8(fs)
	ldi r25,hi8(fs)
	call f_mount
	movw r18,r24
	.stabn	68,0,55,.LM9-.LFBB2
.LM9:
	ldi r24,lo8(1)
	or r18,r19
	breq .L4
	ldi r24,0
.L4:
/* epilogue start */
	.stabn	68,0,59,.LM10-.LFBB2
.LM10:
	ret
	.size	sd_card_init, .-sd_card_init
	.stabs	"FRESULT:t(0,4)=(0,3)",128,0,0,0
.Lscope2:
	.stabs	"sd_card_uninit:F(0,1)",36,0,0,sd_card_uninit
.global	sd_card_uninit
	.type	sd_card_uninit, @function
sd_card_uninit:
	.stabn	68,0,62,.LM11-.LFBB3
.LM11:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,63,.LM12-.LFBB3
.LM12:
	ldi r20,0
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r25,0
	ldi r24,0
	jmp f_mount
	.size	sd_card_uninit, .-sd_card_uninit
.Lscope3:
	.local	tick_counter
	.comm	tick_counter,1,1
	.stabs	"tick_counter:S(0,5)=(0,6)=r(0,6);0;255;",38,0,0,tick_counter
	.stabs	"uint8_t:t(0,5)",128,0,0,0
	.stabs	"unsigned char:t(0,6)",128,0,0,0
	.local	fs
	.comm	fs,559,1
	.stabs	"fs:S(0,7)=(0,8)=s559fs_type:(0,9)=(0,6),0,8;pdrv:(0,9),8,8;n_fats:(0,9),16,8;wflag:(0,9),24,8;fsi_flag:(0,9),32,8;id:(0,10)=(0,11)=(0,12)=r(0,12);0;65535;,40,16;n_rootdir:(0,10),56,16;csize:(0,10),72,16;last_clst:(0,13)=(0,14)=(0,15)=r(0,15);0;4294967295;,88,32;free_clst:(0,13),120,32;n_fatent:(0,13),152,32;fsize:(0,13),184,32;volbase:(0,16)=(0,13),216,32;fatbase:(0,16),248,32;dirbase:(0,16),280,32;database:(0,16),312,32;winsect:(0,16),344,32;win:(0,17)=ar(0,18)=r(0,18);0;65535;;0;511;(0,9),376,4096;;",40,0,0,fs
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
