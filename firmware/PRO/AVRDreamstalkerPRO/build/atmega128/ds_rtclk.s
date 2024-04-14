	.file	"ds_rtclk.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_rtclk.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%02u"
.LC1:
	.string	"  "
.LC2:
	.string	"."
	.text
	.stabs	"rtc_display:f(0,1)=(0,1)",36,0,0,rtc_display
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"flags:P(0,2)=(0,3)=r(0,3);0;255;",64,0,0,28
	.stabs	"uint8_t:t(0,2)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	rtc_display, @function
rtc_display:
	.stabn	68,0,408,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	mov r17,r24
	mov r16,r25
	mov r29,r22
	mov r15,r23
	mov r28,r20
	.stabn	68,0,412,.LM1-.LFBB1
.LM1:
	call disp_is_enabled
	.stabn	68,0,412,.LM2-.LFBB1
.LM2:
	tst r24
	brne .+2
	rjmp .L1
.LBB55:
.LBB56:
	.stabn	68,0,415,.LM3-.LFBB1
.LM3:
	sbrs r28,0
	rjmp .L3
	.stabn	68,0,416,.LM4-.LFBB1
.LM4:
	push r16
	push r17
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(3)
	push r24
	ldi r24,lo8(msg.0)
	ldi r25,hi8(msg.0)
	push r25
	push r24
	call snprintf
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
.L4:
	.stabn	68,0,419,.LM5-.LFBB1
.LM5:
	ldi r16,lo8(msg.0+2)
	ldi r17,hi8(msg.0+2)
	.stabn	68,0,421,.LM6-.LFBB1
.LM6:
	sbrs r28,2
	rjmp .L5
	.stabn	68,0,422,.LM7-.LFBB1
.LM7:
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(msg.0+2)
	ldi r25,hi8(msg.0+2)
	call strcat
	ldi r16,lo8(msg.0+3)
	ldi r17,hi8(msg.0+3)
.L5:
	.stabn	68,0,424,.LM8-.LFBB1
.LM8:
	sbrs r28,1
	rjmp .L6
	.stabn	68,0,425,.LM9-.LFBB1
.LM9:
	push r15
	push r29
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(3)
	push r24
	push r17
	push r16
	call snprintf
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
.L7:
	.stabn	68,0,430,.LM10-.LFBB1
.LM10:
	sbrs r28,3
	rjmp .L8
	.stabn	68,0,431,.LM11-.LFBB1
.LM11:
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	movw r24,r16
	adiw r24,2
	call strcat
.L8:
	.stabn	68,0,433,.LM12-.LFBB1
.LM12:
	ldi r24,lo8(msg.0)
	ldi r25,hi8(msg.0)
/* epilogue start */
.LBE56:
.LBE55:
	.stabn	68,0,434,.LM13-.LFBB1
.LM13:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
.LBB58:
.LBB57:
	.stabn	68,0,433,.LM14-.LFBB1
.LM14:
	jmp disp_text_unsafe
.L3:
	.stabn	68,0,418,.LM15-.LFBB1
.LM15:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,lo8(msg.0)
	ldi r25,hi8(msg.0)
	call strcpy
	rjmp .L4
.L6:
	.stabn	68,0,427,.LM16-.LFBB1
.LM16:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	movw r24,r16
	call strcat
	rjmp .L7
.L1:
/* epilogue start */
.LBE57:
.LBE58:
	.stabn	68,0,434,.LM17-.LFBB1
.LM17:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	rtc_display, .-rtc_display
	.stabs	"msg:V(0,4)=ar(0,5)=r(0,5);0;65535;;0;6;(0,6)=r(0,6);0;255;",40,0,0,msg.0
	.stabs	"char:t(0,6)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"rtc_start:F(0,1)",36,0,0,rtc_start
	.stabs	"e_rtc_oper_mode:T(0,7)=eRTC_OPM_DEFAULT:0,RTC_OPM_POWERSAVE:1,;",128,0,0,0
	.stabs	"mode:P(0,8)=(0,7)",64,0,0,24
.global	rtc_start
	.type	rtc_start, @function
rtc_start:
	.stabn	68,0,219,.LM18-.LFBB2
.LM18:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,226,.LM19-.LFBB2
.LM19:
	in r25,0x37
	andi r25,lo8(-4)
	out 0x37,r25
	.stabn	68,0,231,.LM20-.LFBB2
.LM20:
	ldi r25,lo8(8)
	out 0x30,r25
	.stabn	68,0,236,.LM21-.LFBB2
.LM21:
	out 0x33,r25
	.stabn	68,0,238,.LM22-.LFBB2
.LM22:
	out 0x32,__zero_reg__
	.stabn	68,0,244,.LM23-.LFBB2
.LM23:
	in r24,0x33
	.stabn	68,0,240,.LM24-.LFBB2
.LM24:
	cpi r18,1
	cpc r19,__zero_reg__
	brne .L14
	.stabn	68,0,244,.LM25-.LFBB2
