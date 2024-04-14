	.file	"ds_menu.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_menu.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"get_addr:f(0,1)=*(0,2)=(0,3)=r(0,3);0;255;",36,0,0,get_addr
	.stabs	"uint8_t:t(0,2)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	get_addr, @function
get_addr:
	.stabn	68,0,448,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,449,.LM1-.LFBB1
.LM1:
	lds r18,menu+6
	mov __tmp_reg__,r18
	lsl r0
	sbc r19,r19
.LBB167:
.LBB168:
	.stabn	68,0,436,.LM2-.LFBB1
.LM2:
	ldi r20,0
	.stabn	68,0,435,.LM3-.LFBB1
.LM3:
	ldi r24,lo8(menu_desc)
	ldi r25,hi8(menu_desc)
	.stabn	68,0,438,.LM4-.LFBB1
.LM4:
	ldi r21,lo8(22)
.L3:
	.stabn	68,0,438,.LM5-.LFBB1
.LM5:
	mov r22,r20
	mov __tmp_reg__,r20
	lsl r0
	sbc r23,r23
	mov r30,r20
	lsl r30
	sbc r31,r31
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	.stabn	68,0,438,.LM6-.LFBB1
.LM6:
	ld r30,Z
	.stabn	68,0,438,.LM7-.LFBB1
.LM7:
	mul r30,r21
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	.stabn	68,0,439,.LM8-.LFBB1
.LM8:
	cp r22,r18
	cpc r23,r19
	brge .L2
.LBB169:
.LBB170:
.LBB171:
	.stabn	68,0,410,.LM9-.LFBB1
.LM9:
	adiw r24,19
	movw r30,r24
/* #APP */
 ;  410 "src/ds_menu.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.L2:
	subi r20,lo8(-(1))
.LBE171:
.LBE170:
.LBE169:
	.stabn	68,0,441,.LM10-.LFBB1
.LM10:
	cp r22,r18
	cpc r23,r19
	brlt .L3
/* epilogue start */
.LBE168:
.LBE167:
	.stabn	68,0,450,.LM11-.LFBB1
.LM11:
	ret
	.size	get_addr, .-get_addr
	.stabs	"addr:r(0,1)",64,0,0,24
	.stabs	"l:r(0,4)=(0,5)=r(0,5);-128;127;",64,0,0,20
	.stabs	"int8_t:t(0,4)",128,0,0,0
	.stabs	"signed char:t(0,5)",128,0,0,0
	.stabn	192,0,0,.LBB168-.LFBB1
	.stabs	"__addr16:r(0,6)=(0,7)=r(0,7);0;65535;",64,0,0,24
	.stabs	"uint16_t:t(0,6)",128,0,0,0
	.stabs	"unsigned int:t(0,7)",128,0,0,0
	.stabn	192,0,0,.LBB171-.LFBB1
	.stabn	224,0,0,.LBE171-.LFBB1
	.stabn	224,0,0,.LBE168-.LFBB1
.Lscope1:
	.stabs	"trigger_times_handler:f(0,8)=(0,8)",36,0,0,trigger_times_handler
	.stabs	"void:t(0,8)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	trigger_times_handler, @function
trigger_times_handler:
	.stabn	68,0,995,.LM12-.LFBB2
.LM12:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,996,.LM13-.LFBB2
.LM13:
	cpi r24,lo8(-112)
	breq .L6
	brsh .L7
	cpi r24,lo8(16)
	breq .L6
	cpi r24,lo8(32)
	breq .L6
	ret
.L7:
	cpi r24,lo8(-96)
	brne .L5
.L6:
.LBB172:
.LBB173:
	.stabn	68,0,323,.LM14-.LFBB2
.LM14:
	ldi r24,lo8(1)
	sts menu+7,r24
.L5:
/* epilogue start */
.LBE173:
.LBE172:
	.stabn	68,0,1008,.LM15-.LFBB2
.LM15:
	ret
	.size	trigger_times_handler, .-trigger_times_handler
.Lscope2:
	.stabs	"wakeup_signal_check_handler:f(0,8)",36,0,0,wakeup_signal_check_handler
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	wakeup_signal_check_handler, @function
wakeup_signal_check_handler:
	.stabn	68,0,1298,.LM16-.LFBB3
.LM16:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,1300,.LM17-.LFBB3
.LM17:
	ret
	.size	wakeup_signal_check_handler, .-wakeup_signal_check_handler
.Lscope3:
	.stabs	"enhanced_sp_setup_activate:f(0,8)",36,0,0,enhanced_sp_setup_activate
	.type	enhanced_sp_setup_activate, @function
enhanced_sp_setup_activate:
	.stabn	68,0,873,.LM18-.LFBB4
.LM18:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,874,.LM19-.LFBB4
.LM19:
	call get_speaker_enabled
	.stabn	68,0,874,.LM20-.LFBB4
.LM20:
	ldi r25,0
	jmp disp_flag
	.size	enhanced_sp_setup_activate, .-enhanced_sp_setup_activate
.Lscope4:
	.stabs	"enhanced_rd_setup_activate:f(0,8)",36,0,0,enhanced_rd_setup_activate
	.type	enhanced_rd_setup_activate, @function
enhanced_rd_setup_activate:
	.stabn	68,0,738,.LM21-.LFBB5
.LM21:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,739,.LM22-.LFBB5
.LM22:
	call get_voice_recording
	.stabn	68,0,739,.LM23-.LFBB5
.LM23:
	ldi r25,0
	jmp disp_flag
	.size	enhanced_rd_setup_activate, .-enhanced_rd_setup_activate
.Lscope5:
	.stabs	"enhanced_af_setup_activate:f(0,8)",36,0,0,enhanced_af_setup_activate
	.type	enhanced_af_setup_activate, @function
enhanced_af_setup_activate:
	.stabn	68,0,681,.LM24-.LFBB6
.LM24:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,682,.LM25-.LFBB6
.LM25:
	call get_after_hints_message
	.stabn	68,0,682,.LM26-.LFBB6
.LM26:
	ldi r25,0
	jmp disp_flag
	.size	enhanced_af_setup_activate, .-enhanced_af_setup_activate
.Lscope6:
	.stabs	"enhanced_be_setup_activate:f(0,8)",36,0,0,enhanced_be_setup_activate
	.type	enhanced_be_setup_activate, @function
enhanced_be_setup_activate:
	.stabn	68,0,662,.LM27-.LFBB7
.LM27:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,663,.LM28-.LFBB7
.LM28:
	call get_before_hints_message
	.stabn	68,0,663,.LM29-.LFBB7
.LM29:
	ldi r25,0
	jmp disp_flag
	.size	enhanced_be_setup_activate, .-enhanced_be_setup_activate
.Lscope7:
	.stabs	"enhanced_fl_setup:f(0,8)",36,0,0,enhanced_fl_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_fl_setup, @function
enhanced_fl_setup:
	.stabn	68,0,845,.LM30-.LFBB8
.LM30:
.LFBB8:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,846,.LM31-.LFBB8
.LM31:
	cpi r24,lo8(32)
	breq .L24
	brsh .L25
	cpi r24,lo8(8)
	breq .L26
	cpi r24,lo8(16)
	breq .L27
.L23:
/* epilogue start */
	.stabn	68,0,870,.LM32-.LFBB8
.LM32:
	pop r28
	ret
.L25:
	.stabn	68,0,846,.LM33-.LFBB8
.LM33:
	cpi r24,lo8(-112)
	breq .L27
	cpi r24,lo8(-96)
	brne .L23
.L24:
	.stabn	68,0,856,.LM34-.LFBB8
.LM34:
	call is_readonly_vibration_level
	cpse r24,__zero_reg__
	rjmp .L33
.LBB174:
	.stabn	68,0,856,.LM35-.LFBB8
.LM35:
	call get_vibration_level
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L31
.L50:
	.stabn	68,0,856,.LM36-.LFBB8
.LM36:
	call max_vibration_level
.L52:
.LBE174:
.LBB175:
	.stabn	68,0,864,.LM37-.LFBB8
.LM37:
	mov r28,r24
	rjmp .L34
.L26:
.LBE175:
	.stabn	68,0,849,.LM38-.LFBB8
.LM38:
	call get_vibration_level
	.stabn	68,0,849,.LM39-.LFBB8
.LM39:
	tst r24
	breq .L51
	.stabn	68,0,850,.LM40-.LFBB8
.LM40:
	call get_vibration_level
	mov r22,r24
	ldi r24,lo8(-48)
	ldi r25,lo8(7)
	call vibro_on
.L51:
.LBB176:
.LBB177:
	.stabn	68,0,323,.LM41-.LFBB8
.LM41:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE177:
.LBE176:
	.stabn	68,0,870,.LM42-.LFBB8
.LM42:
	rjmp .L23
.L31:
.LBB178:
	.stabn	68,0,856,.LM43-.LFBB8
.LM43:
	call step_vibration_level
	sub r28,r24
	call min_vibration_level
	cp r28,r24
	brlo .L50
.L34:
.LBE178:
.LBB179:
	.stabn	68,0,864,.LM44-.LFBB8
.LM44:
	mov r24,r28
	call set_vibration_level
.L33:
.LBE179:
	.stabn	68,0,866,.LM45-.LFBB8
.LM45:
	call get_vibration_level
	.stabn	68,0,866,.LM46-.LFBB8
.LM46:
	ldi r25,0
	call disp_dec
	rjmp .L51
.L27:
	.stabn	68,0,864,.LM47-.LFBB8
.LM47:
	call is_readonly_vibration_level
	cpse r24,__zero_reg__
	rjmp .L33
.LBB180:
	.stabn	68,0,864,.LM48-.LFBB8
.LM48:
	call get_vibration_level
	mov r28,r24
	call step_vibration_level
	add r28,r24
	call max_vibration_level
	cp r24,r28
	brsh .L34
	.stabn	68,0,864,.LM49-.LFBB8
.LM49:
	call min_vibration_level
	rjmp .L52
.LBE180:
	.size	enhanced_fl_setup, .-enhanced_fl_setup
.Lscope8:
	.stabs	"enhanced_fl_setup_activate:f(0,8)",36,0,0,enhanced_fl_setup_activate
	.stabs	"vibration_level_t:t(0,9)=(0,2)",128,0,0,0
	.type	enhanced_fl_setup_activate, @function
enhanced_fl_setup_activate:
	.stabn	68,0,840,.LM50-.LFBB9
.LM50:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,841,.LM51-.LFBB9
.LM51:
	call get_vibration_level
	.stabn	68,0,841,.LM52-.LFBB9
.LM52:
	ldi r25,0
	jmp disp_dec
	.size	enhanced_fl_setup_activate, .-enhanced_fl_setup_activate
.Lscope9:
	.stabs	"disp_relax_tunes_playback:f(0,8)",36,0,0,disp_relax_tunes_playback
	.type	disp_relax_tunes_playback, @function
disp_relax_tunes_playback:
	.stabn	68,0,785,.LM53-.LFBB10
.LM53:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,786,.LM54-.LFBB10
.LM54:
	call get_relax_tunes_playback
	.stabn	68,0,786,.LM55-.LFBB10
.LM55:
	ldi r25,0
	jmp disp_dec
	.size	disp_relax_tunes_playback, .-disp_relax_tunes_playback
.Lscope10:
	.stabs	"enhanced_tu_setup_activate:f(0,8)",36,0,0,enhanced_tu_setup_activate
	.type	enhanced_tu_setup_activate, @function
enhanced_tu_setup_activate:
	.stabn	68,0,790,.LM56-.LFBB11
.LM56:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,791,.LM57-.LFBB11
.LM57:
	jmp disp_relax_tunes_playback
	.size	enhanced_tu_setup_activate, .-enhanced_tu_setup_activate
.Lscope11:
	.stabs	"enhanced_vol_setup_activate:f(0,8)",36,0,0,enhanced_vol_setup_activate
	.type	enhanced_vol_setup_activate, @function
enhanced_vol_setup_activate:
	.stabn	68,0,757,.LM58-.LFBB12
.LM58:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,758,.LM59-.LFBB12
.LM59:
	call get_volume_level
	.stabn	68,0,758,.LM60-.LFBB12
.LM60:
	ldi r25,0
	jmp disp_dec
	.size	enhanced_vol_setup_activate, .-enhanced_vol_setup_activate
.Lscope12:
	.stabs	"disp_sleep_scenario_playback:f(0,8)",36,0,0,disp_sleep_scenario_playback
	.type	disp_sleep_scenario_playback, @function
disp_sleep_scenario_playback:
	.stabn	68,0,701,.LM61-.LFBB13
