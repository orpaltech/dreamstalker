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
	.stabn	68,0,227,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,228,.LM1-.LFBB1
.LM1:
	in r24,0x14
	andi r24,lo8(15)
	out 0x14,r24
	.stabn	68,0,229,.LM2-.LFBB1
.LM2:
	out 0x1a,__zero_reg__
	.stabn	68,0,231,.LM3-.LFBB1
.LM3:
	in r24,0x15
	ori r24,lo8(-16)
	out 0x15,r24
	.stabn	68,0,232,.LM4-.LFBB1
.LM4:
	out 0x1b,__zero_reg__
/* epilogue start */
	.stabn	68,0,233,.LM5-.LFBB1
.LM5:
	ret
	.size	pins_off, .-pins_off
.Lscope1:
	.stabs	"pins_on:f(0,1)",36,0,0,pins_on
	.type	pins_on, @function
pins_on:
	.stabn	68,0,237,.LM6-.LFBB2
.LM6:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,238,.LM7-.LFBB2
.LM7:
	in r24,0x14
	ori r24,lo8(-16)
	out 0x14,r24
	.stabn	68,0,239,.LM8-.LFBB2
.LM8:
	ldi r25,lo8(-1)
	out 0x1a,r25
	.stabn	68,0,241,.LM9-.LFBB2
.LM9:
	in r24,0x15
	ori r24,lo8(-16)
	out 0x15,r24
	.stabn	68,0,242,.LM10-.LFBB2
.LM10:
	in r24,0x1b
	out 0x1b,r25
/* epilogue start */
	.stabn	68,0,243,.LM11-.LFBB2
.LM11:
	ret
	.size	pins_on, .-pins_on
.Lscope2:
	.stabs	"disp_test_on:F(0,1)",36,0,0,disp_test_on
.global	disp_test_on
	.type	disp_test_on, @function
disp_test_on:
	.stabn	68,0,254,.LM12-.LFBB3
.LM12:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,255,.LM13-.LFBB3
.LM13:
	call pins_on
	.stabn	68,0,258,.LM14-.LFBB3
.LM14:
	in r24,0x15
	andi r24,lo8(15)
	out 0x15,r24
	.stabn	68,0,259,.LM15-.LFBB3
.LM15:
	out 0x1b,__zero_reg__
/* epilogue start */
	.stabn	68,0,260,.LM16-.LFBB3
.LM16:
	ret
	.size	disp_test_on, .-disp_test_on
.Lscope3:
.global	disp_test_off
	.type	disp_test_off, @function
disp_test_off:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp pins_off
	.size	disp_test_off, .-disp_test_off
	.stabs	"display_isr:F(0,1)",36,0,0,display_isr
.global	display_isr
	.type	display_isr, @function
display_isr:
	.stabn	68,0,270,.LM17-.LFBB4
.LM17:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,271,.LM18-.LFBB4
.LM18:
	lds r24,disp_enabled
	.stabn	68,0,271,.LM19-.LFBB4
.LM19:
	tst r24
	breq .L5
	.stabn	68,0,274,.LM20-.LFBB4
.LM20:
	in r18,0x15
	.stabn	68,0,274,.LM21-.LFBB4
.LM21:
	lds r24,dig_index
.LBB27:
.LBB28:
	.stabn	68,0,221,.LM22-.LFBB4
.LM22:
	ldi r25,0
	subi r24,lo8(-(pf_digits))
	sbci r25,hi8(-(pf_digits))
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  221 "src/display/ds_display.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE28:
.LBE27:
	.stabn	68,0,274,.LM23-.LFBB4
.LM23:
	com r24
	ori r18,lo8(-16)
	and r24,r18
	.stabn	68,0,274,.LM24-.LFBB4
.LM24:
	out 0x15,r24
	.stabn	68,0,275,.LM25-.LFBB4
.LM25:
	lds r30,dig_index
	ldi r31,0
	subi r30,lo8(-(pf_segments))
	sbci r31,hi8(-(pf_segments))
	ld r24,Z
	.stabn	68,0,275,.LM26-.LFBB4
