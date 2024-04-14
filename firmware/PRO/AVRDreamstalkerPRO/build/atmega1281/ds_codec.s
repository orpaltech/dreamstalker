	.file	"ds_codec.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/ds_codec.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"RIFF"
.LC1:
	.string	"WAVE"
.LC2:
	.string	"fmt "
.LC3:
	.string	"fact"
.LC4:
	.string	"data"
	.text
	.stabs	"write_wav_header.constprop.0:f(0,1)=eFalse:0,True:1,;",36,0,0,write_wav_header.constprop.0
	.stabs	"_Bool:t(0,1)",128,0,0,0
	.stabs	"num_blocks:P(0,2)=(0,3)=r(0,3);0;4294967295;",64,0,0,4
	.stabs	"uint32_t:t(0,2)",128,0,0,0
	.stabs	"long unsigned int:t(0,3)",128,0,0,0
	.type	write_wav_header.constprop.0, @function
write_wav_header.constprop.0:
	.stabn	68,0,165,.LM0-.LFBB1
.LM0:
.LFBB1:
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
	.stabn	68,0,171,.LM1-.LFBB1
.LM1:
	movw r16,r28
	subi r16,-5
	sbci r17,-1
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .L2
.L18:
.LBB23:
	.stabn	68,0,214,.LM2-.LFBB1
.LM2:
	ldi r24,0
.L1:
/* epilogue start */
.LBE23:
	.stabn	68,0,217,.LM3-.LFBB1
.LM3:
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
.L2:
.LBB24:
	.stabn	68,0,175,.LM4-.LFBB1
.LM4:
	mov r27,r6
	mov r26,r5
	mov r25,r4
	clr r24
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	adiw r24,52
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r26,r28
	adiw r26,1
	movw r14,r26
	movw r22,r26
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	brne .L18
.LBE24:
	.stabn	68,0,177,.LM5-.LFBB1
.LM5:
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	brne .L18
	.stabn	68,0,180,.LM6-.LFBB1
.LM6:
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBB25:
	.stabn	68,0,182,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(20)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE25:
.LBB26:
	.stabn	68,0,184,.LM8-.LFBB1
.LM8:
	ldi r24,lo8(17)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE26:
.LBB27:
	.stabn	68,0,186,.LM9-.LFBB1
.LM9:
	ldi r24,lo8(1)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE27:
.LBB28:
	.stabn	68,0,188,.LM10-.LFBB1
.LM10:
	ldi r24,lo8(64)
	ldi r25,lo8(31)
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE28:
.LBB29:
	.stabn	68,0,192,.LM11-.LFBB1
.LM11:
	ldi r24,lo8(-41)
	ldi r25,lo8(15)
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE29:
.LBB30:
	.stabn	68,0,194,.LM12-.LFBB1
.LM12:
	ldi r24,0
	ldi r25,lo8(1)
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE30:
.LBB31:
	.stabn	68,0,196,.LM13-.LFBB1
.LM13:
	ldi r24,lo8(4)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE31:
.LBB32:
	.stabn	68,0,198,.LM14-.LFBB1
.LM14:
	ldi r24,lo8(2)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE32:
.LBB33:
	.stabn	68,0,200,.LM15-.LFBB1
.LM15:
	ldi r24,lo8(-7)
	ldi r25,lo8(1)
	std Y+2,r25
	std Y+1,r24
	movw r18,r16
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE33:
	.stabn	68,0,203,.LM16-.LFBB1
.LM16:
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC3)
	ldi r23,hi8(.LC3)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBB34:
	.stabn	68,0,205,.LM17-.LFBB1
.LM17:
	ldi r24,lo8(4)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE34:
.LBB35:
	.stabn	68,0,207,.LM18-.LFBB1
.LM18:
	ldi r26,lo8(-7)
	ldi r27,lo8(1)
	movw r20,r6
	movw r18,r4
	call __muluhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE35:
	.stabn	68,0,210,.LM19-.LFBB1
.LM19:
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC4)
	ldi r23,hi8(.LC4)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBB36:
	.stabn	68,0,214,.LM20-.LFBB1