.LM61:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,702,.LM62-.LFBB13
.LM62:
	call get_sleep_scenario_playback
	.stabn	68,0,702,.LM63-.LFBB13
.LM63:
	ldi r25,0
	jmp disp_dec
	.size	disp_sleep_scenario_playback, .-disp_sleep_scenario_playback
.Lscope13:
	.stabs	"enhanced_sc_setup_activate:f(0,8)",36,0,0,enhanced_sc_setup_activate
	.type	enhanced_sc_setup_activate, @function
enhanced_sc_setup_activate:
	.stabn	68,0,706,.LM64-.LFBB14
.LM64:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,707,.LM65-.LFBB14
.LM65:
	jmp disp_sleep_scenario_playback
	.size	enhanced_sc_setup_activate, .-enhanced_sc_setup_activate
.Lscope14:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"SurE"
	.text
	.stabs	"enhanced_del_records_activate:f(0,8)",36,0,0,enhanced_del_records_activate
	.type	enhanced_del_records_activate, @function
enhanced_del_records_activate:
	.stabn	68,0,823,.LM66-.LFBB15
.LM66:
.LFBB15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,824,.LM67-.LFBB15
.LM67:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp disp_msg
	.size	enhanced_del_records_activate, .-enhanced_del_records_activate
.Lscope15:
	.type	set_defaults_activate, @function
set_defaults_activate:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp enhanced_del_records_activate
	.size	set_defaults_activate, .-set_defaults_activate
	.stabs	"enhanced_tu_setup:f(0,8)",36,0,0,enhanced_tu_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_tu_setup, @function
enhanced_tu_setup:
	.stabn	68,0,795,.LM68-.LFBB16
.LM68:
.LFBB16:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,796,.LM69-.LFBB16
.LM69:
	cpi r24,lo8(32)
	breq .L62
	brsh .L63
	cpi r24,lo8(8)
	breq .L86
	cpi r24,lo8(16)
	breq .L65
.L61:
/* epilogue start */
	.stabn	68,0,819,.LM70-.LFBB16
.LM70:
	pop r28
	ret
.L63:
	.stabn	68,0,796,.LM71-.LFBB16
.LM71:
	cpi r24,lo8(-112)
	breq .L65
	cpi r24,lo8(-96)
	brne .L61
.L62:
	.stabn	68,0,805,.LM72-.LFBB16
.LM72:
	call is_readonly_relax_tunes_playback
	cpse r24,__zero_reg__
	rjmp .L68
.LBB181:
	.stabn	68,0,805,.LM73-.LFBB16
.LM73:
	call get_relax_tunes_playback
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L69
.L85:
	.stabn	68,0,805,.LM74-.LFBB16
.LM74:
	call max_relax_tunes_playback
.L87:
	mov r28,r24
	rjmp .L70
.L69:
	.stabn	68,0,805,.LM75-.LFBB16
.LM75:
	call step_relax_tunes_playback
	sub r28,r24
	call min_relax_tunes_playback
	cp r28,r24
	brlo .L85
.L70:
	.stabn	68,0,805,.LM76-.LFBB16
.LM76:
	mov r24,r28
	call set_relax_tunes_playback
.L68:
.LBE181:
	.stabn	68,0,807,.LM77-.LFBB16
.LM77:
	call disp_relax_tunes_playback
.L86:
.LBB182:
.LBB183:
	.stabn	68,0,323,.LM78-.LFBB16
.LM78:
	ldi r24,lo8(1)
	sts menu+7,r24
	rjmp .L61
.L65:
.LBE183:
.LBE182:
	.stabn	68,0,813,.LM79-.LFBB16
.LM79:
	call is_readonly_relax_tunes_playback
	cpse r24,__zero_reg__
	rjmp .L68
.LBB184:
	.stabn	68,0,813,.LM80-.LFBB16
.LM80:
	call get_relax_tunes_playback
	mov r28,r24
	call step_relax_tunes_playback
	add r28,r24
	call max_relax_tunes_playback
	cp r24,r28
	brsh .L70
	.stabn	68,0,813,.LM81-.LFBB16
.LM81:
	call min_relax_tunes_playback
	rjmp .L87
.LBE184:
	.size	enhanced_tu_setup, .-enhanced_tu_setup
.Lscope16:
	.stabs	"enhanced_vol_setup:f(0,8)",36,0,0,enhanced_vol_setup
	.stabs	"relax_tunes_playback_t:t(0,10)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_vol_setup, @function
enhanced_vol_setup:
	.stabn	68,0,762,.LM82-.LFBB17
.LM82:
.LFBB17:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,763,.LM83-.LFBB17
.LM83:
	cpi r24,lo8(-112)
	breq .L89
	brsh .L90
	cpi r24,lo8(16)
	breq .L89
	cpi r24,lo8(32)
	breq .L91
.L88:
/* epilogue start */
	.stabn	68,0,781,.LM84-.LFBB17
.LM84:
	pop r28
	ret
.L90:
	.stabn	68,0,763,.LM85-.LFBB17
.LM85:
	cpi r24,lo8(-96)
	brne .L88
.L91:
	.stabn	68,0,767,.LM86-.LFBB17
.LM86:
	call is_readonly_volume_level
	cpse r24,__zero_reg__
	rjmp .L96
.LBB185:
	.stabn	68,0,767,.LM87-.LFBB17
.LM87:
	call get_volume_level
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L94
.L107:
	.stabn	68,0,767,.LM88-.LFBB17
.LM88:
	call max_volume_level
.L108:
.LBE185:
.LBB186:
	.stabn	68,0,775,.LM89-.LFBB17
.LM89:
	mov r28,r24
	rjmp .L97
.L94:
.LBE186:
.LBB187:
	.stabn	68,0,767,.LM90-.LFBB17
.LM90:
	call step_volume_level
	sub r28,r24
	call min_volume_level
	cp r28,r24
	brlo .L107
.L97:
.LBE187:
.LBB188:
	.stabn	68,0,775,.LM91-.LFBB17
.LM91:
	mov r24,r28
	call set_volume_level
.L96:
.LBE188:
	.stabn	68,0,777,.LM92-.LFBB17
.LM92:
	call get_volume_level
	.stabn	68,0,777,.LM93-.LFBB17
.LM93:
	ldi r25,0
	call disp_dec
.LBB189:
.LBB190:
	.stabn	68,0,323,.LM94-.LFBB17
.LM94:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE190:
.LBE189:
	.stabn	68,0,781,.LM95-.LFBB17
.LM95:
	rjmp .L88
.L89:
	.stabn	68,0,775,.LM96-.LFBB17
.LM96:
	call is_readonly_volume_level
	cpse r24,__zero_reg__
	rjmp .L96
.LBB191:
	.stabn	68,0,775,.LM97-.LFBB17
.LM97:
	call get_volume_level
	mov r28,r24
	call step_volume_level
	add r28,r24
	call max_volume_level
	cp r24,r28
	brsh .L97
	.stabn	68,0,775,.LM98-.LFBB17
.LM98:
	call min_volume_level
	rjmp .L108
.LBE191:
	.size	enhanced_vol_setup, .-enhanced_vol_setup
.Lscope17:
	.stabs	"enhanced_sc_setup:f(0,8)",36,0,0,enhanced_sc_setup
	.stabs	"volume_level_t:t(0,11)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_sc_setup, @function
enhanced_sc_setup:
	.stabn	68,0,711,.LM99-.LFBB18
.LM99:
.LFBB18:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,712,.LM100-.LFBB18
.LM100:
	cpi r24,lo8(32)
	breq .L110
	brsh .L111
	cpi r24,lo8(8)
	breq .L134
	cpi r24,lo8(16)
	breq .L113
.L109:
/* epilogue start */
	.stabn	68,0,735,.LM101-.LFBB18
.LM101:
	pop r28
	ret
.L111:
	.stabn	68,0,712,.LM102-.LFBB18
.LM102:
	cpi r24,lo8(-112)
	breq .L113
	cpi r24,lo8(-96)
	brne .L109
.L110:
	.stabn	68,0,721,.LM103-.LFBB18
.LM103:
	call is_readonly_sleep_scenario_playback
	cpse r24,__zero_reg__
	rjmp .L116
.LBB192:
	.stabn	68,0,721,.LM104-.LFBB18
.LM104:
	call get_sleep_scenario_playback
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L117
.L133:
	.stabn	68,0,721,.LM105-.LFBB18
.LM105:
	call max_sleep_scenario_playback
.L135:
	mov r28,r24
	rjmp .L118
.L117:
	.stabn	68,0,721,.LM106-.LFBB18
.LM106:
	call step_sleep_scenario_playback
	sub r28,r24
	call min_sleep_scenario_playback
	cp r28,r24
	brlo .L133
.L118:
	.stabn	68,0,721,.LM107-.LFBB18
.LM107:
	mov r24,r28
	call set_sleep_scenario_playback
.L116:
.LBE192:
	.stabn	68,0,723,.LM108-.LFBB18
.LM108:
	call disp_sleep_scenario_playback
.L134:
.LBB193:
.LBB194:
	.stabn	68,0,323,.LM109-.LFBB18
.LM109:
	ldi r24,lo8(1)
	sts menu+7,r24
	rjmp .L109
.L113:
.LBE194:
.LBE193:
	.stabn	68,0,729,.LM110-.LFBB18
.LM110:
	call is_readonly_sleep_scenario_playback
	cpse r24,__zero_reg__
	rjmp .L116
.LBB195:
	.stabn	68,0,729,.LM111-.LFBB18
.LM111:
	call get_sleep_scenario_playback
	mov r28,r24
	call step_sleep_scenario_playback
	add r28,r24
	call max_sleep_scenario_playback
	cp r24,r28
	brsh .L118
	.stabn	68,0,729,.LM112-.LFBB18
.LM112:
	call min_sleep_scenario_playback
	rjmp .L135
.LBE195:
	.size	enhanced_sc_setup, .-enhanced_sc_setup
.Lscope18:
	.stabs	"alarm_clock_setup_activate:f(0,8)",36,0,0,alarm_clock_setup_activate
	.stabs	"sleep_scenario_playback_t:t(0,12)=(0,2)",128,0,0,0
	.type	alarm_clock_setup_activate, @function
alarm_clock_setup_activate:
	.stabn	68,0,1122,.LM113-.LFBB19
.LM113:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1123,.LM114-.LFBB19
.LM114:
	call get_alarm_clock
	.stabn	68,0,1123,.LM115-.LFBB19
.LM115:
	ldi r25,0
	jmp disp_flag
	.size	alarm_clock_setup_activate, .-alarm_clock_setup_activate
.Lscope19:
	.stabs	"hints_frequency_setup_activate:f(0,8)",36,0,0,hints_frequency_setup_activate
	.type	hints_frequency_setup_activate, @function
hints_frequency_setup_activate:
	.stabn	68,0,1140,.LM116-.LFBB20
.LM116:
.LFBB20:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1141,.LM117-.LFBB20
.LM117:
	call get_hints_frequency
	.stabn	68,0,1141,.LM118-.LFBB20
.LM118:
	ldi r25,0
	jmp disp_dec
	.size	hints_frequency_setup_activate, .-hints_frequency_setup_activate
.Lscope20:
	.stabs	"hints_duty_cycle_setup_activate:f(0,8)",36,0,0,hints_duty_cycle_setup_activate
	.type	hints_duty_cycle_setup_activate, @function
hints_duty_cycle_setup_activate:
	.stabn	68,0,1165,.LM119-.LFBB21
.LM119:
.LFBB21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1166,.LM120-.LFBB21
.LM120:
	call get_hints_duty_cycle
	.stabn	68,0,1166,.LM121-.LFBB21
.LM121:
	ldi r25,0
	jmp disp_dec
	.size	hints_duty_cycle_setup_activate, .-hints_duty_cycle_setup_activate
.Lscope21:
	.stabs	"light_hints_brightness_setup_activate:f(0,8)",36,0,0,light_hints_brightness_setup_activate
	.type	light_hints_brightness_setup_activate, @function
light_hints_brightness_setup_activate:
	.stabn	68,0,1215,.LM122-.LFBB22
.LM122:
.LFBB22:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1216,.LM123-.LFBB22
.LM123:
	call get_light_hints_brightness
	.stabn	68,0,1216,.LM124-.LFBB22
.LM124:
	ldi r25,0
	jmp disp_dec
	.size	light_hints_brightness_setup_activate, .-light_hints_brightness_setup_activate
.Lscope22:
	.stabs	"sound_hints_volume_setup_activate:f(0,8)",36,0,0,sound_hints_volume_setup_activate
	.type	sound_hints_volume_setup_activate, @function
