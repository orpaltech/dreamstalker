	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/main.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"/sd/beyond.mp3"
	.text
	.stabs	"deferred_codec_task:f(0,1)=(0,1)",36,0,0,deferred_codec_task
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"pd:P(0,2)=*(0,3)=(0,4)=xss_deferred_context:",64,0,0,28
	.stabs	"s_deferred_context:T(0,4)=s7handler:(0,5)=(0,6)=*(0,7)=f(0,1),0,16;ticks:(0,8)=(0,9)=r(0,9);0;4294967295;,16,32;flags:(0,10)=(0,11)=r(0,11);0;255;,48,8;;",128,0,0,0
	.stabs	"pfn_deferred_handler:t(0,5)",128,0,0,0
	.stabs	"uint32_t:t(0,8)",128,0,0,0
	.stabs	"long unsigned int:t(0,9)",128,0,0,0
	.stabs	"uint8_t:t(0,10)",128,0,0,0
	.stabs	"unsigned char:t(0,11)",128,0,0,0
	.type	deferred_codec_task, @function
deferred_codec_task:
	.stabn	68,0,407,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	.stabn	68,0,408,.LM1-.LFBB1
.LM1:
	ldd r24,Y+2
	ldd r25,Y+3
	ldd r26,Y+4
	ldd r27,Y+5
	cpi r24,-12
	sbci r25,1
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L1
.LBB4:
.LBB5:
	.stabn	68,0,416,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call codec_playback
	.stabn	68,0,418,.LM3-.LFBB1
.LM3:
	movw r24,r28
/* epilogue start */
.LBE5:
.LBE4:
	.stabn	68,0,420,.LM4-.LFBB1
.LM4:
	pop r29
	pop r28
.LBB7:
.LBB6:
	.stabn	68,0,418,.LM5-.LFBB1
.LM5:
	jmp deferred_stop
.L1:
/* epilogue start */
.LBE6:
.LBE7:
	.stabn	68,0,420,.LM6-.LFBB1
.LM6:
	pop r29
	pop r28
	ret
	.size	deferred_codec_task, .-deferred_codec_task
.Lscope1:
	.section	.rodata.str1.1
.LC1:
	.string	"UtSE"
	.text
	.stabs	"deferred_clear_wakeup_timer:f(0,1)",36,0,0,deferred_clear_wakeup_timer
	.stabs	"pd:p(0,2)",160,0,0,5
	.type	deferred_clear_wakeup_timer, @function
deferred_clear_wakeup_timer:
	.stabn	68,0,386,.LM7-.LFBB2
.LM7:
.LFBB2:
	push r12
	push r13
	push r14
	push r15
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
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,387,.LM8-.LFBB2
.LM8:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,2
	ld r12,X+
	ld r13,X+
	ld r14,X+
	ld r15,X
	sbiw r26,2+3
	.stabn	68,0,387,.LM9-.LFBB2
.LM9:
	ldi r27,1
	cp r12,r27
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L4
	.stabn	68,0,389,.LM10-.LFBB2
.LM10:
	call set_invalid_wakeup_timer_delay
	.stabn	68,0,391,.LM11-.LFBB2
.LM11:
	call rtc_hide
	.stabn	68,0,393,.LM12-.LFBB2
.LM12:
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
/* epilogue start */
	.stabn	68,0,404,.LM13-.LFBB2
.LM13:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	.stabn	68,0,393,.LM14-.LFBB2
.LM14:
	jmp disp_text
.L4:
	.stabn	68,0,395,.LM15-.LFBB2
.LM15:
	ldi r22,lo8(-12)
	ldi r23,lo8(1)
	ldi r24,0
	ldi r25,0
	call rtc_msec_to_ticks
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,395,.LM16-.LFBB2
.LM16:
	cp r12,r22
	cpc r13,r23
	cpc r14,r24
	cpc r15,r25
	brne .L5
/* epilogue start */
	.stabn	68,0,404,.LM17-.LFBB2
.LM17:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	.stabn	68,0,396,.LM18-.LFBB2
.LM18:
	jmp disp_wakeup_timer_delay