.LM20:
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r18,r16
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r14
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L18
.LBE36:
	.stabn	68,0,216,.LM21-.LFBB1
.LM21:
	ldi r24,lo8(1)
	rjmp .L1
	.size	write_wav_header.constprop.0, .-write_wav_header.constprop.0
	.stabs	"len:(0,4)=(0,5)=r(0,5);0;65535;",128,0,0,5
	.stabs	" :T(0,6)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
	.stabs	"FRESULT:t(0,7)=(0,6)",128,0,0,0
	.stabs	"UINT:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB23-.LFBB1
	.stabn	224,0,0,.LBE23-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB24-.LFBB1
	.stabn	224,0,0,.LBE24-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB25-.LFBB1
	.stabn	224,0,0,.LBE25-.LFBB1
	.stabs	"w:(0,8)=(0,5)",128,0,0,1
	.stabs	"uint16_t:t(0,8)",128,0,0,0
	.stabn	192,0,0,.LBB26-.LFBB1
	.stabn	224,0,0,.LBE26-.LFBB1
	.stabs	"w:(0,8)",128,0,0,1
	.stabn	192,0,0,.LBB27-.LFBB1
	.stabn	224,0,0,.LBE27-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB28-.LFBB1
	.stabn	224,0,0,.LBE28-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB29-.LFBB1
	.stabn	224,0,0,.LBE29-.LFBB1
	.stabs	"w:(0,8)",128,0,0,1
	.stabn	192,0,0,.LBB30-.LFBB1
	.stabn	224,0,0,.LBE30-.LFBB1
	.stabs	"w:(0,8)",128,0,0,1
	.stabn	192,0,0,.LBB31-.LFBB1
	.stabn	224,0,0,.LBE31-.LFBB1
	.stabs	"w:(0,8)",128,0,0,1
	.stabn	192,0,0,.LBB32-.LFBB1
	.stabn	224,0,0,.LBE32-.LFBB1
	.stabs	"w:(0,8)",128,0,0,1
	.stabn	192,0,0,.LBB33-.LFBB1
	.stabn	224,0,0,.LBE33-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB34-.LFBB1
	.stabn	224,0,0,.LBE34-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB35-.LFBB1
	.stabn	224,0,0,.LBE35-.LFBB1
	.stabs	"dw:(0,2)",128,0,0,1
	.stabn	192,0,0,.LBB36-.LFBB1
	.stabn	224,0,0,.LBE36-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"codec_init:F(0,9)=(0,10)=r(0,10);0;255;",36,0,0,codec_init
	.stabs	"uint8_t:t(0,9)",128,0,0,0
	.stabs	"e_codec_status:T(0,11)=eCODEC_IDLE:0,CODEC_PLAYBACK:1,CODEC_CAPTURE:2,;",128,0,0,0
	.stabs	"unsigned char:t(0,10)",128,0,0,0
.global	codec_init
	.type	codec_init, @function
codec_init:
	.stabn	68,0,141,.LM22-.LFBB2
.LM22:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,142,.LM23-.LFBB2
.LM23:
	call vs_init
	.stabn	68,0,142,.LM24-.LFBB2
.LM24:
	tst r24
	breq .L21
	.stabn	68,0,145,.LM25-.LFBB2
.LM25:
	sts codec+294+1,__zero_reg__
	sts codec+294,__zero_reg__
	.stabn	68,0,148,.LM26-.LFBB2
.LM26:
	call vs_hw_spec
	.stabn	68,0,148,.LM27-.LFBB2
.LM27:
	ret
.L21:
	.stabn	68,0,143,.LM28-.LFBB2
.LM28:
	ldi r24,0
/* epilogue start */
	.stabn	68,0,149,.LM29-.LFBB2
.LM29:
	ret
	.size	codec_init, .-codec_init
.Lscope2:
	.stabs	"codec_process_patches:F(0,1)",36,0,0,codec_process_patches
.global	codec_process_patches
	.type	codec_process_patches, @function
codec_process_patches:
	.stabn	68,0,152,.LM30-.LFBB3
.LM30:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,153,.LM31-.LFBB3
.LM31:
	jmp vs_process_patches
	.size	codec_process_patches, .-codec_process_patches