sound_hints_volume_setup_activate:
	.stabn	68,0,1190,.LM125-.LFBB23
.LM125:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1191,.LM126-.LFBB23
.LM126:
	call get_sound_hints_volume
	.stabn	68,0,1191,.LM127-.LFBB23
.LM127:
	ldi r25,0
	jmp disp_dec
	.size	sound_hints_volume_setup_activate, .-sound_hints_volume_setup_activate
.Lscope23:
	.stabs	"set_defaults_handler:f(0,8)",36,0,0,set_defaults_handler
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	set_defaults_handler, @function
set_defaults_handler:
	.stabn	68,0,1313,.LM128-.LFBB24
.LM128:
.LFBB24:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1314,.LM129-.LFBB24
.LM129:
	cpi r24,lo8(8)
	brne .L141
	.stabn	68,0,1317,.LM130-.LFBB24
.LM130:
	call config_set_defaults
.LBB196:
.LBB197:
	.stabn	68,0,323,.LM131-.LFBB24
.LM131:
	ldi r24,lo8(1)
	sts menu+7,r24
.L141:
/* epilogue start */
.LBE197:
.LBE196:
	.stabn	68,0,1321,.LM132-.LFBB24
.LM132:
	ret
	.size	set_defaults_handler, .-set_defaults_handler
.Lscope24:
	.stabs	"sound_hints_duration_setup:f(0,8)",36,0,0,sound_hints_duration_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	sound_hints_duration_setup, @function
sound_hints_duration_setup:
	.stabn	68,0,1276,.LM133-.LFBB25
.LM133:
.LFBB25:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1277,.LM134-.LFBB25
.LM134:
	cpi r24,lo8(-112)
	breq .L144
	brsh .L145
	cpi r24,lo8(16)
	breq .L144
	cpi r24,lo8(32)
	breq .L146
.L143:
/* epilogue start */
	.stabn	68,0,1295,.LM135-.LFBB25
.LM135:
	pop r28
	ret
.L145:
	.stabn	68,0,1277,.LM136-.LFBB25
.LM136:
	cpi r24,lo8(-96)
	brne .L143
.L146:
	.stabn	68,0,1281,.LM137-.LFBB25
.LM137:
	call is_readonly_sound_hints_duration
	cpse r24,__zero_reg__
	rjmp .L151
.LBB198:
	.stabn	68,0,1281,.LM138-.LFBB25
.LM138:
	call get_sound_hints_duration
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L149
.L162:
	.stabn	68,0,1281,.LM139-.LFBB25
.LM139:
	call max_sound_hints_duration
.L163:
.LBE198:
.LBB199:
	.stabn	68,0,1289,.LM140-.LFBB25
.LM140:
	mov r28,r24
	rjmp .L152
.L149:
.LBE199:
.LBB200:
	.stabn	68,0,1281,.LM141-.LFBB25
.LM141:
	call step_sound_hints_duration
	sub r28,r24
	call min_sound_hints_duration
	cp r28,r24
	brlo .L162
.L152:
.LBE200:
.LBB201:
	.stabn	68,0,1289,.LM142-.LFBB25
.LM142:
	mov r24,r28
	call set_sound_hints_duration
.L151:
.LBE201:
	.stabn	68,0,1291,.LM143-.LFBB25
.LM143:
	call get_sound_hints_duration
	.stabn	68,0,1291,.LM144-.LFBB25
.LM144:
	ldi r25,0
	call disp_dec
.LBB202:
.LBB203:
	.stabn	68,0,323,.LM145-.LFBB25
.LM145:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE203:
.LBE202:
	.stabn	68,0,1295,.LM146-.LFBB25
.LM146:
	rjmp .L143
.L144:
	.stabn	68,0,1289,.LM147-.LFBB25
.LM147:
	call is_readonly_sound_hints_duration
	cpse r24,__zero_reg__
	rjmp .L151
.LBB204:
	.stabn	68,0,1289,.LM148-.LFBB25
.LM148:
	call get_sound_hints_duration
	mov r28,r24
	call step_sound_hints_duration
	add r28,r24
	call max_sound_hints_duration
	cp r24,r28
	brsh .L152
	.stabn	68,0,1289,.LM149-.LFBB25
.LM149:
	call min_sound_hints_duration
	rjmp .L163
.LBE204:
	.size	sound_hints_duration_setup, .-sound_hints_duration_setup
.Lscope25:
	.stabs	"sound_hints_duration_setup_activate:f(0,8)",36,0,0,sound_hints_duration_setup_activate
	.stabs	"sound_hints_duration_t:t(0,13)=(0,2)",128,0,0,0
	.type	sound_hints_duration_setup_activate, @function
sound_hints_duration_setup_activate:
	.stabn	68,0,1269,.LM150-.LFBB26
.LM150:
.LFBB26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1270,.LM151-.LFBB26
.LM151:
	call get_sound_hints_duration
	.stabn	68,0,1270,.LM152-.LFBB26
.LM152:
	ldi r25,0
	call disp_dec
	.stabn	68,0,1272,.LM153-.LFBB26
.LM153:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	sound_hints_duration_setup_activate, .-sound_hints_duration_setup_activate
.Lscope26:
	.stabs	"light_hints_duration_setup_activate:f(0,8)",36,0,0,light_hints_duration_setup_activate
	.type	light_hints_duration_setup_activate, @function
light_hints_duration_setup_activate:
	.stabn	68,0,1240,.LM154-.LFBB27
.LM154:
.LFBB27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1241,.LM155-.LFBB27
.LM155:
	call get_light_hints_duration
	.stabn	68,0,1241,.LM156-.LFBB27
.LM156:
	ldi r25,0
	call disp_dec
	.stabn	68,0,1243,.LM157-.LFBB27
.LM157:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	light_hints_duration_setup_activate, .-light_hints_duration_setup_activate
.Lscope27:
	.stabs	"rem_detect_sensitivity_setup_activate:f(0,8)",36,0,0,rem_detect_sensitivity_setup_activate
	.type	rem_detect_sensitivity_setup_activate, @function
rem_detect_sensitivity_setup_activate:
	.stabn	68,0,1011,.LM158-.LFBB28
.LM158:
.LFBB28:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1012,.LM159-.LFBB28
.LM159:
	call get_rem_detect_sensitivity
	.stabn	68,0,1012,.LM160-.LFBB28
.LM160:
	ldi r25,0
	call disp_dec
	.stabn	68,0,1014,.LM161-.LFBB28
.LM161:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	rem_detect_sensitivity_setup_activate, .-rem_detect_sensitivity_setup_activate
.Lscope28:
	.stabs	"trigger_times_activate:f(0,8)",36,0,0,trigger_times_activate
	.type	trigger_times_activate, @function
trigger_times_activate:
	.stabn	68,0,990,.LM162-.LFBB29
.LM162:
.LFBB29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,991,.LM163-.LFBB29
.LM163:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	trigger_times_activate, .-trigger_times_activate
.Lscope29:
	.stabs	"disable_input_hold_repeat:f(0,8)",36,0,0,disable_input_hold_repeat
	.type	disable_input_hold_repeat, @function
disable_input_hold_repeat:
	.stabn	68,0,943,.LM164-.LFBB30
.LM164:
.LFBB30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,944,.LM165-.LFBB30
.LM165:
	ldi r25,0
	ldi r24,0
	jmp input_set_hold_repeat
	.size	disable_input_hold_repeat, .-disable_input_hold_repeat
.Lscope30:
	.stabs	"light_hints_duration_setup:f(0,8)",36,0,0,light_hints_duration_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	light_hints_duration_setup, @function
light_hints_duration_setup:
	.stabn	68,0,1247,.LM166-.LFBB31
.LM166:
.LFBB31:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1248,.LM167-.LFBB31
.LM167:
	cpi r24,lo8(-112)
	breq .L170
	brsh .L171
	cpi r24,lo8(16)
	breq .L170
	cpi r24,lo8(32)
	breq .L172
.L169:
/* epilogue start */
	.stabn	68,0,1266,.LM168-.LFBB31
.LM168:
	pop r28
	ret
.L171:
	.stabn	68,0,1248,.LM169-.LFBB31
.LM169:
	cpi r24,lo8(-96)
	brne .L169
.L172:
	.stabn	68,0,1252,.LM170-.LFBB31
.LM170:
	call is_readonly_light_hints_duration
	cpse r24,__zero_reg__
	rjmp .L177
.LBB205:
	.stabn	68,0,1252,.LM171-.LFBB31
.LM171:
	call get_light_hints_duration
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L175
.L188:
	.stabn	68,0,1252,.LM172-.LFBB31
.LM172:
	call max_light_hints_duration
.L189:
.LBE205:
.LBB206:
	.stabn	68,0,1260,.LM173-.LFBB31
.LM173:
	mov r28,r24
	rjmp .L178
.L175:
.LBE206:
.LBB207:
	.stabn	68,0,1252,.LM174-.LFBB31
.LM174:
	call step_light_hints_duration
	sub r28,r24
	call min_light_hints_duration
	cp r28,r24
	brlo .L188
.L178:
.LBE207:
.LBB208:
	.stabn	68,0,1260,.LM175-.LFBB31
.LM175:
	mov r24,r28
	call set_light_hints_duration
.L177:
.LBE208:
	.stabn	68,0,1262,.LM176-.LFBB31
.LM176:
	call get_light_hints_duration
	.stabn	68,0,1262,.LM177-.LFBB31
.LM177:
	ldi r25,0
	call disp_dec
.LBB209:
.LBB210:
	.stabn	68,0,323,.LM178-.LFBB31
.LM178:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE210:
.LBE209:
	.stabn	68,0,1266,.LM179-.LFBB31
.LM179:
	rjmp .L169
.L170:
	.stabn	68,0,1260,.LM180-.LFBB31
.LM180:
	call is_readonly_light_hints_duration
	cpse r24,__zero_reg__
	rjmp .L177
.LBB211:
	.stabn	68,0,1260,.LM181-.LFBB31
.LM181:
	call get_light_hints_duration
	mov r28,r24
	call step_light_hints_duration
	add r28,r24
	call max_light_hints_duration
	cp r24,r28
	brsh .L178
	.stabn	68,0,1260,.LM182-.LFBB31
.LM182:
	call min_light_hints_duration
	rjmp .L189
.LBE211:
	.size	light_hints_duration_setup, .-light_hints_duration_setup
.Lscope31:
	.stabs	"sound_hints_volume_setup:f(0,8)",36,0,0,sound_hints_volume_setup
	.stabs	"light_hints_duration_t:t(0,14)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	sound_hints_volume_setup, @function
sound_hints_volume_setup:
	.stabn	68,0,1195,.LM183-.LFBB32
.LM183:
.LFBB32:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1196,.LM184-.LFBB32
.LM184:
	cpi r24,lo8(16)
	breq .L191
	cpi r24,lo8(32)
	brne .L190
	.stabn	68,0,1199,.LM185-.LFBB32
.LM185:
	call is_readonly_sound_hints_volume
	cpse r24,__zero_reg__
	rjmp .L196
.LBB212:
	.stabn	68,0,1199,.LM186-.LFBB32
.LM186:
	call get_sound_hints_volume
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L194
.L198:
	.stabn	68,0,1199,.LM187-.LFBB32
.LM187:
	call max_sound_hints_volume
.L199:
.LBE212:
.LBB213:
	.stabn	68,0,1206,.LM188-.LFBB32
.LM188:
	mov r28,r24
	rjmp .L197
.L194:
.LBE213:
.LBB214:
	.stabn	68,0,1199,.LM189-.LFBB32
.LM189:
	call step_sound_hints_volume
	sub r28,r24
	call min_sound_hints_volume
	cp r28,r24
	brlo .L198
.L197:
.LBE214:
.LBB215:
	.stabn	68,0,1206,.LM190-.LFBB32
.LM190:
	mov r24,r28
	call set_sound_hints_volume
.L196:
.LBE215:
	.stabn	68,0,1208,.LM191-.LFBB32
.LM191:
	call get_sound_hints_volume
	.stabn	68,0,1208,.LM192-.LFBB32
.LM192:
	ldi r25,0
	call disp_dec
.LBB216:
.LBB217:
	.stabn	68,0,323,.LM193-.LFBB32
.LM193:
	ldi r24,lo8(1)
	sts menu+7,r24
.L190:
/* epilogue start */
.LBE217:
.LBE216:
	.stabn	68,0,1212,.LM194-.LFBB32
.LM194:
	pop r28
	ret
.L191:
	.stabn	68,0,1206,.LM195-.LFBB32
