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
	.stabs	"codec_init:F(0,1)=(0,2)=r(0,2);0;255;",36,0,0,codec_init
	.stabs	"int:t(0,3)=r(0,3);-32768;32767;",128,0,0,0
	.stabs	"e_codec_status:T(0,4)=eCODEC_IDLE:0,CODEC_PLAYBACK:1,CODEC_CAPTURE:2,;",128,0,0,0
	.stabs	"uint8_t:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,2)",128,0,0,0
.global	codec_init
	.type	codec_init, @function
codec_init:
	.stabn	68,0,63,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,64,.LM1-.LFBB1
.LM1:
	call vs_init
	.stabn	68,0,64,.LM2-.LFBB1
.LM2:
	tst r24
	breq .L3
	.stabn	68,0,67,.LM3-.LFBB1
.LM3:
	sts codec+1958+1,__zero_reg__
	sts codec+1958,__zero_reg__
	.stabn	68,0,71,.LM4-.LFBB1
.LM4:
	call vs_get_hw_spec
	.stabn	68,0,71,.LM5-.LFBB1
.LM5:
	ret
.L3:
	.stabn	68,0,65,.LM6-.LFBB1
.LM6:
	ldi r24,0
/* epilogue start */
	.stabn	68,0,72,.LM7-.LFBB1
.LM7:
	ret
	.size	codec_init, .-codec_init
.Lscope1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"VLSI/02_ima.cmd"
	.text
	.stabs	"codec_apply_patches:F(0,5)=eFalse:0,True:1,;",36,0,0,codec_apply_patches
	.stabs	"e_vs_hw_spec:T(0,6)=eVS_HWS_UNKNOWN:0,VS_HWS_1002:2,VS_HWS_1003:3,VS_HWS_1053:53,;",128,0,0,0
	.stabs	"_Bool:t(0,5)",128,0,0,0
.global	codec_apply_patches
	.type	codec_apply_patches, @function
codec_apply_patches:
	.stabn	68,0,75,.LM8-.LFBB2
.LM8:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,78,.LM9-.LFBB2
.LM9:
	call vs_get_hw_spec
	.stabn	68,0,78,.LM10-.LFBB2
.LM10:
	sbiw r24,2
	brne .L5
	.stabn	68,0,80,.LM11-.LFBB2
.LM11:
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp vs1002_patch_ima_adpcm_apply
.L5:
	.stabn	68,0,85,.LM12-.LFBB2
.LM12:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	codec_apply_patches, .-codec_apply_patches
.Lscope2:
	.stabs	"codec_get_status:F(0,7)=(0,4)",36,0,0,codec_get_status
.global	codec_get_status
	.type	codec_get_status, @function
codec_get_status:
	.stabn	68,0,88,.LM13-.LFBB3
.LM13:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,89,.LM14-.LFBB3
.LM14:
	lds r24,codec+1958
	lds r25,codec+1958+1
/* epilogue start */
	.stabn	68,0,90,.LM15-.LFBB3
.LM15:
	ret
	.size	codec_get_status, .-codec_get_status
.Lscope3:
	.stabs	"codec_is_data_req:F(0,3)",36,0,0,codec_is_data_req
.global	codec_is_data_req
	.type	codec_is_data_req, @function
codec_is_data_req:
	.stabn	68,0,93,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,94,.LM17-.LFBB4
.LM17:
	call vs_is_dreq
	.stabn	68,0,95,.LM18-.LFBB4
.LM18:
	ldi r25,0
/* epilogue start */
	ret
	.size	codec_is_data_req, .-codec_is_data_req
.Lscope4:
	.stabs	"codec_send_data:F(0,8)=(0,8)",36,0,0,codec_send_data
	.stabs	"void:t(0,8)",128,0,0,0
	.stabs	"data:P(0,9)=*(0,1)",64,0,0,24
.global	codec_send_data
	.type	codec_send_data, @function
codec_send_data:
	.stabn	68,0,98,.LM19-.LFBB5