.Lscope3:
	.stabs	"codec_get_status:F(0,12)=(0,11)",36,0,0,codec_get_status
.global	codec_get_status
	.type	codec_get_status, @function
codec_get_status:
	.stabn	68,0,157,.LM32-.LFBB4
.LM32:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,159,.LM33-.LFBB4
.LM33:
	lds r24,codec+294
	lds r25,codec+294+1
/* epilogue start */
	ret
	.size	codec_get_status, .-codec_get_status
.Lscope4:
	.stabs	"codec_set_volume:F(0,13)=(0,13)",36,0,0,codec_set_volume
	.stabs	"void:t(0,13)",128,0,0,0
	.stabs	"left_chan:P(0,9)",64,0,0,24
	.stabs	"right_chan:P(0,9)",64,0,0,20
.global	codec_set_volume
	.type	codec_set_volume, @function
codec_set_volume:
	.stabn	68,0,220,.LM34-.LFBB5
.LM34:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r20,r22
.LBB37:
	.stabn	68,0,224,.LM35-.LFBB5
.LM35:
	cpi r24,lo8(10)
	brlo .L25
	ldi r24,lo8(9)
.L25:
	ldi r25,0
	subi r24,lo8(-(__vol_to_reg))
	sbci r25,hi8(-(__vol_to_reg))
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  224 "src/sound/ds_codec.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE37:
.LBB38:
	.stabn	68,0,225,.LM36-.LFBB5
.LM36:
	cpi r20,lo8(10)
	brlo .L26
	ldi r20,lo8(9)
.L26:
	ldi r21,0
	subi r20,lo8(-(__vol_to_reg))
	sbci r21,hi8(-(__vol_to_reg))
	mov __tmp_reg__,r21
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  225 "src/sound/ds_codec.c" 1
	out 59, r22
	movw r30, r20
	elpm r22, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE38:
	.stabn	68,0,227,.LM37-.LFBB5
.LM37:
	jmp vs_set_volume
	.size	codec_set_volume, .-codec_set_volume
.Lscope5:
	.stabs	"codec_playback:F(0,1)",36,0,0,codec_playback
.global	codec_playback
	.type	codec_playback, @function
codec_playback:
	.stabn	68,0,292,.LM38-.LFBB6
.LM38:
.LFBB6:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	movw r22,r24
	.stabn	68,0,298,.LM39-.LFBB6
.LM39:
	lds r24,codec+294
	lds r25,codec+294+1
	or r24,r25
	breq .L28
.L30:
	.stabn	68,0,299,.LM40-.LFBB6
.LM40:
	ldi r28,0
.L27:
	.stabn	68,0,326,.LM41-.LFBB6
.LM41:
	mov r24,r28
/* epilogue start */
	pop r28
	ret
.L28:
	.stabn	68,0,302,.LM42-.LFBB6
.LM42:
	ldi r20,lo8(1)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_open
	.stabn	68,0,304,.LM43-.LFBB6
.LM43:
	or r24,r25
	brne .L30
	.stabn	68,0,312,.LM44-.LFBB6
.LM44:
	call vs_playback_start
	mov r28,r24
	.stabn	68,0,312,.LM45-.LFBB6
.LM45:
	cpse r24,__zero_reg__
	rjmp .L31
	.stabn	68,0,313,.LM46-.LFBB6
.LM46:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	.stabn	68,0,315,.LM47-.LFBB6
.LM47:
	rjmp .L27
.L31:
	.stabn	68,0,319,.LM48-.LFBB6
.LM48:
	call get_music_volume_level
	.stabn	68,0,320,.LM49-.LFBB6
.LM49:
	mov r22,r24
	call codec_set_volume
	.stabn	68,0,323,.LM50-.LFBB6
.LM50:
	ldi r24,lo8(1)
	ldi r25,0
	sts codec+294+1,r25
	sts codec+294,r24
	.stabn	68,0,325,.LM51-.LFBB6
.LM51:
	rjmp .L27
	.size	codec_playback, .-codec_playback
	.stabs	"vol:r(0,9)",64,0,0,24
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"codec_capture:F(0,1)",36,0,0,codec_capture
.global	codec_capture
	.type	codec_capture, @function
