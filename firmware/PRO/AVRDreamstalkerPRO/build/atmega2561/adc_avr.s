	.file	"adc_avr.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/core/adc_avr.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"get_index:f(0,1)=r(0,1);-32768;32767;",36,0,0,get_index
	.stabs	"int:t(0,1)",128,0,0,0
	.stabs	"channel:P(0,2)=(0,3)=r(0,3);0;255;",64,0,0,24
	.stabs	"uint8_t:t(0,2)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	get_index, @function
get_index:
	.stabn	68,0,86,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB8:
.LBB9:
	.stabn	68,0,82,.LM1-.LFBB1
.LM1:
	lds r18,adc
	lds r19,adc+1
	.stabn	68,0,82,.LM2-.LFBB1
.LM2:
	andi r18,lo8(31)
.LBE9:
.LBE8:
	.stabn	68,0,90,.LM3-.LFBB1
.LM3:
	cp r24,r18
	breq .L3
.LBB11:
.LBB10:
	.stabn	68,0,82,.LM4-.LFBB1
.LM4:
	lds r18,adc+6
	lds r19,adc+6+1
	.stabn	68,0,82,.LM5-.LFBB1
.LM5:
	andi r18,lo8(31)
.LBE10:
.LBE11:
	.stabn	68,0,90,.LM6-.LFBB1
.LM6:
	cp r24,r18
	breq .L4
	.stabn	68,0,93,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	ret
.L3:
	.stabn	68,0,89,.LM8-.LFBB1
.LM8:
	ldi r25,0
	ldi r24,0
	ret
.L4:
	.stabn	68,0,89,.LM9-.LFBB1
.LM9:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	.stabn	68,0,94,.LM10-.LFBB1
.LM10:
	ret
	.size	get_index, .-get_index
.Lscope1:
	.stabs	"adc_convert:f(0,4)=(0,4)",36,0,0,adc_convert
	.stabs	"void:t(0,4)",128,0,0,0
	.stabs	"index:P(0,1)",64,0,0,18
	.type	adc_convert, @function
adc_convert:
	.stabn	68,0,115,.LM11-.LFBB2
.LM11:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,121,.LM12-.LFBB2
.LM12:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	.stabn	68,0,121,.LM13-.LFBB2
.LM13:
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,121,.LM14-.LFBB2
.LM14:
	sbrs r25,0
	rjmp .L6
	.stabn	68,0,122,.LM15-.LFBB2
.LM15:
	ldi r24,lo8(-64)
.L12:
	.stabn	68,0,124,.LM16-.LFBB2
.LM16:
	sts 124,r24
	.stabn	68,0,126,.LM17-.LFBB2
.LM17:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	.stabn	68,0,126,.LM18-.LFBB2
.LM18:
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,126,.LM19-.LFBB2
.LM19:
	sbrs r24,7
	rjmp .L8
	.stabn	68,0,127,.LM20-.LFBB2
.LM20:
	lds r24,124
	ori r24,lo8(32)
	sts 124,r24
.L8:
.LBB12:
.LBB13:
	.stabn	68,0,82,.LM21-.LFBB2
.LM21:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r24,Z
	ldd r25,Z+1
.LBE13:
.LBE12:
	.stabn	68,0,129,.LM22-.LFBB2
.LM22:
	lds r25,124
.LBB15:
.LBB14:
	.stabn	68,0,82,.LM23-.LFBB2
.LM23:
	andi r24,lo8(31)
.LBE14:
.LBE15:
	.stabn	68,0,129,.LM24-.LFBB2
.LM24:
	or r24,r25
	sts 124,r24
	.stabn	68,0,131,.LM25-.LFBB2
.LM25:
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
/* epilogue start */
	.stabn	68,0,132,.LM26-.LFBB2
.LM26:
	ret
.L6:
	.stabn	68,0,124,.LM27-.LFBB2
.LM27:
	ldi r24,lo8(64)
	rjmp .L12
	.size	adc_convert, .-adc_convert
.Lscope2:
	.stabs	"__vector_29:F(0,4)",36,0,0,__vector_29
	.stabs	"uint16_t:t(0,5)=(0,6)=r(0,6);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
