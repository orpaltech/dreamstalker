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
	.stabn	68,0,333,.LM0-.LFBB1
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
	mov r29,r22
	mov r15,r23
	mov r28,r20
	.stabn	68,0,337,.LM1-.LFBB1
.LM1:
	sbrs r20,0
	rjmp .L2
	.stabn	68,0,338,.LM2-.LFBB1
.LM2:
	push r25
	push r24
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
.L3:
	.stabn	68,0,341,.LM3-.LFBB1
.LM3:
	ldi r16,lo8(msg.0+2)
	ldi r17,hi8(msg.0+2)
	.stabn	68,0,343,.LM4-.LFBB1
.LM4:
	sbrs r28,2
	rjmp .L4
	.stabn	68,0,344,.LM5-.LFBB1
.LM5:
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(msg.0+2)
	ldi r25,hi8(msg.0+2)
	call strcat
	ldi r16,lo8(msg.0+3)
	ldi r17,hi8(msg.0+3)
.L4:
	.stabn	68,0,346,.LM6-.LFBB1
.LM6:
	sbrs r28,1
	rjmp .L5
	.stabn	68,0,347,.LM7-.LFBB1
.LM7:
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
.L6:
	.stabn	68,0,352,.LM8-.LFBB1
.LM8:
	sbrs r28,6
	rjmp .L7
	.stabn	68,0,353,.LM9-.LFBB1
.LM9:
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	movw r24,r16
	adiw r24,2
	call strcat
.L7:
	.stabn	68,0,355,.LM10-.LFBB1
.LM10:
	ldi r24,lo8(msg.0)
	ldi r25,hi8(msg.0)
/* epilogue start */
	.stabn	68,0,356,.LM11-.LFBB1
.LM11:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	.stabn	68,0,355,.LM12-.LFBB1
.LM12:
	jmp disp_text
.L2:
	.stabn	68,0,340,.LM13-.LFBB1
.LM13:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,lo8(msg.0)
	ldi r25,hi8(msg.0)
	call strcpy
	rjmp .L3
.L5:
	.stabn	68,0,349,.LM14-.LFBB1
.LM14:
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	movw r24,r16
	call strcat
	rjmp .L6
	.size	rtc_display, .-rtc_display
	.stabs	"msg:V(0,4)=ar(0,5)=r(0,5);0;65535;;0;6;(0,6)=r(0,6);0;255;",40,0,0,msg.0
	.stabs	"char:t(0,6)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"__vector_13:F(0,1)",36,0,0,__vector_13
	.stabs	"e_rtc_setup_mode:T(0,7)=eRTC_SETUP_NONE:0,RTC_SETUP_HOUR:1,RTC_SETUP_MINUTE:2,;",128,0,0,0
.global	__vector_13
	.type	__vector_13, @function
__vector_13:
	.stabn	68,0,73,.LM15-.LFBB2
.LM15:
.LFBB2:
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
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 17 */
.L__stack_usage = 17
	.stabn	68,0,76,.LM16-.LFBB2
.LM16:
	call keybrd_test
	mov r28,r24
	.stabn	68,0,77,.LM17-.LFBB2
.LM17:
	call input_process
	.stabn	68,0,80,.LM18-.LFBB2
.LM18:
	cpse r28,__zero_reg__
	.stabn	68,0,81,.LM19-.LFBB2
.LM19:
	sts rtc+8,__zero_reg__
.L13:
	.stabn	68,0,83,.LM20-.LFBB2
.LM20:
	call deferred_isr
	.stabn	68,0,84,.LM21-.LFBB2
.LM21:
	call display_isr
	.stabn	68,0,85,.LM22-.LFBB2
.LM22:
	call strobe_isr
	.stabn	68,0,86,.LM23-.LFBB2
.LM23:
	call sd_card_isr
	.stabn	68,0,88,.LM24-.LFBB2
.LM24:
	lds r24,rtc+3
	lds r25,rtc+3+1
	.stabn	68,0,88,.LM25-.LFBB2
.LM25:
	adiw r24,1
	.stabn	68,0,88,.LM26-.LFBB2
.LM26:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	call __udivmodhi4
	.stabn	68,0,88,.LM27-.LFBB2
.LM27:
	sts rtc+3+1,r25
	sts rtc+3,r24
	.stabn	68,0,89,.LM28-.LFBB2
