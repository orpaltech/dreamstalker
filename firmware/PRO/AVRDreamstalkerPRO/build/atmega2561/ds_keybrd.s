	.file	"ds_keybrd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/input/ds_keybrd.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"__vector_1:F(0,1)=(0,1)",36,0,0,__vector_1
	.stabs	"void:t(0,1)",128,0,0,0
.global	__vector_1
	.type	__vector_1, @function
__vector_1:
	.stabn	68,0,50,.LM0-.LFBB1
.LM0:
.LFBB1:
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...3 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
/* epilogue start */
	.stabn	68,0,52,.LM1-.LFBB1
.LM1:
	__gcc_isr 2
	reti
	__gcc_isr 0,r0
	.size	__vector_1, .-__vector_1
.Lscope1:
.global	__vector_2
	.type	__vector_2, @function
__vector_2:
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...3 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
/* epilogue start */
	__gcc_isr 2
	reti
	__gcc_isr 0,r0
	.size	__vector_2, .-__vector_2
	.stabs	"keybrd_init:F(0,1)",36,0,0,keybrd_init
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	keybrd_init
	.type	keybrd_init, @function
keybrd_init:
	.stabn	68,0,61,.LM2-.LFBB2
.LM2:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,63,.LM3-.LFBB2
.LM3:
	in r24,0xa
	andi r24,lo8(12)
	out 0xa,r24
	.stabn	68,0,71,.LM4-.LFBB2
.LM4:
	in r24,0xb
	ori r24,lo8(-13)
	out 0xb,r24
	.stabn	68,0,78,.LM5-.LFBB2
.LM5:
	ldi r24,lo8(10)
	sts 105,r24
	.stabn	68,0,79,.LM6-.LFBB2
.LM6:
	out 0x1d,__zero_reg__
/* epilogue start */
	.stabn	68,0,80,.LM7-.LFBB2
.LM7:
	ret
	.size	keybrd_init, .-keybrd_init
.Lscope2:
	.stabs	"keybrd_test:F(0,2)",36,0,0,keybrd_test
	.stabs	"uint16_t:t(0,4)=(0,5)=r(0,5);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
.global	keybrd_test
	.type	keybrd_test, @function
keybrd_test:
	.stabn	68,0,84,.LM8-.LFBB3
.LM8:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,88,.LM9-.LFBB3
.LM9:
	in r24,0x9
	com r24
	andi r24,lo8(1)
	.stabn	68,0,94,.LM10-.LFBB3
.LM10:
	sbis 0x9,1
	.stabn	68,0,96,.LM11-.LFBB3
.LM11:
	ori r24,lo8(2)
.L5:
	.stabn	68,0,100,.LM12-.LFBB3
.LM12:
	sbis 0x9,5
	.stabn	68,0,102,.LM13-.LFBB3
.LM13:
	ori r24,lo8(8)
.L6:
	.stabn	68,0,106,.LM14-.LFBB3
.LM14:
	sbis 0x9,4
	.stabn	68,0,108,.LM15-.LFBB3
.LM15:
	ori r24,lo8(4)
.L7:
	.stabn	68,0,112,.LM16-.LFBB3
.LM16:
	sbis 0x9,6
	.stabn	68,0,114,.LM17-.LFBB3
.LM17:
	ori r24,lo8(16)
.L8:
	.stabn	68,0,118,.LM18-.LFBB3
.LM18:
	sbis 0x9,7
	.stabn	68,0,120,.LM19-.LFBB3
.LM19:
	ori r24,lo8(32)
.L4:
/* epilogue start */
	.stabn	68,0,124,.LM20-.LFBB3
.LM20:
	ret
	.size	keybrd_test, .-keybrd_test
	.stabs	"ret:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