.global	__vector_29
	.type	__vector_29, @function
__vector_29:
	.stabn	68,0,137,.LM28-.LFBB3
.LM28:
.LFBB3:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 18 */
.L__stack_usage = 18
	.stabn	68,0,142,.LM29-.LFBB3
.LM29:
	lds r24,124
	.stabn	68,0,143,.LM30-.LFBB3
.LM30:
	andi r24,lo8(31)
	call get_index
	movw r28,r24
	.stabn	68,0,146,.LM31-.LFBB3
.LM31:
	ldi r24,lo8(6)
	mul r24,r28
	movw r30,r0
	mul r24,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,146,.LM32-.LFBB3
.LM32:
	sbrs r24,7
	rjmp .L14
	.stabn	68,0,147,.LM33-.LFBB3
.LM33:
	lds r24,120
	lds r25,120+1
	.stabn	68,0,147,.LM34-.LFBB3
.LM34:
	ldi r18,6
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
.L15:
	.stabn	68,0,154,.LM35-.LFBB3
.LM35:
	ldi r18,lo8(6)
	mul r18,r28
	movw r30,r0
	mul r18,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r18,Z
	ldd r19,Z+1
	.stabn	68,0,154,.LM36-.LFBB3
.LM36:
	sbrs r18,6
	rjmp .L17
	.stabn	68,0,157,.LM37-.LFBB3
.LM37:
	ldd r18,Z+2
	ldd r19,Z+3
	.stabn	68,0,157,.LM38-.LFBB3
.LM38:
	or r18,r19
	breq .L18
	.stabn	68,0,158,.LM39-.LFBB3
.LM39:
	ldd __tmp_reg__,Z+2
	ldd r31,Z+3
	mov r30,__tmp_reg__
	.stabn	68,0,158,.LM40-.LFBB3
.LM40:
	andi r25,3
	eicall
.L18:
	.stabn	68,0,160,.LM41-.LFBB3
.LM41:
	ldi r24,lo8(6)
	mul r24,r28
	movw r30,r0
	mul r24,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ldd r24,Z+4
	ldd r25,Z+5
	.stabn	68,0,160,.LM42-.LFBB3
.LM42:
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L17
	.stabn	68,0,164,.LM43-.LFBB3
.LM43:
	ldd r24,Z+4
	ldd r25,Z+5
	.stabn	68,0,164,.LM44-.LFBB3
.LM44:
	sbiw r24,1
	.stabn	68,0,164,.LM45-.LFBB3
.LM45:
	std Z+5,r25
	std Z+4,r24
	or r24,r25
	brne .L17
	.stabn	68,0,165,.LM46-.LFBB3
.LM46:
	ld r24,Z
	ldd r25,Z+1
	andi r24,191
	std Z+1,r25
	st Z,r24
.L17:
.LBB18:
.LBB19:
	.stabn	68,0,99,.LM47-.LFBB3
.LM47:
	cpi r28,2
	cpc r29,__zero_reg__
	brlo .L20
	.stabn	68,0,100,.LM48-.LFBB3
.LM48:
	ldi r29,0
	ldi r28,0
.L20:
	.stabn	68,0,102,.LM49-.LFBB3
.LM49:
	movw r24,r28
	.stabn	68,0,107,.LM50-.LFBB3
.LM50:
	ldi r18,lo8(6)
.L23:
	.stabn	68,0,104,.LM51-.LFBB3
.LM51:
	adiw r24,1
	cpi r24,2
	cpc r25,__zero_reg__
	brne .L21
	.stabn	68,0,105,.LM52-.LFBB3
.LM52:
	ldi r25,0
	ldi r24,0
.L21:
	.stabn	68,0,107,.LM53-.LFBB3
.LM53:
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r20,Z
	ldd r21,Z+1
	.stabn	68,0,107,.LM54-.LFBB3
.LM54:
	sbrc r20,6
	rjmp .L22
	.stabn	68,0,109,.LM55-.LFBB3
.LM55:
	cp r24,r28
	cpc r25,r29
	brne .L23