.LM28:
	lds r24,rtc+3
	lds r25,rtc+3+1
	.stabn	68,0,89,.LM29-.LFBB2
.LM29:
	or r24,r25
	breq .+2
	rjmp .L15
	.stabn	68,0,94,.LM30-.LFBB2
.LM30:
	lds r24,rtc+8
	.stabn	68,0,94,.LM31-.LFBB2
.LM31:
	cpi r24,lo8(30)
	brsh .L17
	.stabn	68,0,95,.LM32-.LFBB2
.LM32:
	lds r24,rtc+8
	.stabn	68,0,95,.LM33-.LFBB2
.LM33:
	subi r24,lo8(-(1))
	sts rtc+8,r24
.LBB50:
.LBB51:
	.stabn	68,0,275,.LM34-.LFBB2
.LM34:
	lds r24,rtc+8
.LBE51:
.LBE50:
	.stabn	68,0,96,.LM35-.LFBB2
.LM35:
	cpi r24,lo8(30)
	brlo .L17
.LBB52:
.LBB53:
	.stabn	68,0,270,.LM36-.LFBB2
.LM36:
	lds r24,rtc+6
.LBE53:
.LBE52:
	.stabn	68,0,97,.LM37-.LFBB2
.LM37:
	sbrs r24,7
	rjmp .L17
.LBB54:
.LBB55:
	.stabn	68,0,280,.LM38-.LFBB2
.LM38:
	lds r24,rtc+7
.LBE55:
.LBE54:
	.stabn	68,0,97,.LM39-.LFBB2
.LM39:
	cpse r24,__zero_reg__
	rjmp .L17
	.stabn	68,0,98,.LM40-.LFBB2
.LM40:
	call disp_clear
.L17:
	.stabn	68,0,101,.LM41-.LFBB2
.LM41:
	lds r24,rtc+2
	ldi r25,0
	.stabn	68,0,101,.LM42-.LFBB2
.LM42:
	adiw r24,1
	.stabn	68,0,101,.LM43-.LFBB2
.LM43:
	ldi r18,lo8(60)
	ldi r19,0
	movw r22,r18
	call __divmodhi4
	.stabn	68,0,101,.LM44-.LFBB2
.LM44:
	sts rtc+2,r24
	.stabn	68,0,102,.LM45-.LFBB2
.LM45:
	lds r24,rtc+2
	.stabn	68,0,102,.LM46-.LFBB2
.LM46:
	cpse r24,__zero_reg__
	rjmp .L19
.LBB56:
	.stabn	68,0,107,.LM47-.LFBB2
.LM47:
	in r20,__SREG__
.LBB57:
.LBB58:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,50,.LM48-.LFBB2
.LM48:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE58:
.LBE57:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,108,.LM49-.LFBB2
.LM49:
	lds r24,rtc+1
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	.stabn	68,0,108,.LM50-.LFBB2
.LM50:
	adiw r24,1
	.stabn	68,0,108,.LM51-.LFBB2
.LM51:
	movw r22,r18
	call __divmodhi4
	.stabn	68,0,108,.LM52-.LFBB2
.LM52:
	sts rtc+1,r24
	.stabn	68,0,109,.LM53-.LFBB2
.LM53:
	lds r24,rtc+1
	.stabn	68,0,109,.LM54-.LFBB2
.LM54:
	cpse r24,__zero_reg__
	rjmp .L20
	.stabn	68,0,113,.LM55-.LFBB2
.LM55:
	lds r24,rtc
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	.stabn	68,0,113,.LM56-.LFBB2
.LM56:
	adiw r24,1
	.stabn	68,0,113,.LM57-.LFBB2
.LM57:
	ldi r22,lo8(24)
	ldi r23,0
	call __divmodhi4
	.stabn	68,0,113,.LM58-.LFBB2
.LM58:
	sts rtc,r24
.L20:
.LBB59:
.LBB60:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,70,.LM59-.LFBB2
.LM59:
	out __SREG__,r20
	.stabn	68,0,71,.LM60-.LFBB2
.LM60:
.LBE60:
.LBE59:
.LBE56:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,117,.LM61-.LFBB2
.LM61:
	lds r24,rtc+6
	.stabn	68,0,122,.LM62-.LFBB2
.LM62:
	call batmon_isr
.L19:
	.stabn	68,0,125,.LM63-.LFBB2