.LM19:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,99,.LM20-.LFBB5
.LM20:
	jmp vs_sdi_write
	.size	codec_send_data, .-codec_send_data
.Lscope5:
	.stabs	"codec_set_volume:F(0,8)",36,0,0,codec_set_volume
	.stabs	"left_chan:P(0,1)",64,0,0,18
	.stabs	"right_chan:p(0,1)",160,0,0,5
.global	codec_set_volume
	.type	codec_set_volume, @function
codec_set_volume:
	.stabn	68,0,190,.LM21-.LFBB6
.LM21:
.LFBB6:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 8 */
.L__stack_usage = 8
	mov r18,r24
	std Y+5,r22
	.stabn	68,0,195,.LM22-.LFBB6
.LM22:
	ldi r24,lo8(-2)
	.stabn	68,0,194,.LM23-.LFBB6
.LM23:
	tst r18
	breq .L16
	.stabn	68,0,197,.LM24-.LFBB6
.LM24:
	cpi r18,lo8(11)
	brlo .L11
	ldi r18,lo8(10)
.L11:
	subi r18,lo8(-(90))
	ldi r19,0
	ldi r26,lo8(-2)
	ldi r27,0
	call __umulhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,197,.LM25-.LFBB6
.LM25:
	ldi r18,lo8(100)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	.stabn	68,0,197,.LM26-.LFBB6
.LM26:
	ldi r24,lo8(-2)
	sub r24,r18
.L16:
	.stabn	68,0,195,.LM27-.LFBB6
.LM27:
	std Y+6,r24
	.stabn	68,0,199,.LM28-.LFBB6
.LM28:
	ldd r24,Y+5
	.stabn	68,0,200,.LM29-.LFBB6
.LM29:
	ldi r22,lo8(-2)
	.stabn	68,0,199,.LM30-.LFBB6
.LM30:
	tst r24
	breq .L12
	.stabn	68,0,202,.LM31-.LFBB6
.LM31:
	mov r18,r24
	cpi r24,lo8(11)
	brlo .L13
	ldi r18,lo8(10)
.L13:
	subi r18,lo8(-(90))
	ldi r19,0
	ldi r26,lo8(-2)
	ldi r27,0
	call __umulhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,202,.LM32-.LFBB6
.LM32:
	ldi r18,lo8(100)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	.stabn	68,0,202,.LM33-.LFBB6
.LM33:
	ldi r22,lo8(-2)
	sub r22,r18
.L12:
	.stabn	68,0,204,.LM34-.LFBB6
.LM34:
	ldd r24,Y+6
/* epilogue start */
	.stabn	68,0,205,.LM35-.LFBB6
.LM35:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	.stabn	68,0,204,.LM36-.LFBB6
.LM36:
	jmp vs_set_volume
	.size	codec_set_volume, .-codec_set_volume
.Lscope6:
	.stabs	"codec_playback:F(0,5)",36,0,0,codec_playback
	.stabs	" :T(0,10)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
.global	codec_playback
	.type	codec_playback, @function
codec_playback:
	.stabn	68,0,243,.LM37-.LFBB7
.LM37:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r22,r24
.LBB16:
.LBB17:
	.stabn	68,0,89,.LM38-.LFBB7
.LM38:
	lds r24,codec+1958
	lds r25,codec+1958+1
.LBE17:
.LBE16:
	.stabn	68,0,244,.LM39-.LFBB7
.LM39:
	or r24,r25
	breq .L18
.L32:
	.stabn	68,0,257,.LM40-.LFBB7
.LM40:
	ldi r24,0
	ret
.L18:
	.stabn	68,0,248,.LM41-.LFBB7
.LM41:
	ldi r20,lo8(1)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_open
	.stabn	68,0,249,.LM42-.LFBB7
.LM42:
	or r24,r25
	brne .L32
	.stabn	68,0,253,.LM43-.LFBB7
