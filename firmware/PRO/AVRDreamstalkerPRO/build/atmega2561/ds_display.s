	.file	"ds_display.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/display/ds_display.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"pins_off:f(0,1)=(0,1)",36,0,0,pins_off
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	pins_off, @function
pins_off:
	.stabn	68,0,189,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,191,.LM1-.LFBB1
.LM1:
	in r24,0x8
	ori r24,lo8(-16)
	out 0x8,r24
	.stabn	68,0,194,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(-1)
	out 0x2,r24
/* epilogue start */
	.stabn	68,0,195,.LM3-.LFBB1
.LM3:
	ret
	.size	pins_off, .-pins_off
.Lscope1:
	.stabs	"display_isr:F(0,1)",36,0,0,display_isr
.global	display_isr
	.type	display_isr, @function
display_isr:
	.stabn	68,0,230,.LM4-.LFBB2
.LM4:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,231,.LM5-.LFBB2
.LM5:
	call pins_off
	.stabn	68,0,233,.LM6-.LFBB2
.LM6:
	lds r30,dig_index
.LBB46:
.LBB47:
	.stabn	68,0,218,.LM7-.LFBB2
.LM7:
	ldi r31,0
	subi r30,lo8(-(pf_digits))
	sbci r31,hi8(-(pf_digits))
/* #APP */
 ;  218 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE47:
.LBE46:
	.stabn	68,0,233,.LM8-.LFBB2
.LM8:
	in r24,0x8
	.stabn	68,0,233,.LM9-.LFBB2
.LM9:
	com r30
	.stabn	68,0,233,.LM10-.LFBB2
.LM10:
	and r30,r24
	out 0x8,r30
	.stabn	68,0,234,.LM11-.LFBB2
.LM11:
	lds r30,dig_index
	ldi r31,0
	subi r30,lo8(-(pf_segments))
	sbci r31,hi8(-(pf_segments))
	ld r24,Z
	.stabn	68,0,234,.LM12-.LFBB2
.LM12:
	in r25,0x2
	.stabn	68,0,234,.LM13-.LFBB2
.LM13:
	com r24
	.stabn	68,0,234,.LM14-.LFBB2
.LM14:
	and r24,r25
	out 0x2,r24
	.stabn	68,0,235,.LM15-.LFBB2
.LM15:
	lds r24,dig_index
	ldi r25,0
	adiw r24,1
	.stabn	68,0,235,.LM16-.LFBB2
.LM16:
	andi r24,3
	clr r25
	.stabn	68,0,235,.LM17-.LFBB2
.LM17:
	sts dig_index,r24
/* epilogue start */
	.stabn	68,0,236,.LM18-.LFBB2
.LM18:
	ret
	.size	display_isr, .-display_isr
.Lscope2:
	.stabs	"disp_on:F(0,1)",36,0,0,disp_on
.global	disp_on
	.type	disp_on, @function
disp_on:
	.stabn	68,0,249,.LM19-.LFBB3
.LM19:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,250,.LM20-.LFBB3
.LM20:
	call pins_off
.LBB48:
.LBB49:
.LBB50:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM21-.LFBB3
.LM21:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE50:
.LBE49:
.LBE48:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,255,.LM22-.LFBB3
.LM22:
	ret
	.size	disp_on, .-disp_on
.Lscope3:
	.stabs	"disp_init:F(0,1)",36,0,0,disp_init
.global	disp_init
	.type	disp_init, @function
disp_init:
	.stabn	68,0,241,.LM23-.LFBB4
.LM23:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,242,.LM24-.LFBB4
.LM24:
	in r24,0x1
	ldi r24,lo8(-1)
	out 0x1,r24
	.stabn	68,0,243,.LM25-.LFBB4
.LM25:
	in r24,0x7
	ori r24,lo8(-16)
	out 0x7,r24
	.stabn	68,0,245,.LM26-.LFBB4
.LM26:
	jmp disp_on
	.size	disp_init, .-disp_init
.Lscope4:
	.stabs	"disp_off:F(0,1)",36,0,0,disp_off
.global	disp_off
	.type	disp_off, @function
disp_off:
	.stabn	68,0,258,.LM27-.LFBB5
