	.file	"ds_leds.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_leds.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"led_transition:f(0,1)=(0,1)",36,0,0,led_transition
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	" :T(0,4)=eLED1:0,LED2:1,;",128,0,0,0
	.stabs	" :T(0,5)=eSTROBE_HIGH:0,STROBE_LOW:1,STROBE_TOGGLE:2,;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"led:P(0,6)=r(0,6);0;65535;",64,0,0,20
	.stabs	"trans:P(0,7)=(0,5)",64,0,0,24
	.stabs	"unsigned int:t(0,6)",128,0,0,0
	.type	led_transition, @function
led_transition:
	.stabn	68,0,67,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r24
	movw r24,r22
	.stabn	68,0,70,.LM1-.LFBB1
.LM1:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L7
	cpi r20,1
	cpc r21,__zero_reg__
	brne .L2
	.stabn	68,0,72,.LM2-.LFBB1
.LM2:
	ldi r18,lo8(16)
.L2:
	.stabn	68,0,75,.LM3-.LFBB1
.LM3:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L3
	cpi r24,2
	cpc r25,__zero_reg__
	breq .L4
	or r24,r25
	brne .L1
	.stabn	68,0,82,.LM4-.LFBB1
.LM4:
	in r24,0xd
	or r24,r18
.L8:
	.stabn	68,0,86,.LM5-.LFBB1
.LM5:
	out 0xd,r24
.L1:
/* epilogue start */
	.stabn	68,0,89,.LM6-.LFBB1
.LM6:
	ret
.L7:
	.stabn	68,0,70,.LM7-.LFBB1
.LM7:
	ldi r18,lo8(8)
	rjmp .L2
.L3:
	.stabn	68,0,78,.LM8-.LFBB1
.LM8:
	in r24,0xd
	com r18
	and r18,r24
	out 0xd,r18
	.stabn	68,0,79,.LM9-.LFBB1
.LM9:
	ret
.L4:
	.stabn	68,0,86,.LM10-.LFBB1
.LM10:
	in r24,0xd
	eor r24,r18
	rjmp .L8
	.size	led_transition, .-led_transition
	.stabs	"dd:r(0,2)",64,0,0,18
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
.global	__floatunsisf
.global	__mulsf3
.global	__divsf3
.global	__subsf3
.global	__addsf3
.global	__fixunssfsi
	.stabs	"leds_pulse:F(0,1)",36,0,0,leds_pulse
	.stabs	"float:t(0,8)=r(0,0);4;0;",128,0,0,0
	.stabs	"led:P(0,9)=(0,4)",64,0,0,14
	.stabs	"brightness:p(0,2)",160,0,0,1
	.stabs	"duty_cycle:P(0,2)",64,0,0,16
.global	leds_pulse
	.type	leds_pulse, @function
leds_pulse:
	.stabn	68,0,106,.LM11-.LFBB2
.LM11:
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 17 */
.L__stack_usage = 17
	movw r14,r24
	std Y+1,r22
	mov r17,r20
	std Y+5,r21
	movw r12,r18
	.stabn	68,0,108,.LM12-.LFBB2
.LM12:
	ldi r24,2
	cp r14,r24
	cpc r15,__zero_reg__
	brlo .+2
	rjmp .L9
.LBB14:
.LBB15:
	.stabn	68,0,62,.LM13-.LFBB2
.LM13:
	movw r24,r14
	call strobe_is_active
.LBE15:
.LBE14:
	.stabn	68,0,110,.LM14-.LFBB2
.LM14:
	cpse r24,__zero_reg__
	rjmp .L9
	cpi r16,lo8(96)
	brsh .+2
	rjmp .L13
	ldi r16,lo8(95)
.L14:
.LBB16:
.LBB17:
	.stabn	68,0,119,.LM15-.LFBB2
.LM15:
	lds r24,145
	andi r24,lo8(-8)
	sts 145,r24
	.stabn	68,0,121,.LM16-.LFBB2
.LM16:
	ldd r25,Y+1
	cpi r25,lo8(101)
	brsh .+2
	rjmp .L15
	ldi r26,lo8(100)
	std Y+1,r26
.L16:
	ldd r25,Y+1
	mov r24,r25
	ldi r25,0
	ldi r27,0
	ldi r26,0
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r22,r24
	movw r24,r26
	call __floatunsisf
	.stabn	68,0,121,.LM17-.LFBB2
.LM17:
	movw r18,r22
	movw r20,r24
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __mulsf3
	.stabn	68,0,121,.LM18-.LFBB2
.LM18:
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __divsf3
	.stabn	68,0,121,.LM19-.LFBB2
.LM19:
	movw r18,r22
	movw r20,r24
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(-56)
	ldi r25,lo8(66)
	call __subsf3
	.stabn	68,0,121,.LM20-.LFBB2
.LM20:
	ldi r18,0
	ldi r19,lo8(-128)
	ldi r20,lo8(-1)
	ldi r21,lo8(67)
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __mulsf3
	.stabn	68,0,121,.LM21-.LFBB2
