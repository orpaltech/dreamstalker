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
	.stabn	68,0,62,.LM0-.LFBB1
.LM0:
.LFBB1:
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...4 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
	.stabn	68,0,65,.LM1-.LFBB1
.LM1:
	lds r24,irq_keys
	ori r24,lo8(1)
	sts irq_keys,r24
/* epilogue start */
	.stabn	68,0,66,.LM2-.LFBB1
.LM2:
	__gcc_isr 2
	reti
	__gcc_isr 0,r24
	.size	__vector_1, .-__vector_1
.Lscope1:
	.stabs	"__vector_2:F(0,1)",36,0,0,__vector_2
.global	__vector_2
	.type	__vector_2, @function
__vector_2:
	.stabn	68,0,69,.LM3-.LFBB2
.LM3:
.LFBB2:
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...4 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
	.stabn	68,0,72,.LM4-.LFBB2
.LM4:
	lds r24,irq_keys
	ori r24,lo8(2)
	sts irq_keys,r24
/* epilogue start */
	.stabn	68,0,73,.LM5-.LFBB2
.LM5:
	__gcc_isr 2
	reti
	__gcc_isr 0,r24
	.size	__vector_2, .-__vector_2
.Lscope2:
	.stabs	"keybrd_init:F(0,1)",36,0,0,keybrd_init
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	keybrd_init
	.type	keybrd_init, @function
keybrd_init:
	.stabn	68,0,77,.LM6-.LFBB3
.LM6:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,79,.LM7-.LFBB3
.LM7:
	in r24,0x11
	andi r24,lo8(12)
	out 0x11,r24
	.stabn	68,0,87,.LM8-.LFBB3
.LM8:
	in r24,0x12
	ori r24,lo8(-13)
	out 0x12,r24
	.stabn	68,0,95,.LM9-.LFBB3
.LM9:
	out 0x39,__zero_reg__
	.stabn	68,0,98,.LM10-.LFBB3
.LM10:
	ldi r30,lo8(106)
	ldi r31,0
	ld r24,Z
	.stabn	68,0,98,.LM11-.LFBB3
.LM11:
	andi r24,lo8(-16)
	ori r24,lo8(10)
	.stabn	68,0,98,.LM12-.LFBB3
.LM12:
	st Z,r24
/* epilogue start */
	.stabn	68,0,99,.LM13-.LFBB3
.LM13:
	ret
	.size	keybrd_init, .-keybrd_init
.Lscope3:
	.stabs	"keybrd_hold_repeat_disable:F(0,1)",36,0,0,keybrd_hold_repeat_disable
.global	keybrd_hold_repeat_disable
	.type	keybrd_hold_repeat_disable, @function
keybrd_hold_repeat_disable:
	.stabn	68,0,102,.LM14-.LFBB4
.LM14:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,103,.LM15-.LFBB4
.LM15:
	ldi r25,0
	ldi r24,0
	jmp input_set_hold_repeat
	.size	keybrd_hold_repeat_disable, .-keybrd_hold_repeat_disable
.Lscope4:
	.stabs	"keybrd_hold_repeat_default:F(0,1)",36,0,0,keybrd_hold_repeat_default
.global	keybrd_hold_repeat_default
	.type	keybrd_hold_repeat_default, @function
keybrd_hold_repeat_default:
	.stabn	68,0,107,.LM16-.LFBB5
.LM16:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,108,.LM17-.LFBB5
.LM17:
	ldi r24,lo8(50)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	keybrd_hold_repeat_default, .-keybrd_hold_repeat_default
.Lscope5:
	.stabs	"keybrd_hold_repeat_fast:F(0,1)",36,0,0,keybrd_hold_repeat_fast
.global	keybrd_hold_repeat_fast
	.type	keybrd_hold_repeat_fast, @function
keybrd_hold_repeat_fast:
	.stabn	68,0,112,.LM18-.LFBB6
.LM18:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,113,.LM19-.LFBB6
.LM19:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	keybrd_hold_repeat_fast, .-keybrd_hold_repeat_fast
.Lscope6:
	.stabs	"keybrd_get_irq_keys:F(0,2)",36,0,0,keybrd_get_irq_keys
.global	keybrd_get_irq_keys
	.type	keybrd_get_irq_keys, @function
keybrd_get_irq_keys:
	.stabn	68,0,117,.LM20-.LFBB7
.LM20:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,118,.LM21-.LFBB7
.LM21:
	lds r24,irq_keys
/* epilogue start */
	.stabn	68,0,119,.LM22-.LFBB7
.LM22:
	ret
	.size	keybrd_get_irq_keys, .-keybrd_get_irq_keys
.Lscope7:
	.stabs	"keybrd_enable_irq:F(0,1)",36,0,0,keybrd_enable_irq
	.stabs	"keys:P(0,2)",64,0,0,24
.global	keybrd_enable_irq
	.type	keybrd_enable_irq, @function
keybrd_enable_irq:
	.stabn	68,0,122,.LM23-.LFBB8
.LM23:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,123,.LM24-.LFBB8
.LM24:
	sbrs r24,0
	rjmp .L9
	.stabn	68,0,124,.LM25-.LFBB8
.LM25:
	in r25,0x39
	ori r25,lo8(1)
	out 0x39,r25
.L9:
	.stabn	68,0,127,.LM26-.LFBB8
.LM26:
	sbrs r24,1
	rjmp .L10
	.stabn	68,0,128,.LM27-.LFBB8