.LM43:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(-128)
	ldi r21,lo8(7)
	ldi r22,lo8(codec+34)
	ldi r23,hi8(codec+34)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_read
	.stabn	68,0,254,.LM44-.LFBB7
.LM44:
	or r24,r25
	breq .L21
.L22:
	.stabn	68,0,255,.LM45-.LFBB7
.LM45:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	rjmp .L32
.L21:
	.stabn	68,0,260,.LM46-.LFBB7
.LM46:
	lds r24,len
	lds r25,len+1
	.stabn	68,0,260,.LM47-.LFBB7
.LM47:
	sbiw r24,0
	breq .L22
	.stabn	68,0,266,.LM48-.LFBB7
.LM48:
	sts codec+1956+1,r25
	sts codec+1956,r24
	.stabn	68,0,267,.LM49-.LFBB7
.LM49:
	sts codec+1954+1,__zero_reg__
	sts codec+1954,__zero_reg__
	.stabn	68,0,271,.LM50-.LFBB7
.LM50:
	call vs_is_analog_power_down
	.stabn	68,0,271,.LM51-.LFBB7
.LM51:
	tst r24
	breq .L23
.LBB18:
.LBB19:
	.stabn	68,0,204,.LM52-.LFBB7
.LM52:
	ldi r22,lo8(18)
	ldi r24,lo8(18)
	call vs_set_volume
.L23:
.LBE19:
.LBE18:
	.stabn	68,0,275,.LM53-.LFBB7
.LM53:
	lds r24,codec+1956
	lds r25,codec+1956+1
	.stabn	68,0,275,.LM54-.LFBB7
.LM54:
	ldi r22,lo8(64)
	ldi r23,lo8(1)
	cpi r24,65
	sbci r25,1
	brsh .L24
	.stabn	68,0,275,.LM55-.LFBB7
.LM55:
	lds r22,codec+1956
	lds r23,codec+1956+1
.L24:
	.stabn	68,0,275,.LM56-.LFBB7
.LM56:
	sts len+1,r23
	sts len,r22
.LBB20:
.LBB21:
	.stabn	68,0,99,.LM57-.LFBB7
.LM57:
	ldi r24,lo8(codec+34)
	ldi r25,hi8(codec+34)
	call vs_sdi_write
.LBE21:
.LBE20:
	.stabn	68,0,278,.LM58-.LFBB7
.LM58:
	lds r24,codec+1954
	lds r25,codec+1954+1
	lds r18,len
	lds r19,len+1
	add r24,r18
	adc r25,r19
	sts codec+1954+1,r25
	sts codec+1954,r24
	.stabn	68,0,281,.LM59-.LFBB7
.LM59:
	ldi r24,lo8(1)
	ldi r25,0
	sts codec+1958+1,r25
	sts codec+1958,r24
/* epilogue start */
	.stabn	68,0,284,.LM60-.LFBB7
.LM60:
	ret
	.size	codec_playback, .-codec_playback
.Lscope7:
	.section	.rodata.str1.1
.LC1:
	.string	"RIFF"
.LC2:
	.string	"WAVE"
.LC3:
	.string	"fmt "
.LC4:
	.string	"fact"
.LC5:
	.string	"data"
	.text
	.stabs	"codec_capture:F(0,5)",36,0,0,codec_capture
.global	codec_capture
	.type	codec_capture, @function
codec_capture:
	.stabn	68,0,287,.LM61-.LFBB8
.LM61:
.LFBB8:
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
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r8,r22
.LBB26:
.LBB27:
	.stabn	68,0,89,.LM62-.LFBB8
.LM62:
	lds r18,codec+1958
	lds r19,codec+1958+1
.LBE27:
.LBE26:
	.stabn	68,0,288,.LM63-.LFBB8
.LM63:
	or r18,r19
	breq .L34
.L41:
	.stabn	68,0,300,.LM64-.LFBB8
.LM64:
	ldi r24,0
