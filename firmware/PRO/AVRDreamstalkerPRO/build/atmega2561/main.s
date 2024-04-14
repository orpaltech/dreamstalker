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
	.string	"UtSE"
	.text
	.stabs	"deferred_clear_wakeup_timer:f(0,1)=(0,1)",36,0,0,deferred_clear_wakeup_timer
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"pd:P(0,2)=*(0,3)=(0,4)=xss_deferred_context:",64,0,0,30
	.stabs	"s_deferred_context:T(0,4)=s7handler:(0,5)=(0,6)=*(0,7)=f(0,1),0,16;ticks:(0,8)=(0,9)=r(0,9);0;4294967295;,16,32;flags:(0,10)=(0,11)=r(0,11);0;255;,48,8;;",128,0,0,0
	.stabs	"pfn_deferred_handler:t(0,5)",128,0,0,0
	.stabs	"uint32_t:t(0,8)",128,0,0,0
	.stabs	"long unsigned int:t(0,9)",128,0,0,0
	.stabs	"uint8_t:t(0,10)",128,0,0,0
	.stabs	"unsigned char:t(0,11)",128,0,0,0
	.type	deferred_clear_wakeup_timer, @function
deferred_clear_wakeup_timer:
	.stabn	68,0,303,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	.stabn	68,0,304,.LM1-.LFBB1
.LM1:
	ldd r24,Z+2
	ldd r25,Z+3
	ldd r26,Z+4
	ldd r27,Z+5
	.stabn	68,0,304,.LM2-.LFBB1
.LM2:
	cpi r24,1
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L2
.LBB4:
.LBB5:
	.stabn	68,0,306,.LM3-.LFBB1
.LM3:
	call set_invalid_wakeup_timer_delay
	.stabn	68,0,308,.LM4-.LFBB1
.LM4:
	call rtc_hide
	.stabn	68,0,310,.LM5-.LFBB1
.LM5:
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp disp_text
.L2:
.LBE5:
.LBE4:
	.stabn	68,0,312,.LM6-.LFBB1
.LM6:
	cpi r24,-12
	ldi r18,1
	cpc r25,r18
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L3
	.stabn	68,0,313,.LM7-.LFBB1
.LM7:
	jmp disp_wakeup_timer_delay
.L3:
	.stabn	68,0,315,.LM8-.LFBB1
.LM8:
	cpi r24,-24
	sbci r25,3
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L1
	.stabn	68,0,316,.LM9-.LFBB1
.LM9:
	movw r24,r30
	call deferred_stop
	.stabn	68,0,318,.LM10-.LFBB1
.LM10:
	jmp rtc_show
.L1:
/* epilogue start */
	.stabn	68,0,321,.LM11-.LFBB1
.LM11:
	ret
	.size	deferred_clear_wakeup_timer, .-deferred_clear_wakeup_timer
.Lscope1:
	.section	.rodata.str1.1
.LC1:
	.string	"CoEr"
.LC2:
	.string	"Co%02u"
.LC3:
	.string	"noSd"
.LC4:
	.string	" . . . ."
.LC5:
	.string	"Sd 0"
	.section	.text.startup,"ax",@progbits
	.stabs	"main:F(0,12)=r(0,12);-32768;32767;",36,0,0,main
	.stabs	" :T(0,13)=eUART_BR_9600:9600,UART_BR_38400:38400,UART_BR_115200:115200,UART_BR_230400:230400,UART_BR_250K:250000,UART_BR_500K:500000,UART_BR_1M:1000000,;",128,0,0,0
	.stabs	" :T(0,14)=eUART_MODE_RX:1,UART_MODE_TX:2,UART_MODE_ALL:3,;",128,0,0,0
	.stabs	"e_menu_process_flag:T(0,15)=eMENU_UNHANDLED:0,MENU_HANDLED:1,MENU_ITEM_EXIT:2,MENU_EXIT:4,;",128,0,0,0
	.stabs	"int:t(0,12)",128,0,0,0
	.stabs	"argc:P(0,12)",64,0,0,24
	.stabs	"argv:P(0,16)=*(0,17)=*(0,18)=r(0,18);0;255;",64,0,0,22
	.stabs	"char:t(0,18)",128,0,0,0
.global	main
	.type	main, @function
main:
	.stabn	68,0,88,.LM12-.LFBB2
.LM12:
.LFBB2:
	rcall .
	rcall .
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 10 */
/* stack size = 10 */
.L__stack_usage = 10
	.stabn	68,0,102,.LM13-.LFBB2