.LM27:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB51:
.LBB52:
.LBB53:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,187,.LM28-.LFBB5
.LM28:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE53:
.LBE52:
.LBE51:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,263,.LM29-.LFBB5
.LM29:
	jmp pins_off
	.size	disp_off, .-disp_off
.Lscope5:
	.stabs	"disp_get_cycle_ms:F(0,4)=r(0,4);-32768;32767;",36,0,0,disp_get_cycle_ms
	.stabs	"int:t(0,4)",128,0,0,0
.global	disp_get_cycle_ms
	.type	disp_get_cycle_ms, @function
disp_get_cycle_ms:
	.stabn	68,0,267,.LM30-.LFBB6
.LM30:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,269,.LM31-.LFBB6
.LM31:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	disp_get_cycle_ms, .-disp_get_cycle_ms
.Lscope6:
	.stabs	"disp_clear:F(0,1)",36,0,0,disp_clear
.global	disp_clear
	.type	disp_clear, @function
disp_clear:
	.stabn	68,0,272,.LM32-.LFBB7
.LM32:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,273,.LM33-.LFBB7
.LM33:
	ldi r30,lo8(pf_segments)
	ldi r31,hi8(pf_segments)
	st Z,__zero_reg__
	.stabn	68,0,274,.LM34-.LFBB7
.LM34:
	std Z+1,__zero_reg__
	.stabn	68,0,275,.LM35-.LFBB7
.LM35:
	std Z+2,__zero_reg__
	.stabn	68,0,276,.LM36-.LFBB7
.LM36:
	std Z+3,__zero_reg__
/* epilogue start */
	.stabn	68,0,277,.LM37-.LFBB7
.LM37:
	ret
	.size	disp_clear, .-disp_clear
.Lscope7:
	.stabs	"disp_text:F(0,1)",36,0,0,disp_text
	.stabs	"text:P(0,5)=*(0,6)=r(0,6);0;255;",64,0,0,30
	.stabs	"char:t(0,6)",128,0,0,0
.global	disp_text
	.type	disp_text, @function
disp_text:
	.stabn	68,0,280,.LM38-.LFBB8
.LM38:
.LFBB8:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,283,.LM39-.LFBB8
.LM39:
	movw r26,r24
	0:
	ld __tmp_reg__,X+
	tst __tmp_reg__
	brne 0b
	sbiw r26,1
	.stabn	68,0,283,.LM40-.LFBB8
.LM40:
	mov r20,r26
	sub r20,r24
	.stabn	68,0,284,.LM41-.LFBB8
.LM41:
	cp r26,r24
	breq .L8
	.stabn	68,0,288,.LM42-.LFBB8
.LM42:
	sts pf_segments,__zero_reg__
	sts pf_segments+1,__zero_reg__
	sts pf_segments+2,__zero_reg__
	sts pf_segments+3,__zero_reg__
	mov r21,r24
	movw r26,r24
	.stabn	68,0,290,.LM43-.LFBB8
.LM43:
	ldi r24,0
.L14:
	.stabn	68,0,291,.LM44-.LFBB8
.LM44:
	ld r25,X+
	.stabn	68,0,291,.LM45-.LFBB8
.LM45:
	tst r24
	breq .L10
	.stabn	68,0,291,.LM46-.LFBB8
.LM46:
	cpi r25,lo8(46)
	brne .L11
	.stabn	68,0,292,.LM47-.LFBB8
.LM47:
	mov r18,r24
	subi r18,1
	sbc r19,r19
	movw r30,r18
	subi r30,lo8(-(pf_segments))
	sbci r31,hi8(-(pf_segments))
	ld r25,Z
	ori r25,lo8(-128)
	st Z,r25
.L12:
	.stabn	68,0,290,.LM48-.LFBB8
.LM48:
	mov r25,r26
	sub r25,r21
	cp r25,r20
	brlo .L14
.L8:
/* epilogue start */
	.stabn	68,0,301,.LM49-.LFBB8
.LM49:
	pop r29
	pop r28
	ret
.L11:
	.stabn	68,0,294,.LM50-.LFBB8
.LM50:
	cpi r24,lo8(4)
	brsh .L8
.L10:
	.stabn	68,0,295,.LM51-.LFBB8
.LM51:
	mov r18,r24
	ldi r19,0
	.stabn	68,0,295,.LM52-.LFBB8