.LM195:
	call is_readonly_sound_hints_volume
	cpse r24,__zero_reg__
	rjmp .L196
.LBB218:
	.stabn	68,0,1206,.LM196-.LFBB32
.LM196:
	call get_sound_hints_volume
	mov r28,r24
	call step_sound_hints_volume
	add r28,r24
	call max_sound_hints_volume
	cp r24,r28
	brsh .L197
	.stabn	68,0,1206,.LM197-.LFBB32
.LM197:
	call min_sound_hints_volume
	rjmp .L199
.LBE218:
	.size	sound_hints_volume_setup, .-sound_hints_volume_setup
.Lscope32:
	.stabs	"light_hints_brightness_setup:f(0,8)",36,0,0,light_hints_brightness_setup
	.stabs	"sound_hints_volume_t:t(0,15)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	light_hints_brightness_setup, @function
light_hints_brightness_setup:
	.stabn	68,0,1220,.LM198-.LFBB33
.LM198:
.LFBB33:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1221,.LM199-.LFBB33
.LM199:
	cpi r24,lo8(16)
	breq .L201
	cpi r24,lo8(32)
	brne .L200
	.stabn	68,0,1224,.LM200-.LFBB33
.LM200:
	call is_readonly_light_hints_brightness
	cpse r24,__zero_reg__
	rjmp .L206
.LBB219:
	.stabn	68,0,1224,.LM201-.LFBB33
.LM201:
	call get_light_hints_brightness
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L204
.L208:
	.stabn	68,0,1224,.LM202-.LFBB33
.LM202:
	call max_light_hints_brightness
.L209:
.LBE219:
.LBB220:
	.stabn	68,0,1231,.LM203-.LFBB33
.LM203:
	mov r28,r24
	rjmp .L207
.L204:
.LBE220:
.LBB221:
	.stabn	68,0,1224,.LM204-.LFBB33
.LM204:
	call step_light_hints_brightness
	sub r28,r24
	call min_light_hints_brightness
	cp r28,r24
	brlo .L208
.L207:
.LBE221:
.LBB222:
	.stabn	68,0,1231,.LM205-.LFBB33
.LM205:
	mov r24,r28
	call set_light_hints_brightness
.L206:
.LBE222:
	.stabn	68,0,1233,.LM206-.LFBB33
.LM206:
	call get_light_hints_brightness
	.stabn	68,0,1233,.LM207-.LFBB33
.LM207:
	ldi r25,0
	call disp_dec
.LBB223:
.LBB224:
	.stabn	68,0,323,.LM208-.LFBB33
.LM208:
	ldi r24,lo8(1)
	sts menu+7,r24
.L200:
/* epilogue start */
.LBE224:
.LBE223:
	.stabn	68,0,1237,.LM209-.LFBB33
.LM209:
	pop r28
	ret
.L201:
	.stabn	68,0,1231,.LM210-.LFBB33
.LM210:
	call is_readonly_light_hints_brightness
	cpse r24,__zero_reg__
	rjmp .L206
.LBB225:
	.stabn	68,0,1231,.LM211-.LFBB33
.LM211:
	call get_light_hints_brightness
	mov r28,r24
	call step_light_hints_brightness
	add r28,r24
	call max_light_hints_brightness
	cp r24,r28
	brsh .L207
	.stabn	68,0,1231,.LM212-.LFBB33
.LM212:
	call min_light_hints_brightness
	rjmp .L209
.LBE225:
	.size	light_hints_brightness_setup, .-light_hints_brightness_setup
.Lscope33:
	.stabs	"hints_duty_cycle_setup:f(0,8)",36,0,0,hints_duty_cycle_setup
	.stabs	"light_hints_brightness_t:t(0,16)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	hints_duty_cycle_setup, @function
hints_duty_cycle_setup:
	.stabn	68,0,1170,.LM213-.LFBB34
.LM213:
.LFBB34:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1171,.LM214-.LFBB34
.LM214:
	cpi r24,lo8(16)
	breq .L211
	cpi r24,lo8(32)
	brne .L210
	.stabn	68,0,1174,.LM215-.LFBB34
.LM215:
	call is_readonly_hints_duty_cycle
	cpse r24,__zero_reg__
	rjmp .L216
.LBB226:
	.stabn	68,0,1174,.LM216-.LFBB34
.LM216:
	call get_hints_duty_cycle
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L214
.L218:
	.stabn	68,0,1174,.LM217-.LFBB34
.LM217:
	call max_hints_duty_cycle
.L219:
.LBE226:
.LBB227:
	.stabn	68,0,1181,.LM218-.LFBB34
.LM218:
	mov r28,r24
	rjmp .L217
.L214:
.LBE227:
.LBB228:
	.stabn	68,0,1174,.LM219-.LFBB34
.LM219:
	call step_hints_duty_cycle
	sub r28,r24
	call min_hints_duty_cycle
	cp r28,r24
	brlo .L218
.L217:
.LBE228:
.LBB229:
	.stabn	68,0,1181,.LM220-.LFBB34
.LM220:
	mov r24,r28
	call set_hints_duty_cycle
.L216:
.LBE229:
	.stabn	68,0,1183,.LM221-.LFBB34
.LM221:
	call get_hints_duty_cycle
	.stabn	68,0,1183,.LM222-.LFBB34
.LM222:
	ldi r25,0
	call disp_dec
.LBB230:
.LBB231:
	.stabn	68,0,323,.LM223-.LFBB34
.LM223:
	ldi r24,lo8(1)
	sts menu+7,r24
.L210:
/* epilogue start */
.LBE231:
.LBE230:
	.stabn	68,0,1187,.LM224-.LFBB34
.LM224:
	pop r28
	ret
.L211:
	.stabn	68,0,1181,.LM225-.LFBB34
.LM225:
	call is_readonly_hints_duty_cycle
	cpse r24,__zero_reg__
	rjmp .L216
.LBB232:
	.stabn	68,0,1181,.LM226-.LFBB34
.LM226:
	call get_hints_duty_cycle
	mov r28,r24
	call step_hints_duty_cycle
	add r28,r24
	call max_hints_duty_cycle
	cp r24,r28
	brsh .L217
	.stabn	68,0,1181,.LM227-.LFBB34
.LM227:
	call min_hints_duty_cycle
	rjmp .L219
.LBE232:
	.size	hints_duty_cycle_setup, .-hints_duty_cycle_setup
.Lscope34:
	.stabs	"hints_frequency_setup:f(0,8)",36,0,0,hints_frequency_setup
	.stabs	"hints_duty_cycle_t:t(0,17)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	hints_frequency_setup, @function
hints_frequency_setup:
	.stabn	68,0,1145,.LM228-.LFBB35
.LM228:
.LFBB35:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1146,.LM229-.LFBB35
.LM229:
	cpi r24,lo8(16)
	breq .L221
	cpi r24,lo8(32)
	brne .L220
	.stabn	68,0,1149,.LM230-.LFBB35
.LM230:
	call is_readonly_hints_frequency
	cpse r24,__zero_reg__
	rjmp .L226
.LBB233:
	.stabn	68,0,1149,.LM231-.LFBB35
.LM231:
	call get_hints_frequency
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L224
.L228:
	.stabn	68,0,1149,.LM232-.LFBB35
.LM232:
	call max_hints_frequency
.L229:
.LBE233:
.LBB234:
	.stabn	68,0,1156,.LM233-.LFBB35
.LM233:
	mov r28,r24
	rjmp .L227
.L224:
.LBE234:
.LBB235:
	.stabn	68,0,1149,.LM234-.LFBB35
.LM234:
	call step_hints_frequency
	sub r28,r24
	call min_hints_frequency
	cp r28,r24
	brlo .L228
.L227:
.LBE235:
.LBB236:
	.stabn	68,0,1156,.LM235-.LFBB35
.LM235:
	mov r24,r28
	call set_hints_frequency
.L226:
.LBE236:
	.stabn	68,0,1158,.LM236-.LFBB35
.LM236:
	call get_hints_frequency
	.stabn	68,0,1158,.LM237-.LFBB35
.LM237:
	ldi r25,0
	call disp_dec
.LBB237:
.LBB238:
	.stabn	68,0,323,.LM238-.LFBB35
.LM238:
	ldi r24,lo8(1)
	sts menu+7,r24
.L220:
/* epilogue start */
.LBE238:
.LBE237:
	.stabn	68,0,1162,.LM239-.LFBB35
.LM239:
	pop r28
	ret
.L221:
	.stabn	68,0,1156,.LM240-.LFBB35
.LM240:
	call is_readonly_hints_frequency
	cpse r24,__zero_reg__
	rjmp .L226
.LBB239:
	.stabn	68,0,1156,.LM241-.LFBB35
.LM241:
	call get_hints_frequency
	mov r28,r24
	call step_hints_frequency
	add r28,r24
	call max_hints_frequency
	cp r24,r28
	brsh .L227
	.stabn	68,0,1156,.LM242-.LFBB35
.LM242:
	call min_hints_frequency
	rjmp .L229
.LBE239:
	.size	hints_frequency_setup, .-hints_frequency_setup
.Lscope35:
	.stabs	"rem_detect_sensitivity_setup:f(0,8)",36,0,0,rem_detect_sensitivity_setup
	.stabs	"hints_frequency_t:t(0,18)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	rem_detect_sensitivity_setup, @function
rem_detect_sensitivity_setup:
	.stabn	68,0,1018,.LM243-.LFBB36
.LM243:
.LFBB36:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1019,.LM244-.LFBB36
.LM244:
	cpi r24,lo8(-112)
	breq .L231
	brsh .L232
	cpi r24,lo8(16)
	breq .L231
	cpi r24,lo8(32)
	breq .L233
.L230:
/* epilogue start */
	.stabn	68,0,1037,.LM245-.LFBB36
.LM245:
	pop r28
	ret
.L232:
	.stabn	68,0,1019,.LM246-.LFBB36
.LM246:
	cpi r24,lo8(-96)
	brne .L230
.L233:
	.stabn	68,0,1023,.LM247-.LFBB36
.LM247:
	call is_readonly_rem_detect_sensitivity
	cpse r24,__zero_reg__
	rjmp .L238
.LBB240:
	.stabn	68,0,1023,.LM248-.LFBB36
.LM248:
	call get_rem_detect_sensitivity
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L236
.L249:
	.stabn	68,0,1023,.LM249-.LFBB36
.LM249:
	call max_rem_detect_sensitivity
.L250:
.LBE240:
.LBB241:
	.stabn	68,0,1031,.LM250-.LFBB36
.LM250:
	mov r28,r24
	rjmp .L239
.L236:
.LBE241:
.LBB242:
	.stabn	68,0,1023,.LM251-.LFBB36
.LM251:
	call step_rem_detect_sensitivity
	sub r28,r24
	call min_rem_detect_sensitivity
	cp r28,r24
	brlo .L249
.L239:
.LBE242:
.LBB243:
	.stabn	68,0,1031,.LM252-.LFBB36
.LM252:
	mov r24,r28
	call set_rem_detect_sensitivity
.L238:
.LBE243:
	.stabn	68,0,1033,.LM253-.LFBB36
.LM253:
	call get_rem_detect_sensitivity
	.stabn	68,0,1033,.LM254-.LFBB36
.LM254:
	ldi r25,0
	call disp_dec
.LBB244:
.LBB245:
	.stabn	68,0,323,.LM255-.LFBB36
.LM255:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE245:
.LBE244:
	.stabn	68,0,1037,.LM256-.LFBB36
.LM256:
	rjmp .L230
.L231:
	.stabn	68,0,1031,.LM257-.LFBB36
.LM257:
	call is_readonly_rem_detect_sensitivity
	cpse r24,__zero_reg__
	rjmp .L238
.LBB246:
	.stabn	68,0,1031,.LM258-.LFBB36
.LM258:
	call get_rem_detect_sensitivity
	mov r28,r24
	call step_rem_detect_sensitivity
	add r28,r24
	call max_rem_detect_sensitivity
	cp r24,r28
	brsh .L239
	.stabn	68,0,1031,.LM259-.LFBB36
.LM259:
	call min_rem_detect_sensitivity
	rjmp .L250
.LBE246:
	.size	rem_detect_sensitivity_setup, .-rem_detect_sensitivity_setup
.Lscope36:
	.stabs	"trigger_counter_display:f(0,8)",36,0,0,trigger_counter_display
	.stabs	"rem_detect_sensitivity_t:t(0,19)=(0,2)",128,0,0,0
	.type	trigger_counter_display, @function
trigger_counter_display:
	.stabn	68,0,984,.LM260-.LFBB37