.LM21:
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __divsf3
	.stabn	68,0,121,.LM22-.LFBB2
.LM22:
	ldi r18,0
	ldi r19,lo8(-128)
	ldi r20,lo8(-1)
	ldi r21,lo8(67)
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __addsf3
	.stabn	68,0,121,.LM23-.LFBB2
.LM23:
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __fixunssfsi
.LBB18:
.LBB19:
	.stabn	68,0,94,.LM24-.LFBB2
.LM24:
	ldi r26,1
	cp r14,r26
	cpc r15,__zero_reg__
	breq .L17
	.stabn	68,0,95,.LM25-.LFBB2
.LM25:
	sts 152+1,r23
	sts 152,r22
.L18:
.LBE19:
.LBE18:
	.stabn	68,0,124,.LM26-.LFBB2
.LM26:
	lds r24,145
	andi r24,lo8(-8)
	sts 145,r24
	.stabn	68,0,126,.LM27-.LFBB2
.LM27:
	mov r18,r16
	movw r20,r12
	mov r22,r17
	ldd r23,Y+5
	movw r24,r14
/* epilogue start */
.LBE17:
.LBE16:
	.stabn	68,0,127,.LM28-.LFBB2
.LM28:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
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
.LBB23:
.LBB22:
	.stabn	68,0,126,.LM29-.LFBB2
.LM29:
	jmp strobe_start
.L13:
	cpi r16,lo8(5)
	brlo .+2
	rjmp .L14
	ldi r16,lo8(5)
	rjmp .L14
.L15:
	.stabn	68,0,121,.LM30-.LFBB2
.LM30:
	ldd r27,Y+1
	cpse r27,__zero_reg__
	rjmp .L16
	ldi r24,lo8(1)
	std Y+1,r24
	rjmp .L16
.L17:
.LBB21:
.LBB20:
	.stabn	68,0,96,.LM31-.LFBB2
.LM31:
	sts 154+1,r23
	sts 154,r22
	.stabn	68,0,96,.LM32-.LFBB2
.LM32:
	rjmp .L18
.L9:
/* epilogue start */
.LBE20:
.LBE21:
.LBE22:
.LBE23:
	.stabn	68,0,127,.LM33-.LFBB2
.LM33:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
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
	.size	leds_pulse, .-leds_pulse
.Lscope2:
	.stabs	"leds_on:F(0,1)",36,0,0,leds_on
	.stabs	"led:P(0,9)",64,0,0,24
	.stabs	"brightness:P(0,2)",64,0,0,22
.global	leds_on
	.type	leds_on, @function
leds_on:
	.stabn	68,0,101,.LM34-.LFBB3
.LM34:
.LFBB3:
	push r16
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,102,.LM35-.LFBB3
.LM35:
	ldi r16,0
	ldi r19,0
	ldi r18,0
	call leds_pulse
/* epilogue start */
	.stabn	68,0,103,.LM36-.LFBB3
.LM36:
	pop r16
	ret
	.size	leds_on, .-leds_on
.Lscope3:
	.stabs	"leds_init:F(0,1)",36,0,0,leds_init
	.stabs	"uint16_t:t(0,10)=(0,6)",128,0,0,0
.global	leds_init
	.type	leds_init, @function
leds_init:
	.stabn	68,0,130,.LM37-.LFBB4
.LM37:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,132,.LM38-.LFBB4
.LM38:
	in r24,0xd
	andi r24,lo8(-25)
	out 0xd,r24
	.stabn	68,0,133,.LM39-.LFBB4
.LM39:
	in r24,0xe
	andi r24,lo8(-25)
	out 0xe,r24
	.stabn	68,0,141,.LM40-.LFBB4
.LM40:
	ldi r30,lo8(113)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-40)
	st Z,r24
	.stabn	68,0,148,.LM41-.LFBB4
.LM41:
	ldi r24,lo8(-93)
	sts 144,r24
	.stabn	68,0,149,.LM42-.LFBB4
.LM42:
	ldi r24,lo8(8)
	sts 145,r24
	.stabn	68,0,151,.LM43-.LFBB4
.LM43:
	ldi r24,lo8(-1)
	ldi r25,lo8(3)
	sts 152+1,r25
	sts 152,r24
	.stabn	68,0,152,.LM44-.LFBB4
.LM44:
	sts 154+1,r25
	sts 154,r24
	.stabn	68,0,154,.LM45-.LFBB4
.LM45:
	ldi r22,lo8(gs(led_transition))
	ldi r23,hi8(gs(led_transition))
	ldi r25,0
	ldi r24,0
	call strobe_set_cb
	.stabn	68,0,155,.LM46-.LFBB4
.LM46:
	ldi r22,lo8(gs(led_transition))
	ldi r23,hi8(gs(led_transition))
	ldi r24,lo8(1)
	ldi r25,0
	jmp strobe_set_cb
	.size	leds_init, .-leds_init
.Lscope4:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