.LM25:
	ori r24,lo8(6)
	out 0x33,r24
	.stabn	68,0,248,.LM26-.LFBB2
.LM26:
	ldi r24,lo8(-128)
	out 0x31,r24
	.stabn	68,0,250,.LM27-.LFBB2
.LM27:
	lds r24,rtc+7
	andi r24,lo8(-4)
	ori r24,lo8(1)
.L18:
	.stabn	68,0,261,.LM28-.LFBB2
.LM28:
	sts rtc+7,r24
.L16:
	.stabn	68,0,266,.LM29-.LFBB2
.LM29:
	in r24,0x30
	andi r24,lo8(7)
	brne .L16
	.stabn	68,0,268,.LM30-.LFBB2
.LM30:
	in r24,0x36
	andi r24,lo8(-4)
	out 0x36,r24
	.stabn	68,0,269,.LM31-.LFBB2
.LM31:
	in r24,0x37
	ori r24,lo8(2)
	out 0x37,r24
/* epilogue start */
	.stabn	68,0,323,.LM32-.LFBB2
.LM32:
	ret
.L14:
	.stabn	68,0,256,.LM33-.LFBB2
.LM33:
	ori r24,lo8(1)
	out 0x33,r24
	.stabn	68,0,259,.LM34-.LFBB2
.LM34:
	ldi r24,lo8(33)
	out 0x31,r24
	.stabn	68,0,261,.LM35-.LFBB2
.LM35:
	lds r24,rtc+7
	andi r24,lo8(-4)
	rjmp .L18
	.size	rtc_start, .-rtc_start
.Lscope2:
	.stabs	"rtc_msec_to_ticks:F(0,9)=(0,10)=r(0,10);0;4294967295;",36,0,0,rtc_msec_to_ticks
	.stabs	"uint32_t:t(0,9)",128,0,0,0
	.stabs	"long unsigned int:t(0,10)",128,0,0,0
.global	rtc_msec_to_ticks
	.type	rtc_msec_to_ticks, @function
rtc_msec_to_ticks:
	.stabn	68,0,326,.LM36-.LFBB3
.LM36:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,328,.LM37-.LFBB3
.LM37:
	ret
	.size	rtc_msec_to_ticks, .-rtc_msec_to_ticks
.Lscope3:
	.stabs	"rtc_is_visible:F(0,11)=eFalse:0,True:1,;",36,0,0,rtc_is_visible
	.stabs	"_Bool:t(0,11)",128,0,0,0
.global	rtc_is_visible
	.type	rtc_is_visible, @function
rtc_is_visible:
	.stabn	68,0,341,.LM38-.LFBB4
.LM38:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB59:
.LBB60:
	.stabn	68,0,377,.LM39-.LFBB4
.LM39:
	lds r24,rtc+6
.LBE60:
.LBE59:
	.stabn	68,0,343,.LM40-.LFBB4
.LM40:
	rol r24
	clr r24
	rol r24
/* epilogue start */
	ret
	.size	rtc_is_visible, .-rtc_is_visible
.Lscope4:
	.stabs	"rtc_is_setup:F(0,11)",36,0,0,rtc_is_setup
	.stabs	"e_rtc_setup_mode:T(0,12)=eRTC_SETUP_NONE:0,RTC_SETUP_HOUR:1,RTC_SETUP_MINUTE:2,;",128,0,0,0
.global	rtc_is_setup
	.type	rtc_is_setup, @function
rtc_is_setup:
	.stabn	68,0,346,.LM41-.LFBB5
.LM41:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB61:
.LBB62:
	.stabn	68,0,357,.LM42-.LFBB5
.LM42:
	lds r25,rtc+7
	lsr r25
	lsr r25
	andi r25,lo8(3)
.LBE62:
.LBE61:
	.stabn	68,0,347,.LM43-.LFBB5
.LM43:
	ldi r24,lo8(1)
	brne .L22
	ldi r24,0
.L22:
/* epilogue start */
	.stabn	68,0,348,.LM44-.LFBB5
.LM44:
	ret
	.size	rtc_is_setup, .-rtc_is_setup
.Lscope5:
	.stabs	"rtc_set_setup:F(0,1)",36,0,0,rtc_set_setup
.global	rtc_set_setup
	.type	rtc_set_setup, @function
rtc_set_setup:
	.stabn	68,0,351,.LM45-.LFBB6
.LM45:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,352,.LM46-.LFBB6
.LM46:
	mov r25,r24
	andi r25,lo8(3)
	ldi r30,lo8(rtc+6)
	ldi r31,hi8(rtc+6)
	lsl r25
	lsl r25
	ldd r24,Z+1
	andi r24,lo8(-13)
	or r24,r25
	std Z+1,r24
/* epilogue start */
	.stabn	68,0,353,.LM47-.LFBB6
.LM47:
	ret
	.size	rtc_set_setup, .-rtc_set_setup
.Lscope6:
	.stabs	"rtc_get_setup:F(0,13)=(0,12)",36,0,0,rtc_get_setup