.LM63:
	lds r24,rtc+6
	ldi r25,lo8(4)
	eor r24,r25
	sts rtc+6,r24
.LBB61:
.LBB62:
	.stabn	68,0,280,.LM64-.LFBB2
.LM64:
	lds r24,rtc+7
.LBE62:
.LBE61:
	.stabn	68,0,127,.LM65-.LFBB2
.LM65:
	cpse r24,__zero_reg__
	rjmp .L15
	.stabn	68,0,129,.LM66-.LFBB2
.LM66:
	lds r24,rtc+6
	ori r24,lo8(1)
	sts rtc+6,r24
	.stabn	68,0,130,.LM67-.LFBB2
.LM67:
	lds r24,rtc+6
	ori r24,lo8(2)
	sts rtc+6,r24
.LBB63:
.LBB64:
	.stabn	68,0,270,.LM68-.LFBB2
.LM68:
	lds r24,rtc+6
.LBE64:
.LBE63:
	.stabn	68,0,132,.LM69-.LFBB2
.LM69:
	sbrs r24,7
	rjmp .L15
.LBB65:
.LBB66:
	.stabn	68,0,275,.LM70-.LFBB2
.LM70:
	lds r24,rtc+8
.LBE66:
.LBE65:
	.stabn	68,0,132,.LM71-.LFBB2
.LM71:
	cpi r24,lo8(30)
	brsh .L15
	.stabn	68,0,134,.LM72-.LFBB2
.LM72:
	lds r20,rtc+6
	.stabn	68,0,134,.LM73-.LFBB2
.LM73:
	lds r22,rtc+1
	.stabn	68,0,134,.LM74-.LFBB2
.LM74:
	lds r24,rtc
	.stabn	68,0,134,.LM75-.LFBB2
.LM75:
	mov __tmp_reg__,r22
	lsl r0
	sbc r23,r23
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	call rtc_display
.L15:
	.stabn	68,0,139,.LM76-.LFBB2
.LM76:
	lds r24,rtc+5
	ldi r25,0
	.stabn	68,0,139,.LM77-.LFBB2
.LM77:
	adiw r24,1
	.stabn	68,0,139,.LM78-.LFBB2
.LM78:
	ldi r22,lo8(-56)
	ldi r23,0
	call __divmodhi4
	.stabn	68,0,139,.LM79-.LFBB2
.LM79:
	sts rtc+5,r24
.LBB67:
.LBB68:
	.stabn	68,0,280,.LM80-.LFBB2
.LM80:
	lds r24,rtc+7
.LBE68:
.LBE67:
	.stabn	68,0,140,.LM81-.LFBB2
.LM81:
	tst r24
	breq .L12
	.stabn	68,0,140,.LM82-.LFBB2
.LM82:
	lds r24,rtc+5
	.stabn	68,0,140,.LM83-.LFBB2
.LM83:
	cpse r24,__zero_reg__
	rjmp .L12
	.stabn	68,0,145,.LM84-.LFBB2
.LM84:
	lds r24,rtc+7
	.stabn	68,0,145,.LM85-.LFBB2
.LM85:
	cpi r24,lo8(1)
	breq .L25
	cpi r24,lo8(2)
	brne .L26
	.stabn	68,0,148,.LM86-.LFBB2
.LM86:
	lds r25,rtc+6
	ori r25,lo8(1)
.L30:
	.stabn	68,0,153,.LM87-.LFBB2
.LM87:
	sts rtc+6,r25
	.stabn	68,0,154,.LM88-.LFBB2
.LM88:
	lds r25,rtc+6
	eor r24,r25
	sts rtc+6,r24
.L26:
.LBB69:
.LBB70:
	.stabn	68,0,270,.LM89-.LFBB2
.LM89:
	lds r24,rtc+6
.LBE70:
.LBE69:
	.stabn	68,0,158,.LM90-.LFBB2
.LM90:
	sbrs r24,7
	rjmp .L12
	.stabn	68,0,161,.LM91-.LFBB2
.LM91:
	lds r20,rtc+6
	.stabn	68,0,161,.LM92-.LFBB2
.LM92:
	lds r22,rtc+1
	.stabn	68,0,161,.LM93-.LFBB2
.LM93:
	lds r24,rtc
	.stabn	68,0,161,.LM94-.LFBB2
.LM94:
	andi r20,lo8(-65)
	mov __tmp_reg__,r22
	lsl r0
	sbc r23,r23
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	call rtc_display
.L12:
/* epilogue start */
	.stabn	68,0,164,.LM95-.LFBB2
