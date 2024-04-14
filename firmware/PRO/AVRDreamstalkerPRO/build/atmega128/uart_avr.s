	.file	"uart_avr.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/core/uart_avr.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"__vector_18:F(0,1)=(0,1)",36,0,0,__vector_18
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	__vector_18
	.type	__vector_18, @function
__vector_18:
	.stabn	68,0,126,.LM0-.LFBB1
.LM0:
.LFBB1:
	__gcc_isr 1
	in r18,__RAMPZ__
	push r18
	push r19
	push r20
	push r24
	push r25
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7...11 */
.L__stack_usage = 7 + __gcc_isr.n_pushed
	.stabn	68,0,133,.LM1-.LFBB1
.LM1:
	in r18,0xb
	.stabn	68,0,134,.LM2-.LFBB1
.LM2:
	in r19,0xc
	.stabn	68,0,139,.LM3-.LFBB1
.LM3:
	lds r24,u0+8
	ldi r25,0
	.stabn	68,0,139,.LM4-.LFBB1
.LM4:
	adiw r24,1
	.stabn	68,0,139,.LM5-.LFBB1
.LM5:
	andi r24,7
	clr r25
	.stabn	68,0,141,.LM6-.LFBB1
.LM6:
	lds r20,u0+9
	.stabn	68,0,141,.LM7-.LFBB1
.LM7:
	cp r20,r24
	cpc __zero_reg__,r25
	breq .L3
	.stabn	68,0,136,.LM8-.LFBB1
.LM8:
	andi r18,lo8(24)
	.stabn	68,0,146,.LM9-.LFBB1
.LM9:
	sts u0+8,r24
	.stabn	68,0,148,.LM10-.LFBB1
.LM10:
	subi r24,lo8(-(u0))
	sbci r25,hi8(-(u0))
	movw r30,r24
	st Z,r19
.L2:
	.stabn	68,0,151,.LM11-.LFBB1
.LM11:
	sts u0+10,r18
/* epilogue start */
	.stabn	68,0,152,.LM12-.LFBB1
.LM12:
	pop r31
	pop r30
	pop r25
	pop r24
	pop r20
	pop r19
	pop r18
	out __RAMPZ__,r18
	__gcc_isr 2
	reti
.L3:
	.stabn	68,0,143,.LM13-.LFBB1
.LM13:
	ldi r18,lo8(2)
	rjmp .L2
	__gcc_isr 0,r18
	.size	__vector_18, .-__vector_18
	.stabs	"uint16_t:t(0,4)=(0,5)=r(0,5);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.stabs	"data:r(0,2)",64,0,0,19
	.stabs	"stat:r(0,2)",64,0,0,18
	.stabs	"lastRxError:r(0,2)",64,0,0,18
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"__vector_19:F(0,1)",36,0,0,__vector_19
.global	__vector_19
	.type	__vector_19, @function
__vector_19:
	.stabn	68,0,155,.LM14-.LFBB2
.LM14:
.LFBB2:
	__gcc_isr 1
	in r24,__RAMPZ__
	push r24
	push r25
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 4...8 */
.L__stack_usage = 4 + __gcc_isr.n_pushed
	.stabn	68,0,158,.LM15-.LFBB2
.LM15:
	lds r25,u0+19
	.stabn	68,0,158,.LM16-.LFBB2
.LM16:
	lds r24,u0+20
	.stabn	68,0,158,.LM17-.LFBB2
.LM17:
	cp r25,r24
	breq .L5
	.stabn	68,0,160,.LM18-.LFBB2
.LM18:
	lds r24,u0+20
	ldi r25,0
	.stabn	68,0,160,.LM19-.LFBB2
.LM19:
	adiw r24,1
	.stabn	68,0,160,.LM20-.LFBB2
.LM20:
	andi r24,7
	clr r25
	.stabn	68,0,161,.LM21-.LFBB2
.LM21:
	sts u0+20,r24
	.stabn	68,0,163,.LM22-.LFBB2
