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
	.stabs	"chan:P(0,2)=(0,3)=r(0,3);0;255;",64,0,0,24
	.stabs	"uint8_t:t(0,2)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	get_index, @function
get_index:
	.stabn	68,0,82,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB8:
.LBB9:
	.stabn	68,0,77,.LM1-.LFBB1
.LM1:
	lds r18,adc
	lds r19,adc+1
	.stabn	68,0,77,.LM2-.LFBB1
.LM2:
	andi r18,lo8(31)
.LBE9:
.LBE8:
	.stabn	68,0,86,.LM3-.LFBB1
.LM3:
	cp r24,r18
	breq .L3
.LBB11:
.LBB10:
	.stabn	68,0,77,.LM4-.LFBB1
.LM4:
	lds r18,adc+6
	lds r19,adc+6+1
	.stabn	68,0,77,.LM5-.LFBB1
.LM5:
	andi r18,lo8(31)
.LBE10:
.LBE11:
	.stabn	68,0,86,.LM6-.LFBB1
.LM6:
	cp r24,r18
	breq .L4
	.stabn	68,0,89,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	ret
.L3:
	.stabn	68,0,85,.LM8-.LFBB1
.LM8:
	ldi r25,0
	ldi r24,0
	ret
.L4:
	.stabn	68,0,85,.LM9-.LFBB1
.LM9:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	.stabn	68,0,90,.LM10-.LFBB1
.LM10:
	ret
	.size	get_index, .-get_index
.Lscope1:
	.stabs	"adc_convert:f(0,4)=(0,4)",36,0,0,adc_convert
	.stabs	"void:t(0,4)",128,0,0,0
	.stabs	"i:P(0,1)",64,0,0,18
	.type	adc_convert, @function
adc_convert:
	.stabn	68,0,113,.LM11-.LFBB2
.LM11:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,115,.LM12-.LFBB2
.LM12:
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
	.stabn	68,0,115,.LM13-.LFBB2
.LM13:
	sbrs r25,0
	rjmp .L6
	.stabn	68,0,116,.LM14-.LFBB2
.LM14:
	ldi r24,lo8(-64)
.L12:
	.stabn	68,0,118,.LM15-.LFBB2
.LM15:
	out 0x7,r24
	.stabn	68,0,120,.LM16-.LFBB2
.LM16:
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
	.stabn	68,0,120,.LM17-.LFBB2
.LM17:
	sbrc r24,7
	.stabn	68,0,121,.LM18-.LFBB2
.LM18:
	sbi 0x7,5
.L8:
.LBB12:
.LBB13:
	.stabn	68,0,77,.LM19-.LFBB2
.LM19:
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
	.stabn	68,0,123,.LM20-.LFBB2
.LM20:
	in r25,0x7
.LBB15:
.LBB14:
	.stabn	68,0,77,.LM21-.LFBB2
.LM21:
	andi r24,lo8(31)
.LBE14:
.LBE15:
	.stabn	68,0,123,.LM22-.LFBB2
.LM22:
	or r24,r25
	out 0x7,r24
	.stabn	68,0,126,.LM23-.LFBB2
.LM23:
	sbi 0x6,6
/* epilogue start */
	.stabn	68,0,127,.LM24-.LFBB2
.LM24:
	ret
.L6:
	.stabn	68,0,118,.LM25-.LFBB2
.LM25:
	ldi r24,lo8(64)
	rjmp .L12
	.size	adc_convert, .-adc_convert
.Lscope2:
	.stabs	"__vector_21:F(0,4)",36,0,0,__vector_21
	.stabs	"uint16_t:t(0,5)=(0,6)=r(0,6);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
	.stabn	68,0,132,.LM26-.LFBB3
.LM26:
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
	.stabn	68,0,136,.LM27-.LFBB3
.LM27:
	in r24,0x7
	.stabn	68,0,136,.LM28-.LFBB3
.LM28:
	andi r24,lo8(31)
	call get_index
	movw r28,r24
	.stabn	68,0,139,.LM29-.LFBB3
