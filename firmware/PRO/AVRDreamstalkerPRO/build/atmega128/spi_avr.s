	.file	"spi_avr.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/core/spi_avr.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"spi_enable:F(0,1)=eFalse:0,True:1,;",36,0,0,spi_enable
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"_Bool:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	spi_enable
	.type	spi_enable, @function
spi_enable:
	.stabn	68,0,31,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,32,.LM1-.LFBB1
.LM1:
	sbic 0xd,6
	rjmp .L2
	.stabn	68,0,36,.LM2-.LFBB1
.LM2:
	in r24,0x17
	ori r24,lo8(6)
	out 0x17,r24
	.stabn	68,0,37,.LM3-.LFBB1
.LM3:
	cbi 0x17,3
	.stabn	68,0,39,.LM4-.LFBB1
.LM4:
	cbi 0x18,2
	.stabn	68,0,40,.LM5-.LFBB1
.LM5:
	cbi 0x18,1
	.stabn	68,0,41,.LM6-.LFBB1
.LM6:
	sbi 0x18,3
	.stabn	68,0,43,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(80)
	out 0xd,r24
.LBB4:
.LBB5:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM8-.LFBB1
.LM8:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.L2:
.LBE5:
.LBE4:
	.stabs	"src/core/spi_avr.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,47,.LM9-.LFBB1
.LM9:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	spi_enable, .-spi_enable
.Lscope1:
	.stabs	"spi_disable:F(0,4)=(0,4)",36,0,0,spi_disable
	.stabs	"void:t(0,4)",128,0,0,0
.global	spi_disable
	.type	spi_disable, @function
spi_disable:
	.stabn	68,0,50,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,51,.LM11-.LFBB2
.LM11:
	out 0xd,__zero_reg__
	.stabn	68,0,54,.LM12-.LFBB2
.LM12:
	in r24,0x17
	andi r24,lo8(-7)
	out 0x17,r24
	.stabn	68,0,57,.LM13-.LFBB2
.LM13:
	in r24,0x18
	andi r24,lo8(-15)
	out 0x18,r24
/* epilogue start */
	.stabn	68,0,58,.LM14-.LFBB2
.LM14:
	ret
	.size	spi_disable, .-spi_disable
.Lscope2:
	.stabs	"spi_set_clk:F(0,5)=(0,6)=eclock_div_1:1,clock_div_2:2,clock_div_4:4,clock_div_8:8,clock_div_16:16,clock_div_32:32,clock_div_64:64,clock_div_128:128,;",36,0,0,spi_set_clk
	.stabs	" :T(0,6)",128,0,0,0
	.stabs	"div:P(0,5)",64,0,0,18
.global	spi_set_clk
	.type	spi_set_clk, @function
spi_set_clk:
	.stabn	68,0,64,.LM15-.LFBB3
.LM15:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,69,.LM16-.LFBB3
.LM16:
	in r25,0xd
	.stabn	68,0,69,.LM17-.LFBB3
.LM17:
	andi r25,lo8(3)
	.stabn	68,0,70,.LM18-.LFBB3
.LM18:
	in r24,0xe
	.stabn	68,0,70,.LM19-.LFBB3
.LM19:
	andi r24,lo8(1)
	.stabn	68,0,72,.LM20-.LFBB3
.LM20:
	cpi r25,lo8(2)
	breq .L5
	cpi r25,lo8(3)
	breq .L6
	cpi r25,lo8(1)
	breq .L7
	.stabn	68,0,74,.LM21-.LFBB3
.LM21:
	cpse r24,__zero_reg__
	rjmp .L22
	ldi r24,lo8(4)
	ldi r25,0
.L8:
	.stabn	68,0,87,.LM22-.LFBB3
.LM22:
	cpi r18,32
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L9
	brsh .L10
	cpi r18,8
	cpc r19,__zero_reg__
	breq .L11
	brsh .L12
	cpi r18,2
	cpc r19,__zero_reg__
	breq .L13
	cpi r18,4
	cpc r19,__zero_reg__
	breq .L13
.L67:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	ret
.L7:
	.stabn	68,0,77,.LM23-.LFBB3
.LM23:
	cpse r24,__zero_reg__
	rjmp .L23
	ldi r24,lo8(16)
	ldi r25,0
	rjmp .L8
.L5:
	.stabn	68,0,80,.LM24-.LFBB3