.LM22:
	subi r24,lo8(-(u0))
	sbci r25,hi8(-(u0))
	movw r30,r24
	ldd r24,Z+11
	.stabn	68,0,163,.LM23-.LFBB2
.LM23:
	out 0xc,r24
.L4:
/* epilogue start */
	.stabn	68,0,168,.LM24-.LFBB2
.LM24:
	pop r31
	pop r30
	pop r25
	pop r24
	out __RAMPZ__,r24
	__gcc_isr 2
	reti
.L5:
	.stabn	68,0,166,.LM25-.LFBB2
.LM25:
	cbi 0xa,5
	.stabn	68,0,168,.LM26-.LFBB2
.LM26:
	rjmp .L4
	__gcc_isr 0,r24
	.size	__vector_19, .-__vector_19
.Lscope2:
	.stabs	"uart0_open:F(0,6)=eFalse:0,True:1,;",36,0,0,uart0_open
	.stabs	" :T(0,7)=eUART_BR_9600:9600,UART_BR_38400:38400,UART_BR_115200:115200,UART_BR_230400:230400,UART_BR_250K:250000,UART_BR_500K:500000,UART_BR_1M:1000000,;",128,0,0,0
	.stabs	" :T(0,8)=eUART_MODE_RX:1,UART_MODE_TX:2,UART_MODE_ALL:3,;",128,0,0,0
	.stabs	"_Bool:t(0,6)",128,0,0,0
	.stabs	"baudrate:P(0,9)=(0,7)",64,0,0,16
.global	uart0_open
	.type	uart0_open, @function
uart0_open:
	.stabn	68,0,171,.LM27-.LFBB3
.LM27:
.LFBB3:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r16,r22
	movw r18,r24
	.stabn	68,0,173,.LM28-.LFBB3
.LM28:
	out 0xb,__zero_reg__
	.stabn	68,0,174,.LM29-.LFBB3
.LM29:
	out 0xa,__zero_reg__
	.stabn	68,0,176,.LM30-.LFBB3
.LM30:
	sbrc r20,0
	.stabn	68,0,176,.LM31-.LFBB3
.LM31:
	sbi 0xa,4
.L8:
	.stabn	68,0,177,.LM32-.LFBB3
.LM32:
	sbrc r20,1
	.stabn	68,0,177,.LM33-.LFBB3
.LM33:
	sbi 0xa,3
.L9:
	.stabn	68,0,180,.LM34-.LFBB3
.LM34:
	cp r16,__zero_reg__
	ldi r24,-124
	cpc r17,r24
	ldi r24,3
	cpc r18,r24
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L10
	brsh .L11
	cp r16,__zero_reg__
	ldi r24,-106
	cpc r17,r24
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L12
	cp r16,__zero_reg__
	ldi r24,-62
	cpc r17,r24
	ldi r24,1
	cpc r18,r24
	cpc r19,__zero_reg__
	breq .L13
	cpi r16,-128
	sbci r17,37
	cpc r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L14
.L15:
	.stabn	68,0,207,.LM35-.LFBB3
.LM35:
	ldi r24,lo8(6)
	sts 149,r24
	.stabn	68,0,209,.LM36-.LFBB3
.LM36:
	sts u0+8,__zero_reg__
	.stabn	68,0,210,.LM37-.LFBB3
.LM37:
	sts u0+9,__zero_reg__
	.stabn	68,0,211,.LM38-.LFBB3
.LM38:
	sts u0+19,__zero_reg__
	.stabn	68,0,212,.LM39-.LFBB3
.LM39:
	sts u0+20,__zero_reg__
	.stabn	68,0,215,.LM40-.LFBB3
.LM40:
	ldi r24,lo8(1)
/* epilogue start */
	pop r17
	pop r16
	ret
.L11:
	.stabn	68,0,180,.LM41-.LFBB3