.LM27:
	in r24,0x39
	ori r24,lo8(2)
	out 0x39,r24
.L10:
	.stabn	68,0,131,.LM28-.LFBB8
.LM28:
	sts irq_keys,__zero_reg__
/* epilogue start */
	.stabn	68,0,132,.LM29-.LFBB8
.LM29:
	ret
	.size	keybrd_enable_irq, .-keybrd_enable_irq
.Lscope8:
	.stabs	"keybrd_disable_irq:F(0,1)",36,0,0,keybrd_disable_irq
	.stabs	"keys:P(0,2)",64,0,0,24
.global	keybrd_disable_irq
	.type	keybrd_disable_irq, @function
keybrd_disable_irq:
	.stabn	68,0,135,.LM30-.LFBB9
.LM30:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,136,.LM31-.LFBB9
.LM31:
	sbrs r24,0
	rjmp .L18
	.stabn	68,0,137,.LM32-.LFBB9
.LM32:
	in r25,0x39
	andi r25,lo8(-2)
	out 0x39,r25
.L18:
	.stabn	68,0,140,.LM33-.LFBB9
.LM33:
	sbrs r24,1
	rjmp .L17
	.stabn	68,0,141,.LM34-.LFBB9
.LM34:
	in r24,0x39
	andi r24,lo8(-3)
	out 0x39,r24
.L17:
/* epilogue start */
	.stabn	68,0,143,.LM35-.LFBB9
.LM35:
	ret
	.size	keybrd_disable_irq, .-keybrd_disable_irq
.Lscope9:
	.stabs	"keybrd_get_event:F(0,4)=(0,2)",36,0,0,keybrd_get_event
	.stabs	"keybrd_event_t:t(0,4)",128,0,0,0
.global	keybrd_get_event
	.type	keybrd_get_event, @function
keybrd_get_event:
	.stabn	68,0,146,.LM36-.LFBB10
.LM36:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,147,.LM37-.LFBB10
.LM37:
	lds r24,v_InputEventCount
	.stabn	68,0,147,.LM38-.LFBB10
.LM38:
	cpse r24,__zero_reg__
	.stabn	68,0,150,.LM39-.LFBB10
.LM39:
	jmp input_get_event
.L26:
	.stabn	68,0,151,.LM40-.LFBB10
.LM40:
	ldi r24,0
/* epilogue start */
	ret
	.size	keybrd_get_event, .-keybrd_get_event
.Lscope10:
	.stabs	"keybrd_clear_events:F(0,1)",36,0,0,keybrd_clear_events
.global	keybrd_clear_events
	.type	keybrd_clear_events, @function
keybrd_clear_events:
	.stabn	68,0,154,.LM41-.LFBB11
.LM41:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,155,.LM42-.LFBB11
.LM42:
	jmp input_clear_events
	.size	keybrd_clear_events, .-keybrd_clear_events
.Lscope11:
	.stabs	"keybrd_isr:F(0,5)=eFalse:0,True:1,;",36,0,0,keybrd_isr
	.stabs	"_Bool:t(0,5)",128,0,0,0
.global	keybrd_isr
	.type	keybrd_isr, @function
keybrd_isr:
	.stabn	68,0,164,.LM43-.LFBB12
.LM43:
.LFBB12:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB4:
.LBB5:
	.stabn	68,0,179,.LM44-.LFBB12
.LM44:
	in r28,0x10
	com r28
	andi r28,lo8(1)
	.stabn	68,0,185,.LM45-.LFBB12
.LM45:
	sbis 0x10,1
	.stabn	68,0,187,.LM46-.LFBB12
.LM46:
	ori r28,lo8(2)
.L30:
	.stabn	68,0,191,.LM47-.LFBB12
.LM47:
	sbis 0x10,5
	.stabn	68,0,193,.LM48-.LFBB12
.LM48:
	ori r28,lo8(8)
.L31:
	.stabn	68,0,197,.LM49-.LFBB12
.LM49:
	sbis 0x10,4
	.stabn	68,0,199,.LM50-.LFBB12
.LM50:
	ori r28,lo8(4)
.L32:
	.stabn	68,0,203,.LM51-.LFBB12
.LM51:
	sbis 0x10,6
	.stabn	68,0,205,.LM52-.LFBB12
.LM52:
	ori r28,lo8(16)
.L33:
	.stabn	68,0,209,.LM53-.LFBB12
.LM53:
	sbis 0x10,7
	.stabn	68,0,211,.LM54-.LFBB12
.LM54:
	ori r28,lo8(32)
.L34:
.LBE5:
.LBE4:
	.stabn	68,0,168,.LM55-.LFBB12
.LM55:
	mov r24,r28
	call input_process
	.stabn	68,0,170,.LM56-.LFBB12
.LM56:
	ldi r24,lo8(1)
	cpse r28,__zero_reg__
	rjmp .L35
	ldi r24,0
.L35:
/* epilogue start */
	.stabn	68,0,171,.LM57-.LFBB12
.LM57:
	pop r28
	ret
	.size	keybrd_isr, .-keybrd_isr
	.stabs	"ret:r(0,4)",64,0,0,28
	.stabn	192,0,0,.LBB5-.LFBB12
	.stabn	224,0,0,.LBE5-.LFBB12
.Lscope12:
	.local	irq_keys
	.comm	irq_keys,1,1
	.stabs	"irq_keys:S(0,2)",38,0,0,irq_keys
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
