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
	.stabs	"spi_enable:F(0,1)=r(0,1);-32768;32767;",36,0,0,spi_enable
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"int:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	spi_enable
	.type	spi_enable, @function
spi_enable:
	.stabn	68,0,29,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,30,.LM1-.LFBB1
.LM1:
	in __tmp_reg__,0x2c
	sbrc __tmp_reg__,6
	rjmp .L2
	.stabn	68,0,34,.LM2-.LFBB1
.LM2:
	in r24,0x4
	ori r24,lo8(7)
	out 0x4,r24
	.stabn	68,0,35,.LM3-.LFBB1
.LM3:
	cbi 0x4,3
	.stabn	68,0,37,.LM4-.LFBB1
.LM4:
	sbi 0x5,3
	.stabn	68,0,38,.LM5-.LFBB1
.LM5:
	sbi 0x5,0
	.stabn	68,0,40,.LM6-.LFBB1
.LM6:
	ldi r24,lo8(80)
	out 0x2c,r24
.L2:
	.stabn	68,0,43,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	spi_enable, .-spi_enable
.Lscope1:
	.stabs	"spi_disable:F(0,4)=(0,4)",36,0,0,spi_disable
	.stabs	"void:t(0,4)",128,0,0,0
.global	spi_disable
	.type	spi_disable, @function
spi_disable:
	.stabn	68,0,46,.LM8-.LFBB2
.LM8:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,47,.LM9-.LFBB2
.LM9:
	out 0x2c,__zero_reg__
	.stabn	68,0,50,.LM10-.LFBB2
.LM10:
	in r24,0x4
	andi r24,lo8(-8)
	out 0x4,r24
	.stabn	68,0,53,.LM11-.LFBB2
.LM11:
	in r24,0x5
	andi r24,lo8(-16)
	out 0x5,r24
/* epilogue start */
	.stabn	68,0,54,.LM12-.LFBB2
.LM12:
	ret
	.size	spi_disable, .-spi_disable
.Lscope2:
	.stabs	"spi_set_clk:F(0,5)=(0,6)=eclock_div_1:0,clock_div_2:1,clock_div_4:2,clock_div_8:3,clock_div_16:4,clock_div_32:5,clock_div_64:6,clock_div_128:7,clock_div_256:8,;",36,0,0,spi_set_clk
	.stabs	" :T(0,6)",128,0,0,0
	.stabs	"div:P(0,5)",64,0,0,18
.global	spi_set_clk
	.type	spi_set_clk, @function
spi_set_clk:
	.stabn	68,0,61,.LM13-.LFBB3
.LM13:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,66,.LM14-.LFBB3
.LM14:
	in r24,0x2c
	.stabn	68,0,66,.LM15-.LFBB3
.LM15:
	andi r24,lo8(3)
	.stabn	68,0,67,.LM16-.LFBB3
.LM16:
	in r25,0x2d
	mov r20,r25
	andi r20,1
	ldi r21,0
	.stabn	68,0,69,.LM17-.LFBB3
.LM17:
	cpi r24,lo8(2)
	breq .L5
	cpi r24,lo8(3)
	breq .L6
	cpi r24,lo8(1)
	breq .L7
	.stabn	68,0,71,.LM18-.LFBB3
.LM18:
	ldi r24,lo8(2)
	ldi r25,0
.L17:
	.stabn	68,0,80,.LM19-.LFBB3
.LM19:
	sub r24,r20
	sbc r25,r21
	.stabn	68,0,84,.LM20-.LFBB3
.LM20:
	cpi r18,7
	cpc r19,__zero_reg__
	brsh .L9
	cpi r18,5
	cpc r19,__zero_reg__
	brsh .L10
	cpi r18,3
	cpc r19,__zero_reg__
	brsh .L11
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L12
.L19:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	ret
.L7:
	.stabn	68,0,74,.LM21-.LFBB3
.LM21:
	ldi r24,lo8(4)
	ldi r25,0
	rjmp .L17
.L5:
	.stabn	68,0,77,.LM22-.LFBB3
.LM22:
	ldi r24,lo8(6)
	ldi r25,0
	rjmp .L17
.L6:
	.stabn	68,0,80,.LM23-.LFBB3
.LM23:
	ldi r24,lo8(7)
	ldi r25,0
	rjmp .L17
.L11:
	.stabn	68,0,91,.LM24-.LFBB3
.LM24:
	in r20,0x2c
	.stabn	68,0,91,.LM25-.LFBB3
.LM25:
	andi r20,lo8(-4)
	ori r20,lo8(1)
.L18:
	.stabn	68,0,87,.LM26-.LFBB3
.LM26:
	out 0x2c,r20
	ldi r19,lo8(-44)
	rjmp 2f
	1:
	lsr r19
	2:
	dec r18
	brpl 1b
	sbrc r19,0
	rjmp .L16
	.stabn	68,0,108,.LM27-.LFBB3