.L33:
/* epilogue start */
	.stabn	68,0,318,.LM65-.LFBB8
.LM65:
	adiw r28,6
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
	ret
.L34:
	.stabn	68,0,292,.LM66-.LFBB8
.LM66:
	ldi r20,lo8(10)
	movw r22,r24
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_open
	.stabn	68,0,293,.LM67-.LFBB8
.LM67:
	or r24,r25
	brne .L41
.LBB28:
.LBB29:
	.stabn	68,0,121,.LM68-.LFBB8
.LM68:
	std Y+6,__zero_reg__
	std Y+5,__zero_reg__
	.stabn	68,0,122,.LM69-.LFBB8
.LM69:
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	.stabn	68,0,125,.LM70-.LFBB8
.LM70:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,126,.LM71-.LFBB8
.LM71:
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,130,.LM72-.LFBB8
.LM72:
	ldi r24,lo8(52)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,133,.LM73-.LFBB8
.LM73:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,134,.LM74-.LFBB8
.LM74:
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,138,.LM75-.LFBB8
.LM75:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC3)
	ldi r23,hi8(.LC3)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,139,.LM76-.LFBB8
.LM76:
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,142,.LM77-.LFBB8
.LM77:
	ldi r24,lo8(20)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,145,.LM78-.LFBB8
.LM78:
	ldi r24,lo8(17)
	ldi r25,0
	std Y+6,r25
	std Y+5,r24
	movw r10,r28
	ldi r24,5
	add r10,r24
	adc r11,__zero_reg__
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,148,.LM79-.LFBB8
.LM79:
	ldi r24,lo8(1)
	ldi r25,0
	std Y+6,r25
	std Y+5,r24
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,151,.LM80-.LFBB8
.LM80:
	ldi r24,lo8(64)
	ldi r25,lo8(31)
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,155,.LM81-.LFBB8
.LM81:
	ldi r24,lo8(-41)
	ldi r25,lo8(15)
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,158,.LM82-.LFBB8
.LM82:
	ldi r24,0
	ldi r25,lo8(1)
	std Y+6,r25
	std Y+5,r24
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,161,.LM83-.LFBB8
.LM83:
	ldi r24,lo8(4)
	ldi r25,0
	std Y+6,r25
	std Y+5,r24
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,164,.LM84-.LFBB8
.LM84:
	ldi r24,lo8(2)
	ldi r25,0
	std Y+6,r25
	std Y+5,r24
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,166,.LM85-.LFBB8
.LM85:
	ldi r24,lo8(-7)
	ldi r25,lo8(1)
	std Y+6,r25
	std Y+5,r24
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(2)
	ldi r21,0
	movw r22,r10
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,169,.LM86-.LFBB8
.LM86:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC4)
	ldi r23,hi8(.LC4)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,170,.LM87-.LFBB8
.LM87:
	or r24,r25
	breq .+2
	rjmp .L38
	.stabn	68,0,173,.LM88-.LFBB8
.LM88:
	ldi r24,lo8(4)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	brne .L38
	.stabn	68,0,176,.LM89-.LFBB8
.LM89:
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	brne .L38
	.stabn	68,0,179,.LM90-.LFBB8
.LM90:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	ldi r22,lo8(.LC5)
	ldi r23,hi8(.LC5)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,180,.LM91-.LFBB8
.LM91:
	or r24,r25
	brne .L38
	.stabn	68,0,184,.LM92-.LFBB8
.LM92:
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,lo8(4)
	ldi r21,0
	movw r22,r16
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	or r24,r25
	brne .L38
.LBE29:
.LBE28:
	.stabn	68,0,303,.LM93-.LFBB8
.LM93:
	movw r24,r8
	call vs_adpcm_rec_start
	.stabn	68,0,303,.LM94-.LFBB8
.LM94:
	or r24,r25
	brne .L40
.L38:
	.stabn	68,0,298,.LM95-.LFBB8
.LM95:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	rjmp .L41
.L40:
	.stabn	68,0,309,.LM96-.LFBB8
