	.file	"ds_strobe.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/core/ds_strobe.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"strobe_isr:F(0,1)=(0,1)",36,0,0,strobe_isr
	.stabs	" :T(0,2)=eSTROBE_HIGH:0,STROBE_LOW:1,STROBE_TOGGLE:2,;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
.global	strobe_isr
	.type	strobe_isr, @function
strobe_isr:
	.stabn	68,0,42,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r10
	push r11
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	ldi r16,lo8(strobes)
	ldi r17,hi8(strobes)
	.stabn	68,0,45,.LM1-.LFBB1
.LM1:
	ldi r29,0
	ldi r28,0
	.stabn	68,0,46,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(11)
	mov r13,r24
	.stabn	68,0,58,.LM3-.LFBB1
.LM3:
	ldi r25,lo8(100)
	mov r14,r25
	mov r15,__zero_reg__
.L9:
	.stabn	68,0,46,.LM4-.LFBB1
.LM4:
	mul r13,r28
	movw r30,r0
	mul r13,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	ld r24,Z
	ldd r25,Z+1
	ldd r26,Z+2
	ldd r27,Z+3
	.stabn	68,0,46,.LM5-.LFBB1
.LM5:
	or r24,r25
	or r24,r26
	or r24,r27
	breq .L3
	.stabn	68,0,47,.LM6-.LFBB1
.LM6:
	ld r24,Z
	ldd r25,Z+1
	ldd r26,Z+2
	ldd r27,Z+3
	.stabn	68,0,47,.LM7-.LFBB1
.LM7:
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,47,.LM8-.LFBB1
.LM8:
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L3
	.stabn	68,0,48,.LM9-.LFBB1
.LM9:
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
	.stabn	68,0,49,.LM10-.LFBB1
.LM10:
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
	.stabn	68,0,50,.LM11-.LFBB1
.LM11:
	movw r26,r16
	adiw r26,6+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,6
.LBB28:
.LBB29:
	.stabn	68,0,35,.LM12-.LFBB1
.LM12:
	adiw r26,9
	ld r30,X+
	ld r31,X
	.stabn	68,0,35,.LM13-.LFBB1
.LM13:
	sbiw r30,0
	breq .L3
	.stabn	68,0,36,.LM14-.LFBB1
.LM14:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	eicall
.L3:
.LBE29:
.LBE28:
	.stabn	68,0,56,.LM15-.LFBB1
.LM15:
	movw r30,r16
	ldd r22,Z+6
	ldd r23,Z+7
	.stabn	68,0,56,.LM16-.LFBB1
.LM16:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L6
	.stabn	68,0,58,.LM17-.LFBB1
.LM17:
	ldd r24,Z+8
	.stabn	68,0,58,.LM18-.LFBB1
.LM18:
	mul r24,r22
	movw r18,r0
	mul r24,r23
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,60,.LM19-.LFBB1
.LM19:
	mul r13,r28
	movw r30,r0
	mul r13,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	ldd r24,Z+4
	ldd r25,Z+5
	.stabn	68,0,60,.LM20-.LFBB1
.LM20:
	adiw r24,1
	.stabn	68,0,60,.LM21-.LFBB1
.LM21:
	call __udivmodhi4
	.stabn	68,0,60,.LM22-.LFBB1
.LM22:
	std Z+5,r25
	std Z+4,r24
	.stabn	68,0,61,.LM23-.LFBB1
.LM23:
	ldd r10,Z+4
	ldd r11,Z+5
	.stabn	68,0,58,.LM24-.LFBB1
.LM24:
	movw r24,r18
	movw r22,r14
	call __divmodhi4
	.stabn	68,0,61,.LM25-.LFBB1
.LM25:
	cp r10,r22
	cpc r11,r23
	breq .L7
	.stabn	68,0,61,.LM26-.LFBB1
.LM26:
	ldd r24,Z+4
	ldd r25,Z+5
	.stabn	68,0,61,.LM27-.LFBB1