.LM41:
	cpi r16,32
	ldi r24,-95
	cpc r17,r24
	ldi r24,7
	cpc r18,r24
	cpc r19,__zero_reg__
	breq .L16
	cpi r16,64
	ldi r24,66
	cpc r17,r24
	ldi r24,15
	cpc r18,r24
	cpc r19,__zero_reg__
	breq .L17
	cpi r16,-112
	sbci r17,-48
	sbci r18,3
	cpc r19,__zero_reg__
	brne .L15
.LBB51:
.LBB52:
.LBB53:
	.stabn	68,0,58,.LM42-.LFBB3
.LM42:
	ldi r24,lo8(1)
.L26:
.LBE53:
.LBE52:
.LBE51:
.LBB54:
.LBB55:
.LBB56:
	out 0x9,r24
	rjmp .L27
.L17:
.LBE56:
.LBE55:
.LBE54:
.LBB61:
.LBB62:
.LBB63:
	out 0x9,__zero_reg__
.L25:
.LBE63:
.LBE62:
.LBE61:
.LBB64:
.LBB65:
.LBB66:
	.stabn	68,0,59,.LM43-.LFBB3
.LM43:
	sts 144,__zero_reg__
.LBB67:
.LBB68:
	.stabn	68,0,62,.LM44-.LFBB3
.LM44:
	sbi 0xb,1
	rjmp .L15
.L16:
.LBE68:
.LBE67:
.LBE66:
.LBE65:
.LBE64:
.LBB71:
.LBB72:
.LBB73:
	.stabn	68,0,58,.LM45-.LFBB3
.LM45:
	out 0x9,__zero_reg__
.L27:
.LBE73:
.LBE72:
.LBE71:
.LBB74:
.LBB59:
.LBB57:
	.stabn	68,0,59,.LM46-.LFBB3
.LM46:
	sts 144,__zero_reg__
	.stabn	68,0,64,.LM47-.LFBB3
.LM47:
	cbi 0xb,1
	rjmp .L15
.L10:
.LBE57:
.LBE59:
.LBE74:
.LBB75:
.LBB70:
.LBB69:
	.stabn	68,0,58,.LM48-.LFBB3
.LM48:
	ldi r24,lo8(3)
.L28:
	out 0x9,r24
	rjmp .L25
.L13:
.LBE69:
.LBE70:
.LBE75:
.LBB76:
.LBB77:
.LBB78:
	ldi r24,lo8(8)
	rjmp .L28
.L12:
.LBE78:
.LBE77:
.LBE76:
.LBB79:
.LBB80:
.LBB81:
	ldi r24,lo8(12)
	rjmp .L26
.L14:
.LBE81:
.LBE80:
.LBE79:
.LBB82:
.LBB60:
.LBB58:
	ldi r24,lo8(51)
	rjmp .L26
.LBE58:
.LBE60:
.LBE82:
	.size	uart0_open, .-uart0_open
.Lscope3:
	.stabs	"uart0_send:F(0,1)",36,0,0,uart0_send
	.stabs	"data:P(0,2)",64,0,0,24
.global	uart0_send
	.type	uart0_send, @function
uart0_send:
	.stabn	68,0,218,.LM49-.LFBB4
.LM49:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,221,.LM50-.LFBB4
.LM50:
	lds r18,u0+19
	ldi r19,0
	.stabn	68,0,221,.LM51-.LFBB4
.LM51:
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,221,.LM52-.LFBB4
.LM52:
	andi r18,7
	clr r19
.L30:
	.stabn	68,0,224,.LM53-.LFBB4
.LM53:
	lds r25,u0+20
	.stabn	68,0,224,.LM54-.LFBB4
.LM54:
	cp r25,r18
	cpc __zero_reg__,r19
	breq .L30
	.stabn	68,0,227,.LM55-.LFBB4
.LM55:
	movw r30,r18
	subi r30,lo8(-(u0))
	sbci r31,hi8(-(u0))
	std Z+11,r24
	.stabn	68,0,228,.LM56-.LFBB4