.L13:
/* epilogue start */
.LBE19:
.LBE18:
	.stabn	68,0,176,.LM56-.LFBB3
.LM56:
	pop r31
	pop r30
	pop r29
	pop r28
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L14:
	.stabn	68,0,149,.LM57-.LFBB3
.LM57:
	lds r24,120
	lds r25,120+1
	rjmp .L15
.L22:
	.stabn	68,0,171,.LM58-.LFBB3
.LM58:
	sbrc r25,7
	rjmp .L13
	.stabn	68,0,175,.LM59-.LFBB3
.LM59:
	call adc_convert
	rjmp .L13
	.size	__vector_29, .-__vector_29
	.stabs	"index:r(0,1)",64,0,0,28
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabs	"index:r(0,1)",64,0,0,28
	.stabn	192,0,0,.LBB18-.LFBB3
	.stabs	"next:r(0,1)",64,0,0,24
	.stabn	192,0,0,.LBB19-.LFBB3
	.stabn	224,0,0,.LBE19-.LFBB3
	.stabn	224,0,0,.LBE18-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"adc_get_rate:F(0,7)=(0,8)=r(0,8);0;4294967295;",36,0,0,adc_get_rate
	.stabs	"uint32_t:t(0,7)",128,0,0,0
	.stabs	"long unsigned int:t(0,8)",128,0,0,0
.global	adc_get_rate
	.type	adc_get_rate, @function
adc_get_rate:
	.stabn	68,0,216,.LM60-.LFBB4
.LM60:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,218,.LM61-.LFBB4
.LM61:
	ldi r22,lo8(36)
	ldi r23,lo8(-12)
	ldi r24,0
	ldi r25,0
/* epilogue start */
	ret
	.size	adc_get_rate, .-adc_get_rate
.Lscope4:
	.stabs	"adc_setup_channel:F(0,9)=eFalse:0,True:1,;",36,0,0,adc_setup_channel
	.stabs	"adc_channel_flag:T(0,10)=eADC_CF_VREF_256:1,ADC_CF_LEFT_ADJUST:2,;",128,0,0,0
	.stabs	"_Bool:t(0,9)",128,0,0,0
	.stabs	"channel:P(0,2)",64,0,0,24
.global	adc_setup_channel
	.type	adc_setup_channel, @function
adc_setup_channel:
	.stabn	68,0,221,.LM62-.LFBB5
.LM62:
.LFBB5:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r22
	.stabn	68,0,225,.LM63-.LFBB5
.LM63:
	call get_index
	movw r18,r24
	.stabn	68,0,227,.LM64-.LFBB5
.LM64:
	ldi r24,0
	.stabn	68,0,226,.LM65-.LFBB5
.LM65:
	sbrc r19,7
	rjmp .L30
	.stabn	68,0,231,.LM66-.LFBB5
.LM66:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,230,.LM67-.LFBB5
.LM67:
	sbrs r28,1
	rjmp .L32
	.stabn	68,0,231,.LM68-.LFBB5
.LM68:
	ori r24,128
.L33:
	ldi r20,lo8(6)
	mul r20,r18
	movw r30,r0
	mul r20,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	std Z+1,r25
	st Z,r24
	.stabn	68,0,236,.LM69-.LFBB5
.LM69:
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,235,.LM70-.LFBB5
.LM70:
	sbrs r28,0
	rjmp .L34
	.stabn	68,0,236,.LM71-.LFBB5
.LM71:
	ori r25,1
.L36:
	.stabn	68,0,238,.LM72-.LFBB5
.LM72:
	std Z+1,r25
	st Z,r24
	.stabn	68,0,240,.LM73-.LFBB5
.LM73:
	ldi r24,lo8(1)
.L30:
/* epilogue start */
	.stabn	68,0,241,.LM74-.LFBB5
.LM74:
	pop r28
	ret
.L32:
	.stabn	68,0,233,.LM75-.LFBB5
.LM75:
	andi r24,127
	rjmp .L33
.L34:
	.stabn	68,0,238,.LM76-.LFBB5