.LM27:
	or r24,r25
	brne .L6
.L7:
.LBB30:
.LBB31:
	.stabn	68,0,35,.LM28-.LFBB1
.LM28:
	movw r26,r16
	adiw r26,9
	ld r30,X+
	ld r31,X
	.stabn	68,0,35,.LM29-.LFBB1
.LM29:
	sbiw r30,0
	breq .L6
	.stabn	68,0,36,.LM30-.LFBB1
.LM30:
	ldi r22,lo8(2)
	ldi r23,0
	movw r24,r28
	eicall
.L6:
.LBE31:
.LBE30:
	.stabn	68,0,45,.LM31-.LFBB1
.LM31:
	adiw r28,1
	.stabn	68,0,45,.LM32-.LFBB1
.LM32:
	subi r16,-11
	sbci r17,-1
	cpi r28,3
	cpc r29,__zero_reg__
	breq .+2
	rjmp .L9
/* epilogue start */
	.stabn	68,0,67,.LM33-.LFBB1
.LM33:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r11
	pop r10
	ret
	.size	strobe_isr, .-strobe_isr
	.stabs	"i:r(0,3)=r(0,3);-32768;32767;",64,0,0,28
	.stabs	"int:t(0,3)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"strobe_init:F(0,1)",36,0,0,strobe_init
.global	strobe_init
	.type	strobe_init, @function
strobe_init:
	.stabn	68,0,72,.LM34-.LFBB2
.LM34:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,73,.LM35-.LFBB2
.LM35:
	ldi r30,lo8(strobes)
	ldi r31,hi8(strobes)
	ldi r24,lo8(33)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
/* epilogue start */
	.stabn	68,0,74,.LM36-.LFBB2
.LM36:
	ret
	.size	strobe_init, .-strobe_init
.Lscope2:
	.stabs	"strobe_interval_us:F(0,4)=(0,5)=r(0,5);0;4294967295;",36,0,0,strobe_interval_us
	.stabs	"uint32_t:t(0,4)",128,0,0,0
	.stabs	"long unsigned int:t(0,5)",128,0,0,0
.global	strobe_interval_us
	.type	strobe_interval_us, @function
strobe_interval_us:
	.stabn	68,0,77,.LM37-.LFBB3
.LM37:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,79,.LM38-.LFBB3
.LM38:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	ldi r24,0
	ldi r25,0
/* epilogue start */
	ret
	.size	strobe_interval_us, .-strobe_interval_us
.Lscope3:
	.stabs	"strobe_get:F(0,6)=*(0,7)=(0,8)=xss_strobe_context:",36,0,0,strobe_get
	.stabs	"s_strobe_context:T(0,8)=s11duration_ticks:(0,4),0,32;period_ticks:(0,9)=(0,10)=r(0,10);0;65535;,32,16;period:(0,9),48,16;duty_cycle:(0,11)=(0,12)=r(0,12);0;255;,64,8;transition:(0,13)=(0,14)=*(0,15)=f(0,1),72,16;;",128,0,0,0
	.stabs	"uint16_t:t(0,9)",128,0,0,0
	.stabs	"unsigned int:t(0,10)",128,0,0,0
	.stabs	"uint8_t:t(0,11)",128,0,0,0
	.stabs	"unsigned char:t(0,12)",128,0,0,0
	.stabs	"pfn_strobe_transition:t(0,13)",128,0,0,0
	.stabs	"i:P(0,3)",64,0,0,24
.global	strobe_get
	.type	strobe_get, @function
strobe_get:
	.stabn	68,0,82,.LM39-.LFBB4
.LM39:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,83,.LM40-.LFBB4
.LM40:
	ldi r20,lo8(11)
	mul r20,r24
	movw r18,r0
	mul r20,r25
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,84,.LM41-.LFBB4
.LM41:
	movw r24,r18
	subi r24,lo8(-(strobes))
	sbci r25,hi8(-(strobes))