.LM96:
	call mic_unmute
	.stabn	68,0,316,.LM97-.LFBB8
.LM97:
	ldi r24,lo8(2)
	ldi r25,0
	sts codec+1958+1,r25
	sts codec+1958,r24
	.stabn	68,0,317,.LM98-.LFBB8
.LM98:
	ldi r24,lo8(1)
	rjmp .L33
	.size	codec_capture, .-codec_capture
	.stabs	"val2:(0,11)=(0,12)=r(0,12);0;65535;",128,0,0,5
	.stabs	"uint16_t:t(0,11)",128,0,0,0
	.stabs	"unsigned int:t(0,12)",128,0,0,0
	.stabs	"val4:(0,13)=(0,14)=r(0,14);0;4294967295;",128,0,0,1
	.stabs	"uint32_t:t(0,13)",128,0,0,0
	.stabs	"long unsigned int:t(0,14)",128,0,0,0
	.stabn	192,0,0,.LBB29-.LFBB8
	.stabn	224,0,0,.LBE29-.LFBB8
.Lscope8:
	.stabs	"codec_stop:F(0,8)",36,0,0,codec_stop
.global	codec_stop
	.type	codec_stop, @function
codec_stop:
	.stabn	68,0,390,.LM99-.LFBB9
.LM99:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB30:
.LBB31:
	.stabn	68,0,89,.LM100-.LFBB9
.LM100:
	lds r24,codec+1958
	lds r25,codec+1958+1
.LBE31:
.LBE30:
	.stabn	68,0,391,.LM101-.LFBB9
.LM101:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L43
	sbiw r24,2
	breq .L44
.L45:
	.stabn	68,0,416,.LM102-.LFBB9
.LM102:
	sts codec+1958+1,__zero_reg__
	sts codec+1958,__zero_reg__
/* epilogue start */
	.stabn	68,0,417,.LM103-.LFBB9
.LM103:
	ret
.L43:
	.stabn	68,0,393,.LM104-.LFBB9
.LM104:
	call vs_analog_power_down
.L46:
	.stabn	68,0,407,.LM105-.LFBB9
.LM105:
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_close
	.stabn	68,0,408,.LM106-.LFBB9
.LM106:
	rjmp .L45
.L44:
	.stabn	68,0,400,.LM107-.LFBB9
.LM107:
	call vs_adpcm_rec_stop
	.stabn	68,0,402,.LM108-.LFBB9
.LM108:
	call mic_mute
	.stabn	68,0,405,.LM109-.LFBB9
.LM109:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_lseek
	rjmp .L46
	.size	codec_stop, .-codec_stop
.Lscope9:
	.stabs	"codec_process_task:F(0,8)",36,0,0,codec_process_task
.global	codec_process_task
	.type	codec_process_task, @function
codec_process_task:
	.stabn	68,0,420,.LM110-.LFBB10
.LM110:
.LFBB10:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
.LBB40:
.LBB41:
	.stabn	68,0,89,.LM111-.LFBB10
.LM111:
	lds r24,codec+1958
	lds r25,codec+1958+1
.LBE41:
.LBE40:
	.stabn	68,0,421,.LM112-.LFBB10
.LM112:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L48
	sbiw r24,2
	brne .+2
	rjmp .L49
.L47:
/* epilogue start */
	.stabn	68,0,433,.LM113-.LFBB10
.LM113:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L48:
.LBB42:
.LBB43:
	.stabn	68,0,210,.LM114-.LFBB10
.LM114:
	lds r14,codec+1956
	lds r15,codec+1956+1
	.stabn	68,0,210,.LM115-.LFBB10
.LM115:
	lds r16,codec+1954
	lds r17,codec+1954+1
	.stabn	68,0,210,.LM116-.LFBB10
.LM116:
	movw r28,r14
	sub r28,r16
	sbc r29,r17
	.stabn	68,0,210,.LM117-.LFBB10