.LM26:
	com r24
	out 0x1b,r24
	.stabn	68,0,277,.LM27-.LFBB4
.LM27:
	lds r24,dig_index
	ldi r25,0
	adiw r24,1
	.stabn	68,0,277,.LM28-.LFBB4
.LM28:
	andi r24,3
	clr r25
	.stabn	68,0,277,.LM29-.LFBB4
.LM29:
	sts dig_index,r24
.L5:
/* epilogue start */
	.stabn	68,0,278,.LM30-.LFBB4
.LM30:
	ret
	.size	display_isr, .-display_isr
.Lscope4:
	.stabs	"disp_init:F(0,1)",36,0,0,disp_init
.global	disp_init
	.type	disp_init, @function
disp_init:
	.stabn	68,0,283,.LM31-.LFBB5
.LM31:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,284,.LM32-.LFBB5
.LM32:
	jmp pins_off
	.size	disp_init, .-disp_init
.Lscope5:
	.stabs	"disp_enable_unsafe:F(0,1)",36,0,0,disp_enable_unsafe
.global	disp_enable_unsafe
	.type	disp_enable_unsafe, @function
disp_enable_unsafe:
	.stabn	68,0,289,.LM33-.LFBB6
.LM33:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,290,.LM34-.LFBB6
.LM34:
	lds r24,disp_enabled
	.stabn	68,0,290,.LM35-.LFBB6
.LM35:
	cpse r24,__zero_reg__
	rjmp .L11
	.stabn	68,0,293,.LM36-.LFBB6
.LM36:
	call pins_on
	.stabn	68,0,295,.LM37-.LFBB6
.LM37:
	ldi r24,lo8(1)
	sts disp_enabled,r24
.L11:
/* epilogue start */
	.stabn	68,0,296,.LM38-.LFBB6
.LM38:
	ret
	.size	disp_enable_unsafe, .-disp_enable_unsafe
.Lscope6:
	.stabs	"disp_enable:F(0,1)",36,0,0,disp_enable
.global	disp_enable
	.type	disp_enable, @function
disp_enable:
	.stabn	68,0,299,.LM39-.LFBB7
.LM39:
.LFBB7:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB34:
	.stabn	68,0,300,.LM40-.LFBB7
.LM40:
	in r28,__SREG__
.LBB35:
.LBB36:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,50,.LM41-.LFBB7
.LM41:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE36:
.LBE35:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,301,.LM42-.LFBB7
.LM42:
	call disp_enable_unsafe
.LBB37:
.LBB38:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,70,.LM43-.LFBB7
.LM43:
	out __SREG__,r28
	.stabn	68,0,71,.LM44-.LFBB7
.LM44:
/* epilogue start */
.LBE38:
.LBE37:
.LBE34:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,303,.LM45-.LFBB7
.LM45:
	pop r28
	ret
	.size	disp_enable, .-disp_enable
.Lscope7:
	.stabs	"disp_is_enabled:F(0,4)=eFalse:0,True:1,;",36,0,0,disp_is_enabled
	.stabs	"_Bool:t(0,4)",128,0,0,0
.global	disp_is_enabled
	.type	disp_is_enabled, @function
disp_is_enabled:
	.stabn	68,0,325,.LM46-.LFBB8
.LM46:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,326,.LM47-.LFBB8
.LM47:
	lds r24,disp_enabled
/* epilogue start */
	.stabn	68,0,327,.LM48-.LFBB8
.LM48:
	ret
	.size	disp_is_enabled, .-disp_is_enabled
.Lscope8:
	.stabs	"disp_get_cycle_us:F(0,5)=(0,6)=r(0,6);0;4294967295;",36,0,0,disp_get_cycle_us
	.stabs	"uint32_t:t(0,5)",128,0,0,0
	.stabs	"long unsigned int:t(0,6)",128,0,0,0
.global	disp_get_cycle_us
	.type	disp_get_cycle_us, @function