.LM29:
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
	.stabn	68,0,139,.LM30-.LFBB3
.LM30:
	sbrs r24,7
	rjmp .L14
	.stabn	68,0,140,.LM31-.LFBB3
.LM31:
	in r24,0x4
	in r25,0x4+1
	.stabn	68,0,140,.LM32-.LFBB3
.LM32:
	ldi r18,6
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
.L15:
	.stabn	68,0,147,.LM33-.LFBB3
.LM33:
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
	.stabn	68,0,147,.LM34-.LFBB3
.LM34:
	sbrs r18,6
	rjmp .L17
	.stabn	68,0,150,.LM35-.LFBB3
.LM35:
	ldd r18,Z+4
	ldd r19,Z+5
	.stabn	68,0,150,.LM36-.LFBB3
.LM36:
	or r18,r19
	breq .L18
	.stabn	68,0,151,.LM37-.LFBB3
.LM37:
	ldd __tmp_reg__,Z+4
	ldd r31,Z+5
	mov r30,__tmp_reg__
	.stabn	68,0,151,.LM38-.LFBB3
.LM38:
	andi r25,3
	icall
.L18:
	.stabn	68,0,153,.LM39-.LFBB3
.LM39:
	ldi r24,lo8(6)
	mul r24,r28
	movw r30,r0
	mul r24,r29
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ldd r24,Z+2
	ldd r25,Z+3
	.stabn	68,0,153,.LM40-.LFBB3
.LM40:
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L17
	.stabn	68,0,157,.LM41-.LFBB3
.LM41:
	ldd r24,Z+2
	ldd r25,Z+3
	.stabn	68,0,157,.LM42-.LFBB3
.LM42:
	sbiw r24,1
	.stabn	68,0,157,.LM43-.LFBB3
.LM43:
	std Z+3,r25
	std Z+2,r24
	or r24,r25
	brne .L17
	.stabn	68,0,158,.LM44-.LFBB3
.LM44:
	ld r24,Z
	ldd r25,Z+1
	andi r24,191
	std Z+1,r25
	st Z,r24
.L17:
.LBB18:
.LBB19:
	.stabn	68,0,96,.LM45-.LFBB3
.LM45:
	cpi r28,2
	cpc r29,__zero_reg__
	brlo .L20
	.stabn	68,0,97,.LM46-.LFBB3
.LM46:
	ldi r29,0
	ldi r28,0
.L20:
	.stabn	68,0,99,.LM47-.LFBB3
.LM47:
	movw r24,r28
	.stabn	68,0,104,.LM48-.LFBB3
.LM48:
	ldi r18,lo8(6)
.L23:
	.stabn	68,0,101,.LM49-.LFBB3
.LM49:
	adiw r24,1
	cpi r24,2
	cpc r25,__zero_reg__
	brne .L21
	.stabn	68,0,102,.LM50-.LFBB3
.LM50:
	ldi r25,0
	ldi r24,0
.L21:
	.stabn	68,0,104,.LM51-.LFBB3
.LM51:
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	ld r20,Z
	ldd r21,Z+1
	.stabn	68,0,104,.LM52-.LFBB3
.LM52:
	sbrc r20,6
	rjmp .L22
	.stabn	68,0,106,.LM53-.LFBB3
.LM53:
	cp r24,r28
	cpc r25,r29
	brne .L23
.L13:
/* epilogue start */
.LBE19:
.LBE18:
	.stabn	68,0,169,.LM54-.LFBB3
.LM54:
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
	.stabn	68,0,142,.LM55-.LFBB3
.LM55:
	in r24,0x4
	in r25,0x4+1
	rjmp .L15
.L22:
	.stabn	68,0,164,.LM56-.LFBB3
.LM56:
	sbrc r25,7
	rjmp .L13
	.stabn	68,0,168,.LM57-.LFBB3