codec_capture:
	.stabn	68,0,329,.LM52-.LFBB7
.LM52:
.LFBB7:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
	mov r28,r25
	.stabn	68,0,333,.LM53-.LFBB7
.LM53:
	lds r24,codec+294
	lds r25,codec+294+1
	or r24,r25
	breq .L33
.L41:
	.stabn	68,0,369,.LM54-.LFBB7
.LM54:
	ldi r24,0
	rjmp .L32
.L33:
	.stabn	68,0,337,.LM55-.LFBB7
.LM55:
	ldi r20,lo8(10)
	mov r22,r29
	mov r23,r28
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_open
	.stabn	68,0,339,.LM56-.LFBB7
.LM56:
	or r24,r25
	brne .L41
	.stabn	68,0,343,.LM57-.LFBB7
.LM57:
	ldi r22,0
	ldi r23,0
	movw r24,r22
	call write_wav_header.constprop.0
	.stabn	68,0,343,.LM58-.LFBB7
.LM58:
	tst r24
	breq .L36
	.stabn	68,0,347,.LM59-.LFBB7
.LM59:
	call mic_power_on
	.stabn	68,0,349,.LM60-.LFBB7
.LM60:
	call get_recording_gain_level
	mov r22,r24
	ldi r20,0
	ldi r24,lo8(64)
	ldi r25,lo8(31)
	call vs_adpcm_rec_start
	.stabn	68,0,349,.LM61-.LFBB7
.LM61:
	cpse r24,__zero_reg__
	rjmp .L37
	.stabn	68,0,363,.LM62-.LFBB7
.LM62:
	call mic_power_off
.L36:
	.stabn	68,0,366,.LM63-.LFBB7
.LM63:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	.stabn	68,0,367,.LM64-.LFBB7
.LM64:
	mov r24,r29
	mov r25,r28
	call f_unlink
	rjmp .L41
.L37:
	.stabn	68,0,356,.LM65-.LFBB7
.LM65:
	sts codec+290,__zero_reg__
	sts codec+290+1,__zero_reg__
	sts codec+290+2,__zero_reg__
	sts codec+290+3,__zero_reg__
	.stabn	68,0,359,.LM66-.LFBB7
.LM66:
	ldi r18,lo8(2)
	ldi r19,0
	sts codec+294+1,r19
	sts codec+294,r18
.L32:
/* epilogue start */
	.stabn	68,0,370,.LM67-.LFBB7
.LM67:
	pop r29
	pop r28
	ret
	.size	codec_capture, .-codec_capture
.Lscope7:
	.stabs	"codec_stop:F(0,13)",36,0,0,codec_stop
.global	codec_stop
	.type	codec_stop, @function
codec_stop:
	.stabn	68,0,422,.LM68-.LFBB8
.LM68:
.LFBB8:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
.LBB45:
.LBB46:
	.stabn	68,0,158,.LM69-.LFBB8
.LM69:
	lds r24,codec+294
	lds r25,codec+294+1
.LBE46:
.LBE45:
	.stabn	68,0,423,.LM70-.LFBB8
.LM70:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L43
	sbiw r24,2
	breq .L44
/* epilogue start */
	.stabn	68,0,437,.LM71-.LFBB8
.LM71:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L43:
.LBB47:
.LBB48:
	.stabn	68,0,236,.LM72-.LFBB8
.LM72:
	sts codec+294+1,__zero_reg__
	sts codec+294,__zero_reg__
	.stabn	68,0,238,.LM73-.LFBB8
.LM73:
	call vs_playback_stop
.L47:
.LBE48:
.LBE47:
.LBB49:
.LBB50:
	.stabn	68,0,390,.LM74-.LFBB8
.LM74:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
/* epilogue start */
.LBE50:
.LBE49:
	.stabn	68,0,437,.LM75-.LFBB8
.LM75:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
.LBB52:
.LBB51:
	.stabn	68,0,390,.LM76-.LFBB8
.LM76:
	jmp f_close
.L44:
	.stabn	68,0,378,.LM77-.LFBB8