.LM76:
	andi r25,254
	rjmp .L36
	.size	adc_setup_channel, .-adc_setup_channel
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB5-.LFBB5
	.stabn	224,0,0,.Lscope5-.LFBB5
.Lscope5:
	.stabs	"adc_start:F(0,9)",36,0,0,adc_start
	.stabs	"channel:P(0,2)",64,0,0,24
	.stabs	"num_samples:P(0,1)",64,0,0,16
	.stabs	"pfcb:P(0,11)=(0,12)=*(0,13)=f(0,4)",64,0,0,28
	.stabs	"pfn_adc_callback:t(0,11)",128,0,0,0
.global	adc_start
	.type	adc_start, @function
adc_start:
	.stabn	68,0,244,.LM77-.LFBB6
.LM77:
.LFBB6:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r22
	movw r28,r20
	.stabn	68,0,248,.LM78-.LFBB6
.LM78:
	call get_index
	.stabn	68,0,249,.LM79-.LFBB6
.LM79:
	sbrc r25,7
	rjmp .L42
	.stabn	68,0,254,.LM80-.LFBB6
.LM80:
	ldi r18,lo8(6)
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r18,Z
	ldd r19,Z+1
	.stabn	68,0,254,.LM81-.LFBB6
.LM81:
	sbrs r18,5
	rjmp .L42
	.stabn	68,0,257,.LM82-.LFBB6
.LM82:
	sbrc r18,6
	rjmp .L42
	.stabn	68,0,260,.LM83-.LFBB6
.LM83:
	cp __zero_reg__,r16
	cpc __zero_reg__,r17
	brlt .L39
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
.L39:
	.stabn	68,0,260,.LM84-.LFBB6
.LM84:
	ldi r20,lo8(6)
	mul r20,r24
	movw r30,r0
	mul r20,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	std Z+5,r17
	std Z+4,r16
	.stabn	68,0,261,.LM85-.LFBB6
.LM85:
	std Z+3,r29
	std Z+2,r28
	.stabn	68,0,262,.LM86-.LFBB6
.LM86:
	ori r18,64
	std Z+1,r19
	st Z,r18
	.stabn	68,0,265,.LM87-.LFBB6
.LM87:
	call adc_convert
	.stabn	68,0,267,.LM88-.LFBB6
.LM88:
	ldi r24,lo8(1)
.L37:
/* epilogue start */
	.stabn	68,0,268,.LM89-.LFBB6
.LM89:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L42:
	.stabn	68,0,250,.LM90-.LFBB6
.LM90:
	ldi r24,0
	rjmp .L37
	.size	adc_start, .-adc_start
	.stabs	"index:r(0,1)",64,0,0,24
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"adc_enable:F(0,9)",36,0,0,adc_enable
.global	adc_enable
	.type	adc_enable, @function
adc_enable:
	.stabn	68,0,180,.LM91-.LFBB7
.LM91:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,181,.LM92-.LFBB7
.LM92:
	ldi r30,lo8(122)
	ldi r31,0
	ldi r24,lo8(-128)
	st Z,r24
	.stabn	68,0,182,.LM93-.LFBB7
.LM93:
	ld r24,Z
	ori r24,lo8(7)
	st Z,r24
	.stabn	68,0,187,.LM94-.LFBB7
.LM94:
	ldi r26,lo8(adc)
	ldi r27,hi8(adc)
	ldi r24,lo8(32)
	ldi r25,0
	adiw r26,1
	st X,r25
	st -X,r24
	.stabn	68,0,188,.LM95-.LFBB7
.LM95:
	ldi r24,lo8(34)
	ldi r25,0
	adiw r26,6+1
	st X,r25
	st -X,r24
	sbiw r26,6
	.stabn	68,0,191,.LM96-.LFBB7
.LM96:
	in r24,0x10
	andi r24,lo8(-6)
	out 0x10,r24
	.stabn	68,0,193,.LM97-.LFBB7
.LM97:
	ld r24,Z
	ori r24,lo8(8)
	st Z,r24
	.stabn	68,0,196,.LM98-.LFBB7
.LM98:
	ldi r21,0
	ldi r20,0
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(2)
	call adc_start