.LM260:
.LFBB37:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,985,.LM261-.LFBB37
.LM261:
	call get_trigger_counter
	.stabn	68,0,985,.LM262-.LFBB37
.LM262:
	ldi r25,0
	jmp disp_dec
	.size	trigger_counter_display, .-trigger_counter_display
.Lscope37:
	.stabs	"wakeup_timer_setup_activate:f(0,8)",36,0,0,wakeup_timer_setup_activate
	.type	wakeup_timer_setup_activate, @function
wakeup_timer_setup_activate:
	.stabn	68,0,948,.LM263-.LFBB38
.LM263:
.LFBB38:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,949,.LM264-.LFBB38
.LM264:
	call disp_wakeup_timer_delay
	.stabn	68,0,951,.LM265-.LFBB38
.LM265:
	ldi r24,lo8(20)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	wakeup_timer_setup_activate, .-wakeup_timer_setup_activate
.Lscope38:
	.stabs	"wakeup_timer_setup:f(0,8)",36,0,0,wakeup_timer_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	wakeup_timer_setup, @function
wakeup_timer_setup:
	.stabn	68,0,955,.LM266-.LFBB39
.LM266:
.LFBB39:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,956,.LM267-.LFBB39
.LM267:
	cpi r24,lo8(32)
	breq .L254
	brsh .L255
	cpi r24,lo8(8)
	breq .L256
	cpi r24,lo8(16)
	breq .L257
.L253:
/* epilogue start */
	.stabn	68,0,981,.LM268-.LFBB39
.LM268:
	pop r29
	pop r28
	ret
.L255:
	.stabn	68,0,956,.LM269-.LFBB39
.LM269:
	cpi r24,lo8(-112)
	breq .L257
	cpi r24,lo8(-96)
	brne .L253
.L254:
	.stabn	68,0,967,.LM270-.LFBB39
.LM270:
	call is_invalid_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L260
	.stabn	68,0,967,.LM271-.LFBB39
.LM271:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L260
.LBB247:
	.stabn	68,0,967,.LM272-.LFBB39
.LM272:
	call get_wakeup_timer_delay
	movw r28,r24
	or r24,r25
	brne .L263
.L279:
	.stabn	68,0,967,.LM273-.LFBB39
.LM273:
	call max_wakeup_timer_delay
.L278:
.LBE247:
.LBB248:
	.stabn	68,0,975,.LM274-.LFBB39
.LM274:
	movw r28,r24
	rjmp .L265
.L256:
.LBE248:
	.stabn	68,0,959,.LM275-.LFBB39
.LM275:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L260
	.stabn	68,0,959,.LM276-.LFBB39
.LM276:
	call is_invalid_wakeup_timer_delay
	tst r24
	breq .L261
	.stabn	68,0,959,.LM277-.LFBB39
.LM277:
	call set_default_wakeup_timer_delay
.L260:
	.stabn	68,0,961,.LM278-.LFBB39
.LM278:
	call disp_wakeup_timer_delay
.LBB249:
.LBB250:
	.stabn	68,0,323,.LM279-.LFBB39
.LM279:
	ldi r24,lo8(1)
	sts menu+7,r24
	rjmp .L253
.L261:
.LBE250:
.LBE249:
	.stabn	68,0,959,.LM280-.LFBB39
.LM280:
	call set_invalid_wakeup_timer_delay
	rjmp .L260
.L263:
.LBB251:
	.stabn	68,0,967,.LM281-.LFBB39
.LM281:
	call step_wakeup_timer_delay
	sub r28,r24
	sbc r29,r25
	call min_wakeup_timer_delay
	cp r28,r24
	cpc r29,r25
	brlo .L279
.L265:
.LBE251:
.LBB252:
	.stabn	68,0,975,.LM282-.LFBB39
.LM282:
	movw r24,r28
	call set_wakeup_timer_delay
	rjmp .L260
.L257:
.LBE252:
	.stabn	68,0,975,.LM283-.LFBB39
.LM283:
	call is_invalid_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L260
	.stabn	68,0,975,.LM284-.LFBB39
.LM284:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L260
.LBB253:
	.stabn	68,0,975,.LM285-.LFBB39
.LM285:
	call get_wakeup_timer_delay
	movw r28,r24
	call step_wakeup_timer_delay
	add r28,r24
	adc r29,r25
	call max_wakeup_timer_delay
	cp r24,r28
	cpc r25,r29
	brsh .L265
	.stabn	68,0,975,.LM286-.LFBB39
.LM286:
	call min_wakeup_timer_delay
	rjmp .L278
.LBE253:
	.size	wakeup_timer_setup, .-wakeup_timer_setup
.Lscope39:
	.stabs	"clock_setup_exit:f(0,8)",36,0,0,clock_setup_exit
	.stabs	"wakeup_timer_delay_t:t(0,20)=(0,6)",128,0,0,0
	.stabs	"e_rtc_setup_mode:T(0,21)=eRTC_SETUP_NONE:0,RTC_SETUP_HOUR:1,RTC_SETUP_MINUTE:2,;",128,0,0,0
	.type	clock_setup_exit, @function
clock_setup_exit:
	.stabn	68,0,907,.LM287-.LFBB40
.LM287:
.LFBB40:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,909,.LM288-.LFBB40
.LM288:
	ldi r25,0
	ldi r24,0
	call rtc_setup
	.stabn	68,0,910,.LM289-.LFBB40
.LM289:
	call rtc_hide
	.stabn	68,0,912,.LM290-.LFBB40
.LM290:
	jmp disable_input_hold_repeat
	.size	clock_setup_exit, .-clock_setup_exit
.Lscope40:
	.stabs	"clock_setup_activate:f(0,8)",36,0,0,clock_setup_activate
	.type	clock_setup_activate, @function
clock_setup_activate:
	.stabn	68,0,898,.LM291-.LFBB41
.LM291:
.LFBB41:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,900,.LM292-.LFBB41
.LM292:
	ldi r24,lo8(1)
	ldi r25,0
	call rtc_setup
	.stabn	68,0,901,.LM293-.LFBB41
.LM293:
	call rtc_show
	.stabn	68,0,903,.LM294-.LFBB41
.LM294:
	ldi r24,lo8(50)
	ldi r25,0
	jmp input_set_hold_repeat
	.size	clock_setup_activate, .-clock_setup_activate
.Lscope41:
	.stabs	"enhanced_sp_setup:f(0,8)",36,0,0,enhanced_sp_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_sp_setup, @function
enhanced_sp_setup:
	.stabn	68,0,878,.LM295-.LFBB42
.LM295:
.LFBB42:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,879,.LM296-.LFBB42
.LM296:
	cpi r24,lo8(16)
	breq .L283
	cpi r24,lo8(32)
	brne .L282
.L283:
.LBB258:
.LBB259:
	.stabn	68,0,883,.LM297-.LFBB42
.LM297:
	call toggle_speaker_enabled
	.stabn	68,0,885,.LM298-.LFBB42
.LM298:
	call get_speaker_enabled
	.stabn	68,0,885,.LM299-.LFBB42
.LM299:
	ldi r25,0
	call disp_flag
	.stabn	68,0,887,.LM300-.LFBB42
.LM300:
	call get_speaker_enabled
	.stabn	68,0,887,.LM301-.LFBB42
.LM301:
	tst r24
	breq .L285
	.stabn	68,0,888,.LM302-.LFBB42
.LM302:
	call speaker_on
.L286:
.LBB260:
.LBB261:
	.stabn	68,0,323,.LM303-.LFBB42
.LM303:
	ldi r24,lo8(1)
	sts menu+7,r24
.L282:
/* epilogue start */
.LBE261:
.LBE260:
.LBE259:
.LBE258:
	.stabn	68,0,895,.LM304-.LFBB42
.LM304:
	ret
.L285:
.LBB263:
.LBB262:
	.stabn	68,0,890,.LM305-.LFBB42
.LM305:
	call speaker_off
	rjmp .L286
.LBE262:
.LBE263:
	.size	enhanced_sp_setup, .-enhanced_sp_setup
.Lscope42:
	.section	.rodata.str1.1
.LC1:
	.string	"donE"
	.text
	.stabs	"enhanced_del_records:f(0,8)",36,0,0,enhanced_del_records
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_del_records, @function
enhanced_del_records:
	.stabn	68,0,828,.LM306-.LFBB43
.LM306:
.LFBB43:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,829,.LM307-.LFBB43
.LM307:
	cpi r24,lo8(8)
	brne .L290
.LBB268:
.LBB269:
	.stabn	68,0,833,.LM308-.LFBB43
.LM308:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call disp_msg
.LBB270:
.LBB271:
	.stabn	68,0,329,.LM309-.LFBB43
.LM309:
	ldi r24,lo8(3)
	sts menu+7,r24
.L290:
/* epilogue start */
.LBE271:
.LBE270:
.LBE269:
.LBE268:
	.stabn	68,0,837,.LM310-.LFBB43
.LM310:
	ret
	.size	enhanced_del_records, .-enhanced_del_records
.Lscope43:
	.stabs	"enhanced_rd_setup:f(0,8)",36,0,0,enhanced_rd_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_rd_setup, @function
enhanced_rd_setup:
	.stabn	68,0,743,.LM311-.LFBB44
.LM311:
.LFBB44:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,744,.LM312-.LFBB44
.LM312:
	cpi r24,lo8(16)
	breq .L293
	cpi r24,lo8(32)
	brne .L292
.L293:
.LBB276:
.LBB277:
	.stabn	68,0,748,.LM313-.LFBB44
.LM313:
	call toggle_voice_recording
	.stabn	68,0,750,.LM314-.LFBB44
.LM314:
	call get_voice_recording
	.stabn	68,0,750,.LM315-.LFBB44
.LM315:
	ldi r25,0
	call disp_flag
.LBB278:
.LBB279:
	.stabn	68,0,323,.LM316-.LFBB44
.LM316:
	ldi r24,lo8(1)
	sts menu+7,r24
.L292:
/* epilogue start */
.LBE279:
.LBE278:
.LBE277:
.LBE276:
	.stabn	68,0,754,.LM317-.LFBB44
.LM317:
	ret
	.size	enhanced_rd_setup, .-enhanced_rd_setup
.Lscope44:
	.stabs	"enhanced_af_setup:f(0,8)",36,0,0,enhanced_af_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_af_setup, @function
enhanced_af_setup:
	.stabn	68,0,686,.LM318-.LFBB45
.LM318:
.LFBB45:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,687,.LM319-.LFBB45
.LM319:
	cpi r24,lo8(16)
	breq .L299
	cpi r24,lo8(32)
	brne .L298
.L299:
.LBB284:
.LBB285:
	.stabn	68,0,691,.LM320-.LFBB45
.LM320:
	call toggle_after_hints_message
	.stabn	68,0,693,.LM321-.LFBB45
.LM321:
	call get_after_hints_message
	.stabn	68,0,693,.LM322-.LFBB45
.LM322:
	ldi r25,0
	call disp_flag
.LBB286:
.LBB287:
	.stabn	68,0,323,.LM323-.LFBB45
.LM323:
	ldi r24,lo8(1)
	sts menu+7,r24
.L298:
/* epilogue start */
.LBE287:
.LBE286:
.LBE285:
.LBE284:
	.stabn	68,0,697,.LM324-.LFBB45
.LM324:
	ret
	.size	enhanced_af_setup, .-enhanced_af_setup
.Lscope45:
	.stabs	"enhanced_be_setup:f(0,8)",36,0,0,enhanced_be_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	enhanced_be_setup, @function
enhanced_be_setup:
	.stabn	68,0,667,.LM325-.LFBB46
.LM325:
.LFBB46:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,668,.LM326-.LFBB46
.LM326:
	cpi r24,lo8(16)
	breq .L305
	cpi r24,lo8(32)
	brne .L304
.L305:
.LBB292:
.LBB293:
	.stabn	68,0,672,.LM327-.LFBB46
.LM327:
	call toggle_before_hints_message
	.stabn	68,0,674,.LM328-.LFBB46
.LM328:
	call get_before_hints_message
	.stabn	68,0,674,.LM329-.LFBB46
.LM329:
	ldi r25,0
	call disp_flag
.LBB294:
.LBB295:
	.stabn	68,0,323,.LM330-.LFBB46
.LM330:
	ldi r24,lo8(1)
	sts menu+7,r24
.L304:
/* epilogue start */
.LBE295:
.LBE294:
.LBE293:
.LBE292:
	.stabn	68,0,678,.LM331-.LFBB46
.LM331:
	ret
	.size	enhanced_be_setup, .-enhanced_be_setup
.Lscope46:
	.stabs	"alarm_clock_setup:f(0,8)",36,0,0,alarm_clock_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	alarm_clock_setup, @function