.L5:
.LBB10:
.LBB11:
	.stabn	68,0,398,.LM19-.LFBB2
.LM19:
	ldd r30,Y+5
	ldd r31,Y+6
	ldd r12,Z+2
	ldd r13,Z+3
	ldd r14,Z+4
	ldd r15,Z+5
	.stabn	68,0,398,.LM20-.LFBB2
.LM20:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	ldi r24,0
	ldi r25,0
	call rtc_msec_to_ticks
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,398,.LM21-.LFBB2
.LM21:
	cp r12,r22
	cpc r13,r23
	cpc r14,r24
	cpc r15,r25
	brne .L3
	.stabn	68,0,399,.LM22-.LFBB2
.LM22:
	ldd r24,Y+5
	ldd r25,Y+6
	call deferred_stop
/* epilogue start */
.LBE11:
.LBE10:
	.stabn	68,0,404,.LM23-.LFBB2
.LM23:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
.LBB13:
.LBB12:
	.stabn	68,0,401,.LM24-.LFBB2
.LM24:
	jmp rtc_show
.L3:
/* epilogue start */
.LBE12:
.LBE13:
	.stabn	68,0,404,.LM25-.LFBB2
.LM25:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	deferred_clear_wakeup_timer, .-deferred_clear_wakeup_timer
.Lscope2:
	.section	.rodata.str1.1
.LC2:
	.string	"CoEr"
.LC3:
	.string	"Co%02u"
.LC4:
	.string	"noSd"
.LC5:
	.string	" . . . ."
.LC6:
	.string	"Sd 0"
	.section	.text.startup,"ax",@progbits
	.stabs	"main:F(0,12)=r(0,12);-32768;32767;",36,0,0,main
	.stabs	"e_codec_status:T(0,13)=eCODEC_IDLE:0,CODEC_PLAYBACK:1,CODEC_CAPTURE:2,;",128,0,0,0
	.stabs	"e_menu_process_flag:T(0,14)=eMENU_UNHANDLED:0,MENU_HANDLED:1,MENU_RETURN:2,MENU_EXIT:4,;",128,0,0,0
	.stabs	"e_rtc_oper_mode:T(0,15)=eRTC_OPM_DEFAULT:0,RTC_OPM_POWERSAVE:1,;",128,0,0,0
	.stabs	"int:t(0,12)",128,0,0,0
.global	main
	.type	main, @function
main:
	.stabn	68,0,155,.LM26-.LFBB3
.LM26:
.LFBB3:
	rcall .
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 5 */
.L__stack_usage = 5
	.stabn	68,0,161,.LM27-.LFBB3
.LM27:
/* #APP */
 ;  161 "src/main.c" 1
	sei
 ;  0 "" 2
	.stabn	68,0,170,.LM28-.LFBB3
.LM28:
/* #NOAPP */
	call rtc_init
	.stabn	68,0,171,.LM29-.LFBB3
.LM29:
	call remd_init
	.stabn	68,0,172,.LM30-.LFBB3
.LM30:
	call strobe_init
	.stabn	68,0,173,.LM31-.LFBB3
.LM31:
	call leds_init
	.stabn	68,0,174,.LM32-.LFBB3
.LM32:
	call vibro_init
	.stabn	68,0,175,.LM33-.LFBB3
.LM33:
	call deferred_init
	.stabn	68,0,176,.LM34-.LFBB3
.LM34:
	call disp_init
	.stabn	68,0,177,.LM35-.LFBB3
.LM35:
	call batmon_init
	.stabn	68,0,178,.LM36-.LFBB3
.LM36:
	call sound_init
	.stabn	68,0,179,.LM37-.LFBB3
.LM37:
	call keybrd_init
	.stabn	68,0,180,.LM38-.LFBB3
.LM38:
	call menu_init
	.stabn	68,0,182,.LM39-.LFBB3
.LM39:
	call disp_enable
	.stabn	68,0,184,.LM40-.LFBB3
.LM40:
	call adc_enable
	.stabn	68,0,185,.LM41-.LFBB3