.LM24:
	tst r24
	breq .L25
	ldi r24,lo8(32)
	ldi r25,0
	rjmp .L8
.L6:
	.stabn	68,0,83,.LM25-.LFBB3
.LM25:
	cpse r24,__zero_reg__
	rjmp .L25
	ldi r24,lo8(-128)
	ldi r25,0
	rjmp .L8
.L22:
	.stabn	68,0,74,.LM26-.LFBB3
.LM26:
	ldi r24,lo8(2)
	ldi r25,0
	rjmp .L8
.L23:
	.stabn	68,0,77,.LM27-.LFBB3
.LM27:
	ldi r24,lo8(8)
	ldi r25,0
	rjmp .L8
.L25:
	.stabn	68,0,80,.LM28-.LFBB3
.LM28:
	ldi r24,lo8(64)
	ldi r25,0
	rjmp .L8
.L12:
	.stabn	68,0,87,.LM29-.LFBB3
.LM29:
	cpi r18,16
	cpc r19,__zero_reg__
	brne .L67
.L11:
	.stabn	68,0,94,.LM30-.LFBB3
.LM30:
	in r20,0xd
	.stabn	68,0,94,.LM31-.LFBB3
.LM31:
	andi r20,lo8(-4)
	ori r20,lo8(1)
.L65:
	.stabn	68,0,98,.LM32-.LFBB3
.LM32:
	out 0xd,r20
	.stabn	68,0,107,.LM33-.LFBB3
.LM33:
	cpi r18,8
	cpc r19,__zero_reg__
	breq .L19
	brlo .L16
	cpi r18,32
	cpc r19,__zero_reg__
	breq .L19
	brsh .L21
	cpi r18,16
	cpc r19,__zero_reg__
	brne .L4
	rjmp .L18
.L10:
	.stabn	68,0,87,.LM34-.LFBB3
.LM34:
	cpi r18,64
	cpc r19,__zero_reg__
	breq .L9
	cpi r18,-128
	cpc r19,__zero_reg__
	brne .L67
	.stabn	68,0,101,.LM35-.LFBB3
.LM35:
	in r18,0xd
	ori r18,lo8(3)
	out 0xd,r18
.L18:
	.stabn	68,0,117,.LM36-.LFBB3
.LM36:
	cbi 0xe,0
	.stabn	68,0,118,.LM37-.LFBB3
.LM37:
	rjmp .L4
.L13:
	.stabn	68,0,90,.LM38-.LFBB3
.LM38:
	in r20,0xd
	andi r20,lo8(-4)
	out 0xd,r20
.L16:
	.stabn	68,0,107,.LM39-.LFBB3
.LM39:
	cpi r18,2
	cpc r19,__zero_reg__
	breq .L19
	cpi r18,4
	cpc r19,__zero_reg__
	breq .L18
.L4:
/* epilogue start */
	.stabn	68,0,124,.LM40-.LFBB3
.LM40:
	ret
.L9:
	.stabn	68,0,98,.LM41-.LFBB3
.LM41:
	in r20,0xd
	.stabn	68,0,98,.LM42-.LFBB3
.LM42:
	andi r20,lo8(-4)
	ori r20,lo8(2)
	rjmp .L65
.L21:
	.stabn	68,0,107,.LM43-.LFBB3
.LM43:
	cpi r18,64
	cpc r19,__zero_reg__
	breq .L18
	cpi r18,-128
	cpc r19,__zero_reg__
	brne .L4
	rjmp .L18
.L19:
	.stabn	68,0,111,.LM44-.LFBB3
.LM44:
	sbi 0xe,0
	.stabn	68,0,112,.LM45-.LFBB3
.LM45:
	ret
	.size	spi_set_clk, .-spi_set_clk
	.stabs	"spr:r(0,2)",64,0,0,25
	.stabs	"x2:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"spi_xchg:F(0,2)",36,0,0,spi_xchg
	.stabs	"uint16_t:t(0,7)=(0,8)=r(0,8);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,8)",128,0,0,0
	.stabs	"dat:P(0,2)",64,0,0,24
.global	spi_xchg
	.type	spi_xchg, @function
spi_xchg:
	.stabn	68,0,131,.LM46-.LFBB4
.LM46:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,132,.LM47-.LFBB4
.LM47:
	out 0xf,r24
.L69:
	.stabn	68,0,133,.LM48-.LFBB4