alarm_clock_setup:
	.stabn	68,0,1127,.LM332-.LFBB47
.LM332:
.LFBB47:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1128,.LM333-.LFBB47
.LM333:
	cpi r24,lo8(16)
	breq .L311
	cpi r24,lo8(32)
	brne .L310
.L311:
.LBB300:
.LBB301:
	.stabn	68,0,1132,.LM334-.LFBB47
.LM334:
	call toggle_alarm_clock
	.stabn	68,0,1133,.LM335-.LFBB47
.LM335:
	call get_alarm_clock
	.stabn	68,0,1133,.LM336-.LFBB47
.LM336:
	ldi r25,0
	call disp_flag
.LBB302:
.LBB303:
	.stabn	68,0,323,.LM337-.LFBB47
.LM337:
	ldi r24,lo8(1)
	sts menu+7,r24
.L310:
/* epilogue start */
.LBE303:
.LBE302:
.LBE301:
.LBE300:
	.stabn	68,0,1137,.LM338-.LFBB47
.LM338:
	ret
	.size	alarm_clock_setup, .-alarm_clock_setup
.Lscope47:
	.section	.rodata.str1.1
.LC2:
	.string	" OFF"
	.text
	.stabs	"disp_wakeup_mode:f(0,8)",36,0,0,disp_wakeup_mode
	.type	disp_wakeup_mode, @function
disp_wakeup_mode:
	.stabn	68,0,1082,.LM339-.LFBB48
.LM339:
.LFBB48:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1083,.LM340-.LFBB48
.LM340:
	call is_invalid_wakeup_mode
	.stabn	68,0,1083,.LM341-.LFBB48
.LM341:
	tst r24
	breq .L317
	.stabn	68,0,1084,.LM342-.LFBB48
.LM342:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	jmp disp_msg
.L317:
.LBB306:
.LBB307:
	.stabn	68,0,1086,.LM343-.LFBB48
.LM343:
	call get_wakeup_mode
	.stabn	68,0,1086,.LM344-.LFBB48
.LM344:
	ldi r25,0
	jmp disp_dec
.LBE307:
.LBE306:
	.size	disp_wakeup_mode, .-disp_wakeup_mode
.Lscope48:
	.stabs	"wakeup_mode_setup_activate:f(0,8)",36,0,0,wakeup_mode_setup_activate
	.type	wakeup_mode_setup_activate, @function
wakeup_mode_setup_activate:
	.stabn	68,0,1090,.LM345-.LFBB49
.LM345:
.LFBB49:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1091,.LM346-.LFBB49
.LM346:
	jmp disp_wakeup_mode
	.size	wakeup_mode_setup_activate, .-wakeup_mode_setup_activate
.Lscope49:
	.stabs	"wakeup_mode_setup:f(0,8)",36,0,0,wakeup_mode_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	wakeup_mode_setup, @function
wakeup_mode_setup:
	.stabn	68,0,1095,.LM347-.LFBB50
.LM347:
.LFBB50:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1096,.LM348-.LFBB50
.LM348:
	cpi r24,lo8(16)
	breq .L320
	cpi r24,lo8(32)
	breq .L321
	cpi r24,lo8(8)
	brne .L319
	.stabn	68,0,1099,.LM349-.LFBB50
.LM349:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L324
	.stabn	68,0,1099,.LM350-.LFBB50
.LM350:
	call is_invalid_wakeup_mode
	tst r24
	breq .L325
	.stabn	68,0,1099,.LM351-.LFBB50
.LM351:
	call set_default_wakeup_mode
.L324:
	.stabn	68,0,1101,.LM352-.LFBB50
.LM352:
	call disp_wakeup_mode
.LBB308:
.LBB309:
	.stabn	68,0,323,.LM353-.LFBB50
.LM353:
	ldi r24,lo8(1)
	sts menu+7,r24
.L319:
/* epilogue start */
.LBE309:
.LBE308:
	.stabn	68,0,1119,.LM354-.LFBB50
.LM354:
	pop r28
	ret
.L325:
	.stabn	68,0,1099,.LM355-.LFBB50
.LM355:
	call set_invalid_wakeup_mode
	rjmp .L324
.L321:
	.stabn	68,0,1106,.LM356-.LFBB50
.LM356:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L324
.LBB310:
	.stabn	68,0,1106,.LM357-.LFBB50
.LM357:
	call get_wakeup_mode
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L327
.L331:
	.stabn	68,0,1106,.LM358-.LFBB50
.LM358:
	call max_wakeup_mode
.L330:
.LBE310:
.LBB311:
	.stabn	68,0,1113,.LM359-.LFBB50
.LM359:
	mov r28,r24
	rjmp .L329
.L327:
.LBE311:
.LBB312:
	.stabn	68,0,1106,.LM360-.LFBB50
.LM360:
	call step_wakeup_mode
	sub r28,r24
	call min_wakeup_mode
	cp r28,r24
	brlo .L331
.L329:
.LBE312:
.LBB313:
	.stabn	68,0,1113,.LM361-.LFBB50
.LM361:
	mov r24,r28
	call set_wakeup_mode
	rjmp .L324
.L320:
.LBE313:
	.stabn	68,0,1113,.LM362-.LFBB50
.LM362:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L324
.LBB314:
	.stabn	68,0,1113,.LM363-.LFBB50
.LM363:
	call get_wakeup_mode
	mov r28,r24
	call step_wakeup_mode
	add r28,r24
	call max_wakeup_mode
	cp r24,r28
	brsh .L329
	.stabn	68,0,1113,.LM364-.LFBB50
.LM364:
	call min_wakeup_mode
	rjmp .L330
.LBE314:
	.size	wakeup_mode_setup, .-wakeup_mode_setup
.Lscope50:
	.stabs	"disp_duplex_mode:f(0,8)",36,0,0,disp_duplex_mode
	.stabs	"wakeup_mode_t:t(0,22)=(0,2)",128,0,0,0
	.type	disp_duplex_mode, @function
disp_duplex_mode:
	.stabn	68,0,1041,.LM365-.LFBB51
.LM365:
.LFBB51:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1042,.LM366-.LFBB51
.LM366:
	call is_invalid_duplex_mode
	.stabn	68,0,1042,.LM367-.LFBB51
.LM367:
	tst r24
	breq .L333
	.stabn	68,0,1043,.LM368-.LFBB51
.LM368:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	jmp disp_msg
.L333:
.LBB317:
.LBB318:
	.stabn	68,0,1045,.LM369-.LFBB51
.LM369:
	call get_duplex_mode
	.stabn	68,0,1045,.LM370-.LFBB51
.LM370:
	ldi r25,0
	jmp disp_dec
.LBE318:
.LBE317:
	.size	disp_duplex_mode, .-disp_duplex_mode
.Lscope51:
	.stabs	"duplex_mode_setup_activate:f(0,8)",36,0,0,duplex_mode_setup_activate
	.type	duplex_mode_setup_activate, @function
duplex_mode_setup_activate:
	.stabn	68,0,1049,.LM371-.LFBB52
.LM371:
.LFBB52:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1050,.LM372-.LFBB52
.LM372:
	jmp disp_duplex_mode
	.size	duplex_mode_setup_activate, .-duplex_mode_setup_activate
.Lscope52:
	.stabs	"duplex_mode_setup:f(0,8)",36,0,0,duplex_mode_setup
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	duplex_mode_setup, @function
duplex_mode_setup:
	.stabn	68,0,1054,.LM373-.LFBB53
.LM373:
.LFBB53:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1055,.LM374-.LFBB53
.LM374:
	cpi r24,lo8(16)
	breq .L336
	cpi r24,lo8(32)
	breq .L337
	cpi r24,lo8(8)
	brne .L335
	.stabn	68,0,1058,.LM375-.LFBB53
.LM375:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L340
	.stabn	68,0,1058,.LM376-.LFBB53
.LM376:
	call is_invalid_duplex_mode
	tst r24
	breq .L341
	.stabn	68,0,1058,.LM377-.LFBB53
.LM377:
	call set_default_duplex_mode
.L340:
	.stabn	68,0,1060,.LM378-.LFBB53
.LM378:
	call disp_duplex_mode
.LBB319:
.LBB320:
	.stabn	68,0,323,.LM379-.LFBB53
.LM379:
	ldi r24,lo8(1)
	sts menu+7,r24
.L335:
/* epilogue start */
.LBE320:
.LBE319:
	.stabn	68,0,1078,.LM380-.LFBB53
.LM380:
	pop r28
	ret
.L341:
	.stabn	68,0,1058,.LM381-.LFBB53
.LM381:
	call set_invalid_duplex_mode
	rjmp .L340
.L337:
	.stabn	68,0,1065,.LM382-.LFBB53
.LM382:
	call is_invalid_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L340
	.stabn	68,0,1065,.LM383-.LFBB53
.LM383:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L340
.LBB321:
	.stabn	68,0,1065,.LM384-.LFBB53
.LM384:
	call get_duplex_mode
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L343
.L347:
	.stabn	68,0,1065,.LM385-.LFBB53
.LM385:
	call max_duplex_mode
.L346:
.LBE321:
.LBB322:
	.stabn	68,0,1072,.LM386-.LFBB53
.LM386:
	mov r28,r24
	rjmp .L345
.L343:
.LBE322:
.LBB323:
	.stabn	68,0,1065,.LM387-.LFBB53
.LM387:
	call step_duplex_mode
	sub r28,r24
	call min_duplex_mode
	cp r28,r24
	brlo .L347
.L345:
.LBE323:
.LBB324:
	.stabn	68,0,1072,.LM388-.LFBB53
.LM388:
	mov r24,r28
	call set_duplex_mode
	rjmp .L340
.L336:
.LBE324:
	.stabn	68,0,1072,.LM389-.LFBB53
.LM389:
	call is_invalid_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L340
	.stabn	68,0,1072,.LM390-.LFBB53
.LM390:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L340
.LBB325:
	.stabn	68,0,1072,.LM391-.LFBB53
.LM391:
	call get_duplex_mode
	mov r28,r24
	call step_duplex_mode
	add r28,r24
	call max_duplex_mode
	cp r24,r28
	brsh .L345
	.stabn	68,0,1072,.LM392-.LFBB53
.LM392:
	call min_duplex_mode
	rjmp .L346
.LBE325:
	.size	duplex_mode_setup, .-duplex_mode_setup
.Lscope53:
	.stabs	"clock_setup:f(0,8)",36,0,0,clock_setup
	.stabs	"duplex_mode_t:t(0,23)=(0,2)",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,24
	.type	clock_setup, @function
clock_setup:
	.stabn	68,0,916,.LM393-.LFBB54
.LM393:
.LFBB54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,917,.LM394-.LFBB54
.LM394:
	cpi r24,lo8(32)
	breq .L349
	brsh .L350
	cpi r24,lo8(8)
	breq .L351
	cpi r24,lo8(16)
	breq .L352
	ret
.L350:
	cpi r24,lo8(-112)
	breq .L352
	cpi r24,lo8(-96)
	breq .L349
	ret
.L351:
.LBB338:
.LBB339:
	.stabn	68,0,921,.LM395-.LFBB54
.LM395:
	call rtc_get_setup
	.stabn	68,0,921,.LM396-.LFBB54
.LM396:
	sbiw r24,1
	brne .L354
	.stabn	68,0,922,.LM397-.LFBB54
.LM397:
	ldi r24,lo8(2)
	ldi r25,0
.L368:
	.stabn	68,0,924,.LM398-.LFBB54
.LM398:
	call rtc_setup
.L369:
.LBE339:
.LBE338:
.LBB341:
.LBB342:
	.stabn	68,0,323,.LM399-.LFBB54
.LM399:
	ldi r24,lo8(1)
	sts menu+7,r24
/* epilogue start */
.LBE342:
.LBE341:
	.stabn	68,0,940,.LM400-.LFBB54
.LM400:
	ret
.L354:
.LBB343:
.LBB340:
	.stabn	68,0,924,.LM401-.LFBB54
.LM401:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L368
.L349:
.LBE340:
.LBE343:
	.stabn	68,0,930,.LM402-.LFBB54
.LM402:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L370:
	.stabn	68,0,936,.LM403-.LFBB54
.LM403:
	call rtc_inc
	rjmp .L369
.L352:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L370
	.size	clock_setup, .-clock_setup
.Lscope54:
	.type	rem_detect_check_handler, @function
rem_detect_check_handler:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	rem_detect_check_handler, .-rem_detect_check_handler
	.stabs	"update_menu:f(0,8)",36,0,0,update_menu
	.type	update_menu, @function