.LM27:
	in r18,0x2d
	ori r18,lo8(1)
.L20:
	.stabn	68,0,114,.LM28-.LFBB3
.LM28:
	out 0x2d,r18
/* epilogue start */
	.stabn	68,0,121,.LM29-.LFBB3
.LM29:
	ret
.L9:
	.stabn	68,0,84,.LM30-.LFBB3
.LM30:
	cpi r18,7
	cpc r19,__zero_reg__
	brne .L19
	.stabn	68,0,98,.LM31-.LFBB3
.LM31:
	in r18,0x2c
	ori r18,lo8(3)
	out 0x2c,r18
.L16:
	.stabn	68,0,114,.LM32-.LFBB3
.LM32:
	in r18,0x2d
	andi r18,lo8(-2)
	rjmp .L20
.L12:
	.stabn	68,0,87,.LM33-.LFBB3
.LM33:
	in r20,0x2c
	andi r20,lo8(-4)
	rjmp .L18
.L10:
	.stabn	68,0,95,.LM34-.LFBB3
.LM34:
	in r20,0x2c
	.stabn	68,0,95,.LM35-.LFBB3
.LM35:
	andi r20,lo8(-4)
	ori r20,lo8(2)
	rjmp .L18
	.size	spi_set_clk, .-spi_set_clk
	.stabs	"spr:r(0,2)",64,0,0,24
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
	.stabn	68,0,128,.LM36-.LFBB4
.LM36:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,129,.LM37-.LFBB4
.LM37:
	out 0x2e,r24
.L22:
	.stabn	68,0,130,.LM38-.LFBB4
.LM38:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L22
	.stabn	68,0,131,.LM39-.LFBB4
.LM39:
	in r24,0x2e
/* epilogue start */
	.stabn	68,0,132,.LM40-.LFBB4
.LM40:
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
	.stabn	68,0,139,.LM41-.LFBB5
.LM41:
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
	.stabn	68,0,141,.LM42-.LFBB5
.LM42:
	ldi r24,lo8(-1)
.L27:
	out 0x2e,r24
.L25:
	.stabn	68,0,142,.LM43-.LFBB5
.LM43:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L25
	.stabn	68,0,143,.LM44-.LFBB5
.LM44:
	in r25,0x2e
	.stabn	68,0,143,.LM45-.LFBB5
.LM45:
	st Z,r25
	.stabn	68,0,144,.LM46-.LFBB5
.LM46:
	out 0x2e,r24
.L26:
	.stabn	68,0,145,.LM47-.LFBB5
.LM47:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L26
	.stabn	68,0,146,.LM48-.LFBB5
.LM48:
	in r25,0x2e
	.stabn	68,0,146,.LM49-.LFBB5
.LM49:
	std Z+1,r25
	.stabn	68,0,147,.LM50-.LFBB5
.LM50:
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,147,.LM51-.LFBB5
.LM51:
	adiw r30,2
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L27
/* epilogue start */
	.stabn	68,0,148,.LM52-.LFBB5
.LM52:
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
	.stabn	68,0,155,.LM53-.LFBB6
.LM53:
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
	.stabn	68,0,156,.LM54-.LFBB6
.LM54:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L31
	.stabn	68,0,158,.LM55-.LFBB6
.LM55:
	ld r24,Z
	.stabn	68,0,157,.LM56-.LFBB6
.LM56:
	cpi r16,1
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L37
/* epilogue start */
	.stabn	68,0,167,.LM57-.LFBB6
.LM57:
	pop r17
	pop r16
	.stabn	68,0,158,.LM58-.LFBB6
.LM58:
	jmp spi_xchg
.L37:
	.stabn	68,0,162,.LM59-.LFBB6
.LM59:
	ld r24,Z
	.stabn	68,0,162,.LM60-.LFBB6
.LM60:
	out 0x2e,r24
.L35:
	.stabn	68,0,163,.LM61-.LFBB6
.LM61:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L35
	.stabn	68,0,164,.LM62-.LFBB6
.LM62:
	ldd r24,Z+1
	.stabn	68,0,164,.LM63-.LFBB6
.LM63:
	out 0x2e,r24
.L36:
	.stabn	68,0,165,.LM64-.LFBB6
.LM64:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L36
	.stabn	68,0,166,.LM65-.LFBB6
.LM65:
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,166,.LM66-.LFBB6
.LM66:
	adiw r30,2
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L37
.L31:
/* epilogue start */
	.stabn	68,0,167,.LM67-.LFBB6
.LM67:
	pop r17
	pop r16
	ret
	.size	spi_xmit_multi, .-spi_xmit_multi
.Lscope6:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