.LM95:
	pop r31
	pop r30
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
.L25:
	.stabn	68,0,153,.LM96-.LFBB2
.LM96:
	lds r25,rtc+6
	ori r25,lo8(2)
	rjmp .L30
	.size	__vector_13, .-__vector_13
	.stabs	"keys:r(0,2)",64,0,0,28
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"rtc_init:F(0,1)",36,0,0,rtc_init
.global	rtc_init
	.type	rtc_init, @function
rtc_init:
	.stabn	68,0,241,.LM97-.LFBB3
.LM97:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,242,.LM98-.LFBB3
.LM98:
	ldi r24,lo8(12)
	sts rtc,r24
	.stabn	68,0,243,.LM99-.LFBB3
.LM99:
	sts rtc+1,__zero_reg__
	.stabn	68,0,244,.LM100-.LFBB3
.LM100:
	sts rtc+2,__zero_reg__
	.stabn	68,0,245,.LM101-.LFBB3
.LM101:
	sts rtc+3+1,__zero_reg__
	sts rtc+3,__zero_reg__
	.stabn	68,0,246,.LM102-.LFBB3
.LM102:
	sts rtc+5,__zero_reg__
	.stabn	68,0,247,.LM103-.LFBB3
.LM103:
	ldi r24,lo8(3)
	sts rtc+6,r24
	.stabn	68,0,248,.LM104-.LFBB3
.LM104:
	sts rtc+7,__zero_reg__
	.stabn	68,0,249,.LM105-.LFBB3
.LM105:
	sts rtc+8,__zero_reg__