.LM48:
	sbis 0xe,7
	rjmp .L69
	.stabn	68,0,134,.LM49-.LFBB4
.LM49:
	in r24,0xf
/* epilogue start */
	.stabn	68,0,135,.LM50-.LFBB4
.LM50:
	ret
	.size	spi_xchg, .-spi_xchg
.Lscope4:
	.stabs	"spi_rcvr_multi:F(0,4)",36,0,0,spi_rcvr_multi
	.stabs	"cnt:P(0,9)=(0,10)=r(0,10);0;4294967295;",64,0,0,16
	.stabs	"uint32_t:t(0,9)",128,0,0,0
	.stabs	"long unsigned int:t(0,10)",128,0,0,0
.global	spi_rcvr_multi
	.type	spi_rcvr_multi, @function
spi_rcvr_multi:
	.stabn	68,0,146,.LM51-.LFBB5
.LM51:
.LFBB5:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r16,r20
	movw r18,r22
	movw r30,r24
	.stabn	68,0,148,.LM52-.LFBB5
.LM52:
	ldi r24,lo8(-1)
.L74:
	out 0xf,r24
.L72:
	.stabn	68,0,149,.LM53-.LFBB5
.LM53:
	sbis 0xe,7
	rjmp .L72
	.stabn	68,0,150,.LM54-.LFBB5
.LM54:
	in r25,0xf
	.stabn	68,0,150,.LM55-.LFBB5
.LM55:
	st Z,r25
	.stabn	68,0,151,.LM56-.LFBB5
.LM56:
	out 0xf,r24
.L73:
	.stabn	68,0,152,.LM57-.LFBB5
.LM57:
	sbis 0xe,7
	rjmp .L73
	.stabn	68,0,153,.LM58-.LFBB5
.LM58:
	in r25,0xf
	.stabn	68,0,153,.LM59-.LFBB5
.LM59:
	std Z+1,r25
	.stabn	68,0,154,.LM60-.LFBB5
.LM60:
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,154,.LM61-.LFBB5
.LM61:
	adiw r30,2
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L74
/* epilogue start */
	.stabn	68,0,155,.LM62-.LFBB5
.LM62:
	pop r17
	pop r16
	ret
	.size	spi_rcvr_multi, .-spi_rcvr_multi
.Lscope5:
	.stabs	"spi_xmit_multi:F(0,4)",36,0,0,spi_xmit_multi
	.stabs	"p:P(0,11)=*(0,2)",64,0,0,30
	.stabs	"cnt:P(0,9)",64,0,0,16
.global	spi_xmit_multi
	.type	spi_xmit_multi, @function
spi_xmit_multi:
	.stabn	68,0,162,.LM63-.LFBB6
.LM63:
.LFBB6:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
	movw r16,r20
	movw r18,r22
	.stabn	68,0,163,.LM64-.LFBB6
.LM64:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L78
	.stabn	68,0,165,.LM65-.LFBB6
.LM65:
	ld r24,Z
	.stabn	68,0,164,.LM66-.LFBB6
.LM66:
	cpi r16,1
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L84
/* epilogue start */
	.stabn	68,0,174,.LM67-.LFBB6
.LM67:
	pop r17
	pop r16
	.stabn	68,0,165,.LM68-.LFBB6
.LM68:
	jmp spi_xchg
.L84:
	.stabn	68,0,169,.LM69-.LFBB6
.LM69:
	ld r24,Z
	.stabn	68,0,169,.LM70-.LFBB6
.LM70:
	out 0xf,r24
.L82:
	.stabn	68,0,170,.LM71-.LFBB6
.LM71:
	sbis 0xe,7
	rjmp .L82
	.stabn	68,0,171,.LM72-.LFBB6
.LM72:
	ldd r24,Z+1
	.stabn	68,0,171,.LM73-.LFBB6
.LM73:
	out 0xf,r24
.L83:
	.stabn	68,0,172,.LM74-.LFBB6
.LM74:
	sbis 0xe,7
	rjmp .L83
	.stabn	68,0,173,.LM75-.LFBB6
.LM75:
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,173,.LM76-.LFBB6
.LM76:
	adiw r30,2
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L84
.L78:
/* epilogue start */
	.stabn	68,0,174,.LM77-.LFBB6
.LM77:
	pop r17
	pop r16
	ret
	.size	spi_xmit_multi, .-spi_xmit_multi
.Lscope6:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