.LM117:
	sts len+1,r29
	sts len,r28
	.stabn	68,0,211,.LM118-.LFBB10
.LM118:
	cpi r28,65
	ldi r18,1
	cpc r29,r18
	brsh .L51
	.stabn	68,0,213,.LM119-.LFBB10
.LM119:
	lds r22,codec+1954
	lds r23,codec+1954+1
	.stabn	68,0,213,.LM120-.LFBB10
.LM120:
	subi r22,lo8(-(codec+34))
	sbci r23,hi8(-(codec+34))
	.stabn	68,0,213,.LM121-.LFBB10
.LM121:
	movw r20,r28
	ldi r24,lo8(codec+34)
	ldi r25,hi8(codec+34)
	call memmove
	.stabn	68,0,215,.LM122-.LFBB10
.LM122:
	sts codec+1954+1,__zero_reg__
	sts codec+1954,__zero_reg__
	.stabn	68,0,216,.LM123-.LFBB10
.LM123:
	sts codec+1956+1,r29
	sts codec+1956,r28
	.stabn	68,0,218,.LM124-.LFBB10
.LM124:
	movw r20,r16
	subi r20,-128
	sbci r21,-8
	sub r20,r14
	sbc r21,r15
	.stabn	68,0,218,.LM125-.LFBB10
.LM125:
	movw r22,r28
	subi r22,lo8(-(codec+34))
	sbci r23,hi8(-(codec+34))
	.stabn	68,0,218,.LM126-.LFBB10
.LM126:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_read
	.stabn	68,0,219,.LM127-.LFBB10
.LM127:
	or r24,r25
	breq .L52
.L53:
/* epilogue start */
.LBE43:
.LBE42:
	.stabn	68,0,433,.LM128-.LFBB10
.LM128:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
.LBB47:
.LBB46:
	.stabn	68,0,220,.LM129-.LFBB10
.LM129:
	jmp codec_stop
.L52:
	.stabn	68,0,225,.LM130-.LFBB10
.LM130:
	lds r24,codec+1956
	lds r25,codec+1956+1
	lds r18,len
	lds r19,len+1
	add r24,r18
	adc r25,r19
	sts codec+1956+1,r25
	sts codec+1956,r24
.L51:
	.stabn	68,0,228,.LM131-.LFBB10
.LM131:
	lds r24,len
	lds r25,len+1
	or r24,r25
	breq .L53
	.stabn	68,0,234,.LM132-.LFBB10
.LM132:
	lds r22,codec+1956
	lds r23,codec+1956+1
	.stabn	68,0,234,.LM133-.LFBB10
.LM133:
	lds r24,codec+1954
	lds r25,codec+1954+1
	.stabn	68,0,234,.LM134-.LFBB10
.LM134:
	sub r22,r24
	sbc r23,r25
	.stabn	68,0,235,.LM135-.LFBB10
.LM135:
	cpi r22,65
	ldi r24,1
	cpc r23,r24
	brlo .L54
	ldi r22,lo8(64)
	ldi r23,lo8(1)
.L54:
	.stabn	68,0,235,.LM136-.LFBB10
.LM136:
	sts len+1,r23
	sts len,r22
	.stabn	68,0,237,.LM137-.LFBB10
.LM137:
	lds r24,codec+1954
	lds r25,codec+1954+1
.LBB44:
.LBB45:
	.stabn	68,0,99,.LM138-.LFBB10
.LM138:
	subi r24,lo8(-(codec+34))
	sbci r25,hi8(-(codec+34))
	call vs_sdi_write
.LBE45:
.LBE44:
	.stabn	68,0,239,.LM139-.LFBB10
.LM139:
	lds r24,codec+1954
	lds r25,codec+1954+1
	lds r18,len
	lds r19,len+1
	add r24,r18
	adc r25,r19
	sts codec+1954+1,r25
	sts codec+1954,r24
	rjmp .L47