.LM13:
/* #APP */
 ;  102 "src/main.c" 1
	sei
 ;  0 "" 2
	.stabn	68,0,104,.LM14-.LFBB2
.LM14:
/* #NOAPP */
	call rtc_init
	.stabn	68,0,105,.LM15-.LFBB2
.LM15:
	call adc_enable
	.stabn	68,0,106,.LM16-.LFBB2
.LM16:
	call remd_init
	.stabn	68,0,107,.LM17-.LFBB2
.LM17:
	call strobe_init
	.stabn	68,0,108,.LM18-.LFBB2
.LM18:
	call leds_init
	.stabn	68,0,109,.LM19-.LFBB2
.LM19:
	call vibro_init
	.stabn	68,0,110,.LM20-.LFBB2
.LM20:
	call keybrd_init
	.stabn	68,0,111,.LM21-.LFBB2
.LM21:
	call deferred_init
	.stabn	68,0,112,.LM22-.LFBB2
.LM22:
	call disp_init
	.stabn	68,0,113,.LM23-.LFBB2
.LM23:
	call batmon_init
	.stabn	68,0,115,.LM24-.LFBB2
.LM24:
	call fw_version
	movw r22,r24
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r24,lo8(70)
	call disp_version
	.stabn	68,0,117,.LM25-.LFBB2
.LM25:
	ldi r25,0
	ldi r24,0
	call input_set_hold_repeat
	.stabn	68,0,120,.LM26-.LFBB2
.LM26:
	ldi r20,lo8(2)
	ldi r21,0
	ldi r22,lo8(-112)
	ldi r23,lo8(-48)
	ldi r24,lo8(3)
	ldi r25,0
	call uart0_open
	.stabn	68,0,122,.LM27-.LFBB2
.LM27:
	call batmon_start
	.stabn	68,0,129,.LM28-.LFBB2
.LM28:
	call codec_init
	.stabn	68,0,130,.LM29-.LFBB2
.LM29:
	cpse r24,__zero_reg__
	rjmp .L6
.L12:
	.stabn	68,0,133,.LM30-.LFBB2
.LM30:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call disp_msg
	.stabn	68,0,135,.LM31-.LFBB2
.LM31:
	ldi r17,lo8(1)
.L7:
	.stabn	68,0,190,.LM32-.LFBB2
.LM32:
	call input_clear_events
	.stabn	68,0,193,.LM33-.LFBB2
.LM33:
	cpse r17,__zero_reg__
	rjmp .L43
.L24:
	.stabn	68,0,196,.LM34-.LFBB2
.LM34:
	lds r17,v_InputEventCount
	.stabn	68,0,196,.LM35-.LFBB2
.LM35:
	tst r17
	breq .L14
	.stabn	68,0,196,.LM36-.LFBB2
.LM36:
	call input_get_event
	mov r17,r24
	.stabn	68,0,198,.LM37-.LFBB2
.LM37:
	tst r24
	breq .L14
	.stabn	68,0,200,.LM38-.LFBB2
.LM38:
	ldi r20,lo8(6)
	ldi r22,lo8(2)
	ldi r24,lo8(80)
	ldi r25,0
	call tonegen_beep
.L14:
	.stabn	68,0,203,.LM39-.LFBB2
.LM39:
	call menu_is_active
	.stabn	68,0,203,.LM40-.LFBB2
.LM40:
	or r24,r25
	brne .+2
	rjmp .L15
	.stabn	68,0,203,.LM41-.LFBB2
.LM41:
	tst r17
	breq .L17
	.stabn	68,0,205,.LM42-.LFBB2
.LM42:
	mov r24,r17
	call menu_process
	.stabn	68,0,206,.LM43-.LFBB2
.LM43:
	sbrs r24,0
	rjmp .L15
	.stabn	68,0,208,.LM44-.LFBB2
.LM44:
	sbrc r24,2
	.stabn	68,0,210,.LM45-.LFBB2
.LM45:
	call rtc_show
.L17:
	.stabn	68,0,284,.LM46-.LFBB2
.LM46:
	call codec_process_task
	.stabn	68,0,286,.LM47-.LFBB2
.LM47:
/* #APP */
 ;  286 "src/main.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L24
.L6:
	.stabn	68,0,141,.LM48-.LFBB2
.LM48:
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
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
	.stabn	68,0,142,.LM49-.LFBB2
.LM49:
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	movw r24,r16
	call disp_msg
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
.L11:
	.stabn	68,0,148,.LM50-.LFBB2