.global	rtc_get_setup
	.type	rtc_get_setup, @function
rtc_get_setup:
	.stabn	68,0,356,.LM48-.LFBB7
.LM48:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,357,.LM49-.LFBB7
.LM49:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
	.stabn	68,0,358,.LM50-.LFBB7
.LM50:
	ldi r25,0
/* epilogue start */
	ret
	.size	rtc_get_setup, .-rtc_get_setup
.Lscope7:
	.stabs	"rtc_flag_set:F(0,1)",36,0,0,rtc_flag_set
.global	rtc_flag_set
	.type	rtc_flag_set, @function
rtc_flag_set:
	.stabn	68,0,361,.LM51-.LFBB8
.LM51:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,362,.LM52-.LFBB8
.LM52:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r25,Z+6
	or r25,r24
	std Z+6,r25
/* epilogue start */
	.stabn	68,0,363,.LM53-.LFBB8
.LM53:
	ret
	.size	rtc_flag_set, .-rtc_flag_set
.Lscope8:
	.stabs	"rtc_init:F(0,1)",36,0,0,rtc_init
.global	rtc_init
	.type	rtc_init, @function
rtc_init:
	.stabn	68,0,203,.LM54-.LFBB9
.LM54:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,204,.LM55-.LFBB9
.LM55:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	std Z+6,__zero_reg__
	.stabn	68,0,205,.LM56-.LFBB9
.LM56:
	ld r24,Z
	andi r24,lo8(-32)
	ori r24,lo8(12)
	st Z,r24
	.stabn	68,0,206,.LM57-.LFBB9
.LM57:
	ld r24,Z
	andi r24,lo8(31)
	st Z,r24
	ldi r26,lo8(rtc+1)
	ldi r27,hi8(rtc+1)
	ld r24,X
	andi r24,lo8(-8)
	st X,r24
	.stabn	68,0,207,.LM58-.LFBB9
.LM58:
	ld r24,X
	andi r24,lo8(7)
	st X,r24
	ldi r26,lo8(rtc+2)
	ldi r27,hi8(rtc+2)
	ld r24,X
	andi r24,lo8(-2)
	st X,r24
	.stabn	68,0,208,.LM59-.LFBB9
.LM59:
	std Z+4,__zero_reg__
	std Z+3,__zero_reg__
	.stabn	68,0,209,.LM60-.LFBB9
.LM60:
	std Z+5,__zero_reg__
	.stabn	68,0,210,.LM61-.LFBB9
.LM61:
	ldi r30,lo8(rtc+6)
	ldi r31,hi8(rtc+6)
	ldd r24,Z+1
	andi r24,lo8(-13)
	std Z+1,r24
	.stabn	68,0,211,.LM62-.LFBB9
.LM62:
	ldd r24,Z+1
	andi r24,lo8(15)
	std Z+1,r24
	ldd r24,Z+2
	andi r24,lo8(-4)
	std Z+2,r24
	.stabn	68,0,213,.LM63-.LFBB9
.LM63:
	ldi r24,lo8(3)
	ldi r25,0
	call rtc_flag_set