.LM57:
	call adc_convert
	rjmp .L13
	.size	__vector_21, .-__vector_21
	.stabs	"i:r(0,1)",64,0,0,28
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabs	"i:r(0,1)",64,0,0,28
	.stabn	192,0,0,.LBB18-.LFBB3
	.stabs	"next:r(0,1)",64,0,0,24
	.stabn	192,0,0,.LBB19-.LFBB3
	.stabn	224,0,0,.LBE19-.LFBB3
	.stabn	224,0,0,.LBE18-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"adc_enable:F(0,7)=eFalse:0,True:1,;",36,0,0,adc_enable
	.stabs	"_Bool:t(0,7)",128,0,0,0
.global	adc_enable
	.type	adc_enable, @function
adc_enable:
	.stabn	68,0,173,.LM58-.LFBB4
.LM58:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,174,.LM59-.LFBB4
.LM59:
	ldi r24,lo8(-128)
	out 0x6,r24
	.stabn	68,0,175,.LM60-.LFBB4
.LM60:
	in r24,0x6
	ori r24,lo8(7)
	out 0x6,r24
	.stabn	68,0,180,.LM61-.LFBB4
.LM61:
	ldi r30,lo8(adc)
	ldi r31,hi8(adc)
	ldi r24,lo8(32)
	ldi r25,0
	std Z+1,r25
	st Z,r24
	.stabn	68,0,181,.LM62-.LFBB4
.LM62:
	ldi r24,lo8(34)
	ldi r25,0
	std Z+7,r25
	std Z+6,r24
	.stabn	68,0,186,.LM63-.LFBB4
.LM63:
	ldi r30,lo8(97)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-6)
	st Z,r24
	.stabn	68,0,188,.LM64-.LFBB4
.LM64:
	sbi 0x6,3
	.stabn	68,0,191,.LM65-.LFBB4
.LM65:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	adc_enable, .-adc_enable
.Lscope4:
	.stabs	"adc_get_rate:F(0,8)=(0,9)=r(0,9);0;4294967295;",36,0,0,adc_get_rate
	.stabs	"uint32_t:t(0,8)",128,0,0,0
	.stabs	"long unsigned int:t(0,9)",128,0,0,0
.global	adc_get_rate
	.type	adc_get_rate, @function
adc_get_rate:
	.stabn	68,0,214,.LM66-.LFBB5
.LM66:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,216,.LM67-.LFBB5
.LM67:
	ldi r22,lo8(36)
	ldi r23,lo8(-12)
	ldi r24,0
	ldi r25,0
/* epilogue start */
	ret
	.size	adc_get_rate, .-adc_get_rate
.Lscope5:
	.stabs	"adc_setup_channel:F(0,7)",36,0,0,adc_setup_channel
	.stabs	"adc_channel_flag:T(0,10)=eADC_CF_VREF_256:1,ADC_CF_LEFT_ADJUST:2,;",128,0,0,0
	.stabs	"chan:P(0,2)",64,0,0,24
.global	adc_setup_channel
	.type	adc_setup_channel, @function
adc_setup_channel:
	.stabn	68,0,219,.LM68-.LFBB6
.LM68:
.LFBB6:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r22
	.stabn	68,0,222,.LM69-.LFBB6
.LM69:
	call get_index
	movw r18,r24
	.stabn	68,0,224,.LM70-.LFBB6
.LM70:
	ldi r24,0
	.stabn	68,0,223,.LM71-.LFBB6
.LM71:
	sbrc r19,7
	rjmp .L31
	.stabn	68,0,227,.LM72-.LFBB6
.LM72:
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
	.stabn	68,0,226,.LM73-.LFBB6
.LM73:
	sbrs r28,1
	rjmp .L33
	.stabn	68,0,227,.LM74-.LFBB6
.LM74:
	ori r24,128
.L37:
	.stabn	68,0,229,.LM75-.LFBB6
.LM75:
	std Z+1,r25
	st Z,r24
	.stabn	68,0,232,.LM76-.LFBB6
.LM76:
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
	.stabn	68,0,231,.LM77-.LFBB6
