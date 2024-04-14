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
	.stabs	"hang:F(0,1)=(0,1)",36,0,0,hang
	.stabs	"void:t(0,1)",128,0,0,0
.global	hang
	.type	hang, @function
hang:
	.stabn	68,0,32,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L2:
	.stabn	68,0,34,.LM1-.LFBB1
.LM1:
/* #APP */
 ;  34 "src/ds_util.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L2
	.size	hang, .-hang
.Lscope1:
	.stabs	"dec_to_hex:F(0,2)=eFalse:0,True:1,;",36,0,0,dec_to_hex
	.stabs	"_Bool:t(0,2)",128,0,0,0
	.stabs	"decimal:P(0,3)=r(0,3);-32768;32767;",64,0,0,18
	.stabs	"buffer:P(0,4)=*(0,5)=r(0,5);0;255;",64,0,0,16
	.stabs	"precision:P(0,3)",64,0,0,8
	.stabs	"int:t(0,3)",128,0,0,0
	.stabs	"char:t(0,5)",128,0,0,0
.global	dec_to_hex
	.type	dec_to_hex, @function
dec_to_hex:
	.stabn	68,0,38,.LM2-.LFBB2
.LM2:
.LFBB2:
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
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 10 */
/* stack size = 22 */
.L__stack_usage = 22
	movw r18,r24
	movw r16,r22
	movw r8,r20
	.stabn	68,0,39,.LM3-.LFBB2
.LM3:
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
	.stabn	68,0,43,.LM4-.LFBB2
.LM4:
	movw r30,r24
	.stabn	68,0,40,.LM5-.LFBB2
.LM5:
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L4:
	.stabn	68,0,43,.LM6-.LFBB2
.LM6:
	cp __zero_reg__,r18
	cpc __zero_reg__,r19
	brlt .L7
	.stabn	68,0,54,.LM7-.LFBB2
.LM7:
	movw r14,r8
	sub r14,r12
	sbc r15,r13
	movw r20,r14
	cp r8,r12
	cpc r9,r13
	brge .L11
	ldi r20,0
	ldi r21,0
.L11:
	ldi r22,lo8(48)
	ldi r23,0
	movw r24,r16
	call memset
	movw r24,r10
	add r24,r12
	adc r25,r13
	cp r8,r12
	cpc r9,r13
	brge .L13
	mov r15,__zero_reg__
	mov r14,__zero_reg__
.L13:
	movw r30,r16
	add r30,r14
	adc r31,r15
.L14:
	.stabn	68,0,58,.LM8-.LFBB2
.LM8:
	cp r24,r10
	cpc r25,r11
	brne .L15
	.stabn	68,0,60,.LM9-.LFBB2
.LM9:
	add r16,r12
	adc r17,r13
	movw r30,r16
	add r30,r14
	adc r31,r15
	st Z,__zero_reg__
	.stabn	68,0,63,.LM10-.LFBB2
.LM10:
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
	pop r9
	pop r8
	ret
.L7:
.LBB2:
	.stabn	68,0,45,.LM11-.LFBB2
.LM11:
	movw r24,r18
	andi r24,15
	clr r25
	.stabn	68,0,47,.LM12-.LFBB2
.LM12:
	ldi r26,-1
	sub r12,r26
	sbc r13,r26
	.stabn	68,0,46,.LM13-.LFBB2
.LM13:
	cpi r24,10
	cpc r25,__zero_reg__
	brge .L5
	.stabn	68,0,47,.LM14-.LFBB2
.LM14:
	subi r24,lo8(-(48))
.L6:
	.stabn	68,0,47,.LM15-.LFBB2
.LM15:
	st Z+,r24
	.stabn	68,0,50,.LM16-.LFBB2
.LM16:
	ldi r24,4
	1:
	asr r19
	ror r18
	dec r24
	brne 1b
	rjmp .L4
.L5:
	.stabn	68,0,49,.LM17-.LFBB2
.LM17:
	subi r24,lo8(-(55))
	rjmp .L6
.L15:
.LBE2:
	.stabn	68,0,59,.LM18-.LFBB2
.LM18:
	movw r26,r24
	ld r18,-X
	movw r24,r26
	st Z+,r18
	rjmp .L14
	.size	dec_to_hex, .-dec_to_hex
	.stabs	"hexadecimal:(0,6)=ar(0,7)=r(0,7);0;65535;;0;9;(0,5)",128,0,0,1
	.stabs	"indx:r(0,3)",64,0,0,12
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabs	"remainder:r(0,3)",64,0,0,24
	.stabn	192,0,0,.LBB2-.LFBB2
	.stabn	224,0,0,.LBE2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