.LM56:
	sts u0+19,r18
	.stabn	68,0,231,.LM57-.LFBB4
.LM57:
	sbi 0xa,5
/* epilogue start */
	.stabn	68,0,232,.LM58-.LFBB4
.LM58:
	ret
	.size	uart0_send, .-uart0_send
.Lscope4:
	.stabs	"uart0_send_buf:F(0,1)",36,0,0,uart0_send_buf
	.stabs	"data:P(0,10)=*(0,2)",64,0,0,24
	.stabs	"count:P(0,2)",64,0,0,22
.global	uart0_send_buf
	.type	uart0_send_buf, @function
uart0_send_buf:
	.stabn	68,0,235,.LM59-.LFBB5
.LM59:
.LFBB5:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r24
	add r16,r22
	adc r17,__zero_reg__
.L33:
	.stabn	68,0,238,.LM60-.LFBB5
.LM60:
	cp r28,r16
	cpc r29,r17
	brne .L34
/* epilogue start */
	.stabn	68,0,242,.LM61-.LFBB5
.LM61:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L34:
	.stabn	68,0,239,.LM62-.LFBB5
.LM62:
	ld r24,Y+
	call uart0_send
	rjmp .L33
	.size	uart0_send_buf, .-uart0_send_buf
.Lscope5:
	.stabs	"uart0_read:F(0,4)",36,0,0,uart0_read
.global	uart0_read
	.type	uart0_read, @function
uart0_read:
	.stabn	68,0,245,.LM63-.LFBB6
.LM63:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB90:
	.stabn	68,0,249,.LM64-.LFBB6
.LM64:
	in r24,__SREG__
.LBB91:
.LBB92:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,50,.LM65-.LFBB6
.LM65:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE92:
.LBE91:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,250,.LM66-.LFBB6
.LM66:
	lds r18,u0+8
	.stabn	68,0,250,.LM67-.LFBB6
.LM67:
	lds r25,u0+9
.LBB93:
.LBB94:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,70,.LM68-.LFBB6
.LM68:
	out __SREG__,r24
.LBE94:
.LBE93:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,250,.LM69-.LFBB6
.LM69:
	cpse r18,r25
	rjmp .L36
.LBB96:
.LBB95:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,71,.LM70-.LFBB6
.LM70:
.LBE95:
.LBE96:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,251,.LM71-.LFBB6
.LM71:
	ldi r24,0
	ldi r25,lo8(1)
	ret
.L36:
.LBB97:
.LBB98:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,71,.LM72-.LFBB6
.LM72:
.LBE98:
.LBE97:
.LBE90:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,256,.LM73-.LFBB6
.LM73:
	lds r24,u0+9
	ldi r25,0
	.stabn	68,0,256,.LM74-.LFBB6
.LM74:
	adiw r24,1
	.stabn	68,0,256,.LM75-.LFBB6
.LM75:
	andi r24,7
	clr r25
	.stabn	68,0,257,.LM76-.LFBB6
.LM76:
	sts u0+9,r24
	.stabn	68,0,260,.LM77-.LFBB6
.LM77:
	subi r24,lo8(-(u0))
	sbci r25,hi8(-(u0))
	movw r30,r24
	ld r24,Z
	.stabn	68,0,262,.LM78-.LFBB6
.LM78:
	lds r25,u0+10
/* epilogue start */
	.stabn	68,0,263,.LM79-.LFBB6
.LM79:
	ret
	.size	uart0_read, .-uart0_read
	.stabs	"data:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"uart0_data_ready:F(0,4)",36,0,0,uart0_data_ready
.global	uart0_data_ready
	.type	uart0_data_ready, @function
uart0_data_ready:
	.stabn	68,0,266,.LM80-.LFBB7
.LM80:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB104:
	.stabn	68,0,269,.LM81-.LFBB7
.LM81:
	in r25,__SREG__
