	.file	"ds_deferred.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_deferred.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"deferred_init:F(0,1)=(0,1)",36,0,0,deferred_init
	.stabs	"void:t(0,1)",128,0,0,0
.global	deferred_init
	.type	deferred_init, @function
deferred_init:
	.stabn	68,0,37,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,38,.LM1-.LFBB1
.LM1:
	ldi r30,lo8(dd)
	ldi r31,hi8(dd)
	ldi r24,lo8(14)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
/* epilogue start */
	.stabn	68,0,39,.LM2-.LFBB1
.LM2:
	ret
	.size	deferred_init, .-deferred_init
.Lscope1:
	.stabs	"deferred_start:F(0,2)=eFalse:0,True:1,;",36,0,0,deferred_start
	.stabs	"_Bool:t(0,2)",128,0,0,0
	.stabs	"i:P(0,3)=r(0,3);-32768;32767;",64,0,0,24
	.stabs	"handler:P(0,4)=(0,5)=*(0,6)=f(0,1)",64,0,0,18
	.stabs	"int:t(0,3)",128,0,0,0
	.stabs	"pfn_deferred_handler:t(0,4)",128,0,0,0
.global	deferred_start
	.type	deferred_start, @function
deferred_start:
	.stabn	68,0,42,.LM3-.LFBB2
.LM3:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB6:
.LBB7:
	.stabn	68,0,55,.LM4-.LFBB2
.LM4:
	ldi r20,lo8(7)
	mul r20,r24
	movw r30,r0
	mul r20,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(dd))
	sbci r31,hi8(-(dd))
	ld r24,Z
	ldd r25,Z+1
.LBE7:
.LBE6:
	.stabn	68,0,43,.LM5-.LFBB2
.LM5:
	or r24,r25
	brne .L4
	.stabn	68,0,46,.LM6-.LFBB2
.LM6:
	std Z+1,r23
	st Z,r22
	.stabn	68,0,47,.LM7-.LFBB2
.LM7:
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
	std Z+4,__zero_reg__
	std Z+5,__zero_reg__
	.stabn	68,0,48,.LM8-.LFBB2
.LM8:
	std Z+6,__zero_reg__
	.stabn	68,0,50,.LM9-.LFBB2
.LM9:
	ldi r24,lo8(1)
	ret
.L4:
	.stabn	68,0,44,.LM10-.LFBB2
.LM10:
	ldi r24,0
/* epilogue start */
	.stabn	68,0,51,.LM11-.LFBB2
.LM11:
	ret
	.size	deferred_start, .-deferred_start
.Lscope2:
	.stabs	"deferred_is_running:F(0,2)",36,0,0,deferred_is_running
	.stabs	"i:P(0,3)",64,0,0,24
.global	deferred_is_running
	.type	deferred_is_running, @function
deferred_is_running:
	.stabn	68,0,54,.LM12-.LFBB3
.LM12:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,55,.LM13-.LFBB3
.LM13:
	ldi r20,lo8(7)
	mul r20,r24
	movw r18,r0
	mul r20,r25
	add r19,r0
	clr __zero_reg__
	subi r18,lo8(-(dd))
	sbci r19,hi8(-(dd))
	movw r30,r18
	ld r18,Z
	ldd r19,Z+1
	.stabn	68,0,55,.LM14-.LFBB3
.LM14:
	ldi r24,lo8(1)
	or r18,r19
	brne .L6
	ldi r24,0
.L6:
/* epilogue start */
	.stabn	68,0,56,.LM15-.LFBB3
.LM15:
	ret
	.size	deferred_is_running, .-deferred_is_running
.Lscope3:
	.stabs	"deferred_stop:F(0,1)",36,0,0,deferred_stop
	.stabs	"pd:P(0,7)=*(0,8)=(0,9)=xss_deferred_context:",64,0,0,24
	.stabs	"s_deferred_context:T(0,9)=s7handler:(0,4),0,16;ticks:(0,10)=(0,11)=r(0,11);0;4294967295;,16,32;flags:(0,12)=(0,13)=r(0,13);0;255;,48,8;;",128,0,0,0
	.stabs	"uint32_t:t(0,10)",128,0,0,0
	.stabs	"long unsigned int:t(0,11)",128,0,0,0
	.stabs	"uint8_t:t(0,12)",128,0,0,0
	.stabs	"unsigned char:t(0,13)",128,0,0,0
.global	deferred_stop
	.type	deferred_stop, @function
deferred_stop:
	.stabn	68,0,59,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,60,.LM17-.LFBB4
.LM17:
	movw r30,r24
	std Z+1,__zero_reg__
	st Z,__zero_reg__
/* epilogue start */
	.stabn	68,0,61,.LM18-.LFBB4
.LM18:
	ret
	.size	deferred_stop, .-deferred_stop
.Lscope4:
	.stabs	"deferred_isr:F(0,1)",36,0,0,deferred_isr
.global	deferred_isr
	.type	deferred_isr, @function
deferred_isr:
	.stabn	68,0,64,.LM19-.LFBB5
.LM19:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB8:
.LBB9:
	.stabn	68,0,55,.LM20-.LFBB5
.LM20:
	lds r24,dd
	lds r25,dd+1
.LBE9:
.LBE8:
	.stabn	68,0,68,.LM21-.LFBB5
.LM21:
	or r24,r25
	breq .L9
	.stabn	68,0,69,.LM22-.LFBB5
.LM22:
	lds r24,dd+2
	lds r25,dd+2+1
	lds r26,dd+2+2
	lds r27,dd+2+3
	.stabn	68,0,69,.LM23-.LFBB5
.LM23:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	sts dd+2,r24
	sts dd+2+1,r25
	sts dd+2+2,r26
	sts dd+2+3,r27
	.stabn	68,0,70,.LM24-.LFBB5
.LM24:
	lds r30,dd
	lds r31,dd+1
	.stabn	68,0,70,.LM25-.LFBB5
.LM25:
	ldi r24,lo8(dd)
	ldi r25,hi8(dd)
	icall
.L9:
.LBB11:
.LBB10:
	.stabn	68,0,55,.LM26-.LFBB5
.LM26:
	lds r24,dd+7
	lds r25,dd+7+1
.LBE10:
.LBE11:
	.stabn	68,0,68,.LM27-.LFBB5
.LM27:
	or r24,r25
	breq .L8
	.stabn	68,0,69,.LM28-.LFBB5
.LM28:
	lds r24,dd+9
	lds r25,dd+9+1
	lds r26,dd+9+2
	lds r27,dd+9+3
	.stabn	68,0,69,.LM29-.LFBB5
.LM29:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	sts dd+9,r24
	sts dd+9+1,r25
	sts dd+9+2,r26
	sts dd+9+3,r27
	.stabn	68,0,70,.LM30-.LFBB5
.LM30:
	lds r30,dd+7
	lds r31,dd+7+1
	.stabn	68,0,70,.LM31-.LFBB5
.LM31:
	ldi r24,lo8(dd+7)
	ldi r25,hi8(dd+7)
	ijmp
.L8:
/* epilogue start */
	.stabn	68,0,73,.LM32-.LFBB5
.LM32:
	ret
	.size	deferred_isr, .-deferred_isr
.Lscope5:
	.local	dd
	.comm	dd,14,1
	.stabs	"dd:S(0,14)=ar(0,15)=r(0,15);0;65535;;0;1;(0,8)",40,0,0,dd
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
