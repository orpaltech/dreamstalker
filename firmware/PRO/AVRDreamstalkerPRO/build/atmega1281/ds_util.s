	.file	"ds_util.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_util.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.section	.init3,"ax",@progbits
	.stabs	"wdt_init:F(0,1)=(0,1)",36,0,0,wdt_init
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	wdt_init
	.type	wdt_init, @function
wdt_init:
	.stabn	68,0,43,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,47,.LM1-.LFBB1
.LM1:
	out 0x34,__zero_reg__
.LBB7:
.LBB8:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,470,.LM2-.LFBB1
.LM2:
/* #APP */
 ;  470 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	lds r24,96
	ori r24,24
	sts 96,r24
	sts 96,__zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE8:
.LBE7:
	.stabs	"src/ds_util.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,53,.LM3-.LFBB1
.LM3:
	.size	wdt_init, .-wdt_init
.Lscope1:
	.text
	.stabs	"hang:F(0,1)",36,0,0,hang
.global	hang
	.type	hang, @function
hang:
	.stabn	68,0,37,.LM4-.LFBB2
.LM4:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L3:
	.stabn	68,0,39,.LM5-.LFBB2
.LM5:
/* #APP */
 ;  39 "src/ds_util.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L3
	.size	hang, .-hang
.Lscope2:
	.stabs	"soft_reset:F(0,1)",36,0,0,soft_reset
.global	soft_reset
	.type	soft_reset, @function
soft_reset:
	.stabn	68,0,56,.LM6-.LFBB3
.LM6:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB9:
.LBB10:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,428,.LM7-.LFBB3
.LM7:
	ldi r24,lo8(24)
	ldi r25,lo8(8)
/* #APP */
 ;  428 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	sts 96, r24
	out __SREG__,__tmp_reg__
	sts 96, r25
 	
 ;  0 "" 2
/* #NOAPP */
.L5:
	rjmp .L5
.LBE10:
.LBE9:
	.size	soft_reset, .-soft_reset
.Lscope3:
	.stabs	"hex_str:F(0,4)=eFalse:0,True:1,;",36,0,0,hex_str
	.stabs	"_Bool:t(0,4)",128,0,0,0
	.stabs	"decimal:P(0,5)=(0,6)=r(0,6);0;4294967295;",64,0,0,4
	.stabs	"buffer:P(0,7)=*(0,8)=r(0,8);0;255;",64,0,0,16
	.stabs	"precision:P(0,9)=r(0,9);-32768;32767;",64,0,0,12
	.stabs	"uint32_t:t(0,5)",128,0,0,0
	.stabs	"long unsigned int:t(0,6)",128,0,0,0
	.stabs	"char:t(0,8)",128,0,0,0
	.stabs	"int:t(0,9)",128,0,0,0
.global	hex_str
	.type	hex_str, @function
hex_str:
	.stabs	"src/ds_util.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,64,.LM8-.LFBB4
.LM8:
.LFBB4:
	push r4
	push r5
	push r6
	push r7
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r4,r22
	movw r6,r24
	movw r16,r20
	movw r12,r18
	.stabn	68,0,65,.LM9-.LFBB4
.LM9:
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	movw r30,r28
	adiw r30,3
	ldi r24,lo8(8)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	movw r10,r24
	.stabn	68,0,69,.LM10-.LFBB4
.LM10:
	movw r30,r24
	.stabn	68,0,66,.LM11-.LFBB4
.LM11:
	mov r15,__zero_reg__
	mov r14,__zero_reg__
.L7:
	.stabn	68,0,69,.LM12-.LFBB4
.LM12:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brne .L10
	.stabn	68,0,80,.LM13-.LFBB4
.LM13:
	movw r6,r12
	sub r6,r14
	sbc r7,r15
	movw r20,r6
	cp r12,r14
	cpc r13,r15
	brge .L14
	ldi r20,0
	ldi r21,0
.L14:
	ldi r22,lo8(48)
	ldi r23,0
	movw r24,r16
	call memset
	movw r24,r10
	add r24,r14
	adc r25,r15
	cp r12,r14
	cpc r13,r15
	brge .L16
	mov r7,__zero_reg__
	mov r6,__zero_reg__
.L16:
	movw r30,r16
	add r30,r6
	adc r31,r7
.L17:
	.stabn	68,0,84,.LM14-.LFBB4
.LM14:
	cp r24,r10
	cpc r25,r11
	brne .L18
	.stabn	68,0,86,.LM15-.LFBB4
