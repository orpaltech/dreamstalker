	.file	"oddebug.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/oddebug.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"uartPutc:f(0,1)=(0,1)",36,0,0,uartPutc
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"c:P(0,4)=r(0,4);0;255;",64,0,0,24
	.stabs	"char:t(0,4)",128,0,0,0
	.type	uartPutc, @function
uartPutc:
	.stabn	68,0,18,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L2:
	.stabn	68,0,19,.LM1-.LFBB1
.LM1:
	lds r25,192
	.stabn	68,0,19,.LM2-.LFBB1
.LM2:
	sbrs r25,5
	rjmp .L2
	.stabn	68,0,20,.LM3-.LFBB1
.LM3:
	sts 198,r24
/* epilogue start */
	.stabn	68,0,21,.LM4-.LFBB1
.LM4:
	ret
	.size	uartPutc, .-uartPutc
.Lscope1:
	.stabs	"printHex:f(0,1)",36,0,0,printHex
	.stabs	"c:P(0,3)",64,0,0,28
	.type	printHex, @function
printHex:
	.stabn	68,0,33,.LM5-.LFBB2
.LM5:
.LFBB2:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.stabn	68,0,34,.LM6-.LFBB2
.LM6:
	swap r24
	andi r24,lo8(15)
.LBB6:
.LBB7:
	.stabn	68,0,26,.LM7-.LFBB2
.LM7:
	cpi r28,lo8(-96)
	brlo .L6
	.stabn	68,0,27,.LM8-.LFBB2
.LM8:
	subi r24,lo8(-(39))
.L6:
.LBE7:
.LBE6:
	.stabn	68,0,34,.LM9-.LFBB2
.LM9:
	subi r24,lo8(-(48))
	call uartPutc
.LBB8:
.LBB9:
	.stabn	68,0,25,.LM10-.LFBB2
.LM10:
	mov r24,r28
	andi r24,lo8(15)
	.stabn	68,0,26,.LM11-.LFBB2
.LM11:
	cpi r24,lo8(10)
	brlo .L7
	.stabn	68,0,27,.LM12-.LFBB2
.LM12:
	subi r24,lo8(-(39))
.L7:
.LBE9:
.LBE8:
	.stabn	68,0,35,.LM13-.LFBB2
.LM13:
	subi r24,lo8(-(48))
/* epilogue start */
	.stabn	68,0,36,.LM14-.LFBB2
.LM14:
	pop r28
	.stabn	68,0,35,.LM15-.LFBB2
.LM15:
	jmp uartPutc
	.size	printHex, .-printHex
.Lscope2:
	.stabs	"odDebug:F(0,1)",36,0,0,odDebug
	.stabs	"prefix:P(0,3)",64,0,0,24
	.stabs	"len:P(0,3)",64,0,0,28
.global	odDebug
	.type	odDebug, @function
odDebug:
	.stabn	68,0,39,.LM16-.LFBB3
.LM16:
.LFBB3:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	mov r16,r22
	mov r29,r23
	mov r28,r20
	.stabn	68,0,40,.LM17-.LFBB3
.LM17:
	call printHex
	.stabn	68,0,41,.LM18-.LFBB3
.LM18:
	ldi r24,lo8(58)
	call uartPutc
	.stabn	68,0,42,.LM19-.LFBB3
.LM19:
	mov r17,r16
	mov r15,r29
	.stabn	68,0,42,.LM20-.LFBB3
.LM20:
	mov r16,r28
	add r16,r17
.L9:
	cpse r16,r17
	rjmp .L10
	.stabn	68,0,46,.LM21-.LFBB3
.LM21:
	ldi r24,lo8(13)
	call uartPutc
	.stabn	68,0,47,.LM22-.LFBB3
.LM22:
	ldi r24,lo8(10)
/* epilogue start */
	.stabn	68,0,48,.LM23-.LFBB3
.LM23:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	.stabn	68,0,47,.LM24-.LFBB3
.LM24:
	jmp uartPutc
.L10:
	.stabn	68,0,43,.LM25-.LFBB3
.LM25:
	ldi r24,lo8(32)
	call uartPutc
	.stabn	68,0,44,.LM26-.LFBB3
.LM26:
	mov r28,r17
	mov r29,r15
	.stabn	68,0,44,.LM27-.LFBB3
.LM27:
	ld r24,Y+
	call printHex
	.stabn	68,0,44,.LM28-.LFBB3
.LM28:
	mov r17,r28
	mov r15,r29
	rjmp .L9
	.size	odDebug, .-odDebug
.Lscope3:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