.LM77:
	sbrs r28,0
	rjmp .L35
	.stabn	68,0,232,.LM78-.LFBB6
.LM78:
	ori r25,1
.L38:
	.stabn	68,0,234,.LM79-.LFBB6
.LM79:
	std Z+1,r25
	st Z,r24
	.stabn	68,0,236,.LM80-.LFBB6
.LM80:
	ldi r24,lo8(1)
.L31:
/* epilogue start */
	.stabn	68,0,237,.LM81-.LFBB6
.LM81:
	pop r28
	ret
.L33:
	.stabn	68,0,229,.LM82-.LFBB6
.LM82:
	andi r24,127
	rjmp .L37
.L35:
	.stabn	68,0,234,.LM83-.LFBB6
.LM83:
	andi r25,254
	rjmp .L38
	.size	adc_setup_channel, .-adc_setup_channel
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"adc_start:F(0,7)",36,0,0,adc_start
	.stabs	"chan:P(0,2)",64,0,0,24
	.stabs	"num_samples:P(0,1)",64,0,0,28
	.stabs	"pfcb:P(0,11)=(0,12)=*(0,13)=f(0,4)",64,0,0,16
	.stabs	"pfn_adc_callback:t(0,11)",128,0,0,0
.global	adc_start
	.type	adc_start, @function
adc_start:
	.stabn	68,0,240,.LM84-.LFBB7
.LM84:
.LFBB7:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r22
	movw r16,r20
	.stabn	68,0,243,.LM85-.LFBB7
.LM85:
	call get_index
	.stabn	68,0,244,.LM86-.LFBB7
.LM86:
	sbrc r25,7
	rjmp .L44
	.stabn	68,0,248,.LM87-.LFBB7
.LM87:
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
	.stabn	68,0,248,.LM88-.LFBB7
.LM88:
	sbrs r18,5
	rjmp .L44
	.stabn	68,0,252,.LM89-.LFBB7
.LM89:
	ld r18,Z
	ldd r19,Z+1
	.stabn	68,0,252,.LM90-.LFBB7
.LM90:
	sbrc r18,6
	rjmp .L44
	.stabn	68,0,255,.LM91-.LFBB7
.LM91:
	cp __zero_reg__,r28
	cpc __zero_reg__,r29
	brlt .L41
	ldi r28,lo8(-1)
	ldi r29,lo8(-1)
.L41:
	.stabn	68,0,255,.LM92-.LFBB7
.LM92:
	ldi r18,lo8(6)
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(adc))
	sbci r31,hi8(-(adc))
	std Z+3,r29
	std Z+2,r28
	.stabn	68,0,256,.LM93-.LFBB7
.LM93:
	std Z+5,r17
	std Z+4,r16
	.stabn	68,0,257,.LM94-.LFBB7
.LM94:
	ld r18,Z
	ldd r19,Z+1
	ori r18,64
	std Z+1,r19
	st Z,r18
	.stabn	68,0,260,.LM95-.LFBB7
.LM95:
	call adc_convert
	.stabn	68,0,262,.LM96-.LFBB7
.LM96:
	ldi r24,lo8(1)
.L39:
/* epilogue start */
	.stabn	68,0,263,.LM97-.LFBB7
.LM97:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L44:
	.stabn	68,0,245,.LM98-.LFBB7
.LM98:
	ldi r24,0
	rjmp .L39
	.size	adc_start, .-adc_start
	.stabs	"i:r(0,1)",64,0,0,24
	.stabn	192,0,0,.LFBB7-.LFBB7
	.stabn	224,0,0,.Lscope7-.LFBB7
.Lscope7:
	.stabs	"adc_warm_up:F(0,4)",36,0,0,adc_warm_up
.global	adc_warm_up
	.type	adc_warm_up, @function
adc_warm_up:
	.stabn	68,0,194,.LM99-.LFBB8
.LM99:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,196,.LM100-.LFBB8
.LM100:
	ldi r21,0
	ldi r20,0
	ldi r22,lo8(10)
	ldi r23,0
	ldi r24,lo8(2)
	call adc_start