.LBB105:
.LBB106:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,50,.LM82-.LFBB7
.LM82:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE106:
.LBE105:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,270,.LM83-.LFBB7
.LM83:
	ldi r30,lo8(u0)
	ldi r31,hi8(u0)
	ldd r24,Z+8
	.stabn	68,0,270,.LM84-.LFBB7
.LM84:
	ldd r18,Z+9
.LBB107:
.LBB108:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,70,.LM85-.LFBB7
.LM85:
	out __SREG__,r25
	.stabn	68,0,71,.LM86-.LFBB7
.LM86:
.LBE108:
.LBE107:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,270,.LM87-.LFBB7
.LM87:
	ldi r25,0
	.stabn	68,0,270,.LM88-.LFBB7
.LM88:
	adiw r24,8
	.stabn	68,0,270,.LM89-.LFBB7
.LM89:
	sub r24,r18
	sbc r25,__zero_reg__
	.stabn	68,0,270,.LM90-.LFBB7
.LM90:
	ldi r22,lo8(8)
	ldi r23,0
	call __divmodhi4
/* epilogue start */
.LBE104:
	.stabn	68,0,273,.LM91-.LFBB7
.LM91:
	ret
	.size	uart0_data_ready, .-uart0_data_ready
.Lscope7:
	.stabs	"uart0_flush:F(0,1)",36,0,0,uart0_flush
.global	uart0_flush
	.type	uart0_flush, @function
uart0_flush:
	.stabn	68,0,280,.LM92-.LFBB8
.LM92:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB114:
	.stabn	68,0,281,.LM93-.LFBB8
.LM93:
	in r24,__SREG__
.LBB115:
.LBB116:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext13
.Ltext13:
	.stabn	68,0,50,.LM94-.LFBB8
.LM94:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE116:
.LBE115:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext14
.Ltext14:
	.stabn	68,0,282,.LM95-.LFBB8
.LM95:
	ldi r30,lo8(u0)
	ldi r31,hi8(u0)
	ldd r25,Z+9
	.stabn	68,0,282,.LM96-.LFBB8
.LM96:
	std Z+8,r25
.LBB117:
.LBB118:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext15
.Ltext15:
	.stabn	68,0,70,.LM97-.LFBB8
.LM97:
	out __SREG__,r24
	.stabn	68,0,71,.LM98-.LFBB8
.LM98:
/* epilogue start */
.LBE118:
.LBE117:
.LBE114:
	.stabs	"src/core/uart_avr.c",132,0,0,.Ltext16
.Ltext16:
	.stabn	68,0,284,.LM99-.LFBB8
.LM99:
	ret
	.size	uart0_flush, .-uart0_flush
.Lscope8:
	.stabs	"uart0_close:F(0,1)",36,0,0,uart0_close
.global	uart0_close
	.type	uart0_close, @function
uart0_close:
	.stabn	68,0,287,.LM100-.LFBB9
.LM100:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,289,.LM101-.LFBB9
.LM101:
	in r24,0xa
	andi r24,lo8(-25)
	out 0xa,r24
.L41:
	.stabn	68,0,293,.LM102-.LFBB9
.LM102:
	sbis 0xb,7
/* epilogue start */
	.stabn	68,0,295,.LM103-.LFBB9
.LM103:
	ret
.L42:
	.stabn	68,0,294,.LM104-.LFBB9
.LM104:
	in r24,0xc
	rjmp .L41
	.size	uart0_close, .-uart0_close
	.stabs	"dummy:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.local	u0
	.comm	u0,21,1
	.stabs	"u0:S(0,11)=(0,12)=xss_uart_context:",40,0,0,u0
	.stabs	"s_uart_context:T(0,12)=s21rx_buf:(0,13)=ar(0,14)=r(0,14);0;65535;;0;7;(0,2),0,64;rx_head:(0,2),64,8;rx_tail:(0,2),72,8;rx_last_error:(0,2),80,8;tx_buf:(0,13),88,64;tx_head:(0,2),152,8;tx_tail:(0,2),160,8;;",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