disp_get_cycle_us:
	.stabn	68,0,330,.LM49-.LFBB9
.LM49:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,332,.LM50-.LFBB9
.LM50:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	ldi r24,0
	ldi r25,0
/* epilogue start */
	ret
	.size	disp_get_cycle_us, .-disp_get_cycle_us
.Lscope9:
	.stabs	"disp_clear_unsafe:F(0,1)",36,0,0,disp_clear_unsafe
.global	disp_clear_unsafe
	.type	disp_clear_unsafe, @function
disp_clear_unsafe:
	.stabn	68,0,335,.LM51-.LFBB10
.LM51:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,339,.LM52-.LFBB10
.LM52:
	ldi r30,lo8(pf_segments)
	ldi r31,hi8(pf_segments)
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
/* epilogue start */
	.stabn	68,0,340,.LM53-.LFBB10
.LM53:
	ret
	.size	disp_clear_unsafe, .-disp_clear_unsafe
.Lscope10:
	.stabs	"disp_disable_unsafe:F(0,1)",36,0,0,disp_disable_unsafe
.global	disp_disable_unsafe
	.type	disp_disable_unsafe, @function
disp_disable_unsafe:
	.stabn	68,0,306,.LM54-.LFBB11
.LM54:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,307,.LM55-.LFBB11
.LM55:
	lds r24,disp_enabled
	.stabn	68,0,307,.LM56-.LFBB11
.LM56:
	tst r24
	breq .L17
.LBB41:
.LBB42:
	.stabn	68,0,310,.LM57-.LFBB11
.LM57:
	call pins_off
	.stabn	68,0,312,.LM58-.LFBB11
.LM58:
	call disp_clear_unsafe
	.stabn	68,0,314,.LM59-.LFBB11
.LM59:
	sts disp_enabled,__zero_reg__
.L17:
/* epilogue start */
.LBE42:
.LBE41:
	.stabn	68,0,315,.LM60-.LFBB11
.LM60:
	ret
	.size	disp_disable_unsafe, .-disp_disable_unsafe
.Lscope11:
	.stabs	"disp_disable:F(0,1)",36,0,0,disp_disable
.global	disp_disable
	.type	disp_disable, @function
disp_disable:
	.stabn	68,0,318,.LM61-.LFBB12
.LM61:
.LFBB12:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB48:
	.stabn	68,0,319,.LM62-.LFBB12
.LM62:
	in r28,__SREG__
.LBB49:
.LBB50:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,50,.LM63-.LFBB12
.LM63:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE50:
.LBE49:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,320,.LM64-.LFBB12
.LM64:
	call disp_disable_unsafe
.LBB51:
.LBB52:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,70,.LM65-.LFBB12
.LM65:
	out __SREG__,r28
	.stabn	68,0,71,.LM66-.LFBB12
.LM66:
/* epilogue start */
.LBE52:
.LBE51:
.LBE48:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,322,.LM67-.LFBB12
.LM67:
	pop r28
	ret
	.size	disp_disable, .-disp_disable
.Lscope12:
	.stabs	"disp_clear:F(0,1)",36,0,0,disp_clear
.global	disp_clear
	.type	disp_clear, @function
disp_clear:
	.stabn	68,0,343,.LM68-.LFBB13
.LM68:
.LFBB13:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB58:
	.stabn	68,0,344,.LM69-.LFBB13
.LM69:
	in r28,__SREG__
.LBB59:
.LBB60:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,50,.LM70-.LFBB13
.LM70:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE60:
.LBE59:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,345,.LM71-.LFBB13
.LM71:
	call disp_clear_unsafe
.LBB61:
.LBB62:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,70,.LM72-.LFBB13
.LM72:
	out __SREG__,r28
	.stabn	68,0,71,.LM73-.LFBB13
.LM73:
/* epilogue start */
.LBE62:
.LBE61:
.LBE58:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,347,.LM74-.LFBB13
.LM74:
	pop r28
	ret
	.size	disp_clear, .-disp_clear