.LM77:
	sts codec+294+1,__zero_reg__
	sts codec+294,__zero_reg__
	.stabn	68,0,380,.LM78-.LFBB8
.LM78:
	call vs_adpcm_rec_stop
	.stabn	68,0,382,.LM79-.LFBB8
.LM79:
	call mic_power_off
	.stabn	68,0,386,.LM80-.LFBB8
.LM80:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_lseek
	.stabn	68,0,387,.LM81-.LFBB8
.LM81:
	lds r24,codec+290
	lds r25,codec+290+1
	lds r26,codec+290+2
	lds r27,codec+290+3
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r22,r24
	movw r24,r26
	call write_wav_header.constprop.0
	rjmp .L47
.LBE51:
.LBE52:
	.size	codec_stop, .-codec_stop
.Lscope8:
	.stabs	"codec_process_task:F(0,13)",36,0,0,codec_process_task
.global	codec_process_task
	.type	codec_process_task, @function
codec_process_task:
	.stabn	68,0,440,.LM82-.LFBB9
.LM82:
.LFBB9:
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
.LBB65:
.LBB66:
	.stabn	68,0,158,.LM83-.LFBB9
.LM83:
	lds r24,codec+294
	lds r25,codec+294+1
.LBE66:
.LBE65:
	.stabn	68,0,441,.LM84-.LFBB9
.LM84:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L49
	sbiw r24,2
	brne .+2
	rjmp .L50
.L48:
/* epilogue start */
	.stabn	68,0,453,.LM85-.LFBB9
.LM85:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L49:
.LBB67:
.LBB68:
	.stabn	68,0,263,.LM86-.LFBB9
.LM86:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,lo8(codec+34)
	ldi r23,hi8(codec+34)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_read
	.stabn	68,0,265,.LM87-.LFBB9
.LM87:
	or r24,r25
	breq .L52
.L56:
.LBB69:
.LBB70:
	.stabn	68,0,236,.LM88-.LFBB9
.LM88:
	sts codec+294+1,__zero_reg__
	sts codec+294,__zero_reg__
	.stabn	68,0,238,.LM89-.LFBB9
.LM89:
	call vs_playback_stop
	.stabn	68,0,252,.LM90-.LFBB9
.LM90:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	.stabn	68,0,253,.LM91-.LFBB9
.LM91:
	rjmp .L48
.L52:
.LBE70:
.LBE69:
	.stabn	68,0,271,.LM92-.LFBB9
.LM92:
	ldd r24,Y+1
	ldd r25,Y+2
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,271,.LM93-.LFBB9
.LM93:
	cpi r18,-1
	cpc r19,__zero_reg__
	brsh .L54
	.stabn	68,0,273,.LM94-.LFBB9
.LM94:
	ldi r20,0
	ldi r21,lo8(1)
	sub r20,r24
	sbc r21,r25
	ldi r23,0
	ldi r22,0
	subi r24,lo8(-(codec+34))
	sbci r25,hi8(-(codec+34))
	call memset
.L57:
	ldi r16,lo8(codec+34)
	ldi r17,hi8(codec+34)
.L55:
	.stabn	68,0,286,.LM95-.LFBB9
.LM95:
	movw r24,r16
	call vs_sdi_write
	.stabn	68,0,284,.LM96-.LFBB9
.LM96:
	subi r16,-32
	sbci r17,-1
	ldi r24,hi8(codec+290)
	cpi r16,lo8(codec+290)
	cpc r17,r24
	brne .L55
	rjmp .L48
.L54:
	.stabn	68,0,277,.LM97-.LFBB9
.LM97:
	or r24,r25
	brne .L57
	rjmp .L56
.L50:
.LBE68:
.LBE67:
.LBB71:
.LBB72:
	.stabn	68,0,400,.LM98-.LFBB9
.LM98:
	ldi r24,lo8(codec+34)
	ldi r25,hi8(codec+34)
	call vs_adpcm_read_block
	.stabn	68,0,400,.LM99-.LFBB9
.LM99:
	tst r24
	brne .+2
	rjmp .L48
	.stabn	68,0,410,.LM100-.LFBB9