.LM52:
	movw r30,r26
	sbiw r30,1
.LBB54:
.LBB55:
	.stabn	68,0,212,.LM53-.LFBB8
.LM53:
	ld r30,Z
	ldi r31,0
	subi r30,lo8(-(ascii_code))
	sbci r31,hi8(-(ascii_code))
/* #APP */
 ;  212 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE55:
.LBE54:
	.stabn	68,0,295,.LM54-.LFBB8
.LM54:
	subi r18,lo8(-(pf_segments))
	sbci r19,hi8(-(pf_segments))
	movw r28,r18
	st Y,r30
	.stabn	68,0,296,.LM55-.LFBB8
.LM55:
	subi r24,lo8(-(1))
	rjmp .L12
	.size	disp_text, .-disp_text
	.stabs	"len:r(0,2)",64,0,0,20
	.stabs	"i:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB8-.LFBB8
	.stabn	224,0,0,.Lscope8-.LFBB8
.Lscope8:
	.stabs	"disp_hex:F(0,1)",36,0,0,disp_hex
	.stabs	"num:P(0,7)=(0,8)=r(0,8);0;65535;",64,0,0,18
	.stabs	"uint16_t:t(0,7)",128,0,0,0
	.stabs	"unsigned int:t(0,8)",128,0,0,0
.global	disp_hex
	.type	disp_hex, @function
disp_hex:
	.stabn	68,0,312,.LM56-.LFBB9
.LM56:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,313,.LM57-.LFBB9
.LM57:
	movw r30,r24
	andi r30,15
	clr r31
.LBB56:
.LBB57:
	.stabn	68,0,206,.LM58-.LFBB9
.LM58:
	subi r30,lo8(-(num_code))
	sbci r31,hi8(-(num_code))
/* #APP */
 ;  206 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE57:
.LBE56:
	.stabn	68,0,313,.LM59-.LFBB9
.LM59:
	ldi r26,lo8(pf_segments)
	ldi r27,hi8(pf_segments)
	adiw r26,3
	st X,r30
	sbiw r26,3
	.stabn	68,0,314,.LM60-.LFBB9
.LM60:
	movw r30,r24
	ldi r24,4
	1:
	lsr r31
	ror r30
	dec r24
	brne 1b
	.stabn	68,0,314,.LM61-.LFBB9
.LM61:
	andi r30,15
	clr r31
.LBB58:
.LBB59:
	.stabn	68,0,206,.LM62-.LFBB9
.LM62:
	subi r30,lo8(-(num_code))
	sbci r31,hi8(-(num_code))
/* #APP */
 ;  206 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE59:
.LBE58:
	.stabn	68,0,314,.LM63-.LFBB9
.LM63:
	adiw r26,2
	st X,r30
	sbiw r26,2
	.stabn	68,0,315,.LM64-.LFBB9
.LM64:
	mov r30,r19
	clr r31
	.stabn	68,0,315,.LM65-.LFBB9
.LM65:
	andi r30,15
	clr r31
.LBB60:
.LBB61:
	.stabn	68,0,206,.LM66-.LFBB9
.LM66:
	subi r30,lo8(-(num_code))
	sbci r31,hi8(-(num_code))
/* #APP */
 ;  206 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE61:
.LBE60:
	.stabn	68,0,315,.LM67-.LFBB9
.LM67:
	adiw r26,1
	st X,r30
	sbiw r26,1
	.stabn	68,0,316,.LM68-.LFBB9
.LM68:
	movw r30,r18
	mov r30,r31
	clr r31
	swap r30
	andi r30,0x0f
.LBB62:
.LBB63:
	.stabn	68,0,206,.LM69-.LFBB9
.LM69:
	subi r30,lo8(-(num_code))
	sbci r31,hi8(-(num_code))
/* #APP */
 ;  206 "src/display/ds_display.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE63:
.LBE62:
	.stabn	68,0,316,.LM70-.LFBB9
.LM70:
	st X,r30
.LBB64:
.LBB65:
.LBB66:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM71-.LFBB9
.LM71:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE66:
.LBE65:
.LBE64:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,319,.LM72-.LFBB9
.LM72:
	ret
	.size	disp_hex, .-disp_hex
