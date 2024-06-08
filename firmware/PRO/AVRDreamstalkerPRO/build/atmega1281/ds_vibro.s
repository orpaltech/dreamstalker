	.file	"ds_vibro.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_vibro.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vibro_transition:f(0,1)=(0,1)",36,0,0,vibro_transition
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	" :T(0,4)=eSTROBE_HIGH:0,STROBE_LOW:1,STROBE_TOGGLE:2,;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"index:P(0,5)=r(0,5);0;65535;",64,0,0,24
	.stabs	"trans:P(0,6)=(0,4)",64,0,0,18
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.type	vibro_transition, @function
vibro_transition:
	.stabn	68,0,48,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,49,.LM1-.LFBB1
.LM1:
	sbiw r24,2
	brne .L1
	.stabn	68,0,52,.LM2-.LFBB1
.LM2:
	cpi r22,1
	cpc r23,__zero_reg__
	breq .L3
	cpi r22,2
	cpc r23,__zero_reg__
	breq .L4
	or r22,r23
	brne .L1
.LBB6:
.LBB7:
	.stabn	68,0,58,.LM3-.LFBB1
.LM3:
	sbi 0x8,1
	ret
.L3:
.LBE7:
.LBE6:
	.stabn	68,0,55,.LM4-.LFBB1
.LM4:
	cbi 0x8,1
	.stabn	68,0,56,.LM5-.LFBB1
.LM5:
	ret
.L4:
	.stabn	68,0,61,.LM6-.LFBB1
.LM6:
	in r24,0x8
	ldi r25,lo8(2)
	eor r24,r25
	out 0x8,r24
.L1:
/* epilogue start */
	.stabn	68,0,64,.LM7-.LFBB1
.LM7:
	ret
	.size	vibro_transition, .-vibro_transition
.Lscope1:
	.stabs	"vibro_on:F(0,1)",36,0,0,vibro_on
	.stabs	"level:P(0,2)",64,0,0,28
.global	vibro_on
	.type	vibro_on, @function
vibro_on:
	.stabn	68,0,67,.LM8-.LFBB2
.LM8:
.LFBB2:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	mov r29,r25
	mov r28,r22
	.stabn	68,0,70,.LM9-.LFBB2
.LM9:
	ldi r24,lo8(2)
	ldi r25,0
	call strobe_is_active
	.stabn	68,0,70,.LM10-.LFBB2
.LM10:
	cpse r24,__zero_reg__
	rjmp .L6
	.stabn	68,0,73,.LM11-.LFBB2
.LM11:
	tst r28
	breq .L6
	.stabn	68,0,75,.LM12-.LFBB2
.LM12:
	cpi r28,lo8(10)
	brsh .L11
	.stabn	68,0,76,.LM13-.LFBB2
.LM13:
	ldi r18,lo8(20)
	cpi r28,lo8(1)
	breq .L8
	cpi r28,lo8(9)
	breq .L11
	.stabn	68,0,85,.LM14-.LFBB2
.LM14:
	mov r18,r28
	lsl r18
	lsl r18
	lsl r18
	.stabn	68,0,85,.LM15-.LFBB2
.LM15:
	subi r18,lo8(-(12))
.L8:
	.stabn	68,0,89,.LM16-.LFBB2
.LM16:
	ldi r20,lo8(10)
	ldi r21,0
	mov r22,r17
	mov r23,r29
	ldi r24,lo8(2)
	ldi r25,0
/* epilogue start */
	.stabn	68,0,90,.LM17-.LFBB2
.LM17:
	pop r29
	pop r28
	pop r17
	.stabn	68,0,89,.LM18-.LFBB2
.LM18:
	jmp strobe_start
.L11:
	.stabn	68,0,82,.LM19-.LFBB2
.LM19:
	ldi r18,lo8(90)
	rjmp .L8
.L6:
/* epilogue start */
	.stabn	68,0,90,.LM20-.LFBB2
.LM20:
	pop r29
	pop r28
	pop r17
	ret
	.size	vibro_on, .-vibro_on
	.stabs	"duty_cycle:r(0,2)",64,0,0,18
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"vibro_pulse:F(0,1)",36,0,0,vibro_pulse
	.stabs	"duration_ms:P(0,7)=(0,5)",64,0,0,24
	.stabs	"uint16_t:t(0,7)",128,0,0,0
.global	vibro_pulse
	.type	vibro_pulse, @function
vibro_pulse:
	.stabn	68,0,93,.LM21-.LFBB3
.LM21:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,95,.LM22-.LFBB3
.LM22:
	ret
	.size	vibro_pulse, .-vibro_pulse
.Lscope3:
	.stabs	"vibro_init:F(0,1)",36,0,0,vibro_init
.global	vibro_init
	.type	vibro_init, @function
vibro_init:
	.stabn	68,0,98,.LM23-.LFBB4
.LM23:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,100,.LM24-.LFBB4
.LM24:
	sbi 0x7,1
.LBB8:
.LBB9:
	.stabn	68,0,55,.LM25-.LFBB4
.LM25:
	cbi 0x8,1
.LBE9:
.LBE8:
	.stabn	68,0,105,.LM26-.LFBB4
.LM26:
	ldi r22,lo8(gs(vibro_transition))
	ldi r23,hi8(gs(vibro_transition))
	ldi r24,lo8(2)
	ldi r25,0
	jmp strobe_set_cb
	.size	vibro_init, .-vibro_init
.Lscope4:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