.LM41:
	call adc_warm_up
	.stabn	68,0,192,.LM42-.LFBB3
.LM42:
	ldi r25,0
	ldi r24,0
	call rtc_start
	.stabn	68,0,194,.LM43-.LFBB3
.LM43:
	call fw_version
	movw r22,r24
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r24,lo8(70)
	call disp_version
	.stabn	68,0,199,.LM44-.LFBB3
.LM44:
	call sd_card_cs_init
	.stabn	68,0,202,.LM45-.LFBB3
.LM45:
	call keybrd_hold_repeat_disable
	.stabn	68,0,208,.LM46-.LFBB3
.LM46:
	call codec_init
	.stabn	68,0,209,.LM47-.LFBB3
.LM47:
	cpse r24,__zero_reg__
	rjmp .L8
.L13:
	.stabn	68,0,211,.LM48-.LFBB3
.LM48:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call disp_msg
	.stabn	68,0,213,.LM49-.LFBB3
.LM49:
	ldi r17,lo8(1)
.L9:
	.stabn	68,0,272,.LM50-.LFBB3
.LM50:
	call keybrd_clear_events
	.stabn	68,0,275,.LM51-.LFBB3
.LM51:
	cpse r17,__zero_reg__
	rjmp .L42
.L25:
	.stabn	68,0,278,.LM52-.LFBB3
.LM52:
	call keybrd_get_event
	mov r17,r24
	.stabn	68,0,280,.LM53-.LFBB3
.LM53:
	tst r24
	breq .L15
	.stabn	68,0,281,.LM54-.LFBB3
.LM54:
	ldi r20,lo8(6)
	ldi r22,lo8(3)
	ldi r24,lo8(100)
	ldi r25,0
	call tonegen_beep
.L15:
	.stabn	68,0,283,.LM55-.LFBB3
.LM55:
	call menu_is_active
	.stabn	68,0,283,.LM56-.LFBB3
.LM56:
	tst r24
	brne .+2
	rjmp .L16
	.stabn	68,0,283,.LM57-.LFBB3
.LM57:
	tst r17
	breq .L18
	.stabn	68,0,285,.LM58-.LFBB3
.LM58:
	mov r24,r17
	call menu_handle
	.stabn	68,0,286,.LM59-.LFBB3
.LM59:
	sbrs r24,0
	rjmp .L16
	.stabn	68,0,288,.LM60-.LFBB3
.LM60:
	sbrc r24,2
	.stabn	68,0,290,.LM61-.LFBB3
.LM61:
	call rtc_show
.L18:
	.stabn	68,0,370,.LM62-.LFBB3
.LM62:
	call codec_process_task
	.stabn	68,0,372,.LM63-.LFBB3
.LM63:
/* #APP */
 ;  372 "src/main.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L25
.L8:
	.stabn	68,0,218,.LM64-.LFBB3
.LM64:
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	push __zero_reg__
	ldi r24,lo8(5)
	push r24
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	push r17
	push r16
	call snprintf
	.stabn	68,0,219,.LM65-.LFBB3
.LM65:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	movw r24,r16
	call disp_msg
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
.L12:
	.stabn	68,0,224,.LM66-.LFBB3
.LM66:
	call sd_card_init
	.stabn	68,0,224,.LM67-.LFBB3
.LM67:
	cpse r24,__zero_reg__
	rjmp .L10
	.stabn	68,0,227,.LM68-.LFBB3
.LM68:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	call disp_msg
.L11:
	.stabn	68,0,231,.LM69-.LFBB3
.LM69:
	call keybrd_get_event
	.stabn	68,0,232,.LM70-.LFBB3
.LM70:
/* #APP */
 ;  232 "src/main.c" 1
	nop
 ;  0 "" 2
	.stabn	68,0,233,.LM71-.LFBB3
.LM71:
/* #NOAPP */
	cpi r24,lo8(1)
	brne .L11
	.stabn	68,0,236,.LM72-.LFBB3
.LM72:
	ldi r22,lo8(-112)
	ldi r23,lo8(1)
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	call disp_msg
	.stabn	68,0,224,.LM73-.LFBB3