/* epilogue start */
	ret
	.size	strobe_get, .-strobe_get
.Lscope4:
	.stabs	"strobe_is_active:F(0,16)=eFalse:0,True:1,;",36,0,0,strobe_is_active
	.stabs	"_Bool:t(0,16)",128,0,0,0
	.stabs	"i:P(0,3)",64,0,0,24
.global	strobe_is_active
	.type	strobe_is_active, @function
strobe_is_active:
	.stabn	68,0,87,.LM42-.LFBB5
.LM42:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,88,.LM43-.LFBB5
.LM43:
	ldi r18,lo8(11)
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	ld r24,Z
	ldd r25,Z+1
	ldd r26,Z+2
	ldd r27,Z+3
	.stabn	68,0,88,.LM44-.LFBB5
.LM44:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L23
	ldi r24,lo8(1)
	ldd r18,Z+6
	ldd r19,Z+7
	or r18,r19
	brne .L21
	ldi r24,0
.L21:
	.stabn	68,0,89,.LM45-.LFBB5
.LM45:
	andi r24,lo8(1)
/* epilogue start */
	ret
.L23:
	.stabn	68,0,88,.LM46-.LFBB5
.LM46:
	ldi r24,lo8(1)
	rjmp .L21
	.size	strobe_is_active, .-strobe_is_active
.Lscope5:
	.stabs	"strobe_setup:F(0,1)",36,0,0,strobe_setup
	.stabs	"i:P(0,3)",64,0,0,24
	.stabs	"duration_ms:P(0,9)",64,0,0,22
	.stabs	"period_ms:P(0,9)",64,0,0,20
	.stabs	"duty_cycle:P(0,11)",64,0,0,18
.global	strobe_setup
	.type	strobe_setup, @function
strobe_setup:
	.stabn	68,0,92,.LM47-.LFBB6
.LM47:
.LFBB6:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	mov r25,r18
	.stabn	68,0,93,.LM48-.LFBB6
.LM48:
	movw r16,r22
	ldi r19,0
	ldi r18,0
	.stabn	68,0,93,.LM49-.LFBB6
.LM49:
	ldi r24,lo8(11)
	mul r24,r26
	movw r30,r0
	mul r24,r27
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	st Z,r16
	std Z+1,r17
	std Z+2,r18
	std Z+3,r19
	.stabn	68,0,94,.LM50-.LFBB6
.LM50:
	std Z+7,r21
	std Z+6,r20
	.stabn	68,0,95,.LM51-.LFBB6
.LM51:
	std Z+8,r25
	.stabn	68,0,96,.LM52-.LFBB6
.LM52:
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
/* epilogue start */
	.stabn	68,0,97,.LM53-.LFBB6
.LM53:
	pop r17
	pop r16
	ret
	.size	strobe_setup, .-strobe_setup
.Lscope6:
	.stabs	"strobe_set_cb:F(0,1)",36,0,0,strobe_set_cb
	.stabs	"i:P(0,3)",64,0,0,24
	.stabs	"trans_func:P(0,13)",64,0,0,22
.global	strobe_set_cb
	.type	strobe_set_cb, @function
strobe_set_cb:
	.stabn	68,0,100,.LM54-.LFBB7
.LM54:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,101,.LM55-.LFBB7
.LM55:
	ldi r20,lo8(11)
	mul r20,r24
	movw r18,r0
	mul r20,r25
	add r19,r0
	clr __zero_reg__
	subi r18,lo8(-(strobes))
	sbci r19,hi8(-(strobes))
	movw r30,r18
	std Z+10,r23
	std Z+9,r22
/* epilogue start */
	.stabn	68,0,102,.LM56-.LFBB7
.LM56:
	ret
	.size	strobe_set_cb, .-strobe_set_cb
.Lscope7:
	.local	strobes
	.comm	strobes,33,1
	.stabs	"strobes:S(0,17)=ar(0,18)=r(0,18);0;65535;;0;2;(0,7)",40,0,0,strobes
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