.LBB63:
.LBB64:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM64-.LFBB9
.LM64:
	ldi r18,lo8(319999)
	ldi r24,hi8(319999)
	ldi r25,hlo8(319999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE64:
.LBE63:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,216,.LM65-.LFBB9
.LM65:
	ret
	.size	rtc_init, .-rtc_init
.Lscope9:
	.stabs	"rtc_show:F(0,1)",36,0,0,rtc_show
.global	rtc_show
	.type	rtc_show, @function
rtc_show:
	.stabn	68,0,331,.LM66-.LFBB10
.LM66:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,332,.LM67-.LFBB10
.LM67:
	ldi r24,lo8(-128)
	ldi r25,0
	jmp rtc_flag_set
	.size	rtc_show, .-rtc_show
.Lscope10:
	.stabs	"rtc_flag_unset:F(0,1)",36,0,0,rtc_flag_unset
.global	rtc_flag_unset
	.type	rtc_flag_unset, @function
rtc_flag_unset:
	.stabn	68,0,366,.LM68-.LFBB11
.LM68:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,367,.LM69-.LFBB11
.LM69:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r25,Z+6
	com r24
	and r24,r25
	std Z+6,r24
/* epilogue start */
	.stabn	68,0,368,.LM70-.LFBB11
.LM70:
	ret
	.size	rtc_flag_unset, .-rtc_flag_unset
.Lscope11:
	.stabs	"rtc_hide:F(0,1)",36,0,0,rtc_hide
.global	rtc_hide
	.type	rtc_hide, @function
rtc_hide:
	.stabn	68,0,336,.LM71-.LFBB12
.LM71:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,337,.LM72-.LFBB12
.LM72:
	ldi r24,lo8(-128)
	ldi r25,0
	jmp rtc_flag_unset
	.size	rtc_hide, .-rtc_hide
.Lscope12:
	.stabs	"rtc_wait_for_tick:F(0,1)",36,0,0,rtc_wait_for_tick
.global	rtc_wait_for_tick
	.type	rtc_wait_for_tick, @function
rtc_wait_for_tick:
	.stabn	68,0,194,.LM73-.LFBB13
.LM73:
.LFBB13:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
.LBB72:
	.stabn	68,0,195,.LM74-.LFBB13
.LM74:
	in r28,__SREG__
.LBB73:
.LBB74:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,50,.LM75-.LFBB13
.LM75:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE74:
.LBE73:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,196,.LM76-.LFBB13
.LM76:
	ldi r24,lo8(64)
	ldi r25,0
	call rtc_flag_unset
.LBB75:
.LBB76:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,70,.LM77-.LFBB13
.LM77:
	out __SREG__,r28
	.stabn	68,0,71,.LM78-.LFBB13
.LM78:
.L31:
.LBE76:
.LBE75:
.LBE72:
.LBB77:
.LBB78:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,377,.LM79-.LFBB13
.LM79:
	lds r24,rtc+6
.LBE78:
.LBE77:
	.stabn	68,0,198,.LM80-.LFBB13
.LM80:
	sbrs r24,6
	rjmp .L32
/* epilogue start */
	.stabn	68,0,200,.LM81-.LFBB13
.LM81:
	pop r28
	ret
.L32:
	.stabn	68,0,199,.LM82-.LFBB13
.LM82:
/* #APP */
 ;  199 "src/ds_rtclk.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L31
	.size	rtc_wait_for_tick, .-rtc_wait_for_tick
.Lscope13:
	.stabs	"rtc_flag_toggle:F(0,1)",36,0,0,rtc_flag_toggle
.global	rtc_flag_toggle
	.type	rtc_flag_toggle, @function
rtc_flag_toggle:
	.stabn	68,0,371,.LM83-.LFBB14
.LM83:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,372,.LM84-.LFBB14
.LM84:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r25,Z+6
	eor r25,r24
	std Z+6,r25
/* epilogue start */
	.stabn	68,0,373,.LM85-.LFBB14
.LM85:
	ret
	.size	rtc_flag_toggle, .-rtc_flag_toggle
.Lscope14:
	.stabs	"__vector_15:F(0,1)",36,0,0,__vector_15
.global	__vector_15
	.type	__vector_15, @function
__vector_15:
	.stabn	68,0,71,.LM86-.LFBB15
.LM86:
.LFBB15:
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
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 16 */
.L__stack_usage = 16
	.stabn	68,0,72,.LM87-.LFBB15
.LM87:
	lds r24,rtc+7
	andi r24,lo8(3)
	.stabn	68,0,72,.LM88-.LFBB15
.LM88:
	cpi r24,lo8(1)
	breq .+2
	rjmp .L35
	.stabn	68,0,78,.LM89-.LFBB15
.LM89:
	lds r25,rtc+1
	lsr r25
	lsr r25
	lsr r25
	lds r24,rtc+2
	andi r24,lo8(1)
	swap r24
	lsl r24
	andi r24,lo8(-32)
	or r24,r25
	ldi r25,0
	.stabn	68,0,78,.LM90-.LFBB15
.LM90:
	adiw r24,1
	.stabn	68,0,78,.LM91-.LFBB15
.LM91:
	ldi r18,lo8(60)
	ldi r19,0
	movw r22,r18
	call __divmodhi4
	.stabn	68,0,78,.LM92-.LFBB15
.LM92:
	mov r20,r24
	lsl r20
	lsl r20
	lsl r20
	lds r25,rtc+1
	andi r25,lo8(7)
	or r25,r20
	sts rtc+1,r25
	bst r24,5
	clr r25
	bld r25,0
	lds r24,rtc+2
	andi r24,lo8(-2)
	or r24,r25
	sts rtc+2,r24
	.stabn	68,0,79,.LM93-.LFBB15
.LM93:
	lds r25,rtc+1
	lsr r25
	lsr r25
	lsr r25
	lds r24,rtc+2
	andi r24,lo8(1)
	swap r24
	lsl r24
	andi r24,lo8(-32)
	or r24,r25
	.stabn	68,0,79,.LM94-.LFBB15
.LM94:
	breq .+2
	rjmp .L37
	.stabn	68,0,83,.LM95-.LFBB15
.LM95:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	ldi r25,0
	.stabn	68,0,83,.LM96-.LFBB15
.LM96:
	adiw r24,1
	.stabn	68,0,83,.LM97-.LFBB15
.LM97:
	movw r22,r18
	call __divmodhi4
	mov r18,r24
	andi r18,lo8(63)
	.stabn	68,0,83,.LM98-.LFBB15
.LM98:
	mov r25,r24
	swap r25
	lsl r25
	andi r25,lo8(-32)
	lds r24,rtc
	andi r24,lo8(31)
	or r24,r25
	sts rtc,r24
	lsr r18
	lsr r18
	lsr r18
	lds r24,rtc+1
	andi r24,lo8(-8)
	or r24,r18
	sts rtc+1,r24
	.stabn	68,0,84,.LM99-.LFBB15
.LM99:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	.stabn	68,0,84,.LM100-.LFBB15
.LM100:
	brne .L37
	.stabn	68,0,88,.LM101-.LFBB15
.LM101:
	lds r24,rtc
	andi r24,lo8(31)
	ldi r25,0
	.stabn	68,0,88,.LM102-.LFBB15
.LM102:
	adiw r24,1
	.stabn	68,0,88,.LM103-.LFBB15
.LM103:
	ldi r22,lo8(24)
	ldi r23,0
	call __divmodhi4
	mov r25,r24
	andi r25,lo8(31)
	.stabn	68,0,88,.LM104-.LFBB15
.LM104:
	lds r24,rtc
	andi r24,lo8(-32)
	or r24,r25
	sts rtc,r24
.L37:
	.stabn	68,0,91,.LM105-.LFBB15
.LM105:
	ldi r24,lo8(64)
	ldi r25,0
	call rtc_flag_set
.L34:
/* epilogue start */
	.stabn	68,0,190,.LM106-.LFBB15
.LM106:
	pop r31
	pop r30
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
.L35:
	.stabn	68,0,101,.LM107-.LFBB15
.LM107:
	call keybrd_isr
	.stabn	68,0,101,.LM108-.LFBB15
.LM108:
	tst r24
	breq .L40
	.stabn	68,0,103,.LM109-.LFBB15
.LM109:
	call disp_enable_unsafe
	.stabn	68,0,104,.LM110-.LFBB15
.LM110:
	lds r24,rtc+7
	andi r24,lo8(15)
	sts rtc+7,r24
	lds r24,rtc+8
	andi r24,lo8(-4)
	sts rtc+8,r24
.L40:
	.stabn	68,0,108,.LM111-.LFBB15
.LM111:
	call deferred_isr
	.stabn	68,0,109,.LM112-.LFBB15
.LM112:
	call display_isr
	.stabn	68,0,110,.LM113-.LFBB15
.LM113:
	call strobe_isr
	.stabn	68,0,111,.LM114-.LFBB15
.LM114:
	call sd_card_isr
	.stabn	68,0,113,.LM115-.LFBB15
.LM115:
	lds r24,rtc+3
	lds r25,rtc+3+1
	.stabn	68,0,113,.LM116-.LFBB15
.LM116:
	adiw r24,1
	.stabn	68,0,113,.LM117-.LFBB15
.LM117:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	call __udivmodhi4
	.stabn	68,0,113,.LM118-.LFBB15
.LM118:
	sts rtc+3+1,r25
	sts rtc+3,r24
	.stabn	68,0,114,.LM119-.LFBB15
.LM119:
	lds r24,rtc+3
	lds r25,rtc+3+1
	.stabn	68,0,114,.LM120-.LFBB15
.LM120:
	or r24,r25
	breq .+2
	rjmp .L42
	.stabn	68,0,119,.LM121-.LFBB15
.LM121:
	lds r25,rtc+7
	swap r25
	andi r25,lo8(15)
	lds r24,rtc+8
	andi r24,lo8(3)
	swap r24
	andi r24,lo8(-16)
	or r24,r25
	.stabn	68,0,119,.LM122-.LFBB15
.LM122:
	cpi r24,lo8(30)
	brsh .L44
	.stabn	68,0,120,.LM123-.LFBB15
.LM123:
	lds r25,rtc+7
	swap r25
	andi r25,lo8(15)
	lds r24,rtc+8
	andi r24,lo8(3)
	swap r24
	andi r24,lo8(-16)
	or r24,r25
	.stabn	68,0,120,.LM124-.LFBB15
.LM124:
	subi r24,lo8(-(1))
	andi r24,lo8(63)
	mov r18,r24
	swap r18
	andi r18,lo8(-16)
	lds r25,rtc+7
	andi r25,lo8(15)
	or r25,r18
	sts rtc+7,r25
	swap r24
	andi r24,lo8(15)
	lds r25,rtc+8
	andi r25,lo8(-4)
	or r24,r25
	sts rtc+8,r24
	.stabn	68,0,121,.LM125-.LFBB15
.LM125:
	lds r25,rtc+7
	swap r25
	andi r25,lo8(15)
	lds r24,rtc+8
	andi r24,lo8(3)
	swap r24
	andi r24,lo8(-16)
	or r24,r25
	.stabn	68,0,121,.LM126-.LFBB15
.LM126:
	cpi r24,lo8(30)
	brlo .L44
.LBB79:
.LBB80:
.LBB81:
	.stabn	68,0,377,.LM127-.LFBB15
.LM127:
	lds r24,rtc+6
.LBE81:
.LBE80:
.LBE79:
	.stabn	68,0,122,.LM128-.LFBB15
.LM128:
	sbrs r24,7
	rjmp .L44
.LBB82:
.LBB83:
.LBB84:
	.stabn	68,0,357,.LM129-.LFBB15
.LM129:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE84:
.LBE83:
.LBE82:
	.stabn	68,0,123,.LM130-.LFBB15
.LM130:
	brne .L44
	.stabn	68,0,124,.LM131-.LFBB15
.LM131:
	call disp_disable_unsafe
.L44:
	.stabn	68,0,127,.LM132-.LFBB15
.LM132:
	lds r25,rtc+1
	lsr r25
	lsr r25
	lsr r25
	lds r24,rtc+2
	andi r24,lo8(1)
	swap r24
	lsl r24
	andi r24,lo8(-32)
	or r24,r25
	ldi r25,0
	.stabn	68,0,127,.LM133-.LFBB15
.LM133:
	adiw r24,1
	.stabn	68,0,127,.LM134-.LFBB15
.LM134:
	ldi r18,lo8(60)
	ldi r19,0
	movw r22,r18
	call __divmodhi4
	.stabn	68,0,127,.LM135-.LFBB15
.LM135:
	mov r20,r24
	lsl r20
	lsl r20
	lsl r20
	lds r25,rtc+1
	andi r25,lo8(7)
	or r25,r20
	sts rtc+1,r25
	bst r24,5
	clr r25
	bld r25,0
	lds r24,rtc+2
	andi r24,lo8(-2)
	or r24,r25
	sts rtc+2,r24
	.stabn	68,0,128,.LM136-.LFBB15
.LM136:
	lds r25,rtc+1
	lsr r25
	lsr r25
	lsr r25
	lds r24,rtc+2
	andi r24,lo8(1)
	swap r24
	lsl r24
	andi r24,lo8(-32)
	or r24,r25
	.stabn	68,0,128,.LM137-.LFBB15
.LM137:
	breq .+2
	rjmp .L46
	.stabn	68,0,133,.LM138-.LFBB15
.LM138:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	ldi r25,0
	.stabn	68,0,133,.LM139-.LFBB15
.LM139:
	adiw r24,1
	.stabn	68,0,133,.LM140-.LFBB15
.LM140:
	movw r22,r18
	call __divmodhi4
	mov r18,r24
	andi r18,lo8(63)
	.stabn	68,0,133,.LM141-.LFBB15
.LM141:
	mov r25,r24
	swap r25
	lsl r25
	andi r25,lo8(-32)
	lds r24,rtc
	andi r24,lo8(31)
	or r24,r25
	sts rtc,r24
	lsr r18
	lsr r18
	lsr r18
	lds r24,rtc+1
	andi r24,lo8(-8)
	or r24,r18
	sts rtc+1,r24
	.stabn	68,0,134,.LM142-.LFBB15
.LM142:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	.stabn	68,0,134,.LM143-.LFBB15
.LM143:
	brne .L47
	.stabn	68,0,138,.LM144-.LFBB15
.LM144:
	lds r24,rtc
	andi r24,lo8(31)
	ldi r25,0
	.stabn	68,0,138,.LM145-.LFBB15
.LM145:
	adiw r24,1
	.stabn	68,0,138,.LM146-.LFBB15
.LM146:
	ldi r22,lo8(24)
	ldi r23,0
	call __divmodhi4
	mov r25,r24
	andi r25,lo8(31)
	.stabn	68,0,138,.LM147-.LFBB15
.LM147:
	lds r24,rtc
	andi r24,lo8(-32)
	or r24,r25
	sts rtc,r24
.L47:
.LBB85:
.LBB86:
	.stabn	68,0,377,.LM148-.LFBB15
.LM148:
	lds r24,rtc+6
.LBE86:
.LBE85:
	.stabn	68,0,147,.LM149-.LFBB15
.LM149:
	call batmon_isr
.L46:
	.stabn	68,0,150,.LM150-.LFBB15
.LM150:
	ldi r24,lo8(4)
	ldi r25,0
	call rtc_flag_toggle
.LBB87:
.LBB88:
.LBB89:
	.stabn	68,0,357,.LM151-.LFBB15
.LM151:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE89:
.LBE88:
.LBE87:
	.stabn	68,0,152,.LM152-.LFBB15
.LM152:
	brne .L42
	.stabn	68,0,154,.LM153-.LFBB15
.LM153:
	ldi r24,lo8(3)
	ldi r25,0
	call rtc_flag_set
.LBB90:
.LBB91:
.LBB92:
	.stabn	68,0,377,.LM154-.LFBB15
.LM154:
	lds r24,rtc+6
.LBE92:
.LBE91:
.LBE90:
	.stabn	68,0,156,.LM155-.LFBB15
.LM155:
	sbrs r24,7
	rjmp .L42
	.stabn	68,0,157,.LM156-.LFBB15
.LM156:
	lds r20,rtc+6
	.stabn	68,0,157,.LM157-.LFBB15
.LM157:
	lds r24,rtc
	swap r24
	lsr r24
	andi r24,lo8(7)
	lds r22,rtc+1
	andi r22,lo8(7)
	lsl r22
	lsl r22
	lsl r22
	or r22,r24
	.stabn	68,0,157,.LM158-.LFBB15
.LM158:
	lds r24,rtc
	andi r24,lo8(31)
	.stabn	68,0,157,.LM159-.LFBB15
.LM159:
	ldi r23,0
	ldi r25,0
	call rtc_display
.L42:
	.stabn	68,0,162,.LM160-.LFBB15
.LM160:
	lds r24,rtc+5
	ldi r25,0
	.stabn	68,0,162,.LM161-.LFBB15
.LM161:
	adiw r24,1
	.stabn	68,0,162,.LM162-.LFBB15
.LM162:
	ldi r22,lo8(-56)
	ldi r23,0
	call __divmodhi4
	.stabn	68,0,162,.LM163-.LFBB15
.LM163:
	sts rtc+5,r24
.LBB93:
.LBB94:
.LBB95:
	.stabn	68,0,357,.LM164-.LFBB15
.LM164:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE95:
.LBE94:
.LBE93:
	.stabn	68,0,163,.LM165-.LFBB15
.LM165:
	brne .+2
	rjmp .L34
	.stabn	68,0,163,.LM166-.LFBB15
.LM166:
	lds r24,rtc+5
	.stabn	68,0,163,.LM167-.LFBB15
.LM167:
	cpse r24,__zero_reg__
	rjmp .L34
.LBB96:
.LBB97:
	.stabn	68,0,357,.LM168-.LFBB15
.LM168:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE97:
.LBE96:
	.stabn	68,0,168,.LM169-.LFBB15
.LM169:
	cpi r24,lo8(1)
	breq .L51
	cpi r24,lo8(2)
	brne .L52
	.stabn	68,0,171,.LM170-.LFBB15
.LM170:
	ldi r24,lo8(1)
	ldi r25,0
	call rtc_flag_set
	.stabn	68,0,172,.LM171-.LFBB15
.LM171:
	ldi r24,lo8(2)
	ldi r25,0
.L56:
	.stabn	68,0,177,.LM172-.LFBB15
.LM172:
	call rtc_flag_toggle
.L52:
.LBB98:
.LBB99:
.LBB100:
	.stabn	68,0,377,.LM173-.LFBB15
.LM173:
	lds r24,rtc+6
.LBE100:
.LBE99:
.LBE98:
	.stabn	68,0,181,.LM174-.LFBB15
.LM174:
	sbrs r24,7
	rjmp .L34
	.stabn	68,0,187,.LM175-.LFBB15
.LM175:
	lds r20,rtc+6
	.stabn	68,0,186,.LM176-.LFBB15
.LM176:
	lds r24,rtc
	swap r24
	lsr r24
	andi r24,lo8(7)
	lds r22,rtc+1
	andi r22,lo8(7)
	lsl r22
	lsl r22
	lsl r22
	or r22,r24
	.stabn	68,0,186,.LM177-.LFBB15
.LM177:
	lds r24,rtc
	andi r24,lo8(31)
	.stabn	68,0,186,.LM178-.LFBB15
.LM178:
	andi r20,lo8(-9)
	ldi r23,0
	ldi r25,0
	call rtc_display
	rjmp .L34
.L51:
	.stabn	68,0,176,.LM179-.LFBB15
.LM179:
	ldi r24,lo8(2)
	ldi r25,0
	call rtc_flag_set
	.stabn	68,0,177,.LM180-.LFBB15
.LM180:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L56
	.size	__vector_15, .-__vector_15
.Lscope15:
	.stabs	"rtc_flag_is_set:F(0,11)",36,0,0,rtc_flag_is_set
	.stabs	"flag:P(0,14)=(0,15)=r(0,15);0;65535;",64,0,0,20
	.stabs	"uint16_t:t(0,14)",128,0,0,0
	.stabs	"unsigned int:t(0,15)",128,0,0,0
.global	rtc_flag_is_set
	.type	rtc_flag_is_set, @function
rtc_flag_is_set:
	.stabn	68,0,376,.LM181-.LFBB16
.LM181:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r24
	.stabn	68,0,377,.LM182-.LFBB16
.LM182:
	lds r18,rtc+6
	ldi r19,0
	.stabn	68,0,377,.LM183-.LFBB16
.LM183:
	and r18,r24
	and r19,r21
	.stabn	68,0,377,.LM184-.LFBB16
.LM184:
	ldi r24,lo8(1)
	cp r18,r20
	cpc r19,r21
	breq .L58
	ldi r24,0
.L58:
/* epilogue start */
	.stabn	68,0,378,.LM185-.LFBB16
.LM185:
	ret
	.size	rtc_flag_is_set, .-rtc_flag_is_set
.Lscope16:
	.stabs	"rtc_setup_inc:F(0,1)",36,0,0,rtc_setup_inc
	.stabs	"sign:P(0,16)=r(0,16);-32768;32767;",64,0,0,20
	.stabs	"int:t(0,16)",128,0,0,0
.global	rtc_setup_inc
	.type	rtc_setup_inc, @function
rtc_setup_inc:
	.stabn	68,0,381,.LM186-.LFBB17
.LM186:
.LFBB17:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r24
.LBB113:
.LBB114:
	.stabn	68,0,357,.LM187-.LFBB17
.LM187:
	lds r24,rtc+7
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE114:
.LBE113:
	.stabn	68,0,382,.LM188-.LFBB17
.LM188:
	cpi r24,lo8(1)
	brne .+2
	rjmp .L60
	cpi r24,lo8(2)
	breq .+2
	rjmp .L59
.LBB115:
	.stabn	68,0,384,.LM189-.LFBB17
.LM189:
	in r18,__SREG__
.LBB116:
.LBB117:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,50,.LM190-.LFBB17
.LM190:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE117:
.LBE116:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,386,.LM191-.LFBB17
.LM191:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	.stabn	68,0,385,.LM192-.LFBB17
.LM192:
	sbrs r21,7
	rjmp .L62
	.stabn	68,0,386,.LM193-.LFBB17
.LM193:
	subi r24,lo8(-(63))
.L66:
	.stabn	68,0,388,.LM194-.LFBB17
.LM194:
	andi r24,lo8(63)
	mov r19,r24
	swap r19
	lsl r19
	andi r19,lo8(-32)
	lds r25,rtc
	andi r25,lo8(31)
	or r25,r19
	sts rtc,r25
	lsr r24
	lsr r24
	lsr r24
	lds r25,rtc+1
	andi r25,lo8(-8)
	or r24,r25
	sts rtc+1,r24
	.stabn	68,0,390,.LM195-.LFBB17
.LM195:
	lds r25,rtc
	swap r25
	lsr r25
	andi r25,lo8(7)
	lds r24,rtc+1
	andi r24,lo8(7)
	lsl r24
	lsl r24
	lsl r24
	or r24,r25
	ldi r25,0
	ldi r22,lo8(60)
	ldi r23,0
	call __divmodhi4
	mov r19,r24
	andi r19,lo8(63)
	mov r25,r24
	swap r25
	lsl r25
	andi r25,lo8(-32)
	lds r24,rtc
	andi r24,lo8(31)
	or r24,r25
	sts rtc,r24
	lsr r19
	lsr r19
	lsr r19
	lds r24,rtc+1
	andi r24,lo8(-8)
	or r24,r19
	sts rtc+1,r24
.L68:
.LBE115:
.LBB118:
.LBB119:
.LBB120:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,70,.LM196-.LFBB17
.LM196:
	out __SREG__,r18
	.stabn	68,0,71,.LM197-.LFBB17
.LM197:
.L59:
/* epilogue start */
.LBE120:
.LBE119:
.LBE118:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,405,.LM198-.LFBB17
.LM198:
	ret
.L62:
.LBB123:
	.stabn	68,0,388,.LM199-.LFBB17
.LM199:
	subi r24,lo8(-(1))
	rjmp .L66
.L60:
.LBE123:
.LBB124:
	.stabn	68,0,395,.LM200-.LFBB17
.LM200:
	in r18,__SREG__
.LBB121:
.LBB122:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,50,.LM201-.LFBB17
.LM201:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE122:
.LBE121:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,397,.LM202-.LFBB17
.LM202:
	lds r25,rtc
	.stabn	68,0,396,.LM203-.LFBB17
.LM203:
	sbrs r21,7
	rjmp .L64
	.stabn	68,0,397,.LM204-.LFBB17
.LM204:
	subi r25,lo8(-(31))
.L67:
	.stabn	68,0,399,.LM205-.LFBB17
.LM205:
	andi r25,lo8(31)
	lds r24,rtc
	andi r24,lo8(-32)
	or r24,r25
	sts rtc,r24
	.stabn	68,0,401,.LM206-.LFBB17
.LM206:
	lds r24,rtc
	andi r24,lo8(31)
	ldi r25,0
	ldi r22,lo8(24)
	ldi r23,0
	call __divmodhi4
	mov r25,r24
	andi r25,lo8(31)
	lds r24,rtc
	andi r24,lo8(-32)
	or r24,r25
	sts rtc,r24
	rjmp .L68
.L64:
	.stabn	68,0,399,.LM207-.LFBB17
.LM207:
	subi r25,lo8(-(1))
	rjmp .L67
.LBE124:
	.size	rtc_setup_inc, .-rtc_setup_inc
.Lscope17:
	.local	msg.0
	.comm	msg.0,7,1
	.stabs	"msg:V(0,4)",40,0,0,msg.0
	.local	rtc
	.comm	rtc,9,1
	.stabs	"rtc:S(0,17)=(0,18)=xss_rtc_context:",40,0,0,rtc
	.stabs	"s_rtc_context:T(0,18)=s9hour:(0,2),0,5;minute:(0,2),5,6;second:(0,2),11,6;ticks0:(0,14),24,16;ticks1:(0,2),40,8;flags:(0,14),48,8;oper_mode:(0,2),56,2;setup_mode:(0,2),58,2;off_count:(0,2),60,6;;",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