.LM100:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,lo8(codec+34)
	ldi r23,hi8(codec+34)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,413,.LM101-.LFBB9
.LM101:
	or r24,r25
	breq .L59
.LBB73:
.LBB74:
	.stabn	68,0,378,.LM102-.LFBB9
.LM102:
	sts codec+294+1,__zero_reg__
	sts codec+294,__zero_reg__
	.stabn	68,0,380,.LM103-.LFBB9
.LM103:
	call vs_adpcm_rec_stop
	.stabn	68,0,382,.LM104-.LFBB9
.LM104:
	call mic_power_off
	.stabn	68,0,390,.LM105-.LFBB9
.LM105:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
.L59:
.LBE74:
.LBE73:
	.stabn	68,0,418,.LM106-.LFBB9
.LM106:
	lds r24,codec+290
	lds r25,codec+290+1
	lds r26,codec+290+2
	lds r27,codec+290+3
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	sts codec+290,r24
	sts codec+290+1,r25
	sts codec+290+2,r26
	sts codec+290+3,r27
.LBE72:
.LBE71:
	.stabn	68,0,453,.LM107-.LFBB9
.LM107:
	rjmp .L48
	.size	codec_process_task, .-codec_process_task
	.stabs	"len:(0,4)",128,0,0,1
	.stabn	192,0,0,.LBB68-.LFBB9
	.stabn	224,0,0,.LBE68-.LFBB9
	.stabs	"len:(0,4)",128,0,0,1
	.stabn	192,0,0,.LBB72-.LFBB9
	.stabn	224,0,0,.LBE72-.LFBB9
.Lscope9:
.global	__vol_to_reg
	.section	.progmem.data,"a",@progbits
	.type	__vol_to_reg, @object
	.size	__vol_to_reg, 10
__vol_to_reg:
	.string	"\376\264\202Z<$\024\n\004"
	.stabs	"__vol_to_reg:G(0,14)=ar(0,15)=r(0,15);0;65535;;0;9;(0,9)",32,0,0,0
	.local	codec
	.comm	codec,296,1
	.stabs	"codec:S(0,16)=(0,17)=xss_codec_context:",40,0,0,codec
	.stabs	"s_codec_context:T(0,17)=s296fp:(0,18)=(0,19)=s34obj:(0,20)=(0,21)=s14fs:(0,22)=*(0,23)=(0,24)=s560fs_type:(0,25)=(0,10),0,8;pdrv:(0,25),8,8;ldrv:(0,25),16,8;n_fats:(0,25),24,8;wflag:(0,25),32,8;fsi_flag:(0,25),40,8;id:(0,26)=(0,8),48,16;n_rootdir:(0,26),64,16;csize:(0,26),80,16;last_clst:(0,27)=(0,2),96,32;free_clst:(0,27),128,32;n_fatent:(0,27),160,32;fsize:(0,27),192,32;volbase:(0,28)=(0,27),224,32;fatbase:(0,28),256,32;dirbase:(0,28),288,32;database:(0,28),320,32;winsect:(0,28),352,32;win:(0,29)=ar(0,15);0;511;(0,25),384,4096;;,0,16;id:(0,26),16,16;attr:(0,25),32,8;stat:(0,25),40,8;sclust:(0,27),48,32;objsize:(0,30)=(0,27),80,32;;,0,112;flag:(0,25),112,8;err:(0,25),120,8;fptr:(0,30),128,32;clust:(0,27),160,32;sect:(0,28),192,32;dir_sect:(0,28),224,32;dir_ptr:(0,31)=*(0,25),256,16;;,0,272;buff:(0,32)=ar(0,15);0;255;(0,9),272,2048;count:(0,2),2320,32;status:(0,12),2352,16;;",128,0,0,0
	.stabs	"codec_context_t:t(0,16)",128,0,0,0
	.stabs	"BYTE:t(0,25)",128,0,0,0
	.stabs	"WORD:t(0,26)",128,0,0,0
	.stabs	"DWORD:t(0,27)",128,0,0,0
	.stabs	"LBA_t:t(0,28)",128,0,0,0
	.stabs	"FSIZE_t:t(0,30)",128,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