.Lscope9:
	.stabs	"disp_msg:F(0,1)",36,0,0,disp_msg
	.stabs	"text:P(0,5)",64,0,0,24
.global	disp_msg
	.type	disp_msg, @function
disp_msg:
	.stabn	68,0,337,.LM73-.LFBB10
.LM73:
.LFBB10:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r22
	mov r28,r23
	.stabn	68,0,338,.LM74-.LFBB10
.LM74:
	call disp_text
	mov r24,r29
	mov r25,r28
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brlt .L22
	ldi r24,lo8(1)
	ldi r25,0
.L22:
	.stabn	68,0,342,.LM75-.LFBB10
.LM75:
	sbiw r24,1
	brcc .L23
/* epilogue start */
	.stabn	68,0,344,.LM76-.LFBB10
.LM76:
	pop r29
	pop r28
	ret
.L23:
.LBB67:
.LBB68:
.LBB69:
.LBB70:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,187,.LM77-.LFBB10
.LM77:
	ldi r30,lo8(1999)
	ldi r31,hi8(1999)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
.LBE70:
.LBE69:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,225,.LM78-.LFBB10
.LM78:
	rjmp .L22
.LBE68:
.LBE67:
	.size	disp_msg, .-disp_msg
.Lscope10:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%c%01u.%02u"
	.text
	.stabs	"disp_version:F(0,1)",36,0,0,disp_version
	.stabs	"ver_type:P(0,6)",64,0,0,24
	.stabs	"ver:P(0,7)",64,0,0,18
.global	disp_version
	.type	disp_version, @function
disp_version:
	.stabn	68,0,304,.LM79-.LFBB11
.LM79:
.LFBB11:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r18,r22
	movw r16,r20
	.stabn	68,0,307,.LM80-.LFBB11
.LM80:
	movw r20,r22
	clr r21
	push r21
	push r20
	push __zero_reg__
	push r19
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(6)
	push r24
	movw r24,r28
	adiw r24,1
	movw r14,r24
	push r25
	push r24
	call snprintf
	.stabn	68,0,308,.LM81-.LFBB11
.LM81:
	movw r22,r16
	movw r24,r14
	call disp_msg
	.stabn	68,0,309,.LM82-.LFBB11
.LM82:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	disp_version, .-disp_version
	.stabs	"msg:(0,9)=ar(0,10)=r(0,10);0;65535;;0;5;(0,6)",128,0,0,1
	.stabn	192,0,0,.LFBB11-.LFBB11
	.stabn	224,0,0,.Lscope11-.LFBB11
.Lscope11:
	.section	.rodata.str1.1
.LC1:
	.string	"EEEE"
.LC2:
	.string	"%4u"
	.text
	.stabs	"disp_dec:F(0,1)",36,0,0,disp_dec
	.stabs	"num:P(0,7)",64,0,0,18
.global	disp_dec
	.type	disp_dec, @function
disp_dec:
	.stabn	68,0,322,.LM83-.LFBB12
.LM83:
.LFBB12:
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r18,r24
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,325,.LM84-.LFBB12
.LM84:
	cpi r18,16
	ldi r24,39
	cpc r19,r24
	brlo .L26
	.stabn	68,0,326,.LM85-.LFBB12
.LM85:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	movw r24,r16
	call strcpy
.L27:
	.stabn	68,0,330,.LM86-.LFBB12
.LM86:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r16
	call disp_msg
/* epilogue start */
	.stabn	68,0,331,.LM87-.LFBB12
.LM87:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L26:
	.stabn	68,0,328,.LM88-.LFBB12
.LM88:
	push r19
	push r18
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(5)
	push r24
	push r17
	push r16
	call snprintf
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	rjmp .L27
	.size	disp_dec, .-disp_dec
	.stabs	"msg:(0,11)=ar(0,10);0;4;(0,6)",128,0,0,1
	.stabn	192,0,0,.LFBB12-.LFBB12
	.stabn	224,0,0,.Lscope12-.LFBB12
.Lscope12:
	.section	.rodata.str1.1
.LC3:
	.string	"  On"
.LC4:
	.string	" OFF"
	.text
	.stabs	"disp_flag:F(0,1)",36,0,0,disp_flag
	.stabs	"flag_val:P(0,4)",64,0,0,24