update_menu:
	.stabn	68,0,536,.LM404-.LFBB55
.LM404:
.LFBB55:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 15 */
/* stack size = 21 */
.L__stack_usage = 21
.LBB361:
.LBB362:
	.stabn	68,0,461,.LM405-.LFBB55
.LM405:
	call get_addr
.LBB363:
.LBB364:
	.stabn	68,0,366,.LM406-.LFBB55
.LM406:
	movw r30,r24
	adiw r30,10
/* #APP */
 ;  366 "src/ds_menu.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r16,r28
	subi r16,-1
	sbci r17,-1
.LBE364:
.LBE363:
.LBE362:
.LBE361:
	.stabn	68,0,542,.LM407-.LFBB55
.LM407:
	tst r30
	breq .L373
.LBB365:
.LBB366:
	.stabn	68,0,485,.LM408-.LFBB55
.LM408:
	call get_addr
.LBB367:
.LBB368:
.LBB369:
	.stabn	68,0,399,.LM409-.LFBB55
.LM409:
	movw r30,r24
	adiw r30,17
/* #APP */
 ;  399 "src/ds_menu.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE369:
.LBE368:
.LBE367:
.LBE366:
.LBE365:
	.stabn	68,0,545,.LM410-.LFBB55
.LM410:
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	sbiw r24,0
	breq .L374
	.stabn	68,0,545,.LM411-.LFBB55
.LM411:
	movw r30,r24
	eicall
	.stabn	68,0,545,.LM412-.LFBB55
.LM412:
	mov r14,r24
	mov r15,__zero_reg__
.L374:
.LBB370:
.LBB371:
	.stabn	68,0,455,.LM413-.LFBB55
.LM413:
	call get_addr
	movw r22,r24
.LBB372:
.LBB373:
	.stabn	68,0,359,.LM414-.LFBB55
.LM414:
	movw r24,r16
	call strcpy_P
.LBE373:
.LBE372:
.LBE371:
.LBE370:
	.stabn	68,0,545,.LM415-.LFBB55
.LM415:
	push r15
	push r14
	push r17
	push r16
	push __zero_reg__
	ldi r24,lo8(5)
	push r24
	movw r16,r28
	subi r16,-11
	sbci r17,-1
	push r17
	push r16
	call snprintf
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
.L377:
	.stabn	68,0,549,.LM416-.LFBB55
.LM416:
	movw r24,r16
	.stabn	68,0,551,.LM417-.LFBB55
.LM417:
	ldi r22,lo8(1)
	ldi r23,0
	call disp_msg
/* epilogue start */
	.stabn	68,0,552,.LM418-.LFBB55
.LM418:
	adiw r28,15
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
.L373:
.LBB374:
.LBB375:
	.stabn	68,0,455,.LM419-.LFBB55
.LM419:
	call get_addr
	movw r22,r24
.LBB376:
.LBB377:
	.stabn	68,0,359,.LM420-.LFBB55
.LM420:
	movw r24,r16
	call strcpy_P
	rjmp .L377
.LBE377:
.LBE376:
.LBE375:
.LBE374:
	.size	update_menu, .-update_menu
	.stabs	"temp:(0,24)=ar(0,25)=r(0,25);0;65535;;0;9;(0,26)=r(0,26);0;255;",128,0,0,1
	.stabs	"char:t(0,26)",128,0,0,0
	.stabs	"buf:(0,27)=ar(0,25);0;4;(0,26)",128,0,0,11
	.stabn	192,0,0,.LFBB55-.LFBB55
	.stabs	"__addr16:r(0,6)",64,0,0,30
	.stabn	192,0,0,.LBB369-.LFBB55
	.stabn	224,0,0,.LBE369-.LFBB55
	.stabn	224,0,0,.Lscope55-.LFBB55
.Lscope55:
	.stabs	"menu_init:F(0,8)",36,0,0,menu_init
.global	menu_init
	.type	menu_init, @function
menu_init:
	.stabn	68,0,559,.LM421-.LFBB56
.LM421:
.LFBB56:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,560,.LM422-.LFBB56
.LM422:
	ldi r30,lo8(menu)
	ldi r31,hi8(menu)
	ldi r24,lo8(8)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,562,.LM423-.LFBB56
.LM423:
	ldi r24,lo8(-1)
	std Z+6,r24
	.stabn	68,0,563,.LM424-.LFBB56
.LM424:
	ldi r24,lo8(18)
	std Z+1,r24
/* epilogue start */
	.stabn	68,0,564,.LM425-.LFBB56
.LM425:
	ret
	.size	menu_init, .-menu_init
.Lscope56:
	.stabs	"menu_enter:F(0,8)",36,0,0,menu_enter
.global	menu_enter
	.type	menu_enter, @function
menu_enter:
	.stabn	68,0,567,.LM426-.LFBB57
.LM426:
.LFBB57:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM427-.LFBB57
.LM427:
	ldi r30,lo8(menu)
	ldi r31,hi8(menu)
	std Z+6,__zero_reg__
	.stabn	68,0,569,.LM428-.LFBB57
.LM428:
	st Z,__zero_reg__
	.stabn	68,0,571,.LM429-.LFBB57
.LM429:
	jmp update_menu
	.size	menu_enter, .-menu_enter
.Lscope57:
	.stabs	"menu_is_active:F(0,28)=r(0,28);-32768;32767;",36,0,0,menu_is_active
	.stabs	"int:t(0,28)",128,0,0,0
.global	menu_is_active
	.type	menu_is_active, @function
menu_is_active:
	.stabn	68,0,575,.LM430-.LFBB58
.LM430:
.LFBB58:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM431-.LFBB58
.LM431:
	lds r24,menu+6
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	com r24
	com r25
	.stabn	68,0,577,.LM432-.LFBB58
.LM432:
	mov r24,r25
	rol r24
	clr r24
	rol r24
	ldi r25,0
/* epilogue start */
	ret
	.size	menu_is_active, .-menu_is_active
.Lscope58:
	.stabs	"menu_process:F(0,28)",36,0,0,menu_process
	.stabs	"e_menu_process_flag:T(0,29)=eMENU_UNHANDLED:0,MENU_HANDLED:1,MENU_ITEM_EXIT:2,MENU_EXIT:4,;",128,0,0,0
	.stabs	"key_event:P(0,3)",64,0,0,29
.global	menu_process
	.type	menu_process, @function
menu_process:
	.stabn	68,0,580,.LM433-.LFBB59
.LM433:
.LFBB59:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
.LBB436:
.LBB437:
	.stabn	68,0,576,.LM434-.LFBB59
.LM434:
	lds r28,menu+6
.LBE437:
.LBE436:
	.stabn	68,0,586,.LM435-.LFBB59
.LM435:
	ldi r25,0
	ldi r24,0
	.stabn	68,0,585,.LM436-.LFBB59
.LM436:
	sbrc r28,7
	rjmp .L381
.LBB438:
.LBB439:
	.stabn	68,0,317,.LM437-.LFBB59
.LM437:
	sts menu+7,__zero_reg__
.LBE439:
.LBE438:
.LBB440:
.LBB441:
	.stabn	68,0,343,.LM438-.LFBB59
.LM438:
	mov r24,r28
	mov __tmp_reg__,r28
	lsl r0
	sbc r25,r25
	mov r30,r28
	lsl r30
	sbc r31,r31
	.stabn	68,0,343,.LM439-.LFBB59
.LM439:
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
.LBE441:
.LBE440:
	.stabn	68,0,591,.LM440-.LFBB59
.LM440:
	ldd r24,Z+2
	.stabn	68,0,590,.LM441-.LFBB59
.LM441:
	cpi r29,lo8(-124)
	brne .L383
	.stabn	68,0,591,.LM442-.LFBB59
.LM442:
	tst r24
	breq .L385
.LBB442:
.LBB443:
	.stabn	68,0,473,.LM443-.LFBB59
.LM443:
	call get_addr
.LBB444:
.LBB445:
.LBB446:
	.stabn	68,0,380,.LM444-.LFBB59
.LM444:
	movw r30,r24
	adiw r30,13
/* #APP */
 ;  380 "src/ds_menu.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE446:
.LBE445:
.LBE444:
.LBE443:
.LBE442:
	.stabn	68,0,594,.LM445-.LFBB59
.LM445:
	sbiw r24,0
	breq .L385
	.stabn	68,0,595,.LM446-.LFBB59
.LM446:
	movw r30,r24
	eicall
.L385:
.LBB447:
.LBB448:
	.stabn	68,0,514,.LM447-.LFBB59
.LM447:
	lds r24,menu+6
	.stabn	68,0,514,.LM448-.LFBB59
.LM448:
	cpse r24,__zero_reg__
	rjmp .L387
.L388:
.LBE448:
.LBE447:
.LBB450:
.LBB451:
	.stabn	68,0,335,.LM449-.LFBB59
.LM449:
	ldi r24,lo8(-1)
	sts menu+6,r24
	.stabn	68,0,337,.LM450-.LFBB59
.LM450:
	ldi r24,lo8(5)
	sts menu+7,r24
.LBE451:
.LBE450:
	.stabn	68,0,598,.LM451-.LFBB59
.LM451:
	ldi r24,lo8(5)
	ldi r25,0
.L381:
/* epilogue start */
	.stabn	68,0,655,.LM452-.LFBB59
.LM452:
	pop r29
	pop r28
	ret
.L387:
.LBB452:
.LBB449:
	.stabn	68,0,517,.LM453-.LFBB59
.LM453:
	subi r24,lo8(-(-1))
	sts menu+6,r24
.LBE449:
.LBE452:
	.stabn	68,0,597,.LM454-.LFBB59
.LM454:
	sbrc r24,7
	rjmp .L388
	.stabn	68,0,599,.LM455-.LFBB59
.LM455:
	call update_menu
.LBB453:
.LBB454:
	.stabn	68,0,323,.LM456-.LFBB59
.LM456:
	ldi r24,lo8(1)
	sts menu+7,r24
.LBE454:
.LBE453:
	.stabn	68,0,600,.LM457-.LFBB59
.LM457:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L381
.L383:
	.stabn	68,0,603,.LM458-.LFBB59
.LM458:
	cpse r24,__zero_reg__
	rjmp .L389
	.stabn	68,0,604,.LM459-.LFBB59
.LM459:
	cpi r29,lo8(4)
	breq .L390
	cpi r29,lo8(8)
	breq .L391
.L392:
	.stabn	68,0,654,.LM460-.LFBB59
.LM460:
	lds r24,menu+7
	ldi r25,0
	rjmp .L381
.L390:
.LBB455:
.LBB456:
	.stabn	68,0,527,.LM461-.LFBB59
.LM461:
	ld r24,Z
	ldi r25,0
	.stabn	68,0,527,.LM462-.LFBB59
.LM462:
	adiw r24,1
	.stabn	68,0,527,.LM463-.LFBB59
.LM463:
	ldd r22,Z+1
	ldi r23,0
	.stabn	68,0,527,.LM464-.LFBB59
.LM464:
	call __divmodhi4
	.stabn	68,0,527,.LM465-.LFBB59
.LM465:
	st Z,r24
.L414:
.LBE456:
.LBE455:
	.stabn	68,0,635,.LM466-.LFBB59
.LM466:
	call update_menu
	rjmp .L413
.L391:
.LBB457:
.LBB458:
	.stabn	68,0,491,.LM467-.LFBB59
.LM467:
	call get_addr
.LBB459:
.LBB460:
	.stabn	68,0,422,.LM468-.LFBB59
.LM468:
	movw r30,r24
	adiw r30,21
/* #APP */
 ;  422 "src/ds_menu.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE460:
.LBE459:
.LBE458:
.LBE457:
	.stabn	68,0,614,.LM469-.LFBB59
.LM469:
	tst r30
	breq .L393
.LBB461:
.LBB462:
.LBB463:
.LBB464:
	.stabn	68,0,491,.LM470-.LFBB59
.LM470:
	call get_addr
.LBB465:
.LBB466:
	.stabn	68,0,422,.LM471-.LFBB59
.LM471:
	movw r30,r24
	adiw r30,21
/* #APP */
 ;  422 "src/ds_menu.c" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE466:
.LBE465:
.LBE464:
.LBE463:
	.stabn	68,0,505,.LM472-.LFBB59
.LM472:
	subi r28,lo8(-(1))
	.stabn	68,0,505,.LM473-.LFBB59
.LM473:
	sts menu+6,r28
	.stabn	68,0,507,.LM474-.LFBB59