.Lscope13:
	.stabs	"disp_text_unsafe:F(0,1)",36,0,0,disp_text_unsafe
	.stabs	"int:t(0,7)=r(0,7);-32768;32767;",128,0,0,0
	.stabs	"text:P(0,8)=*(0,9)=r(0,9);0;255;",64,0,0,28
	.stabs	"char:t(0,9)",128,0,0,0
.global	disp_text_unsafe
	.type	disp_text_unsafe, @function
disp_text_unsafe:
	.stabn	68,0,350,.LM75-.LFBB14
.LM75:
.LFBB14:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	.stabn	68,0,354,.LM76-.LFBB14
.LM76:
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	sbiw r30,1
	.stabn	68,0,354,.LM77-.LFBB14
.LM77:
	mov r17,r30
	sub r17,r24
	.stabn	68,0,355,.LM78-.LFBB14
.LM78:
	cp r30,r24
	breq .L24
	.stabn	68,0,358,.LM79-.LFBB14
.LM79:
	call disp_clear_unsafe
	mov r21,r28
	mov r18,r28
	mov r19,r29
	.stabn	68,0,352,.LM80-.LFBB14
.LM80:
	ldi r20,0
.L30:
	.stabn	68,0,361,.LM81-.LFBB14
.LM81:
	movw r30,r18
	ld r24,Z+
	movw r18,r30
	.stabn	68,0,361,.LM82-.LFBB14
.LM82:
	tst r20
	breq .L26
	.stabn	68,0,361,.LM83-.LFBB14
.LM83:
	cpi r24,lo8(46)
	brne .L27
	.stabn	68,0,362,.LM84-.LFBB14
.LM84:
	mov r24,r20
	subi r24,1
	sbc r25,r25
	movw r30,r24
	subi r30,lo8(-(pf_segments))
	sbci r31,hi8(-(pf_segments))
	ld r24,Z
	ori r24,lo8(-128)
	st Z,r24
.L28:
	.stabn	68,0,360,.LM85-.LFBB14
.LM85:
	mov r24,r18
	sub r24,r21
	cp r24,r17
	brlo .L30
.L24:
/* epilogue start */
	.stabn	68,0,371,.LM86-.LFBB14
.LM86:
	pop r29
	pop r28
	pop r17
	ret
.L27:
	.stabn	68,0,364,.LM87-.LFBB14
.LM87:
	cpi r20,lo8(4)
	brsh .L24
.L26:
	.stabn	68,0,365,.LM88-.LFBB14
.LM88:
	mov r22,r20
	ldi r23,0
	.stabn	68,0,365,.LM89-.LFBB14
.LM89:
	movw r30,r18
	sbiw r30,1
.LBB66:
.LBB67:
	.stabn	68,0,206,.LM90-.LFBB14
.LM90:
	ld r24,Z
	ldi r25,0
	subi r24,lo8(-(ascii_code))
	sbci r25,hi8(-(ascii_code))
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  206 "src/display/ds_display.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE67:
.LBE66:
	.stabn	68,0,365,.LM91-.LFBB14
.LM91:
	subi r22,lo8(-(pf_segments))
	sbci r23,hi8(-(pf_segments))
	movw r30,r22
	st Z,r24
	.stabn	68,0,366,.LM92-.LFBB14
.LM92:
	subi r20,lo8(-(1))
	rjmp .L28
	.size	disp_text_unsafe, .-disp_text_unsafe
	.stabs	"len:r(0,2)",64,0,0,17
	.stabs	"i:r(0,2)",64,0,0,20
	.stabn	192,0,0,.LFBB14-.LFBB14
	.stabn	224,0,0,.Lscope14-.LFBB14
.Lscope14:
	.stabs	"disp_text:F(0,1)",36,0,0,disp_text
.global	disp_text
	.type	disp_text, @function
disp_text:
	.stabn	68,0,374,.LM93-.LFBB15