.LM15:
	add r16,r14
	adc r17,r15
	movw r30,r16
	add r30,r6
	adc r31,r7
	st Z,__zero_reg__
	.stabn	68,0,89,.LM16-.LFBB4
.LM16:
	ldi r24,lo8(1)
/* epilogue start */
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L10:
.LBB11:
	.stabn	68,0,71,.LM17-.LFBB4
.LM17:
	movw r24,r4
	andi r24,15
	clr r25
	.stabn	68,0,73,.LM18-.LFBB4
.LM18:
	ldi r26,-1
	sub r14,r26
	sbc r15,r26
	.stabn	68,0,72,.LM19-.LFBB4
.LM19:
	cpi r24,10
	cpc r25,__zero_reg__
	brge .L8
	.stabn	68,0,73,.LM20-.LFBB4
.LM20:
	subi r24,lo8(-(48))
.L9:
	.stabn	68,0,73,.LM21-.LFBB4
.LM21:
	st Z+,r24
	.stabn	68,0,76,.LM22-.LFBB4
.LM22:
	ldi r24,4
	1:
	lsr r7
	ror r6
	ror r5
	ror r4
	dec r24
	brne 1b
	rjmp .L7
.L8:
	.stabn	68,0,75,.LM23-.LFBB4
.LM23:
	subi r24,lo8(-(55))
	rjmp .L9
.L18:
.LBE11:
	.stabn	68,0,85,.LM24-.LFBB4
.LM24:
	movw r26,r24
	ld r18,-X
	movw r24,r26
	st Z+,r18
	rjmp .L17
	.size	hex_str, .-hex_str
	.stabs	"hexadecimal:(0,10)=ar(0,11)=r(0,11);0;65535;;0;9;(0,8)",128,0,0,1
	.stabs	"indx:r(0,9)",64,0,0,14
	.stabn	192,0,0,.LFBB4-.LFBB4
	.stabs	"remainder:r(0,9)",64,0,0,24
	.stabn	192,0,0,.LBB11-.LFBB4
	.stabn	224,0,0,.LBE11-.LFBB4
	.stabn	224,0,0,.Lscope4-.LFBB4
.Lscope4:
	.stabs	"pow_u16:F(0,12)=(0,13)=r(0,13);0;65535;",36,0,0,pow_u16
	.stabs	"uint16_t:t(0,12)",128,0,0,0
	.stabs	"unsigned int:t(0,13)",128,0,0,0
	.stabs	"base:P(0,12)",64,0,0,18
	.stabs	"exp:P(0,2)",64,0,0,22
.global	pow_u16
	.type	pow_u16, @function
pow_u16:
	.stabn	68,0,92,.LM25-.LFBB5
.LM25:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,92,.LM26-.LFBB5
.LM26:
	ldi r24,lo8(1)
	ldi r25,0
.L21:
	.stabn	68,0,93,.LM27-.LFBB5
.LM27:
	tst r22
	breq .L22
	.stabn	68,0,96,.LM28-.LFBB5
.LM28:
	subi r22,lo8(-(-1))
	movw r20,r24
	mul r20,r18
	movw r24,r0
	mul r20,r19
	add r25,r0
	mul r21,r18
	add r25,r0
	clr r1
	.stabn	68,0,96,.LM29-.LFBB5
.LM29:
	rjmp .L21
.L22:
/* epilogue start */
	.stabn	68,0,97,.LM30-.LFBB5
.LM30:
	ret
	.size	pow_u16, .-pow_u16
.Lscope5:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s/%s%02u.%s"
	.text
	.stabs	"make_next_file_path:F(0,1)",36,0,0,make_next_file_path
	.stabs	" :T(0,14)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
.global	make_next_file_path
	.type	make_next_file_path, @function
make_next_file_path:
	.stabn	68,0,101,.LM31-.LFBB6
.LM31:
.LFBB6:
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,71
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 71 */
/* stack size = 86 */
.L__stack_usage = 86
	mov r12,r24
	mov r11,r25
	mov r10,r22
	mov r7,r23
	mov r14,r20
	mov r13,r21
	movw r22,r18
	mov r6,r16
	mov r5,r17
	.stabn	68,0,109,.LM32-.LFBB6
.LM32:
	movw r8,r28
	ldi r24,63
	add r8,r24
	adc r9,__zero_reg__
	ldi r20,lo8(6)
	ldi r21,0
	movw r24,r8
	call strncpy
	.stabn	68,0,110,.LM33-.LFBB6
.LM33:
	adiw r28,69-63
	std Y+63,__zero_reg__
	sbiw r28,69-63
	.stabn	68,0,112,.LM34-.LFBB6