.LBB20:
.LBB21:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM99-.LFBB7
.LM99:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE21:
.LBE20:
	.stabs	"src/core/adc_avr.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,200,.LM100-.LFBB7
.LM100:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	adc_enable, .-adc_enable
.Lscope7:
	.stabs	"adc_is_running:F(0,9)",36,0,0,adc_is_running
	.stabs	"channel:P(0,2)",64,0,0,24
.global	adc_is_running
	.type	adc_is_running, @function
adc_is_running:
	.stabn	68,0,271,.LM101-.LFBB8
.LM101:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,274,.LM102-.LFBB8
.LM102:
	call get_index
	movw r18,r24
	.stabn	68,0,275,.LM103-.LFBB8
.LM103:
	sbrc r25,7
	rjmp .L46
	.stabn	68,0,278,.LM104-.LFBB8
.LM104:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,278,.LM105-.LFBB8
.LM105:
	ldi r18,6
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	andi r24,lo8(1)
	ret
.L46:
	.stabn	68,0,276,.LM106-.LFBB8
.LM106:
	ldi r24,0
/* epilogue start */
	.stabn	68,0,279,.LM107-.LFBB8
.LM107:
	ret
	.size	adc_is_running, .-adc_is_running
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB8-.LFBB8
	.stabn	224,0,0,.Lscope8-.LFBB8
.Lscope8:
	.stabs	"adc_stop:F(0,4)",36,0,0,adc_stop
	.stabs	"channel:P(0,2)",64,0,0,24
.global	adc_stop
	.type	adc_stop, @function
adc_stop:
	.stabn	68,0,282,.LM108-.LFBB9
.LM108:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,285,.LM109-.LFBB9
.LM109:
	call get_index
	movw r18,r24
	.stabn	68,0,286,.LM110-.LFBB9
.LM110:
	sbrc r25,7
	rjmp .L47
	.stabn	68,0,289,.LM111-.LFBB9
.LM111:
	ldi r24,lo8(6)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r24,Z
	ldd r25,Z+1
	andi r24,191
	std Z+1,r25
	st Z,r24
.L47:
/* epilogue start */
	.stabn	68,0,290,.LM112-.LFBB9
.LM112:
	ret
	.size	adc_stop, .-adc_stop
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.stabs	"adc_disable:F(0,4)",36,0,0,adc_disable
.global	adc_disable
	.type	adc_disable, @function
adc_disable:
	.stabn	68,0,203,.LM113-.LFBB10
.LM113:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,204,.LM114-.LFBB10
.LM114:
	ldi r24,0
	call adc_stop
	.stabn	68,0,205,.LM115-.LFBB10
.LM115:
	ldi r24,lo8(2)
	call adc_stop
	.stabn	68,0,208,.LM116-.LFBB10
.LM116:
	ldi r30,lo8(adc)
	ldi r31,hi8(adc)
	ld r24,Z
	ldd r25,Z+1
	andi r24,223
	std Z+1,r25
	st Z,r24
	.stabn	68,0,209,.LM117-.LFBB10
.LM117:
	ldd r24,Z+6
	ldd r25,Z+7
	andi r24,223
	std Z+7,r25
	std Z+6,r24
	.stabn	68,0,211,.LM118-.LFBB10
.LM118:
	ldi r30,lo8(122)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-9)
	st Z,r24
	.stabn	68,0,212,.LM119-.LFBB10
.LM119:
	ld r24,Z
	andi r24,lo8(127)
	st Z,r24
/* epilogue start */
	.stabn	68,0,213,.LM120-.LFBB10
.LM120:
	ret
	.size	adc_disable, .-adc_disable
.Lscope10:
	.local	adc
	.comm	adc,12,1
	.stabs	"adc:S(0,14)=ar(0,15)=r(0,15);0;65535;;0;1;(0,16)=(0,17)=xss_adc_channel:",40,0,0,adc
	.stabs	"s_adc_channel:T(0,17)=s6flags:(0,5),0,16;pfcb:(0,11),16,16;num_samples:(0,1),32,16;;",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