.LBB75:
.LBB76:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM106-.LFBB3
.LM106:
	ldi r18,lo8(479999)
	ldi r24,hi8(479999)
	ldi r25,hlo8(479999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
.LBE76:
.LBE75:
.LBB77:
.LBB78:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,208,.LM107-.LFBB3
.LM107:
	lds r24,112
	andi r24,lo8(-8)
	sts 112,r24
	.stabn	68,0,212,.LM108-.LFBB3
.LM108:
	ldi r24,lo8(32)
	sts 182,r24
	.stabn	68,0,216,.LM109-.LFBB3
.LM109:
	ldi r24,lo8(2)
	sts 176,r24
	.stabn	68,0,216,.LM110-.LFBB3
.LM110:
	ldi r24,lo8(1)
	sts 177,r24
	.stabn	68,0,218,.LM111-.LFBB3
.LM111:
	sts 178,__zero_reg__
	.stabn	68,0,227,.LM112-.LFBB3
.LM112:
	ldi r24,lo8(33)
	sts 179,r24
.L32:
	.stabn	68,0,231,.LM113-.LFBB3
.LM113:
	lds r24,182
	andi r24,lo8(26)
	brne .L32
	.stabn	68,0,233,.LM114-.LFBB3
.LM114:
	out 0x17,__zero_reg__
	.stabn	68,0,234,.LM115-.LFBB3
.LM115:
	ldi r24,lo8(2)
	sts 112,r24
/* epilogue start */
.LBE78:
.LBE77:
	.stabn	68,0,254,.LM116-.LFBB3
.LM116:
	ret
	.size	rtc_init, .-rtc_init
.Lscope3:
	.stabs	"rtc_show:F(0,1)",36,0,0,rtc_show
.global	rtc_show
	.type	rtc_show, @function
rtc_show:
	.stabn	68,0,257,.LM117-.LFBB4
.LM117:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,258,.LM118-.LFBB4
.LM118:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r24,Z+6
	ori r24,lo8(-128)
	std Z+6,r24
/* epilogue start */
	.stabn	68,0,259,.LM119-.LFBB4
.LM119:
	ret
	.size	rtc_show, .-rtc_show
.Lscope4:
	.stabs	"rtc_hide:F(0,1)",36,0,0,rtc_hide
.global	rtc_hide
	.type	rtc_hide, @function
rtc_hide:
	.stabn	68,0,262,.LM120-.LFBB5
.LM120:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,263,.LM121-.LFBB5
.LM121:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r24,Z+6
	andi r24,lo8(127)
	std Z+6,r24
	.stabn	68,0,265,.LM122-.LFBB5
.LM122:
	jmp disp_clear
	.size	rtc_hide, .-rtc_hide
.Lscope5:
	.stabs	"rtc_is_visible:F(0,8)=eFalse:0,True:1,;",36,0,0,rtc_is_visible
	.stabs	"_Bool:t(0,8)",128,0,0,0
.global	rtc_is_visible
	.type	rtc_is_visible, @function
rtc_is_visible:
	.stabn	68,0,269,.LM123-.LFBB6
.LM123:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,270,.LM124-.LFBB6
.LM124:
	lds r24,rtc+6
	.stabn	68,0,271,.LM125-.LFBB6
.LM125:
	rol r24
	clr r24
	rol r24
/* epilogue start */
	ret
	.size	rtc_is_visible, .-rtc_is_visible
.Lscope6:
	.stabs	"rtc_is_setup:F(0,8)",36,0,0,rtc_is_setup
.global	rtc_is_setup
	.type	rtc_is_setup, @function
rtc_is_setup:
	.stabn	68,0,279,.LM126-.LFBB7
.LM126:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,280,.LM127-.LFBB7
.LM127:
	lds r25,rtc+7
	.stabn	68,0,280,.LM128-.LFBB7
.LM128:
	ldi r24,lo8(1)
	cpse r25,__zero_reg__
	rjmp .L38
	ldi r24,0
.L38:
/* epilogue start */
	.stabn	68,0,281,.LM129-.LFBB7
.LM129:
	ret
	.size	rtc_is_setup, .-rtc_is_setup
.Lscope7:
	.stabs	"rtc_setup:F(0,1)",36,0,0,rtc_setup
.global	rtc_setup
	.type	rtc_setup, @function
rtc_setup:
	.stabn	68,0,284,.LM130-.LFBB8
.LM130:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,285,.LM131-.LFBB8
.LM131:
	sts rtc+7,r24
/* epilogue start */
	.stabn	68,0,286,.LM132-.LFBB8
.LM132:
	ret
	.size	rtc_setup, .-rtc_setup
.Lscope8:
	.stabs	"rtc_get_setup:F(0,9)=(0,7)",36,0,0,rtc_get_setup
.global	rtc_get_setup
	.type	rtc_get_setup, @function
rtc_get_setup:
	.stabn	68,0,289,.LM133-.LFBB9
.LM133:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,290,.LM134-.LFBB9
.LM134:
	lds r24,rtc+7
	.stabn	68,0,291,.LM135-.LFBB9
.LM135:
	ldi r25,0
/* epilogue start */
	ret
	.size	rtc_get_setup, .-rtc_get_setup
.Lscope9:
	.stabs	"rtc_flag_set:F(0,1)",36,0,0,rtc_flag_set
	.stabs	"flag:P(0,2)",64,0,0,24
.global	rtc_flag_set
	.type	rtc_flag_set, @function
rtc_flag_set:
	.stabn	68,0,294,.LM136-.LFBB10
.LM136:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,295,.LM137-.LFBB10
.LM137:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r25,Z+6
	or r25,r24
	std Z+6,r25
/* epilogue start */
	.stabn	68,0,296,.LM138-.LFBB10
.LM138:
	ret
	.size	rtc_flag_set, .-rtc_flag_set
.Lscope10:
	.stabs	"rtc_flag_clear:F(0,1)",36,0,0,rtc_flag_clear
	.stabs	"flag:P(0,2)",64,0,0,24
.global	rtc_flag_clear
	.type	rtc_flag_clear, @function
rtc_flag_clear:
	.stabn	68,0,299,.LM139-.LFBB11
.LM139:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,300,.LM140-.LFBB11
.LM140:
	ldi r30,lo8(rtc)
	ldi r31,hi8(rtc)
	ldd r25,Z+6
	com r24
	and r24,r25
	std Z+6,r24
/* epilogue start */
	.stabn	68,0,301,.LM141-.LFBB11
.LM141:
	ret
	.size	rtc_flag_clear, .-rtc_flag_clear
.Lscope11:
	.stabs	"rtc_inc:F(0,1)",36,0,0,rtc_inc
	.stabs	"sign:P(0,10)=r(0,10);-32768;32767;",64,0,0,18
	.stabs	"int:t(0,10)",128,0,0,0
.global	rtc_inc
	.type	rtc_inc, @function
rtc_inc:
	.stabn	68,0,304,.LM142-.LFBB12
.LM142:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,305,.LM143-.LFBB12
.LM143:
	lds r24,rtc+7
	.stabn	68,0,305,.LM144-.LFBB12
.LM144:
	cpi r24,lo8(1)
	breq .L44
	cpi r24,lo8(2)
	brne .L43
.LBB89:
	.stabn	68,0,307,.LM145-.LFBB12
.LM145:
	in r25,__SREG__
.LBB90:
.LBB91:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,50,.LM146-.LFBB12
.LM146:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE91:
.LBE90:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,309,.LM147-.LFBB12
.LM147:
	lds r24,rtc+1
	.stabn	68,0,308,.LM148-.LFBB12
.LM148:
	sbrs r19,7
	rjmp .L46
	.stabn	68,0,309,.LM149-.LFBB12
.LM149:
	subi r24,lo8(-(-1))
	.stabn	68,0,309,.LM150-.LFBB12
.LM150:
	sts rtc+1,r24
	sbrs r24,7
	rjmp .L52
	.stabn	68,0,310,.LM151-.LFBB12
.LM151:
	ldi r24,lo8(59)
	sts rtc+1,r24
.L52:
.LBE89:
.LBB92:
.LBB93:
.LBB94:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,70,.LM152-.LFBB12
.LM152:
	out __SREG__,r25
	.stabn	68,0,71,.LM153-.LFBB12
.LM153:
.L43:
/* epilogue start */
.LBE94:
.LBE93:
.LBE92:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,330,.LM154-.LFBB12
.LM154:
	ret
.L46:
.LBB97:
	.stabn	68,0,312,.LM155-.LFBB12
.LM155:
	subi r24,lo8(-(1))
	.stabn	68,0,312,.LM156-.LFBB12
.LM156:
	sts rtc+1,r24
	cpi r24,lo8(60)
	brlt .L52
	.stabn	68,0,313,.LM157-.LFBB12
.LM157:
	sts rtc+1,__zero_reg__
	rjmp .L52
.L44:
.LBE97:
.LBB98:
	.stabn	68,0,319,.LM158-.LFBB12
.LM158:
	in r25,__SREG__
.LBB95:
.LBB96:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,50,.LM159-.LFBB12
.LM159:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE96:
.LBE95:
	.stabs	"src/ds_rtclk.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,321,.LM160-.LFBB12
.LM160:
	lds r24,rtc
	.stabn	68,0,320,.LM161-.LFBB12
.LM161:
	sbrs r19,7
	rjmp .L50
	.stabn	68,0,321,.LM162-.LFBB12
.LM162:
	subi r24,lo8(-(-1))
	.stabn	68,0,321,.LM163-.LFBB12
.LM163:
	sts rtc,r24
	sbrs r24,7
	rjmp .L52
	.stabn	68,0,322,.LM164-.LFBB12
.LM164:
	ldi r24,lo8(23)
	sts rtc,r24
	rjmp .L52
.L50:
	.stabn	68,0,324,.LM165-.LFBB12
.LM165:
	subi r24,lo8(-(1))
	.stabn	68,0,324,.LM166-.LFBB12
.LM166:
	sts rtc,r24
	cpi r24,lo8(24)
	brlt .L52
	.stabn	68,0,325,.LM167-.LFBB12
.LM167:
	sts rtc,__zero_reg__
	rjmp .L52
.LBE98:
	.size	rtc_inc, .-rtc_inc
.Lscope12:
	.local	msg.0
	.comm	msg.0,7,1
	.stabs	"msg:V(0,4)",40,0,0,msg.0
	.local	rtc
	.comm	rtc,9,1
	.stabs	"rtc:S(0,11)=(0,12)=xss_rtc_context:",40,0,0,rtc
	.stabs	"s_rtc_context:T(0,12)=s9hour:(0,13)=(0,14)=r(0,14);-128;127;,0,8;minute:(0,13),8,8;second:(0,2),16,8;ticks0:(0,15)=(0,16)=r(0,16);0;65535;,24,16;ticks1:(0,2),40,8;flags:(0,2),48,8;setup_mode:(0,2),56,8;off_counter:(0,2),64,8;;",128,0,0,0
	.stabs	"int8_t:t(0,13)",128,0,0,0
	.stabs	"signed char:t(0,14)",128,0,0,0
	.stabs	"uint16_t:t(0,15)",128,0,0,0
	.stabs	"unsigned int:t(0,16)",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