.LM93:
.LFBB15:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB73:
	.stabn	68,0,375,.LM94-.LFBB15
.LM94:
	in r28,__SREG__
.LBB74:
.LBB75:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext13
.Ltext13:
	.stabn	68,0,50,.LM95-.LFBB15
.LM95:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE75:
.LBE74:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext14
.Ltext14:
	.stabn	68,0,376,.LM96-.LFBB15
.LM96:
	call disp_text_unsafe
.LBB76:
.LBB77:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext15
.Ltext15:
	.stabn	68,0,70,.LM97-.LFBB15
.LM97:
	out __SREG__,r28
	.stabn	68,0,71,.LM98-.LFBB15
.LM98:
/* epilogue start */
.LBE77:
.LBE76:
.LBE73:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext16
.Ltext16:
	.stabn	68,0,378,.LM99-.LFBB15
.LM99:
	pop r28
	ret
	.size	disp_text, .-disp_text
.Lscope15:
	.stabs	"disp_msg:F(0,1)",36,0,0,disp_msg
	.stabs	"text:P(0,8)",64,0,0,24
.global	disp_msg
	.type	disp_msg, @function
disp_msg:
	.stabn	68,0,420,.LM100-.LFBB16
.LM100:
.LFBB16:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r22
	mov r28,r23
	.stabn	68,0,421,.LM101-.LFBB16
.LM101:
	call disp_text
	mov r24,r29
	mov r25,r28
	sbiw r24,0
	brne .L38
	ldi r24,lo8(1)
	ldi r25,0
.L38:
.LBB78:
.LBB79:
.LBB80:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext17
.Ltext17:
	.stabn	68,0,276,.LM102-.LFBB16
.LM102:
	ldi r30,lo8(1999)
	ldi r31,hi8(1999)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
.LBE80:
.LBE79:
.LBE78:
	.stabs	"src/display/ds_display.c",132,0,0,.Ltext18
.Ltext18:
	.stabn	68,0,428,.LM103-.LFBB16
.LM103:
	sbiw r24,1
	.stabn	68,0,426,.LM104-.LFBB16
.LM104:
	brne .L38
/* epilogue start */
	.stabn	68,0,430,.LM105-.LFBB16
.LM105:
	pop r29
	pop r28
	ret
	.size	disp_msg, .-disp_msg
.Lscope16:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%c%1u.%02u"
	.text
	.stabs	"disp_version:F(0,1)",36,0,0,disp_version
	.stabs	"ver_type:P(0,9)",64,0,0,24
	.stabs	"ver:P(0,10)=(0,11)=r(0,11);0;65535;",64,0,0,18
	.stabs	"uint16_t:t(0,10)",128,0,0,0
	.stabs	"unsigned int:t(0,11)",128,0,0,0
.global	disp_version
	.type	disp_version, @function
disp_version:
	.stabn	68,0,381,.LM106-.LFBB17
.LM106:
.LFBB17:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
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
	.stabn	68,0,384,.LM107-.LFBB17
.LM107:
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
	.stabn	68,0,386,.LM108-.LFBB17
.LM108:
	movw r22,r16
	movw r24,r14
	call disp_msg
	.stabn	68,0,387,.LM109-.LFBB17
.LM109:
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
	.stabs	"msg:(0,12)=ar(0,13)=r(0,13);0;65535;;0;5;(0,9)",128,0,0,1
	.stabn	192,0,0,.LFBB17-.LFBB17
	.stabn	224,0,0,.Lscope17-.LFBB17
.Lscope17:
	.section	.rodata.str1.1
.LC1:
	.string	"EEEE"
.LC2:
	.string	"%4u"
	.text
	.stabs	"disp_num:F(0,1)",36,0,0,disp_num
	.stabs	"num:P(0,10)",64,0,0,18
.global	disp_num
	.type	disp_num, @function
disp_num:
	.stabn	68,0,405,.LM110-.LFBB18
.LM110:
.LFBB18:
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
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
	.stabn	68,0,408,.LM111-.LFBB18