.L49:
.LBE46:
.LBE47:
.LBB48:
.LBB49:
	.stabn	68,0,342,.LM140-.LFBB10
.LM140:
	ldi r24,lo8(9)
	call vs_sci_read
	.stabn	68,0,347,.LM141-.LFBB10
.LM141:
	subi r24,-128
	sbc r25,__zero_reg__
	cpi r24,-128
	sbci r25,2
	brlo .+2
	rjmp .L47
	.stabn	68,0,351,.LM142-.LFBB10
.LM142:
	sts len+1,__zero_reg__
	sts len,__zero_reg__
.L56:
	.stabn	68,0,352,.LM143-.LFBB10
.LM143:
	ldi r24,lo8(8)
	call vs_sci_read
	.stabn	68,0,351,.LM144-.LFBB10
.LM144:
	lds r24,len
	lds r25,len+1
	adiw r24,1
	sts len+1,r25
	sts len,r24
	.stabn	68,0,351,.LM145-.LFBB10
.LM145:
	cpi r24,-128
	cpc r25,__zero_reg__
	brlo .L56
	.stabn	68,0,373,.LM146-.LFBB10
.LM146:
	ldi r18,lo8(len)
	ldi r19,hi8(len)
	ldi r20,0
	ldi r21,lo8(1)
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(codec)
	ldi r25,hi8(codec)
	call f_write
	.stabn	68,0,374,.LM147-.LFBB10
.LM147:
	or r24,r25
	brne .+2
	rjmp .L47
	rjmp .L53
.LBE49:
.LBE48:
	.size	codec_process_task, .-codec_process_task
.Lscope10:
	.local	len
	.comm	len,2,1
	.stabs	"len:S(0,15)=(0,12)",40,0,0,len
	.stabs	"UINT:t(0,15)",128,0,0,0
	.local	codec
	.comm	codec,1960,1
	.stabs	"codec:S(0,16)=(0,17)=xss_codec_context:",40,0,0,codec
	.stabs	"s_codec_context:T(0,17)=s1960fp:(0,18)=(0,19)=s34obj:(0,20)=(0,21)=s14fs:(0,22)=*(0,23)=(0,24)=s559fs_type:(0,25)=(0,2),0,8;pdrv:(0,25),8,8;n_fats:(0,25),16,8;wflag:(0,25),24,8;fsi_flag:(0,25),32,8;id:(0,26)=(0,11),40,16;n_rootdir:(0,26),56,16;csize:(0,26),72,16;last_clst:(0,27)=(0,13),88,32;free_clst:(0,27),120,32;n_fatent:(0,27),152,32;fsize:(0,27),184,32;volbase:(0,28)=(0,27),216,32;fatbase:(0,28),248,32;dirbase:(0,28),280,32;database:(0,28),312,32;winsect:(0,28),344,32;win:(0,29)=ar(0,30)=r(0,30);0;65535;;0;511;(0,25),376,4096;;,0,16;id:(0,26),16,16;attr:(0,25),32,8;stat:(0,25),40,8;sclust:(0,27),48,32;objsize:(0,31)=(0,27),80,32;;,0,112;flag:(0,25),112,8;err:(0,25),120,8;fptr:(0,31),128,32;clust:(0,27),160,32;sect:(0,28),192,32;dir_sect:(0,28),224,32;dir_ptr:(0,32)=*(0,25),256,16;;,0,272;buf:(0,33)=ar(0,30);0;1919;(0,1),272,15360;pos:(0,11),15632,16;count:(0,11),15648,16;status:(0,7),15664,16;;",128,0,0,0
	.stabs	"codec_context_t:t(0,16)",128,0,0,0
	.stabs	"BYTE:t(0,25)",128,0,0,0
	.stabs	"WORD:t(0,26)",128,0,0,0
	.stabs	"DWORD:t(0,27)",128,0,0,0
	.stabs	"LBA_t:t(0,28)",128,0,0,0
	.stabs	"FSIZE_t:t(0,31)",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