.global	disp_flag
	.type	disp_flag, @function
disp_flag:
	.stabn	68,0,347,.LM89-.LFBB13
.LM89:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,349,.LM90-.LFBB13
.LM90:
	ldi r22,lo8(1)
	ldi r23,0
	.stabn	68,0,348,.LM91-.LFBB13
.LM91:
	or r24,r25
	breq .L29
	.stabn	68,0,349,.LM92-.LFBB13
.LM92:
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
.L30:
	.stabn	68,0,351,.LM93-.LFBB13
.LM93:
	jmp disp_msg
.L29:
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	rjmp .L30
	.size	disp_flag, .-disp_flag
.Lscope13:
	.section	.rodata.str1.1
.LC5:
	.string	"%02u.%02u"
	.text
	.stabs	"disp_wakeup_timer_delay:F(0,1)",36,0,0,disp_wakeup_timer_delay
.global	disp_wakeup_timer_delay
	.type	disp_wakeup_timer_delay, @function
disp_wakeup_timer_delay:
	.stabn	68,0,355,.LM94-.LFBB14
.LM94:
.LFBB14:
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 10 */
.L__stack_usage = 10
	.stabn	68,0,360,.LM95-.LFBB14
.LM95:
	call is_invalid_wakeup_timer_delay
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,360,.LM96-.LFBB14
.LM96:
	tst r24
	breq .L32
	.stabn	68,0,361,.LM97-.LFBB14
.LM97:
	ldi r22,lo8(.LC4)
	ldi r23,hi8(.LC4)
	movw r24,r16
	call strcpy
.L33:
	.stabn	68,0,369,.LM98-.LFBB14
.LM98:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r16
	call disp_msg
/* epilogue start */
	.stabn	68,0,370,.LM99-.LFBB14
.LM99:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L32:
	.stabn	68,0,363,.LM100-.LFBB14
.LM100:
	call get_wakeup_timer_delay
	mov r18,r24
	.stabn	68,0,364,.LM101-.LFBB14
.LM101:
	ldi r22,lo8(60)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,365,.LM102-.LFBB14
.LM102:
	ldi r24,lo8(60)
	mul r22,r24
	sub r18,r0
	clr __zero_reg__
	.stabn	68,0,366,.LM103-.LFBB14
.LM103:
	push __zero_reg__
	push r18
	clr r23
	push r23
	push r22
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(6)
	push r24
	push r17
	push r16
	call snprintf
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	rjmp .L33
	.size	disp_wakeup_timer_delay, .-disp_wakeup_timer_delay
	.stabs	"msg:(0,9)",128,0,0,1
	.stabn	192,0,0,.LFBB14-.LFBB14
	.stabn	224,0,0,.Lscope14-.LFBB14
.Lscope14:
	.local	pf_segments
	.comm	pf_segments,4,1
	.stabs	"pf_segments:S(0,12)=ar(0,10);0;3;(0,2)",38,0,0,pf_segments
	.local	dig_index
	.comm	dig_index,1,1
	.stabs	"dig_index:S(0,2)",38,0,0,dig_index
.global	pf_digits
	.section	.progmem.data,"a",@progbits
	.type	pf_digits, @object
	.size	pf_digits, 4
pf_digits:
	.ascii	"\020 @\200"
	.stabs	"pf_digits:G(0,12)",32,0,0,0
.global	ascii_code
	.type	ascii_code, @object
	.size	ascii_code, 123
ascii_code:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\200"
	.string	"?\006[Ofm}\007\177o"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"w"
	.string	"9"
	.string	"yq=v\006\016"
	.string	"8"
	.string	""
	.string	"?s"
	.string	""
	.string	"m"
	.string	">"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\b"
	.string	""
	.string	"|X^"
	.string	""
	.string	"ot"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"T\\sgP"
	.string	"x\034"
	.string	""
	.string	""
	.string	"n"
	.stabs	"ascii_code:G(0,13)=ar(0,10);0;122;(0,2)",32,0,0,0
.global	num_code
	.type	num_code, @object
	.size	num_code, 16
num_code:
	.ascii	"?\006[Ofm}\007\177ow|9^yq"
	.stabs	"num_code:G(0,14)=ar(0,10);0;15;(0,2)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