.LM111:
	cpi r18,16
	ldi r24,39
	cpc r19,r24
	brlo .L42
	.stabn	68,0,409,.LM112-.LFBB18
.LM112:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	movw r24,r16
	call strcpy
.L43:
	.stabn	68,0,413,.LM113-.LFBB18
.LM113:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r16
	call disp_msg
/* epilogue start */
	.stabn	68,0,414,.LM114-.LFBB18
.LM114:
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
.L42:
	.stabn	68,0,411,.LM115-.LFBB18
.LM115:
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
	rjmp .L43
	.size	disp_num, .-disp_num
	.stabs	"msg:(0,14)=ar(0,13);0;4;(0,9)",128,0,0,1
	.stabn	192,0,0,.LFBB18-.LFBB18
	.stabn	224,0,0,.Lscope18-.LFBB18
.Lscope18:
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
	.stabn	68,0,433,.LM116-.LFBB19
.LM116:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,435,.LM117-.LFBB19
.LM117:
	ldi r22,lo8(1)
	ldi r23,0
	.stabn	68,0,434,.LM118-.LFBB19
.LM118:
	tst r24
	breq .L45
	.stabn	68,0,435,.LM119-.LFBB19
.LM119:
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
.L46:
	.stabn	68,0,437,.LM120-.LFBB19
.LM120:
	jmp disp_msg
.L45:
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	rjmp .L46
	.size	disp_flag, .-disp_flag
.Lscope19:
	.section	.rodata.str1.1
.LC5:
	.string	"%02u.%02u"
	.text
	.stabs	"disp_wakeup_timer_delay:F(0,1)",36,0,0,disp_wakeup_timer_delay
.global	disp_wakeup_timer_delay
	.type	disp_wakeup_timer_delay, @function
disp_wakeup_timer_delay:
	.stabn	68,0,441,.LM121-.LFBB20
.LM121:
.LFBB20:
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 10 */
.L__stack_usage = 10
	.stabn	68,0,445,.LM122-.LFBB20
.LM122:
	call is_invalid_wakeup_timer_delay
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,445,.LM123-.LFBB20
.LM123:
	tst r24
	breq .L48
	.stabn	68,0,446,.LM124-.LFBB20
.LM124:
	ldi r22,lo8(.LC4)
	ldi r23,hi8(.LC4)
	movw r24,r16
	call strcpy
.L49:
	.stabn	68,0,454,.LM125-.LFBB20
.LM125:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r16
	call disp_msg
/* epilogue start */
	.stabn	68,0,455,.LM126-.LFBB20
.LM126:
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
.L48:
	.stabn	68,0,448,.LM127-.LFBB20
.LM127:
	call get_wakeup_timer_delay
	ldi r22,lo8(60)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,451,.LM128-.LFBB20
.LM128:
	push r25
	push r24
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
	rjmp .L49
	.size	disp_wakeup_timer_delay, .-disp_wakeup_timer_delay
	.stabs	"msg:(0,12)",128,0,0,1
	.stabn	192,0,0,.LFBB20-.LFBB20
	.stabn	224,0,0,.Lscope20-.LFBB20
.Lscope20:
	.local	disp_enabled
	.comm	disp_enabled,1,1
	.stabs	"disp_enabled:S(0,4)",38,0,0,disp_enabled
	.local	pf_segments
	.comm	pf_segments,4,1
	.stabs	"pf_segments:S(0,15)=ar(0,13);0;3;(0,2)",38,0,0,pf_segments
	.local	dig_index
	.comm	dig_index,1,1
	.stabs	"dig_index:S(0,2)",38,0,0,dig_index
.global	pf_digits
	.section	.progmem.data,"a",@progbits
	.type	pf_digits, @object
	.size	pf_digits, 4
pf_digits:
	.ascii	"\020 @\200"
	.stabs	"pf_digits:G(0,15)",32,0,0,0
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
	.stabs	"ascii_code:G(0,16)=ar(0,13);0;122;(0,2)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