.LM50:
	ldi r24,0
	call sd_card_init
	.stabn	68,0,148,.LM51-.LFBB2
.LM51:
	cpse r24,__zero_reg__
	rjmp .L8
	.stabn	68,0,151,.LM52-.LFBB2
.LM52:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	call disp_msg
.L9:
	.stabn	68,0,153,.LM53-.LFBB2
.LM53:
	call input_get_event
	.stabn	68,0,153,.LM54-.LFBB2
.LM54:
	cpi r24,lo8(1)
	brne .L10
	.stabn	68,0,156,.LM55-.LFBB2
.LM55:
	ldi r22,lo8(-112)
	ldi r23,lo8(1)
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	call disp_msg
	.stabn	68,0,148,.LM56-.LFBB2
.LM56:
	rjmp .L11
.L10:
	.stabn	68,0,154,.LM57-.LFBB2
.LM57:
/* #APP */
 ;  154 "src/main.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L9
.L8:
	.stabn	68,0,160,.LM58-.LFBB2
.LM58:
	ldi r22,lo8(-112)
	ldi r23,lo8(1)
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	call disp_msg
	.stabn	68,0,168,.LM59-.LFBB2
.LM59:
	call codec_apply_patches
	.stabn	68,0,169,.LM60-.LFBB2
.LM60:
	tst r24
	brne .+2
	rjmp .L12
	.stabn	68,0,178,.LM61-.LFBB2
.LM61:
	call config_init
	.stabn	68,0,183,.LM62-.LFBB2
.LM62:
	call sound_init
	.stabn	68,0,184,.LM63-.LFBB2
.LM63:
	call menu_init
	.stabn	68,0,186,.LM64-.LFBB2
.LM64:
	call rtc_show
	.stabn	68,0,90,.LM65-.LFBB2
.LM65:
	ldi r17,0
	rjmp .L7
.L15:
	.stabn	68,0,218,.LM66-.LFBB2
.LM66:
	cpi r17,lo8(-127)
	breq .L19
	brsh .L20
	cpi r17,lo8(2)
	breq .+2
	rjmp .L17
	.stabn	68,0,255,.LM67-.LFBB2
.LM67:
	call remd_is_running
	.stabn	68,0,255,.LM68-.LFBB2
.LM68:
	tst r24
	breq .L23
	.stabn	68,0,257,.LM69-.LFBB2
.LM69:
	call remd_stop
	rjmp .L17
.L20:
	.stabn	68,0,218,.LM70-.LFBB2
.LM70:
	cpi r17,lo8(-124)
	breq .L22
	cpi r17,lo8(-104)
	breq .+2
	rjmp .L17
	.stabn	68,0,222,.LM71-.LFBB2
.LM71:
	ldi r22,lo8(gs(deferred_clear_wakeup_timer))
	ldi r23,hi8(gs(deferred_clear_wakeup_timer))
	ldi r25,0
	ldi r24,0
	call deferred_start
	.stabn	68,0,224,.LM72-.LFBB2
.LM72:
	rjmp .L17
.L22:
	.stabn	68,0,229,.LM73-.LFBB2
.LM73:
	call rtc_hide
	.stabn	68,0,231,.LM74-.LFBB2
.LM74:
	call menu_enter
	.stabn	68,0,233,.LM75-.LFBB2
.LM75:
	rjmp .L17
.L19:
	.stabn	68,0,238,.LM76-.LFBB2
.LM76:
	call power_off_cycle
	.stabn	68,0,240,.LM77-.LFBB2
.LM77:
	rjmp .L17
.L23:
.LBB6:
	.stabn	68,0,261,.LM78-.LFBB2
.LM78:
	call remd_start
	rjmp .L17
.L43:
.LBE6:
	.stabn	68,0,290,.LM79-.LFBB2
.LM79:
	call batmon_stop
	.stabn	68,0,291,.LM80-.LFBB2
.LM80:
	call adc_disable
	.stabn	68,0,293,.LM81-.LFBB2
.LM81:
	call sd_card_uninit
	.stabn	68,0,296,.LM82-.LFBB2
.LM82:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	ret
	.size	main, .-main
	.stabs	"error:r(0,19)=eFalse:0,True:1,;",64,0,0,17
	.stabs	"_Bool:t(0,19)",128,0,0,0
	.stabs	"msg:(0,20)=ar(0,21)=r(0,21);0;65535;;0;9;(0,18)",128,0,0,1
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