.LBB20:
.LBB21:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM101-.LFBB8
.LM101:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE21:
.LBE20:
	.stabs	"src/core/adc_avr.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,198,.LM102-.LFBB8
.LM102:
	ret
	.size	adc_warm_up, .-adc_warm_up
.Lscope8:
	.stabs	"adc_is_running:F(0,7)",36,0,0,adc_is_running
	.stabs	"chan:P(0,2)",64,0,0,24
.global	adc_is_running
	.type	adc_is_running, @function
adc_is_running:
	.stabn	68,0,266,.LM103-.LFBB9
.LM103:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,269,.LM104-.LFBB9
.LM104:
	call get_index
	movw r18,r24
	.stabn	68,0,270,.LM105-.LFBB9
.LM105:
	sbrc r25,7
	rjmp .L48
	.stabn	68,0,273,.LM106-.LFBB9
.LM106:
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
	.stabn	68,0,273,.LM107-.LFBB9
.LM107:
	ldi r18,6
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	andi r24,lo8(1)
	ret
.L48:
	.stabn	68,0,271,.LM108-.LFBB9
.LM108:
	ldi r24,0
/* epilogue start */
	.stabn	68,0,274,.LM109-.LFBB9
.LM109:
	ret
	.size	adc_is_running, .-adc_is_running
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.stabs	"adc_stop:F(0,4)",36,0,0,adc_stop
	.stabs	"chan:P(0,2)",64,0,0,24
.global	adc_stop
	.type	adc_stop, @function
adc_stop:
	.stabn	68,0,277,.LM110-.LFBB10
.LM110:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,280,.LM111-.LFBB10
.LM111:
	call get_index
	movw r18,r24
	.stabn	68,0,281,.LM112-.LFBB10
.LM112:
	sbrc r25,7
	rjmp .L49
	.stabn	68,0,284,.LM113-.LFBB10
.LM113:
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
.L49:
/* epilogue start */
	.stabn	68,0,285,.LM114-.LFBB10
.LM114:
	ret
	.size	adc_stop, .-adc_stop
	.stabs	"i:r(0,1)",64,0,0,18
	.stabn	192,0,0,.LFBB10-.LFBB10
	.stabn	224,0,0,.Lscope10-.LFBB10
.Lscope10:
	.stabs	"adc_disable:F(0,4)",36,0,0,adc_disable
.global	adc_disable
	.type	adc_disable, @function
adc_disable:
	.stabn	68,0,201,.LM115-.LFBB11
.LM115:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,202,.LM116-.LFBB11
.LM116:
	ldi r24,0
	call adc_stop
	.stabn	68,0,203,.LM117-.LFBB11
.LM117:
	ldi r24,lo8(2)
	call adc_stop
	.stabn	68,0,206,.LM118-.LFBB11
.LM118:
	ldi r30,lo8(adc)
	ldi r31,hi8(adc)
	ld r24,Z
	ldd r25,Z+1
	andi r24,223
	std Z+1,r25
	st Z,r24
	.stabn	68,0,207,.LM119-.LFBB11
.LM119:
	ldd r24,Z+6
	ldd r25,Z+7
	andi r24,223
	std Z+7,r25
	std Z+6,r24
	.stabn	68,0,209,.LM120-.LFBB11
.LM120:
	cbi 0x6,3
	.stabn	68,0,210,.LM121-.LFBB11
.LM121:
	cbi 0x6,7
/* epilogue start */
	.stabn	68,0,211,.LM122-.LFBB11
.LM122:
	ret
	.size	adc_disable, .-adc_disable
.Lscope11:
	.local	adc
	.comm	adc,12,1
	.stabs	"adc:S(0,14)=ar(0,15)=r(0,15);0;65535;;0;1;(0,16)=(0,17)=xss_adc_channel:",40,0,0,adc
	.stabs	"s_adc_channel:T(0,17)=s6flags:(0,5),0,16;num_samples:(0,1),16,16;pfcb:(0,11),32,16;;",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