.LM474:
	mov r26,r28
	lsl r26
	sbc r27,r27
	add r26,r28
	adc r27,__zero_reg__
	sbrc r28,7
	dec r27
	subi r26,lo8(-(menu))
	sbci r27,hi8(-(menu))
	st X,__zero_reg__
	.stabn	68,0,508,.LM475-.LFBB59
.LM475:
	adiw r26,1
	st X,r30
	rjmp .L414
.L393:
.LBE462:
.LBE461:
.LBB467:
.LBB468:
	.stabn	68,0,467,.LM476-.LFBB59
.LM476:
	call get_addr
.LBB469:
.LBB470:
.LBB471:
	.stabn	68,0,372,.LM477-.LFBB59
.LM477:
	movw r30,r24
	adiw r30,11
/* #APP */
 ;  372 "src/ds_menu.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE471:
.LBE470:
.LBE469:
.LBE468:
.LBE467:
	.stabn	68,0,619,.LM478-.LFBB59
.LM478:
	sbiw r24,0
	breq .L395
	.stabn	68,0,620,.LM479-.LFBB59
.LM479:
	movw r30,r24
	eicall
.L395:
.LBB472:
.LBB473:
	.stabn	68,0,349,.LM480-.LFBB59
.LM480:
	lds r24,menu+6
	.stabn	68,0,349,.LM481-.LFBB59
.LM481:
	mov r30,r24
	lsl r30
	sbc r31,r31
	add r30,r24
	adc r31,__zero_reg__
	sbrc r24,7
	dec r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	ldi r24,lo8(1)
	std Z+2,r24
.L413:
.LBE473:
.LBE472:
.LBB474:
.LBB475:
	.stabn	68,0,323,.LM482-.LFBB59
.LM482:
	ldi r24,lo8(1)
	sts menu+7,r24
	rjmp .L392
.L389:
.LBE475:
.LBE474:
	.stabn	68,0,628,.LM483-.LFBB59
.LM483:
	cpi r29,lo8(4)
	brne .L396
.LBB476:
.LBB477:
	.stabn	68,0,473,.LM484-.LFBB59
.LM484:
	call get_addr
.LBB478:
.LBB479:
.LBB480:
	.stabn	68,0,380,.LM485-.LFBB59
.LM485:
	movw r30,r24
	adiw r30,13
/* #APP */
 ;  380 "src/ds_menu.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE480:
.LBE479:
.LBE478:
.LBE477:
.LBE476:
	.stabn	68,0,631,.LM486-.LFBB59
.LM486:
	sbiw r24,0
	breq .L397
	.stabn	68,0,632,.LM487-.LFBB59
.LM487:
	movw r30,r24
	eicall
.L397:
.LBB481:
.LBB482:
	.stabn	68,0,349,.LM488-.LFBB59
.LM488:
	lds r24,menu+6
	.stabn	68,0,349,.LM489-.LFBB59
.LM489:
	mov r30,r24
	lsl r30
	sbc r31,r31
	add r30,r24
	adc r31,__zero_reg__
	sbrc r24,7
	dec r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	std Z+2,__zero_reg__
	rjmp .L414
.L396:
.LBE482:
.LBE481:
.LBB483:
.LBB484:
	.stabn	68,0,479,.LM490-.LFBB59
.LM490:
	call get_addr
.LBB485:
.LBB486:
.LBB487:
	.stabn	68,0,389,.LM491-.LFBB59
.LM491:
	movw r30,r24
	adiw r30,15
/* #APP */
 ;  389 "src/ds_menu.c" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE487:
.LBE486:
.LBE485:
.LBE484:
.LBE483:
	.stabn	68,0,642,.LM492-.LFBB59
.LM492:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L392
	.stabn	68,0,643,.LM493-.LFBB59
.LM493:
	mov r24,r29
	movw r30,r18
	eicall
	.stabn	68,0,645,.LM494-.LFBB59
.LM494:
	lds r24,menu+7
	sbrs r24,1
	rjmp .L392
.LBB488:
.LBB489:
	.stabn	68,0,349,.LM495-.LFBB59
.LM495:
	lds r24,menu+6
	.stabn	68,0,349,.LM496-.LFBB59
.LM496:
	mov r30,r24
	lsl r30
	sbc r31,r31
	add r30,r24
	adc r31,__zero_reg__
	sbrc r24,7
	dec r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	std Z+2,__zero_reg__
.LBE489:
.LBE488:
	.stabn	68,0,647,.LM497-.LFBB59
.LM497:
	call update_menu
	rjmp .L392
	.size	menu_process, .-menu_process
	.stabs	"__addr16:r(0,6)",64,0,0,30
	.stabn	192,0,0,.LBB446-.LFBB59
	.stabn	224,0,0,.LBE446-.LFBB59
	.stabs	"__addr16:r(0,6)",64,0,0,30
	.stabn	192,0,0,.LBB471-.LFBB59
	.stabn	224,0,0,.LBE471-.LFBB59
	.stabs	"__addr16:r(0,6)",64,0,0,30
	.stabn	192,0,0,.LBB480-.LFBB59
	.stabn	224,0,0,.LBE480-.LFBB59
	.stabs	"__addr16:r(0,6)",64,0,0,30
	.stabn	192,0,0,.LBB487-.LFBB59
	.stabn	224,0,0,.LBE487-.LFBB59
.Lscope59:
	.local	menu
	.comm	menu,8,1
	.stabs	"menu:S(0,30)=(0,31)=xss_menu:",40,0,0,menu
	.stabs	"s_menu:T(0,31)=s8plane:(0,32)=ar(0,25);0;1;(0,33)=(0,34)=xss_menu_plane:,0,48;level:(0,4),48,8;res:(0,2),56,8;;",128,0,0,0
	.stabs	"menu_t:t(0,30)",128,0,0,0
	.stabs	"s_menu_plane:T(0,34)=s3index:(0,2),0,8;count:(0,2),8,8;is_active:(0,2),16,8;;",128,0,0,0
.global	menu_desc
	.section	.progmem.data,"a",@progbits
	.type	menu_desc, @object
	.size	menu_desc, 396
menu_desc:
	.string	"CLSE"
	.zero	5
	.zero	1
	.word	gs(clock_setup_activate)
	.word	gs(clock_setup_exit)
	.word	gs(clock_setup)
	.zero	5
	.string	"UtSE"
	.zero	5
	.zero	1
	.word	gs(wakeup_timer_setup_activate)
	.word	gs(disable_input_hold_repeat)
	.word	gs(wakeup_timer_setup)
	.zero	5
	.string	"EnSE"
	.zero	5
	.zero	9
	.word	menu12_desc
	.byte	9
	.string	"COtr"
	.zero	5
	.zero	1
	.word	gs(trigger_counter_display)
	.zero	9
	.string	"HItr"
	.zero	5
	.zero	1
	.word	gs(trigger_times_activate)
	.word	gs(disable_input_hold_repeat)
	.word	gs(trigger_times_handler)
	.zero	5
	.string	"d-%.2i"
	.zero	3
	.byte	2
	.word	gs(rem_detect_sensitivity_setup_activate)
	.word	gs(disable_input_hold_repeat)
	.word	gs(rem_detect_sensitivity_setup)
	.word	gs(get_rem_detect_sensitivity)
	.zero	3
	.string	"du-%i"
	.zero	4
	.byte	1
	.word	gs(duplex_mode_setup_activate)
	.zero	2
	.word	gs(duplex_mode_setup)
	.word	gs(get_duplex_mode)
	.zero	3
	.string	"UP-%i"
	.zero	4
	.byte	1
	.word	gs(wakeup_mode_setup_activate)
	.zero	2
	.word	gs(wakeup_mode_setup)
	.word	gs(get_wakeup_mode)
	.zero	3
	.string	"AL-%i"
	.zero	4
	.byte	1
	.word	gs(alarm_clock_setup_activate)
	.zero	2
	.word	gs(alarm_clock_setup)
	.word	gs(get_alarm_clock)
	.zero	3
	.string	"Fr-%i"
	.zero	4
	.byte	1
	.word	gs(hints_frequency_setup_activate)
	.zero	2
	.word	gs(hints_frequency_setup)
	.word	gs(get_hints_frequency)
	.zero	3
	.string	"Od-%i"
	.zero	4
	.byte	1
	.word	gs(hints_duty_cycle_setup_activate)
	.zero	2
	.word	gs(hints_duty_cycle_setup)
	.word	gs(get_hints_duty_cycle)
	.zero	3
	.string	"br-%i"
	.zero	4
	.byte	1
	.word	gs(light_hints_brightness_setup_activate)
	.zero	2
	.word	gs(light_hints_brightness_setup)
	.word	gs(get_light_hints_brightness)
	.zero	3
	.string	"LE-%i"
	.zero	4
	.byte	1
	.word	gs(sound_hints_volume_setup_activate)
	.zero	2
	.word	gs(sound_hints_volume_setup)
	.word	gs(get_sound_hints_volume)
	.zero	3
	.string	"F-%.2i"
	.zero	3
	.byte	2
	.word	gs(light_hints_duration_setup_activate)
	.word	gs(disable_input_hold_repeat)
	.word	gs(light_hints_duration_setup)
	.word	gs(get_light_hints_duration)
	.zero	3
	.string	"S-%.2i"
	.zero	3
	.byte	2
	.word	gs(sound_hints_duration_setup_activate)
	.word	gs(disable_input_hold_repeat)
	.word	gs(sound_hints_duration_setup)
	.word	gs(get_sound_hints_duration)
	.zero	3
	.string	"CHUP"
	.zero	5
	.zero	5
	.word	gs(wakeup_signal_check_handler)
	.zero	5
	.string	"CHdt"
	.zero	5
	.zero	5
	.word	gs(rem_detect_check_handler)
	.zero	5
	.string	"SEdt"
	.zero	5
	.zero	1
	.word	gs(set_defaults_activate)
	.zero	2
	.word	gs(set_defaults_handler)
	.zero	5
	.stabs	"menu_desc:G(0,35)=ar(0,25);0;17;(0,36)=(0,37)=xss_menu_desc:",32,0,0,0
	.stabs	"s_menu_desc:T(0,37)=s22label:(0,24),0,80;fmt:(0,2),80,8;activate:(0,38)=(0,39)=*(0,40)=f(0,8),88,16;exit:(0,41)=(0,39),104,16;handler:(0,42)=(0,43)=*(0,44)=f(0,8),120,16;read_value:(0,45)=(0,46)=*(0,47)=f(0,2),136,16;sub_items:(0,48)=*(0,36),152,16;sub_count:(0,2),168,8;;",128,0,0,0
	.stabs	"pfn_activate:t(0,38)",128,0,0,0
	.stabs	"pfn_exit:t(0,41)",128,0,0,0
	.stabs	"pfn_handler:t(0,42)",128,0,0,0
	.stabs	"pfn_value_read:t(0,45)",128,0,0,0
.global	menu12_desc
	.type	menu12_desc, @object
	.size	menu12_desc, 198
menu12_desc:
	.string	"bE-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_be_setup_activate)
	.zero	2
	.word	gs(enhanced_be_setup)
	.word	gs(get_before_hints_message)
	.zero	3
	.string	"AF-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_af_setup_activate)
	.zero	2
	.word	gs(enhanced_af_setup)
	.word	gs(get_after_hints_message)
	.zero	3
	.string	"Sc-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_sc_setup_activate)
	.zero	2
	.word	gs(enhanced_sc_setup)
	.word	gs(get_sleep_scenario_playback)
	.zero	3
	.string	"rd-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_rd_setup_activate)
	.zero	2
	.word	gs(enhanced_rd_setup)
	.word	gs(get_voice_recording)
	.zero	3
	.string	"LE-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_vol_setup_activate)
	.zero	2
	.word	gs(enhanced_vol_setup)
	.word	gs(get_volume_level)
	.zero	3
	.string	"tu-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_tu_setup_activate)
	.zero	2
	.word	gs(enhanced_tu_setup)
	.word	gs(get_relax_tunes_playback)
	.zero	3
	.string	"dELr"
	.zero	5
	.zero	1
	.word	gs(enhanced_del_records_activate)
	.zero	2
	.word	gs(enhanced_del_records)
	.zero	5
	.string	"FL-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_fl_setup_activate)
	.zero	2
	.word	gs(enhanced_fl_setup)
	.word	gs(get_vibration_level)
	.zero	3
	.string	"SP-%i"
	.zero	4
	.byte	1
	.word	gs(enhanced_sp_setup_activate)
	.zero	2
	.word	gs(enhanced_sp_setup)
	.word	gs(get_speaker_enabled)
	.zero	3
	.stabs	"menu12_desc:G(0,49)=ar(0,25);0;8;(0,36)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