.LM73:
	rjmp .L12
.L10:
	.stabn	68,0,240,.LM74-.LFBB3
.LM74:
	ldi r22,lo8(-112)
	ldi r23,lo8(1)
	ldi r24,lo8(.LC6)
	ldi r25,hi8(.LC6)
	call disp_msg
	.stabn	68,0,248,.LM75-.LFBB3
.LM75:
	call codec_process_patches
	.stabn	68,0,248,.LM76-.LFBB3
.LM76:
	tst r24
	brne .+2
	rjmp .L13
	.stabn	68,0,257,.LM77-.LFBB3
.LM77:
	call config_init
	.stabn	68,0,264,.LM78-.LFBB3
.LM78:
	call rtc_show
	.stabn	68,0,266,.LM79-.LFBB3
.LM79:
	call batmon_start
	.stabn	68,0,268,.LM80-.LFBB3
.LM80:
	call sound_start
	.stabn	68,0,157,.LM81-.LFBB3
.LM81:
	ldi r17,0
	rjmp .L9
.L16:
	.stabn	68,0,298,.LM82-.LFBB3
.LM82:
	cpi r17,lo8(-127)
	breq .L20
	brsh .L21
	cpi r17,lo8(2)
	breq .+2
	rjmp .L18
	.stabn	68,0,342,.LM83-.LFBB3
.LM83:
	call codec_get_status
	.stabn	68,0,342,.LM84-.LFBB3
.LM84:
	or r24,r25
	breq .L24
	.stabn	68,0,343,.LM85-.LFBB3
.LM85:
	call codec_stop
	rjmp .L18
.L21:
	.stabn	68,0,298,.LM86-.LFBB3
.LM86:
	cpi r17,lo8(-124)
	breq .L23
	.stabn	68,0,302,.LM87-.LFBB3
.LM87:
	ldi r22,lo8(gs(deferred_clear_wakeup_timer))
	ldi r23,hi8(gs(deferred_clear_wakeup_timer))
	ldi r25,0
	ldi r24,0
	.stabn	68,0,298,.LM88-.LFBB3
.LM88:
	cpi r17,lo8(-104)
	breq .+2
	rjmp .L18
.L43:
	.stabn	68,0,346,.LM89-.LFBB3
.LM89:
	call deferred_start
	rjmp .L18
.L23:
	.stabn	68,0,309,.LM90-.LFBB3
.LM90:
	call rtc_hide
	.stabn	68,0,311,.LM91-.LFBB3
.LM91:
	call menu_enter
	.stabn	68,0,313,.LM92-.LFBB3
.LM92:
	rjmp .L18
.L20:
	.stabn	68,0,318,.LM93-.LFBB3
.LM93:
	call power_off
	.stabn	68,0,320,.LM94-.LFBB3
.LM94:
	rjmp .L18
.L24:
	.stabn	68,0,346,.LM95-.LFBB3
.LM95:
	ldi r22,lo8(gs(deferred_codec_task))
	ldi r23,hi8(gs(deferred_codec_task))
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L43
.L42:
	.stabn	68,0,379,.LM96-.LFBB3
.LM96:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ret
	.size	main, .-main
	.stabs	"error:r(0,16)=eFalse:0,True:1,;",64,0,0,17
	.stabs	"_Bool:t(0,16)",128,0,0,0
	.stabs	"msg:(0,17)=ar(0,18)=r(0,18);0;65535;;0;4;(0,19)=r(0,19);0;255;",128,0,0,1
	.stabs	"char:t(0,19)",128,0,0,0
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
.global	__fuse
	.section	.fuse,"aw"
	.type	__fuse, @object
	.size	__fuse, 3
__fuse:
	.byte	-28
	.byte	25
	.byte	-1
	.stabs	"__fuse:G(0,20)=(0,21)=s3low:(0,11),0,8;high:(0,11),8,8;extended:(0,11),16,8;;",32,0,0,0
	.stabs	"keybrd_event_t:t(0,22)=(0,10)",128,0,0,0
	.stabs	"__fuse_t:t(0,20)",128,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