.LM34:
	mov r22,r14
	mov r23,r13
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r24,r16
	call f_opendir
	.stabn	68,0,105,.LM35-.LFBB6
.LM35:
	mov r15,__zero_reg__
	.stabn	68,0,113,.LM36-.LFBB6
.LM36:
	or r24,r25
	brne .L24
.L27:
.LBB12:
	.stabn	68,0,115,.LM37-.LFBB6
.LM37:
	movw r22,r28
	subi r22,-41
	sbci r23,-1
	movw r24,r16
	call f_readdir
	.stabn	68,0,116,.LM38-.LFBB6
.LM38:
	or r24,r25
	brne .L25
	.stabn	68,0,116,.LM39-.LFBB6
.LM39:
	ldd r24,Y+50
	tst r24
	breq .L25
	.stabn	68,0,119,.LM40-.LFBB6
.LM40:
	ldi r22,lo8(46)
	ldi r23,0
	movw r24,r28
	adiw r24,50
	call strchr
	.stabn	68,0,121,.LM41-.LFBB6
.LM41:
	ldi r20,lo8(10)
	ldi r21,0
	movw r22,r28
	subi r22,-70
	sbci r23,-1
	sbiw r24,2
	call strtoul
	cp r15,r22
	brsh .L27
	mov r15,r22
.LBE12:
	.stabn	68,0,114,.LM42-.LFBB6
.LM42:
	rjmp .L27
.L25:
	.stabn	68,0,125,.LM43-.LFBB6
.LM43:
	movw r24,r16
	call f_closedir
.L24:
	.stabn	68,0,128,.LM44-.LFBB6
.LM44:
	push r5
	push r6
	inc r15
	push __zero_reg__
	push r15
	push r9
	push r8
	push r13
	push r14
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r7
	push r10
	push r11
	push r12
	call snprintf
	.stabn	68,0,129,.LM45-.LFBB6
.LM45:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* epilogue start */
	subi r28,-71
	sbci r29,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	ret
	.size	make_next_file_path, .-make_next_file_path
	.stabs	"dir:(0,15)=(0,16)=s40obj:(0,17)=(0,18)=s14fs:(0,19)=*(0,20)=(0,21)=s560fs_type:(0,22)=(0,3),0,8;pdrv:(0,22),8,8;ldrv:(0,22),16,8;n_fats:(0,22),24,8;wflag:(0,22),32,8;fsi_flag:(0,22),40,8;id:(0,23)=(0,12),48,16;n_rootdir:(0,23),64,16;csize:(0,23),80,16;last_clst:(0,24)=(0,5),96,32;free_clst:(0,24),128,32;n_fatent:(0,24),160,32;fsize:(0,24),192,32;volbase:(0,25)=(0,24),224,32;fatbase:(0,25),256,32;dirbase:(0,25),288,32;database:(0,25),320,32;winsect:(0,25),352,32;win:(0,26)=ar(0,11);0;511;(0,22),384,4096;;,0,16;id:(0,23),16,16;attr:(0,22),32,8;stat:(0,22),40,8;sclust:(0,24),48,32;objsize:(0,27)=(0,24),80,32;;,0,112;dptr:(0,24),112,32;clust:(0,24),144,32;sect:(0,25),176,32;dir:(0,28)=*(0,22),208,16;fn:(0,29)=ar(0,11);0;11;(0,22),224,96;;",128,0,0,1
	.stabs	"FRESULT:t(0,30)=(0,14)",128,0,0,0
	.stabs	"DIR:t(0,15)",128,0,0,0
	.stabs	"BYTE:t(0,22)",128,0,0,0
	.stabs	"WORD:t(0,23)",128,0,0,0
	.stabs	"DWORD:t(0,24)",128,0,0,0
	.stabs	"LBA_t:t(0,25)",128,0,0,0
	.stabs	"FSIZE_t:t(0,27)",128,0,0,0
	.stabs	"fi:(0,31)=(0,32)=s22fsize:(0,27),0,32;fdate:(0,23),32,16;ftime:(0,23),48,16;fattrib:(0,22),64,8;fname:(0,33)=ar(0,11);0;12;(0,34)=(0,8),72,104;;",128,0,0,41
	.stabs	"FILINFO:t(0,31)",128,0,0,0
	.stabs	"TCHAR:t(0,34)",128,0,0,0
	.stabs	"prefix:(0,35)=ar(0,11);0;6;(0,8)",128,0,0,63
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabs	"endp:(0,7)",128,0,0,70
	.stabn	192,0,0,.LBB12-.LFBB6
	.stabn	224,0,0,.LBE12-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
