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
	.stabs	"set_handled:f(0,1)=(0,1)",36,0,0,set_handled
	.stabs	"e_menu_process_flag:T(0,2)=eMENU_UNHANDLED:0,MENU_HANDLED:1,MENU_RETURN:2,MENU_EXIT:4,;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.type	set_handled, @function
set_handled:
	.stabn	68,0,346,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,347,.LM1-.LFBB1
.LM1:
	ldi r30,lo8(menu+5)
	ldi r31,hi8(menu+5)
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
/* epilogue start */
	.stabn	68,0,348,.LM2-.LFBB1
.LM2:
	ret
	.size	set_handled, .-set_handled
.Lscope1:
	.stabs	"get_addr:f(0,3)=*(0,4)=(0,5)=r(0,5);0;255;",36,0,0,get_addr
	.stabs	"uint8_t:t(0,4)",128,0,0,0
	.stabs	"unsigned char:t(0,5)",128,0,0,0
	.type	get_addr, @function
get_addr:
	.stabn	68,0,451,.LM3-.LFBB2
.LM3:
.LFBB2:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,452,.LM4-.LFBB2
.LM4:
	lds r18,menu+4
	mov __tmp_reg__,r18
	lsl r0
	sbc r19,r19
.LBB17:
.LBB18:
	.stabn	68,0,439,.LM5-.LFBB2
.LM5:
	ldi r20,0
	.stabn	68,0,438,.LM6-.LFBB2
.LM6:
	ldi r24,lo8(desc_root)
	ldi r25,hi8(desc_root)
	.stabn	68,0,441,.LM7-.LFBB2
.LM7:
	ldi r28,lo8(23)
.L4:
	.stabn	68,0,441,.LM8-.LFBB2
.LM8:
	mov r22,r20
	mov __tmp_reg__,r20
	lsl r0
	sbc r23,r23
	mov r30,r20
	lsl r30
	sbc r31,r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	ld r21,Z
	andi r21,lo8(31)
	.stabn	68,0,441,.LM9-.LFBB2
.LM9:
	mul r21,r28
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	.stabn	68,0,442,.LM10-.LFBB2
.LM10:
	cp r22,r18
	cpc r23,r19
	brge .L3
.LBB19:
.LBB20:
.LBB21:
	.stabn	68,0,425,.LM11-.LFBB2
.LM11:
	adiw r24,20
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  425 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.L3:
	subi r20,lo8(-(1))
.LBE21:
.LBE20:
.LBE19:
	.stabn	68,0,444,.LM12-.LFBB2
.LM12:
	cp r22,r18
	cpc r23,r19
	brlt .L4
/* epilogue start */
.LBE18:
.LBE17:
	.stabn	68,0,453,.LM13-.LFBB2
.LM13:
	pop r28
	ret
	.size	get_addr, .-get_addr
	.stabs	"addr:r(0,3)",64,0,0,24
	.stabs	"l:r(0,6)=(0,7)=r(0,7);-128;127;",64,0,0,20
	.stabs	"int8_t:t(0,6)",128,0,0,0
	.stabs	"signed char:t(0,7)",128,0,0,0
	.stabn	192,0,0,.LBB18-.LFBB2
	.stabs	"uint16_t:t(0,8)=(0,9)=r(0,9);0;65535;",128,0,0,0
	.stabs	"unsigned int:t(0,9)",128,0,0,0
	.stabn	224,0,0,.LBE18-.LFBB2
.Lscope2:
	.stabs	"get_exit_func:f(0,10)=(0,11)=*(0,12)=f(0,1)",36,0,0,get_exit_func
	.stabs	"pfn_exit:t(0,10)",128,0,0,0
	.type	get_exit_func, @function
get_exit_func:
	.stabn	68,0,475,.LM14-.LFBB3
.LM14:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,476,.LM15-.LFBB3
.LM15:
	call get_addr
.LBB25:
.LBB26:
.LBB27:
	.stabn	68,0,404,.LM16-.LFBB3
.LM16:
	adiw r24,14
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  404 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE27:
.LBE26:
.LBE25:
	.stabn	68,0,477,.LM17-.LFBB3
.LM17:
	ret
	.size	get_exit_func, .-get_exit_func
.Lscope3:
	.stabs	"trigger_times_handler:f(0,1)",36,0,0,trigger_times_handler
	.stabs	"key_event:P(0,13)=(0,4)",64,0,0,24
	.stabs	"keybrd_event_t:t(0,13)",128,0,0,0
	.type	trigger_times_handler, @function
trigger_times_handler:
	.stabn	68,0,1055,.LM18-.LFBB4
.LM18:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,1066,.LM19-.LFBB4
.LM19:
	ret
	.size	trigger_times_handler, .-trigger_times_handler
.Lscope4:
	.stabs	"ense_speaker_setup_activate:f(0,1)",36,0,0,ense_speaker_setup_activate
	.type	ense_speaker_setup_activate, @function
ense_speaker_setup_activate:
	.stabn	68,0,933,.LM20-.LFBB5
.LM20:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,934,.LM21-.LFBB5
.LM21:
	call get_loud_speaker
	jmp disp_flag
	.size	ense_speaker_setup_activate, .-ense_speaker_setup_activate
.Lscope5:
	.stabs	"ense_recording_setup_activate:f(0,1)",36,0,0,ense_recording_setup_activate
	.type	ense_recording_setup_activate, @function
ense_recording_setup_activate:
	.stabn	68,0,742,.LM22-.LFBB6
.LM22:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,743,.LM23-.LFBB6
.LM23:
	call get_voice_recording
	jmp disp_flag
	.size	ense_recording_setup_activate, .-ense_recording_setup_activate
.Lscope6:
	.stabs	"ense_af_setup_activate:f(0,1)",36,0,0,ense_af_setup_activate
	.type	ense_af_setup_activate, @function
ense_af_setup_activate:
	.stabn	68,0,685,.LM24-.LFBB7
.LM24:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,686,.LM25-.LFBB7
.LM25:
	call get_after_hints_message
	jmp disp_flag
	.size	ense_af_setup_activate, .-ense_af_setup_activate
.Lscope7:
	.stabs	"ense_be_setup_activate:f(0,1)",36,0,0,ense_be_setup_activate
	.type	ense_be_setup_activate, @function
ense_be_setup_activate:
	.stabn	68,0,666,.LM26-.LFBB8
.LM26:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,667,.LM27-.LFBB8
.LM27:
	call get_before_hints_message
	jmp disp_flag
	.size	ense_be_setup_activate, .-ense_be_setup_activate
.Lscope8:
	.stabs	"ense_fl_setup:f(0,1)",36,0,0,ense_fl_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_fl_setup, @function
ense_fl_setup:
	.stabn	68,0,904,.LM28-.LFBB9
.LM28:
.LFBB9:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,905,.LM29-.LFBB9
.LM29:
	cpi r24,lo8(32)
	breq .L13
	brsh .L14
	cpi r24,lo8(8)
	breq .L15
	cpi r24,lo8(16)
	breq .L16
.L12:
/* epilogue start */
	.stabn	68,0,930,.LM30-.LFBB9
.LM30:
	pop r28
	ret
.L14:
	.stabn	68,0,905,.LM31-.LFBB9
.LM31:
	cpi r24,lo8(-112)
	breq .L16
	cpi r24,lo8(-96)
	brne .L12
.L13:
	.stabn	68,0,916,.LM32-.LFBB9
.LM32:
	call is_readonly_vibration_level
	cpse r24,__zero_reg__
	rjmp .L22
.LBB28:
	.stabn	68,0,916,.LM33-.LFBB9
.LM33:
	call get_vibration_level
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L20
.L39:
	.stabn	68,0,916,.LM34-.LFBB9
.LM34:
	call max_vibration_level
.L41:
.LBE28:
.LBB29:
	.stabn	68,0,924,.LM35-.LFBB9
.LM35:
	mov r28,r24
	rjmp .L23
.L15:
.LBE29:
	.stabn	68,0,908,.LM36-.LFBB9
.LM36:
	call get_vibration_level
	.stabn	68,0,908,.LM37-.LFBB9
.LM37:
	tst r24
	breq .L40
	.stabn	68,0,909,.LM38-.LFBB9
.LM38:
	call get_vibration_level
	mov r22,r24
	ldi r24,lo8(-48)
	ldi r25,lo8(7)
	call vibro_on
.L40:
/* epilogue start */
	.stabn	68,0,930,.LM39-.LFBB9
.LM39:
	pop r28
	.stabn	68,0,927,.LM40-.LFBB9
.LM40:
	jmp set_handled
.L20:
.LBB30:
	.stabn	68,0,916,.LM41-.LFBB9
.LM41:
	call step_vibration_level
	sub r28,r24
	call min_vibration_level
	cp r28,r24
	brlo .L39
.L23:
.LBE30:
.LBB31:
	.stabn	68,0,924,.LM42-.LFBB9
.LM42:
	mov r24,r28
	call set_vibration_level
.L22:
.LBE31:
	.stabn	68,0,926,.LM43-.LFBB9
.LM43:
	call get_vibration_level
	.stabn	68,0,926,.LM44-.LFBB9
.LM44:
	ldi r25,0
	call disp_num
	rjmp .L40
.L16:
	.stabn	68,0,924,.LM45-.LFBB9
.LM45:
	call is_readonly_vibration_level
	cpse r24,__zero_reg__
	rjmp .L22
.LBB32:
	.stabn	68,0,924,.LM46-.LFBB9
.LM46:
	call get_vibration_level
	mov r28,r24
	call step_vibration_level
	add r28,r24
	call max_vibration_level
	cp r24,r28
	brsh .L23
	.stabn	68,0,924,.LM47-.LFBB9
.LM47:
	call min_vibration_level
	rjmp .L41
.LBE32:
	.size	ense_fl_setup, .-ense_fl_setup
.Lscope9:
	.stabs	"ense_fl_setup_activate:f(0,1)",36,0,0,ense_fl_setup_activate
	.stabs	"vibration_level_t:t(0,14)=(0,4)",128,0,0,0
	.type	ense_fl_setup_activate, @function
ense_fl_setup_activate:
	.stabn	68,0,899,.LM48-.LFBB10
.LM48:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,900,.LM49-.LFBB10
.LM49:
	call get_vibration_level
	.stabn	68,0,900,.LM50-.LFBB10
.LM50:
	ldi r25,0
	jmp disp_num
	.size	ense_fl_setup_activate, .-ense_fl_setup_activate
.Lscope10:
	.stabs	"disp_relax_tunes_playback:f(0,1)",36,0,0,disp_relax_tunes_playback
	.type	disp_relax_tunes_playback, @function
disp_relax_tunes_playback:
	.stabn	68,0,843,.LM51-.LFBB11
.LM51:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,844,.LM52-.LFBB11
.LM52:
	call get_relax_tunes_playback
	.stabn	68,0,844,.LM53-.LFBB11
.LM53:
	ldi r25,0
	jmp disp_num
	.size	disp_relax_tunes_playback, .-disp_relax_tunes_playback
.Lscope11:
	.stabs	"ense_tunes_setup_activate:f(0,1)",36,0,0,ense_tunes_setup_activate
	.type	ense_tunes_setup_activate, @function
ense_tunes_setup_activate:
	.stabn	68,0,848,.LM54-.LFBB12
.LM54:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,849,.LM55-.LFBB12
.LM55:
	jmp disp_relax_tunes_playback
	.size	ense_tunes_setup_activate, .-ense_tunes_setup_activate
.Lscope12:
	.stabs	"ense_music_volume_setup_activate:f(0,1)",36,0,0,ense_music_volume_setup_activate
	.type	ense_music_volume_setup_activate, @function
ense_music_volume_setup_activate:
	.stabn	68,0,815,.LM56-.LFBB13
.LM56:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,816,.LM57-.LFBB13
.LM57:
	call get_music_volume_level
	.stabn	68,0,816,.LM58-.LFBB13
.LM58:
	ldi r25,0
	jmp disp_num
	.size	ense_music_volume_setup_activate, .-ense_music_volume_setup_activate
.Lscope13:
	.stabs	"ense_recording_gain_level_setup_activate:f(0,1)",36,0,0,ense_recording_gain_level_setup_activate
	.type	ense_recording_gain_level_setup_activate, @function
ense_recording_gain_level_setup_activate:
	.stabn	68,0,788,.LM59-.LFBB14
.LM59:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,789,.LM60-.LFBB14
.LM60:
	call get_recording_gain_level
	.stabn	68,0,789,.LM61-.LFBB14
.LM61:
	ldi r25,0
	jmp disp_num
	.size	ense_recording_gain_level_setup_activate, .-ense_recording_gain_level_setup_activate
.Lscope14:
	.stabs	"disp_sleep_scenario_playback:f(0,1)",36,0,0,disp_sleep_scenario_playback
	.type	disp_sleep_scenario_playback, @function
disp_sleep_scenario_playback:
	.stabn	68,0,705,.LM62-.LFBB15
.LM62:
.LFBB15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,706,.LM63-.LFBB15
.LM63:
	call get_sleep_scenario_playback
	.stabn	68,0,706,.LM64-.LFBB15
.LM64:
	ldi r25,0
	jmp disp_num
	.size	disp_sleep_scenario_playback, .-disp_sleep_scenario_playback
.Lscope15:
	.stabs	"ense_sc_setup_activate:f(0,1)",36,0,0,ense_sc_setup_activate
	.type	ense_sc_setup_activate, @function
ense_sc_setup_activate:
	.stabn	68,0,710,.LM65-.LFBB16
.LM65:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,711,.LM66-.LFBB16
.LM66:
	jmp disp_sleep_scenario_playback
	.size	ense_sc_setup_activate, .-ense_sc_setup_activate
.Lscope16:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"SurE"
	.text
	.stabs	"ense_del_records_activate:f(0,1)",36,0,0,ense_del_records_activate
	.type	ense_del_records_activate, @function
ense_del_records_activate:
	.stabn	68,0,881,.LM67-.LFBB17
.LM67:
.LFBB17:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,882,.LM68-.LFBB17
.LM68:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp disp_msg
	.size	ense_del_records_activate, .-ense_del_records_activate
.Lscope17:
	.type	set_defaults_activate, @function
set_defaults_activate:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp ense_del_records_activate
	.size	set_defaults_activate, .-set_defaults_activate
	.type	save_settings_activate, @function
save_settings_activate:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp ense_del_records_activate
	.size	save_settings_activate, .-save_settings_activate
	.stabs	"ense_tunes_setup:f(0,1)",36,0,0,ense_tunes_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_tunes_setup, @function
ense_tunes_setup:
	.stabn	68,0,853,.LM69-.LFBB18
.LM69:
.LFBB18:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,854,.LM70-.LFBB18
.LM70:
	cpi r24,lo8(32)
	breq .L53
	brsh .L54
	cpi r24,lo8(8)
	breq .L77
	cpi r24,lo8(16)
	breq .L56
.L52:
/* epilogue start */
	.stabn	68,0,877,.LM71-.LFBB18
.LM71:
	pop r28
	ret
.L54:
	.stabn	68,0,854,.LM72-.LFBB18
.LM72:
	cpi r24,lo8(-112)
	breq .L56
	cpi r24,lo8(-96)
	brne .L52
.L53:
	.stabn	68,0,863,.LM73-.LFBB18
.LM73:
	call is_readonly_relax_tunes_playback
	cpse r24,__zero_reg__
	rjmp .L59
.LBB33:
	.stabn	68,0,863,.LM74-.LFBB18
.LM74:
	call get_relax_tunes_playback
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L60
.L76:
	.stabn	68,0,863,.LM75-.LFBB18
.LM75:
	call max_relax_tunes_playback
.L78:
	mov r28,r24
	rjmp .L61
.L60:
	.stabn	68,0,863,.LM76-.LFBB18
.LM76:
	call step_relax_tunes_playback
	sub r28,r24
	call min_relax_tunes_playback
	cp r28,r24
	brlo .L76
.L61:
	.stabn	68,0,863,.LM77-.LFBB18
.LM77:
	mov r24,r28
	call set_relax_tunes_playback
.L59:
.LBE33:
	.stabn	68,0,865,.LM78-.LFBB18
.LM78:
	call disp_relax_tunes_playback
.L77:
/* epilogue start */
	.stabn	68,0,877,.LM79-.LFBB18
.LM79:
	pop r28
	.stabn	68,0,866,.LM80-.LFBB18
.LM80:
	jmp set_handled
.L56:
	.stabn	68,0,871,.LM81-.LFBB18
.LM81:
	call is_readonly_relax_tunes_playback
	cpse r24,__zero_reg__
	rjmp .L59
.LBB34:
	.stabn	68,0,871,.LM82-.LFBB18
.LM82:
	call get_relax_tunes_playback
	mov r28,r24
	call step_relax_tunes_playback
	add r28,r24
	call max_relax_tunes_playback
	cp r24,r28
	brsh .L61
	.stabn	68,0,871,.LM83-.LFBB18
.LM83:
	call min_relax_tunes_playback
	rjmp .L78
.LBE34:
	.size	ense_tunes_setup, .-ense_tunes_setup
.Lscope18:
	.stabs	"ense_music_volume_setup:f(0,1)",36,0,0,ense_music_volume_setup
	.stabs	"relax_tunes_playback_t:t(0,15)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_music_volume_setup, @function
ense_music_volume_setup:
	.stabn	68,0,820,.LM84-.LFBB19
.LM84:
.LFBB19:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,821,.LM85-.LFBB19
.LM85:
	cpi r24,lo8(-112)
	breq .L80
	brsh .L81
	cpi r24,lo8(16)
	breq .L80
	cpi r24,lo8(32)
	breq .L82
.L79:
/* epilogue start */
	.stabn	68,0,839,.LM86-.LFBB19
.LM86:
	pop r28
	ret
.L81:
	.stabn	68,0,821,.LM87-.LFBB19
.LM87:
	cpi r24,lo8(-96)
	brne .L79
.L82:
	.stabn	68,0,825,.LM88-.LFBB19
.LM88:
	call is_readonly_music_volume_level
	cpse r24,__zero_reg__
	rjmp .L87
.LBB35:
	.stabn	68,0,825,.LM89-.LFBB19
.LM89:
	call get_music_volume_level
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L85
.L98:
	.stabn	68,0,825,.LM90-.LFBB19
.LM90:
	call max_music_volume_level
.L99:
.LBE35:
.LBB36:
	.stabn	68,0,833,.LM91-.LFBB19
.LM91:
	mov r28,r24
	rjmp .L88
.L85:
.LBE36:
.LBB37:
	.stabn	68,0,825,.LM92-.LFBB19
.LM92:
	call step_music_volume_level
	sub r28,r24
	call min_music_volume_level
	cp r28,r24
	brlo .L98
.L88:
.LBE37:
.LBB38:
	.stabn	68,0,833,.LM93-.LFBB19
.LM93:
	mov r24,r28
	call set_music_volume_level
.L87:
.LBE38:
	.stabn	68,0,835,.LM94-.LFBB19
.LM94:
	call get_music_volume_level
	.stabn	68,0,835,.LM95-.LFBB19
.LM95:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,839,.LM96-.LFBB19
.LM96:
	pop r28
	.stabn	68,0,836,.LM97-.LFBB19
.LM97:
	jmp set_handled
.L80:
	.stabn	68,0,833,.LM98-.LFBB19
.LM98:
	call is_readonly_music_volume_level
	cpse r24,__zero_reg__
	rjmp .L87
.LBB39:
	.stabn	68,0,833,.LM99-.LFBB19
.LM99:
	call get_music_volume_level
	mov r28,r24
	call step_music_volume_level
	add r28,r24
	call max_music_volume_level
	cp r24,r28
	brsh .L88
	.stabn	68,0,833,.LM100-.LFBB19
.LM100:
	call min_music_volume_level
	rjmp .L99
.LBE39:
	.size	ense_music_volume_setup, .-ense_music_volume_setup
.Lscope19:
	.stabs	"ense_recording_gain_level_setup:f(0,1)",36,0,0,ense_recording_gain_level_setup
	.stabs	"music_volume_level_t:t(0,16)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_recording_gain_level_setup, @function
ense_recording_gain_level_setup:
	.stabn	68,0,793,.LM101-.LFBB20
.LM101:
.LFBB20:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,794,.LM102-.LFBB20
.LM102:
	cpi r24,lo8(-112)
	breq .L101
	brsh .L102
	cpi r24,lo8(16)
	breq .L101
	cpi r24,lo8(32)
	breq .L103
.L100:
/* epilogue start */
	.stabn	68,0,812,.LM103-.LFBB20
.LM103:
	pop r28
	ret
.L102:
	.stabn	68,0,794,.LM104-.LFBB20
.LM104:
	cpi r24,lo8(-96)
	brne .L100
.L103:
	.stabn	68,0,798,.LM105-.LFBB20
.LM105:
	call is_readonly_recording_gain_level
	cpse r24,__zero_reg__
	rjmp .L108
.LBB40:
	.stabn	68,0,798,.LM106-.LFBB20
.LM106:
	call get_recording_gain_level
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L106
.L119:
	.stabn	68,0,798,.LM107-.LFBB20
.LM107:
	call max_recording_gain_level
.L120:
.LBE40:
.LBB41:
	.stabn	68,0,806,.LM108-.LFBB20
.LM108:
	mov r28,r24
	rjmp .L109
.L106:
.LBE41:
.LBB42:
	.stabn	68,0,798,.LM109-.LFBB20
.LM109:
	call step_recording_gain_level
	sub r28,r24
	call min_recording_gain_level
	cp r28,r24
	brlo .L119
.L109:
.LBE42:
.LBB43:
	.stabn	68,0,806,.LM110-.LFBB20
.LM110:
	mov r24,r28
	call set_recording_gain_level
.L108:
.LBE43:
	.stabn	68,0,808,.LM111-.LFBB20
.LM111:
	call get_recording_gain_level
	.stabn	68,0,808,.LM112-.LFBB20
.LM112:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,812,.LM113-.LFBB20
.LM113:
	pop r28
	.stabn	68,0,809,.LM114-.LFBB20
.LM114:
	jmp set_handled
.L101:
	.stabn	68,0,806,.LM115-.LFBB20
.LM115:
	call is_readonly_recording_gain_level
	cpse r24,__zero_reg__
	rjmp .L108
.LBB44:
	.stabn	68,0,806,.LM116-.LFBB20
.LM116:
	call get_recording_gain_level
	mov r28,r24
	call step_recording_gain_level
	add r28,r24
	call max_recording_gain_level
	cp r24,r28
	brsh .L109
	.stabn	68,0,806,.LM117-.LFBB20
.LM117:
	call min_recording_gain_level
	rjmp .L120
.LBE44:
	.size	ense_recording_gain_level_setup, .-ense_recording_gain_level_setup
.Lscope20:
	.section	.rodata.str1.1
.LC1:
	.string	"WAV"
.LC2:
	.string	"MYREC"
.LC3:
	.string	"/SD/SYSTEM/RECORDS"
	.text
	.stabs	"ense_recording_setup:f(0,1)",36,0,0,ense_recording_setup
	.stabs	"recording_gain_level_t:t(0,17)=(0,4)",128,0,0,0
	.stabs	"e_codec_status:T(0,18)=eCODEC_IDLE:0,CODEC_PLAYBACK:1,CODEC_CAPTURE:2,;",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_recording_setup, @function
ense_recording_setup:
	.stabn	68,0,747,.LM118-.LFBB21
.LM118:
.LFBB21:
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,50
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 50 */
/* stack size = 54 */
.L__stack_usage = 54
	.stabn	68,0,750,.LM119-.LFBB21
.LM119:
	cpi r24,lo8(8)
	breq .L122
	brsh .L123
	cpi r24,lo8(2)
	breq .L124
.L121:
/* epilogue start */
	.stabn	68,0,785,.LM120-.LFBB21
.LM120:
	adiw r28,50
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
.L123:
	.stabn	68,0,750,.LM121-.LFBB21
.LM121:
	cpi r24,lo8(16)
	breq .L126
	cpi r24,lo8(32)
	brne .L121
.L126:
	.stabn	68,0,779,.LM122-.LFBB21
.LM122:
	call toggle_voice_recording
	.stabn	68,0,781,.LM123-.LFBB21
.LM123:
	call get_voice_recording
	call disp_flag
	rjmp .L136
.L122:
	.stabn	68,0,753,.LM124-.LFBB21
.LM124:
	call codec_get_status
	.stabn	68,0,753,.LM125-.LFBB21
.LM125:
	sbiw r24,1
	brne .L127
	.stabn	68,0,754,.LM126-.LFBB21
.LM126:
	call codec_stop
.L127:
	.stabn	68,0,756,.LM127-.LFBB21
.LM127:
	call codec_get_status
.L136:
/* epilogue start */
	.stabn	68,0,785,.LM128-.LFBB21
.LM128:
	adiw r28,50
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	.stabn	68,0,782,.LM129-.LFBB21
.LM129:
	jmp set_handled
.L124:
	.stabn	68,0,763,.LM130-.LFBB21
.LM130:
	call codec_get_status
	.stabn	68,0,763,.LM131-.LFBB21
.LM131:
	sbiw r24,2
	brne .L128
	.stabn	68,0,764,.LM132-.LFBB21
.LM132:
	call codec_stop
.L129:
	.stabn	68,0,774,.LM133-.LFBB21
.LM133:
	call set_handled
	.stabn	68,0,775,.LM134-.LFBB21
.LM134:
	rjmp .L121
.L128:
	.stabn	68,0,766,.LM135-.LFBB21
.LM135:
	call codec_get_status
	.stabn	68,0,766,.LM136-.LFBB21
.LM136:
	or r24,r25
	brne .L129
	.stabn	68,0,768,.LM137-.LFBB21
.LM137:
	ldi r16,lo8(.LC1)
	ldi r17,hi8(.LC1)
	ldi r18,lo8(.LC2)
	ldi r19,hi8(.LC2)
	ldi r20,lo8(.LC3)
	ldi r21,hi8(.LC3)
	ldi r22,lo8(50)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call make_next_file_path
	.stabn	68,0,769,.LM138-.LFBB21
.LM138:
	movw r24,r28
	adiw r24,1
	call codec_capture
	rjmp .L129
	.size	ense_recording_setup, .-ense_recording_setup
	.stabs	"newfile:(0,19)=ar(0,20)=r(0,20);0;65535;;0;49;(0,21)=r(0,21);0;255;",128,0,0,1
	.stabs	"char:t(0,21)",128,0,0,0
	.stabn	192,0,0,.LFBB21-.LFBB21
	.stabn	224,0,0,.Lscope21-.LFBB21
.Lscope21:
	.stabs	"ense_sc_setup:f(0,1)",36,0,0,ense_sc_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_sc_setup, @function
ense_sc_setup:
	.stabn	68,0,715,.LM139-.LFBB22
.LM139:
.LFBB22:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,716,.LM140-.LFBB22
.LM140:
	cpi r24,lo8(32)
	breq .L138
	brsh .L139
	cpi r24,lo8(8)
	breq .L162
	cpi r24,lo8(16)
	breq .L141
.L137:
/* epilogue start */
	.stabn	68,0,739,.LM141-.LFBB22
.LM141:
	pop r28
	ret
.L139:
	.stabn	68,0,716,.LM142-.LFBB22
.LM142:
	cpi r24,lo8(-112)
	breq .L141
	cpi r24,lo8(-96)
	brne .L137
.L138:
	.stabn	68,0,725,.LM143-.LFBB22
.LM143:
	call is_readonly_sleep_scenario_playback
	cpse r24,__zero_reg__
	rjmp .L144
.LBB45:
	.stabn	68,0,725,.LM144-.LFBB22
.LM144:
	call get_sleep_scenario_playback
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L145
.L161:
	.stabn	68,0,725,.LM145-.LFBB22
.LM145:
	call max_sleep_scenario_playback
.L163:
	mov r28,r24
	rjmp .L146
.L145:
	.stabn	68,0,725,.LM146-.LFBB22
.LM146:
	call step_sleep_scenario_playback
	sub r28,r24
	call min_sleep_scenario_playback
	cp r28,r24
	brlo .L161
.L146:
	.stabn	68,0,725,.LM147-.LFBB22
.LM147:
	mov r24,r28
	call set_sleep_scenario_playback
.L144:
.LBE45:
	.stabn	68,0,727,.LM148-.LFBB22
.LM148:
	call disp_sleep_scenario_playback
.L162:
/* epilogue start */
	.stabn	68,0,739,.LM149-.LFBB22
.LM149:
	pop r28
	.stabn	68,0,728,.LM150-.LFBB22
.LM150:
	jmp set_handled
.L141:
	.stabn	68,0,733,.LM151-.LFBB22
.LM151:
	call is_readonly_sleep_scenario_playback
	cpse r24,__zero_reg__
	rjmp .L144
.LBB46:
	.stabn	68,0,733,.LM152-.LFBB22
.LM152:
	call get_sleep_scenario_playback
	mov r28,r24
	call step_sleep_scenario_playback
	add r28,r24
	call max_sleep_scenario_playback
	cp r24,r28
	brsh .L146
	.stabn	68,0,733,.LM153-.LFBB22
.LM153:
	call min_sleep_scenario_playback
	rjmp .L163
.LBE46:
	.size	ense_sc_setup, .-ense_sc_setup
.Lscope22:
	.stabs	"alarm_clock_setup_activate:f(0,1)",36,0,0,alarm_clock_setup_activate
	.stabs	"sleep_scenario_playback_t:t(0,22)=(0,4)",128,0,0,0
	.type	alarm_clock_setup_activate, @function
alarm_clock_setup_activate:
	.stabn	68,0,1180,.LM154-.LFBB23
.LM154:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1181,.LM155-.LFBB23
.LM155:
	call get_alarm_clock
	jmp disp_flag
	.size	alarm_clock_setup_activate, .-alarm_clock_setup_activate
.Lscope23:
	.stabs	"hints_frequency_setup_activate:f(0,1)",36,0,0,hints_frequency_setup_activate
	.type	hints_frequency_setup_activate, @function
hints_frequency_setup_activate:
	.stabn	68,0,1199,.LM156-.LFBB24
.LM156:
.LFBB24:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1200,.LM157-.LFBB24
.LM157:
	call get_hints_frequency
	.stabn	68,0,1200,.LM158-.LFBB24
.LM158:
	ldi r25,0
	jmp disp_num
	.size	hints_frequency_setup_activate, .-hints_frequency_setup_activate
.Lscope24:
	.stabs	"hints_duty_cycle_setup_activate:f(0,1)",36,0,0,hints_duty_cycle_setup_activate
	.type	hints_duty_cycle_setup_activate, @function
hints_duty_cycle_setup_activate:
	.stabn	68,0,1224,.LM159-.LFBB25
.LM159:
.LFBB25:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1225,.LM160-.LFBB25
.LM160:
	call get_hints_duty_cycle
	.stabn	68,0,1225,.LM161-.LFBB25
.LM161:
	ldi r25,0
	jmp disp_num
	.size	hints_duty_cycle_setup_activate, .-hints_duty_cycle_setup_activate
.Lscope25:
	.stabs	"light_hints_brightness_setup_activate:f(0,1)",36,0,0,light_hints_brightness_setup_activate
	.type	light_hints_brightness_setup_activate, @function
light_hints_brightness_setup_activate:
	.stabn	68,0,1274,.LM162-.LFBB26
.LM162:
.LFBB26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1275,.LM163-.LFBB26
.LM163:
	call get_light_hints_brightness
	.stabn	68,0,1275,.LM164-.LFBB26
.LM164:
	ldi r25,0
	jmp disp_num
	.size	light_hints_brightness_setup_activate, .-light_hints_brightness_setup_activate
.Lscope26:
	.stabs	"sound_hints_volume_setup_activate:f(0,1)",36,0,0,sound_hints_volume_setup_activate
	.type	sound_hints_volume_setup_activate, @function
sound_hints_volume_setup_activate:
	.stabn	68,0,1249,.LM165-.LFBB27
.LM165:
.LFBB27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1250,.LM166-.LFBB27
.LM166:
	call get_sound_hints_volume
	.stabn	68,0,1250,.LM167-.LFBB27
.LM167:
	ldi r25,0
	jmp disp_num
	.size	sound_hints_volume_setup_activate, .-sound_hints_volume_setup_activate
.Lscope27:
	.stabs	"set_defaults_handler:f(0,1)",36,0,0,set_defaults_handler
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	set_defaults_handler, @function
set_defaults_handler:
	.stabn	68,0,1372,.LM168-.LFBB28
.LM168:
.LFBB28:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1373,.LM169-.LFBB28
.LM169:
	cpi r24,lo8(8)
	brne .L169
	.stabn	68,0,1376,.LM170-.LFBB28
.LM170:
	jmp config_set_defaults
.L169:
/* epilogue start */
	.stabn	68,0,1380,.LM171-.LFBB28
.LM171:
	ret
	.size	set_defaults_handler, .-set_defaults_handler
.Lscope28:
	.stabs	"sound_hints_duration_setup:f(0,1)",36,0,0,sound_hints_duration_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	sound_hints_duration_setup, @function
sound_hints_duration_setup:
	.stabn	68,0,1335,.LM172-.LFBB29
.LM172:
.LFBB29:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1336,.LM173-.LFBB29
.LM173:
	cpi r24,lo8(-112)
	breq .L172
	brsh .L173
	cpi r24,lo8(16)
	breq .L172
	cpi r24,lo8(32)
	breq .L174
.L171:
/* epilogue start */
	.stabn	68,0,1354,.LM174-.LFBB29
.LM174:
	pop r28
	ret
.L173:
	.stabn	68,0,1336,.LM175-.LFBB29
.LM175:
	cpi r24,lo8(-96)
	brne .L171
.L174:
	.stabn	68,0,1340,.LM176-.LFBB29
.LM176:
	call is_readonly_sound_hints_duration
	cpse r24,__zero_reg__
	rjmp .L179
.LBB47:
	.stabn	68,0,1340,.LM177-.LFBB29
.LM177:
	call get_sound_hints_duration
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L177
.L190:
	.stabn	68,0,1340,.LM178-.LFBB29
.LM178:
	call max_sound_hints_duration
.L191:
.LBE47:
.LBB48:
	.stabn	68,0,1348,.LM179-.LFBB29
.LM179:
	mov r28,r24
	rjmp .L180
.L177:
.LBE48:
.LBB49:
	.stabn	68,0,1340,.LM180-.LFBB29
.LM180:
	call step_sound_hints_duration
	sub r28,r24
	call min_sound_hints_duration
	cp r28,r24
	brlo .L190
.L180:
.LBE49:
.LBB50:
	.stabn	68,0,1348,.LM181-.LFBB29
.LM181:
	mov r24,r28
	call set_sound_hints_duration
.L179:
.LBE50:
	.stabn	68,0,1350,.LM182-.LFBB29
.LM182:
	call get_sound_hints_duration
	.stabn	68,0,1350,.LM183-.LFBB29
.LM183:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1354,.LM184-.LFBB29
.LM184:
	pop r28
	.stabn	68,0,1351,.LM185-.LFBB29
.LM185:
	jmp set_handled
.L172:
	.stabn	68,0,1348,.LM186-.LFBB29
.LM186:
	call is_readonly_sound_hints_duration
	cpse r24,__zero_reg__
	rjmp .L179
.LBB51:
	.stabn	68,0,1348,.LM187-.LFBB29
.LM187:
	call get_sound_hints_duration
	mov r28,r24
	call step_sound_hints_duration
	add r28,r24
	call max_sound_hints_duration
	cp r24,r28
	brsh .L180
	.stabn	68,0,1348,.LM188-.LFBB29
.LM188:
	call min_sound_hints_duration
	rjmp .L191
.LBE51:
	.size	sound_hints_duration_setup, .-sound_hints_duration_setup
.Lscope29:
	.stabs	"sound_hints_duration_setup_activate:f(0,1)",36,0,0,sound_hints_duration_setup_activate
	.stabs	"sound_hints_duration_t:t(0,23)=(0,4)",128,0,0,0
	.type	sound_hints_duration_setup_activate, @function
sound_hints_duration_setup_activate:
	.stabn	68,0,1328,.LM189-.LFBB30
.LM189:
.LFBB30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1329,.LM190-.LFBB30
.LM190:
	call get_sound_hints_duration
	.stabn	68,0,1329,.LM191-.LFBB30
.LM191:
	ldi r25,0
	call disp_num
	.stabn	68,0,1331,.LM192-.LFBB30
.LM192:
	jmp keybrd_hold_repeat_fast
	.size	sound_hints_duration_setup_activate, .-sound_hints_duration_setup_activate
.Lscope30:
	.stabs	"light_hints_duration_setup_activate:f(0,1)",36,0,0,light_hints_duration_setup_activate
	.type	light_hints_duration_setup_activate, @function
light_hints_duration_setup_activate:
	.stabn	68,0,1299,.LM193-.LFBB31
.LM193:
.LFBB31:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1300,.LM194-.LFBB31
.LM194:
	call get_light_hints_duration
	.stabn	68,0,1300,.LM195-.LFBB31
.LM195:
	ldi r25,0
	call disp_num
	.stabn	68,0,1302,.LM196-.LFBB31
.LM196:
	jmp keybrd_hold_repeat_fast
	.size	light_hints_duration_setup_activate, .-light_hints_duration_setup_activate
.Lscope31:
	.stabs	"remd_sensitivity_setup_activate:f(0,1)",36,0,0,remd_sensitivity_setup_activate
	.type	remd_sensitivity_setup_activate, @function
remd_sensitivity_setup_activate:
	.stabn	68,0,1069,.LM197-.LFBB32
.LM197:
.LFBB32:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1070,.LM198-.LFBB32
.LM198:
	call get_remd_sensitivity
	.stabn	68,0,1070,.LM199-.LFBB32
.LM199:
	ldi r25,0
	call disp_num
	.stabn	68,0,1072,.LM200-.LFBB32
.LM200:
	jmp keybrd_hold_repeat_fast
	.size	remd_sensitivity_setup_activate, .-remd_sensitivity_setup_activate
.Lscope32:
	.stabs	"trigger_times_activate:f(0,1)",36,0,0,trigger_times_activate
	.type	trigger_times_activate, @function
trigger_times_activate:
	.stabn	68,0,1050,.LM201-.LFBB33
.LM201:
.LFBB33:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1051,.LM202-.LFBB33
.LM202:
	jmp keybrd_hold_repeat_fast
	.size	trigger_times_activate, .-trigger_times_activate
.Lscope33:
	.stabs	"light_hints_duration_setup:f(0,1)",36,0,0,light_hints_duration_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	light_hints_duration_setup, @function
light_hints_duration_setup:
	.stabn	68,0,1306,.LM203-.LFBB34
.LM203:
.LFBB34:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1307,.LM204-.LFBB34
.LM204:
	cpi r24,lo8(-112)
	breq .L197
	brsh .L198
	cpi r24,lo8(16)
	breq .L197
	cpi r24,lo8(32)
	breq .L199
.L196:
/* epilogue start */
	.stabn	68,0,1325,.LM205-.LFBB34
.LM205:
	pop r28
	ret
.L198:
	.stabn	68,0,1307,.LM206-.LFBB34
.LM206:
	cpi r24,lo8(-96)
	brne .L196
.L199:
	.stabn	68,0,1311,.LM207-.LFBB34
.LM207:
	call is_readonly_light_hints_duration
	cpse r24,__zero_reg__
	rjmp .L204
.LBB52:
	.stabn	68,0,1311,.LM208-.LFBB34
.LM208:
	call get_light_hints_duration
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L202
.L215:
	.stabn	68,0,1311,.LM209-.LFBB34
.LM209:
	call max_light_hints_duration
.L216:
.LBE52:
.LBB53:
	.stabn	68,0,1319,.LM210-.LFBB34
.LM210:
	mov r28,r24
	rjmp .L205
.L202:
.LBE53:
.LBB54:
	.stabn	68,0,1311,.LM211-.LFBB34
.LM211:
	call step_light_hints_duration
	sub r28,r24
	call min_light_hints_duration
	cp r28,r24
	brlo .L215
.L205:
.LBE54:
.LBB55:
	.stabn	68,0,1319,.LM212-.LFBB34
.LM212:
	mov r24,r28
	call set_light_hints_duration
.L204:
.LBE55:
	.stabn	68,0,1321,.LM213-.LFBB34
.LM213:
	call get_light_hints_duration
	.stabn	68,0,1321,.LM214-.LFBB34
.LM214:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1325,.LM215-.LFBB34
.LM215:
	pop r28
	.stabn	68,0,1322,.LM216-.LFBB34
.LM216:
	jmp set_handled
.L197:
	.stabn	68,0,1319,.LM217-.LFBB34
.LM217:
	call is_readonly_light_hints_duration
	cpse r24,__zero_reg__
	rjmp .L204
.LBB56:
	.stabn	68,0,1319,.LM218-.LFBB34
.LM218:
	call get_light_hints_duration
	mov r28,r24
	call step_light_hints_duration
	add r28,r24
	call max_light_hints_duration
	cp r24,r28
	brsh .L205
	.stabn	68,0,1319,.LM219-.LFBB34
.LM219:
	call min_light_hints_duration
	rjmp .L216
.LBE56:
	.size	light_hints_duration_setup, .-light_hints_duration_setup
.Lscope34:
	.stabs	"sound_hints_volume_setup:f(0,1)",36,0,0,sound_hints_volume_setup
	.stabs	"light_hints_duration_t:t(0,24)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	sound_hints_volume_setup, @function
sound_hints_volume_setup:
	.stabn	68,0,1254,.LM220-.LFBB35
.LM220:
.LFBB35:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1255,.LM221-.LFBB35
.LM221:
	cpi r24,lo8(16)
	breq .L218
	cpi r24,lo8(32)
	brne .L217
	.stabn	68,0,1258,.LM222-.LFBB35
.LM222:
	call is_readonly_sound_hints_volume
	cpse r24,__zero_reg__
	rjmp .L223
.LBB57:
	.stabn	68,0,1258,.LM223-.LFBB35
.LM223:
	call get_sound_hints_volume
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L221
.L225:
	.stabn	68,0,1258,.LM224-.LFBB35
.LM224:
	call max_sound_hints_volume
.L226:
.LBE57:
.LBB58:
	.stabn	68,0,1265,.LM225-.LFBB35
.LM225:
	mov r28,r24
	rjmp .L224
.L221:
.LBE58:
.LBB59:
	.stabn	68,0,1258,.LM226-.LFBB35
.LM226:
	call step_sound_hints_volume
	sub r28,r24
	call min_sound_hints_volume
	cp r28,r24
	brlo .L225
.L224:
.LBE59:
.LBB60:
	.stabn	68,0,1265,.LM227-.LFBB35
.LM227:
	mov r24,r28
	call set_sound_hints_volume
.L223:
.LBE60:
	.stabn	68,0,1267,.LM228-.LFBB35
.LM228:
	call get_sound_hints_volume
	.stabn	68,0,1267,.LM229-.LFBB35
.LM229:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1271,.LM230-.LFBB35
.LM230:
	pop r28
	.stabn	68,0,1268,.LM231-.LFBB35
.LM231:
	jmp set_handled
.L218:
	.stabn	68,0,1265,.LM232-.LFBB35
.LM232:
	call is_readonly_sound_hints_volume
	cpse r24,__zero_reg__
	rjmp .L223
.LBB61:
	.stabn	68,0,1265,.LM233-.LFBB35
.LM233:
	call get_sound_hints_volume
	mov r28,r24
	call step_sound_hints_volume
	add r28,r24
	call max_sound_hints_volume
	cp r24,r28
	brsh .L224
	.stabn	68,0,1265,.LM234-.LFBB35
.LM234:
	call min_sound_hints_volume
	rjmp .L226
.L217:
/* epilogue start */
.LBE61:
	.stabn	68,0,1271,.LM235-.LFBB35
.LM235:
	pop r28
	ret
	.size	sound_hints_volume_setup, .-sound_hints_volume_setup
.Lscope35:
	.stabs	"light_hints_brightness_setup:f(0,1)",36,0,0,light_hints_brightness_setup
	.stabs	"sound_hints_volume_t:t(0,25)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	light_hints_brightness_setup, @function
light_hints_brightness_setup:
	.stabn	68,0,1279,.LM236-.LFBB36
.LM236:
.LFBB36:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1280,.LM237-.LFBB36
.LM237:
	cpi r24,lo8(16)
	breq .L228
	cpi r24,lo8(32)
	brne .L227
	.stabn	68,0,1283,.LM238-.LFBB36
.LM238:
	call is_readonly_light_hints_brightness
	cpse r24,__zero_reg__
	rjmp .L233
.LBB62:
	.stabn	68,0,1283,.LM239-.LFBB36
.LM239:
	call get_light_hints_brightness
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L231
.L235:
	.stabn	68,0,1283,.LM240-.LFBB36
.LM240:
	call max_light_hints_brightness
.L236:
.LBE62:
.LBB63:
	.stabn	68,0,1290,.LM241-.LFBB36
.LM241:
	mov r28,r24
	rjmp .L234
.L231:
.LBE63:
.LBB64:
	.stabn	68,0,1283,.LM242-.LFBB36
.LM242:
	call step_light_hints_brightness
	sub r28,r24
	call min_light_hints_brightness
	cp r28,r24
	brlo .L235
.L234:
.LBE64:
.LBB65:
	.stabn	68,0,1290,.LM243-.LFBB36
.LM243:
	mov r24,r28
	call set_light_hints_brightness
.L233:
.LBE65:
	.stabn	68,0,1292,.LM244-.LFBB36
.LM244:
	call get_light_hints_brightness
	.stabn	68,0,1292,.LM245-.LFBB36
.LM245:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1296,.LM246-.LFBB36
.LM246:
	pop r28
	.stabn	68,0,1293,.LM247-.LFBB36
.LM247:
	jmp set_handled
.L228:
	.stabn	68,0,1290,.LM248-.LFBB36
.LM248:
	call is_readonly_light_hints_brightness
	cpse r24,__zero_reg__
	rjmp .L233
.LBB66:
	.stabn	68,0,1290,.LM249-.LFBB36
.LM249:
	call get_light_hints_brightness
	mov r28,r24
	call step_light_hints_brightness
	add r28,r24
	call max_light_hints_brightness
	cp r24,r28
	brsh .L234
	.stabn	68,0,1290,.LM250-.LFBB36
.LM250:
	call min_light_hints_brightness
	rjmp .L236
.L227:
/* epilogue start */
.LBE66:
	.stabn	68,0,1296,.LM251-.LFBB36
.LM251:
	pop r28
	ret
	.size	light_hints_brightness_setup, .-light_hints_brightness_setup
.Lscope36:
	.stabs	"hints_duty_cycle_setup:f(0,1)",36,0,0,hints_duty_cycle_setup
	.stabs	"light_hints_brightness_t:t(0,26)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	hints_duty_cycle_setup, @function
hints_duty_cycle_setup:
	.stabn	68,0,1229,.LM252-.LFBB37
.LM252:
.LFBB37:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1230,.LM253-.LFBB37
.LM253:
	cpi r24,lo8(16)
	breq .L238
	cpi r24,lo8(32)
	brne .L237
	.stabn	68,0,1233,.LM254-.LFBB37
.LM254:
	call is_readonly_hints_duty_cycle
	cpse r24,__zero_reg__
	rjmp .L243
.LBB67:
	.stabn	68,0,1233,.LM255-.LFBB37
.LM255:
	call get_hints_duty_cycle
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L241
.L245:
	.stabn	68,0,1233,.LM256-.LFBB37
.LM256:
	call max_hints_duty_cycle
.L246:
.LBE67:
.LBB68:
	.stabn	68,0,1240,.LM257-.LFBB37
.LM257:
	mov r28,r24
	rjmp .L244
.L241:
.LBE68:
.LBB69:
	.stabn	68,0,1233,.LM258-.LFBB37
.LM258:
	call step_hints_duty_cycle
	sub r28,r24
	call min_hints_duty_cycle
	cp r28,r24
	brlo .L245
.L244:
.LBE69:
.LBB70:
	.stabn	68,0,1240,.LM259-.LFBB37
.LM259:
	mov r24,r28
	call set_hints_duty_cycle
.L243:
.LBE70:
	.stabn	68,0,1242,.LM260-.LFBB37
.LM260:
	call get_hints_duty_cycle
	.stabn	68,0,1242,.LM261-.LFBB37
.LM261:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1246,.LM262-.LFBB37
.LM262:
	pop r28
	.stabn	68,0,1243,.LM263-.LFBB37
.LM263:
	jmp set_handled
.L238:
	.stabn	68,0,1240,.LM264-.LFBB37
.LM264:
	call is_readonly_hints_duty_cycle
	cpse r24,__zero_reg__
	rjmp .L243
.LBB71:
	.stabn	68,0,1240,.LM265-.LFBB37
.LM265:
	call get_hints_duty_cycle
	mov r28,r24
	call step_hints_duty_cycle
	add r28,r24
	call max_hints_duty_cycle
	cp r24,r28
	brsh .L244
	.stabn	68,0,1240,.LM266-.LFBB37
.LM266:
	call min_hints_duty_cycle
	rjmp .L246
.L237:
/* epilogue start */
.LBE71:
	.stabn	68,0,1246,.LM267-.LFBB37
.LM267:
	pop r28
	ret
	.size	hints_duty_cycle_setup, .-hints_duty_cycle_setup
.Lscope37:
	.stabs	"hints_frequency_setup:f(0,1)",36,0,0,hints_frequency_setup
	.stabs	"hints_duty_cycle_t:t(0,27)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	hints_frequency_setup, @function
hints_frequency_setup:
	.stabn	68,0,1204,.LM268-.LFBB38
.LM268:
.LFBB38:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1205,.LM269-.LFBB38
.LM269:
	cpi r24,lo8(16)
	breq .L248
	cpi r24,lo8(32)
	brne .L247
	.stabn	68,0,1208,.LM270-.LFBB38
.LM270:
	call is_readonly_hints_frequency
	cpse r24,__zero_reg__
	rjmp .L253
.LBB72:
	.stabn	68,0,1208,.LM271-.LFBB38
.LM271:
	call get_hints_frequency
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L251
.L255:
	.stabn	68,0,1208,.LM272-.LFBB38
.LM272:
	call max_hints_frequency
.L256:
.LBE72:
.LBB73:
	.stabn	68,0,1215,.LM273-.LFBB38
.LM273:
	mov r28,r24
	rjmp .L254
.L251:
.LBE73:
.LBB74:
	.stabn	68,0,1208,.LM274-.LFBB38
.LM274:
	call step_hints_frequency
	sub r28,r24
	call min_hints_frequency
	cp r28,r24
	brlo .L255
.L254:
.LBE74:
.LBB75:
	.stabn	68,0,1215,.LM275-.LFBB38
.LM275:
	mov r24,r28
	call set_hints_frequency
.L253:
.LBE75:
	.stabn	68,0,1217,.LM276-.LFBB38
.LM276:
	call get_hints_frequency
	.stabn	68,0,1217,.LM277-.LFBB38
.LM277:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1221,.LM278-.LFBB38
.LM278:
	pop r28
	.stabn	68,0,1218,.LM279-.LFBB38
.LM279:
	jmp set_handled
.L248:
	.stabn	68,0,1215,.LM280-.LFBB38
.LM280:
	call is_readonly_hints_frequency
	cpse r24,__zero_reg__
	rjmp .L253
.LBB76:
	.stabn	68,0,1215,.LM281-.LFBB38
.LM281:
	call get_hints_frequency
	mov r28,r24
	call step_hints_frequency
	add r28,r24
	call max_hints_frequency
	cp r24,r28
	brsh .L254
	.stabn	68,0,1215,.LM282-.LFBB38
.LM282:
	call min_hints_frequency
	rjmp .L256
.L247:
/* epilogue start */
.LBE76:
	.stabn	68,0,1221,.LM283-.LFBB38
.LM283:
	pop r28
	ret
	.size	hints_frequency_setup, .-hints_frequency_setup
.Lscope38:
	.stabs	"remd_sensitivity_setup:f(0,1)",36,0,0,remd_sensitivity_setup
	.stabs	"hints_frequency_t:t(0,28)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	remd_sensitivity_setup, @function
remd_sensitivity_setup:
	.stabn	68,0,1076,.LM284-.LFBB39
.LM284:
.LFBB39:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1077,.LM285-.LFBB39
.LM285:
	cpi r24,lo8(-112)
	breq .L258
	brsh .L259
	cpi r24,lo8(16)
	breq .L258
	cpi r24,lo8(32)
	breq .L260
.L257:
/* epilogue start */
	.stabn	68,0,1095,.LM286-.LFBB39
.LM286:
	pop r28
	ret
.L259:
	.stabn	68,0,1077,.LM287-.LFBB39
.LM287:
	cpi r24,lo8(-96)
	brne .L257
.L260:
	.stabn	68,0,1081,.LM288-.LFBB39
.LM288:
	call is_readonly_remd_sensitivity
	cpse r24,__zero_reg__
	rjmp .L265
.LBB77:
	.stabn	68,0,1081,.LM289-.LFBB39
.LM289:
	call get_remd_sensitivity
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L263
.L276:
	.stabn	68,0,1081,.LM290-.LFBB39
.LM290:
	call max_remd_sensitivity
.L277:
.LBE77:
.LBB78:
	.stabn	68,0,1089,.LM291-.LFBB39
.LM291:
	mov r28,r24
	rjmp .L266
.L263:
.LBE78:
.LBB79:
	.stabn	68,0,1081,.LM292-.LFBB39
.LM292:
	call step_remd_sensitivity
	sub r28,r24
	call min_remd_sensitivity
	cp r28,r24
	brlo .L276
.L266:
.LBE79:
.LBB80:
	.stabn	68,0,1089,.LM293-.LFBB39
.LM293:
	mov r24,r28
	call set_remd_sensitivity
.L265:
.LBE80:
	.stabn	68,0,1091,.LM294-.LFBB39
.LM294:
	call get_remd_sensitivity
	.stabn	68,0,1091,.LM295-.LFBB39
.LM295:
	ldi r25,0
	call disp_num
/* epilogue start */
	.stabn	68,0,1095,.LM296-.LFBB39
.LM296:
	pop r28
	.stabn	68,0,1092,.LM297-.LFBB39
.LM297:
	jmp set_handled
.L258:
	.stabn	68,0,1089,.LM298-.LFBB39
.LM298:
	call is_readonly_remd_sensitivity
	cpse r24,__zero_reg__
	rjmp .L265
.LBB81:
	.stabn	68,0,1089,.LM299-.LFBB39
.LM299:
	call get_remd_sensitivity
	mov r28,r24
	call step_remd_sensitivity
	add r28,r24
	call max_remd_sensitivity
	cp r24,r28
	brsh .L266
	.stabn	68,0,1089,.LM300-.LFBB39
.LM300:
	call min_remd_sensitivity
	rjmp .L277
.LBE81:
	.size	remd_sensitivity_setup, .-remd_sensitivity_setup
.Lscope39:
	.stabs	"remd_trigger_counter_display:f(0,1)",36,0,0,remd_trigger_counter_display
	.stabs	"remd_sensitivity_t:t(0,29)=(0,4)",128,0,0,0
	.type	remd_trigger_counter_display, @function
remd_trigger_counter_display:
	.stabn	68,0,1044,.LM301-.LFBB40
.LM301:
.LFBB40:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1045,.LM302-.LFBB40
.LM302:
	call get_remd_trigger_counter
	.stabn	68,0,1045,.LM303-.LFBB40
.LM303:
	ldi r25,0
	jmp disp_num
	.size	remd_trigger_counter_display, .-remd_trigger_counter_display
.Lscope40:
	.stabs	"wakeup_timer_setup_activate:f(0,1)",36,0,0,wakeup_timer_setup_activate
	.type	wakeup_timer_setup_activate, @function
wakeup_timer_setup_activate:
	.stabn	68,0,1008,.LM304-.LFBB41
.LM304:
.LFBB41:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1009,.LM305-.LFBB41
.LM305:
	call disp_wakeup_timer_delay
	.stabn	68,0,1011,.LM306-.LFBB41
.LM306:
	jmp keybrd_hold_repeat_fast
	.size	wakeup_timer_setup_activate, .-wakeup_timer_setup_activate
.Lscope41:
	.stabs	"wakeup_timer_setup:f(0,1)",36,0,0,wakeup_timer_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	wakeup_timer_setup, @function
wakeup_timer_setup:
	.stabn	68,0,1015,.LM307-.LFBB42
.LM307:
.LFBB42:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,1016,.LM308-.LFBB42
.LM308:
	cpi r24,lo8(32)
	breq .L281
	brsh .L282
	cpi r24,lo8(8)
	breq .L283
	cpi r24,lo8(16)
	breq .L284
.L280:
/* epilogue start */
	.stabn	68,0,1041,.LM309-.LFBB42
.LM309:
	pop r29
	pop r28
	ret
.L282:
	.stabn	68,0,1016,.LM310-.LFBB42
.LM310:
	cpi r24,lo8(-112)
	breq .L284
	cpi r24,lo8(-96)
	brne .L280
.L281:
	.stabn	68,0,1027,.LM311-.LFBB42
.LM311:
	call is_invalid_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L287
	.stabn	68,0,1027,.LM312-.LFBB42
.LM312:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L287
.LBB82:
	.stabn	68,0,1027,.LM313-.LFBB42
.LM313:
	call get_wakeup_timer_delay
	movw r28,r24
	or r24,r25
	brne .L290
.L306:
	.stabn	68,0,1027,.LM314-.LFBB42
.LM314:
	call max_wakeup_timer_delay
.L305:
.LBE82:
.LBB83:
	.stabn	68,0,1035,.LM315-.LFBB42
.LM315:
	movw r28,r24
	rjmp .L292
.L283:
.LBE83:
	.stabn	68,0,1019,.LM316-.LFBB42
.LM316:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L287
	.stabn	68,0,1019,.LM317-.LFBB42
.LM317:
	call is_invalid_wakeup_timer_delay
	tst r24
	breq .L288
	.stabn	68,0,1019,.LM318-.LFBB42
.LM318:
	call set_default_wakeup_timer_delay
.L287:
	.stabn	68,0,1021,.LM319-.LFBB42
.LM319:
	call disp_wakeup_timer_delay
/* epilogue start */
	.stabn	68,0,1041,.LM320-.LFBB42
.LM320:
	pop r29
	pop r28
	.stabn	68,0,1022,.LM321-.LFBB42
.LM321:
	jmp set_handled
.L288:
	.stabn	68,0,1019,.LM322-.LFBB42
.LM322:
	call set_invalid_wakeup_timer_delay
	rjmp .L287
.L290:
.LBB84:
	.stabn	68,0,1027,.LM323-.LFBB42
.LM323:
	call step_wakeup_timer_delay
	sub r28,r24
	sbc r29,r25
	call min_wakeup_timer_delay
	cp r28,r24
	cpc r29,r25
	brlo .L306
.L292:
.LBE84:
.LBB85:
	.stabn	68,0,1035,.LM324-.LFBB42
.LM324:
	movw r24,r28
	call set_wakeup_timer_delay
	rjmp .L287
.L284:
.LBE85:
	.stabn	68,0,1035,.LM325-.LFBB42
.LM325:
	call is_invalid_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L287
	.stabn	68,0,1035,.LM326-.LFBB42
.LM326:
	call is_readonly_wakeup_timer_delay
	cpse r24,__zero_reg__
	rjmp .L287
.LBB86:
	.stabn	68,0,1035,.LM327-.LFBB42
.LM327:
	call get_wakeup_timer_delay
	movw r28,r24
	call step_wakeup_timer_delay
	add r28,r24
	adc r29,r25
	call max_wakeup_timer_delay
	cp r24,r28
	cpc r25,r29
	brsh .L292
	.stabn	68,0,1035,.LM328-.LFBB42
.LM328:
	call min_wakeup_timer_delay
	rjmp .L305
.LBE86:
	.size	wakeup_timer_setup, .-wakeup_timer_setup
.Lscope42:
	.stabs	"disable_key_hold_repeat:f(0,1)",36,0,0,disable_key_hold_repeat
	.stabs	"wakeup_timer_delay_t:t(0,30)=(0,8)",128,0,0,0
	.type	disable_key_hold_repeat, @function
disable_key_hold_repeat:
	.stabn	68,0,1003,.LM329-.LFBB43
.LM329:
.LFBB43:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1004,.LM330-.LFBB43
.LM330:
	jmp keybrd_hold_repeat_disable
	.size	disable_key_hold_repeat, .-disable_key_hold_repeat
.Lscope43:
	.stabs	"clock_setup_exit:f(0,1)",36,0,0,clock_setup_exit
	.stabs	"e_rtc_setup_mode:T(0,31)=eRTC_SETUP_NONE:0,RTC_SETUP_HOUR:1,RTC_SETUP_MINUTE:2,;",128,0,0,0
	.type	clock_setup_exit, @function
clock_setup_exit:
	.stabn	68,0,967,.LM331-.LFBB44
.LM331:
.LFBB44:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,969,.LM332-.LFBB44
.LM332:
	ldi r25,0
	ldi r24,0
	call rtc_set_setup
	.stabn	68,0,970,.LM333-.LFBB44
.LM333:
	call rtc_hide
.LBB87:
.LBB88:
	.stabn	68,0,1004,.LM334-.LFBB44
.LM334:
	jmp keybrd_hold_repeat_disable
.LBE88:
.LBE87:
	.size	clock_setup_exit, .-clock_setup_exit
.Lscope44:
	.stabs	"clock_setup_activate:f(0,1)",36,0,0,clock_setup_activate
	.type	clock_setup_activate, @function
clock_setup_activate:
	.stabn	68,0,958,.LM335-.LFBB45
.LM335:
.LFBB45:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,960,.LM336-.LFBB45
.LM336:
	ldi r24,lo8(1)
	ldi r25,0
	call rtc_set_setup
	.stabn	68,0,961,.LM337-.LFBB45
.LM337:
	call rtc_show
	.stabn	68,0,963,.LM338-.LFBB45
.LM338:
	jmp keybrd_hold_repeat_default
	.size	clock_setup_activate, .-clock_setup_activate
.Lscope45:
	.stabs	"ense_speaker_setup:f(0,1)",36,0,0,ense_speaker_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_speaker_setup, @function
ense_speaker_setup:
	.stabn	68,0,938,.LM339-.LFBB46
.LM339:
.LFBB46:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,939,.LM340-.LFBB46
.LM340:
	cpi r24,lo8(16)
	breq .L311
	cpi r24,lo8(32)
	brne .L310
.L311:
.LBB91:
.LBB92:
	.stabn	68,0,943,.LM341-.LFBB46
.LM341:
	call toggle_loud_speaker
	.stabn	68,0,945,.LM342-.LFBB46
.LM342:
	call get_loud_speaker
	call disp_flag
	.stabn	68,0,947,.LM343-.LFBB46
.LM343:
	call get_loud_speaker
	.stabn	68,0,947,.LM344-.LFBB46
.LM344:
	tst r24
	breq .L313
	.stabn	68,0,948,.LM345-.LFBB46
.LM345:
	call speaker_on
.L314:
	.stabn	68,0,952,.LM346-.LFBB46
.LM346:
	jmp set_handled
.L313:
	.stabn	68,0,950,.LM347-.LFBB46
.LM347:
	call speaker_off
	rjmp .L314
.L310:
/* epilogue start */
.LBE92:
.LBE91:
	.stabn	68,0,955,.LM348-.LFBB46
.LM348:
	ret
	.size	ense_speaker_setup, .-ense_speaker_setup
.Lscope46:
	.section	.rodata.str1.1
.LC4:
	.string	"donE"
	.text
	.stabs	"ense_del_records:f(0,1)",36,0,0,ense_del_records
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_del_records, @function
ense_del_records:
	.stabn	68,0,886,.LM349-.LFBB47
.LM349:
.LFBB47:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,887,.LM350-.LFBB47
.LM350:
	cpi r24,lo8(8)
	brne .L318
.LBB97:
.LBB98:
	.stabn	68,0,891,.LM351-.LFBB47
.LM351:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	call disp_msg
	.stabn	68,0,892,.LM352-.LFBB47
.LM352:
	call set_handled
.LBB99:
.LBB100:
	.stabn	68,0,353,.LM353-.LFBB47
.LM353:
	lds r24,menu+5
	ori r24,lo8(2)
	sts menu+5,r24
.L318:
/* epilogue start */
.LBE100:
.LBE99:
.LBE98:
.LBE97:
	.stabn	68,0,896,.LM354-.LFBB47
.LM354:
	ret
	.size	ense_del_records, .-ense_del_records
.Lscope47:
	.stabs	"ense_af_setup:f(0,1)",36,0,0,ense_af_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_af_setup, @function
ense_af_setup:
	.stabn	68,0,690,.LM355-.LFBB48
.LM355:
.LFBB48:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,691,.LM356-.LFBB48
.LM356:
	cpi r24,lo8(16)
	breq .L321
	cpi r24,lo8(32)
	brne .L320
.L321:
.LBB103:
.LBB104:
	.stabn	68,0,695,.LM357-.LFBB48
.LM357:
	call toggle_after_hints_message
	.stabn	68,0,697,.LM358-.LFBB48
.LM358:
	call get_after_hints_message
	call disp_flag
	.stabn	68,0,698,.LM359-.LFBB48
.LM359:
	jmp set_handled
.L320:
/* epilogue start */
.LBE104:
.LBE103:
	.stabn	68,0,701,.LM360-.LFBB48
.LM360:
	ret
	.size	ense_af_setup, .-ense_af_setup
.Lscope48:
	.stabs	"ense_be_setup:f(0,1)",36,0,0,ense_be_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	ense_be_setup, @function
ense_be_setup:
	.stabn	68,0,671,.LM361-.LFBB49
.LM361:
.LFBB49:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,672,.LM362-.LFBB49
.LM362:
	cpi r24,lo8(16)
	breq .L327
	cpi r24,lo8(32)
	brne .L326
.L327:
.LBB107:
.LBB108:
	.stabn	68,0,676,.LM363-.LFBB49
.LM363:
	call toggle_before_hints_message
	.stabn	68,0,678,.LM364-.LFBB49
.LM364:
	call get_before_hints_message
	call disp_flag
	.stabn	68,0,679,.LM365-.LFBB49
.LM365:
	jmp set_handled
.L326:
/* epilogue start */
.LBE108:
.LBE107:
	.stabn	68,0,682,.LM366-.LFBB49
.LM366:
	ret
	.size	ense_be_setup, .-ense_be_setup
.Lscope49:
	.stabs	"alarm_clock_setup:f(0,1)",36,0,0,alarm_clock_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	alarm_clock_setup, @function
alarm_clock_setup:
	.stabn	68,0,1185,.LM367-.LFBB50
.LM367:
.LFBB50:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1186,.LM368-.LFBB50
.LM368:
	cpi r24,lo8(16)
	breq .L333
	cpi r24,lo8(32)
	brne .L332
.L333:
.LBB111:
.LBB112:
	.stabn	68,0,1190,.LM369-.LFBB50
.LM369:
	call toggle_alarm_clock
	.stabn	68,0,1192,.LM370-.LFBB50
.LM370:
	call get_alarm_clock
	call disp_flag
	.stabn	68,0,1193,.LM371-.LFBB50
.LM371:
	jmp set_handled
.L332:
/* epilogue start */
.LBE112:
.LBE111:
	.stabn	68,0,1196,.LM372-.LFBB50
.LM372:
	ret
	.size	alarm_clock_setup, .-alarm_clock_setup
.Lscope50:
	.section	.rodata.str1.1
.LC5:
	.string	" OFF"
	.text
	.stabs	"disp_wakeup_mode:f(0,1)",36,0,0,disp_wakeup_mode
	.type	disp_wakeup_mode, @function
disp_wakeup_mode:
	.stabn	68,0,1140,.LM373-.LFBB51
.LM373:
.LFBB51:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1141,.LM374-.LFBB51
.LM374:
	call is_invalid_wakeup_mode
	.stabn	68,0,1141,.LM375-.LFBB51
.LM375:
	tst r24
	breq .L339
	.stabn	68,0,1142,.LM376-.LFBB51
.LM376:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	jmp disp_msg
.L339:
.LBB115:
.LBB116:
	.stabn	68,0,1144,.LM377-.LFBB51
.LM377:
	call get_wakeup_mode
	.stabn	68,0,1144,.LM378-.LFBB51
.LM378:
	ldi r25,0
	jmp disp_num
.LBE116:
.LBE115:
	.size	disp_wakeup_mode, .-disp_wakeup_mode
.Lscope51:
	.stabs	"wakeup_mode_setup_activate:f(0,1)",36,0,0,wakeup_mode_setup_activate
	.type	wakeup_mode_setup_activate, @function
wakeup_mode_setup_activate:
	.stabn	68,0,1148,.LM379-.LFBB52
.LM379:
.LFBB52:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1149,.LM380-.LFBB52
.LM380:
	jmp disp_wakeup_mode
	.size	wakeup_mode_setup_activate, .-wakeup_mode_setup_activate
.Lscope52:
	.stabs	"wakeup_mode_setup:f(0,1)",36,0,0,wakeup_mode_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	wakeup_mode_setup, @function
wakeup_mode_setup:
	.stabn	68,0,1153,.LM381-.LFBB53
.LM381:
.LFBB53:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1154,.LM382-.LFBB53
.LM382:
	cpi r24,lo8(16)
	breq .L342
	cpi r24,lo8(32)
	breq .L343
	cpi r24,lo8(8)
	brne .L341
	.stabn	68,0,1157,.LM383-.LFBB53
.LM383:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L346
	.stabn	68,0,1157,.LM384-.LFBB53
.LM384:
	call is_invalid_wakeup_mode
	tst r24
	breq .L347
	.stabn	68,0,1157,.LM385-.LFBB53
.LM385:
	call set_default_wakeup_mode
.L346:
	.stabn	68,0,1159,.LM386-.LFBB53
.LM386:
	call disp_wakeup_mode
/* epilogue start */
	.stabn	68,0,1177,.LM387-.LFBB53
.LM387:
	pop r28
	.stabn	68,0,1160,.LM388-.LFBB53
.LM388:
	jmp set_handled
.L347:
	.stabn	68,0,1157,.LM389-.LFBB53
.LM389:
	call set_invalid_wakeup_mode
	rjmp .L346
.L343:
	.stabn	68,0,1164,.LM390-.LFBB53
.LM390:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L346
.LBB117:
	.stabn	68,0,1164,.LM391-.LFBB53
.LM391:
	call get_wakeup_mode
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L349
.L353:
	.stabn	68,0,1164,.LM392-.LFBB53
.LM392:
	call max_wakeup_mode
.L352:
.LBE117:
.LBB118:
	.stabn	68,0,1171,.LM393-.LFBB53
.LM393:
	mov r28,r24
	rjmp .L351
.L349:
.LBE118:
.LBB119:
	.stabn	68,0,1164,.LM394-.LFBB53
.LM394:
	call step_wakeup_mode
	sub r28,r24
	call min_wakeup_mode
	cp r28,r24
	brlo .L353
.L351:
.LBE119:
.LBB120:
	.stabn	68,0,1171,.LM395-.LFBB53
.LM395:
	mov r24,r28
	call set_wakeup_mode
	rjmp .L346
.L342:
.LBE120:
	.stabn	68,0,1171,.LM396-.LFBB53
.LM396:
	call is_readonly_wakeup_mode
	cpse r24,__zero_reg__
	rjmp .L346
.LBB121:
	.stabn	68,0,1171,.LM397-.LFBB53
.LM397:
	call get_wakeup_mode
	mov r28,r24
	call step_wakeup_mode
	add r28,r24
	call max_wakeup_mode
	cp r24,r28
	brsh .L351
	.stabn	68,0,1171,.LM398-.LFBB53
.LM398:
	call min_wakeup_mode
	rjmp .L352
.L341:
/* epilogue start */
.LBE121:
	.stabn	68,0,1177,.LM399-.LFBB53
.LM399:
	pop r28
	ret
	.size	wakeup_mode_setup, .-wakeup_mode_setup
.Lscope53:
	.stabs	"disp_duplex_mode:f(0,1)",36,0,0,disp_duplex_mode
	.stabs	"wakeup_mode_t:t(0,32)=(0,4)",128,0,0,0
	.type	disp_duplex_mode, @function
disp_duplex_mode:
	.stabn	68,0,1099,.LM400-.LFBB54
.LM400:
.LFBB54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1100,.LM401-.LFBB54
.LM401:
	call is_invalid_duplex_mode
	.stabn	68,0,1100,.LM402-.LFBB54
.LM402:
	tst r24
	breq .L355
	.stabn	68,0,1101,.LM403-.LFBB54
.LM403:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	jmp disp_msg
.L355:
.LBB124:
.LBB125:
	.stabn	68,0,1103,.LM404-.LFBB54
.LM404:
	call get_duplex_mode
	.stabn	68,0,1103,.LM405-.LFBB54
.LM405:
	ldi r25,0
	jmp disp_num
.LBE125:
.LBE124:
	.size	disp_duplex_mode, .-disp_duplex_mode
.Lscope54:
	.stabs	"duplex_mode_setup_activate:f(0,1)",36,0,0,duplex_mode_setup_activate
	.type	duplex_mode_setup_activate, @function
duplex_mode_setup_activate:
	.stabn	68,0,1107,.LM406-.LFBB55
.LM406:
.LFBB55:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1108,.LM407-.LFBB55
.LM407:
	jmp disp_duplex_mode
	.size	duplex_mode_setup_activate, .-duplex_mode_setup_activate
.Lscope55:
	.stabs	"duplex_mode_setup:f(0,1)",36,0,0,duplex_mode_setup
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	duplex_mode_setup, @function
duplex_mode_setup:
	.stabn	68,0,1112,.LM408-.LFBB56
.LM408:
.LFBB56:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,1113,.LM409-.LFBB56
.LM409:
	cpi r24,lo8(16)
	breq .L358
	cpi r24,lo8(32)
	breq .L359
	cpi r24,lo8(8)
	breq .+2
	rjmp .L357
	.stabn	68,0,1116,.LM410-.LFBB56
.LM410:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L362
	.stabn	68,0,1116,.LM411-.LFBB56
.LM411:
	call is_invalid_duplex_mode
	tst r24
	breq .L363
	.stabn	68,0,1116,.LM412-.LFBB56
.LM412:
	call set_default_duplex_mode
.L362:
	.stabn	68,0,1118,.LM413-.LFBB56
.LM413:
	call disp_duplex_mode
/* epilogue start */
	.stabn	68,0,1136,.LM414-.LFBB56
.LM414:
	pop r28
	.stabn	68,0,1119,.LM415-.LFBB56
.LM415:
	jmp set_handled
.L363:
	.stabn	68,0,1116,.LM416-.LFBB56
.LM416:
	call set_invalid_duplex_mode
	rjmp .L362
.L359:
	.stabn	68,0,1123,.LM417-.LFBB56
.LM417:
	call is_invalid_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L362
	.stabn	68,0,1123,.LM418-.LFBB56
.LM418:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L362
.LBB126:
	.stabn	68,0,1123,.LM419-.LFBB56
.LM419:
	call get_duplex_mode
	mov r28,r24
	cpse r24,__zero_reg__
	rjmp .L365
.L369:
	.stabn	68,0,1123,.LM420-.LFBB56
.LM420:
	call max_duplex_mode
.L368:
.LBE126:
.LBB127:
	.stabn	68,0,1130,.LM421-.LFBB56
.LM421:
	mov r28,r24
	rjmp .L367
.L365:
.LBE127:
.LBB128:
	.stabn	68,0,1123,.LM422-.LFBB56
.LM422:
	call step_duplex_mode
	sub r28,r24
	call min_duplex_mode
	cp r28,r24
	brlo .L369
.L367:
.LBE128:
.LBB129:
	.stabn	68,0,1130,.LM423-.LFBB56
.LM423:
	mov r24,r28
	call set_duplex_mode
	rjmp .L362
.L358:
.LBE129:
	.stabn	68,0,1130,.LM424-.LFBB56
.LM424:
	call is_invalid_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L362
	.stabn	68,0,1130,.LM425-.LFBB56
.LM425:
	call is_readonly_duplex_mode
	cpse r24,__zero_reg__
	rjmp .L362
.LBB130:
	.stabn	68,0,1130,.LM426-.LFBB56
.LM426:
	call get_duplex_mode
	mov r28,r24
	call step_duplex_mode
	add r28,r24
	call max_duplex_mode
	cp r24,r28
	brsh .L367
	.stabn	68,0,1130,.LM427-.LFBB56
.LM427:
	call min_duplex_mode
	rjmp .L368
.L357:
/* epilogue start */
.LBE130:
	.stabn	68,0,1136,.LM428-.LFBB56
.LM428:
	pop r28
	ret
	.size	duplex_mode_setup, .-duplex_mode_setup
.Lscope56:
	.stabs	"clock_setup:f(0,1)",36,0,0,clock_setup
	.stabs	"duplex_mode_t:t(0,33)=(0,4)",128,0,0,0
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	clock_setup, @function
clock_setup:
	.stabn	68,0,976,.LM429-.LFBB57
.LM429:
.LFBB57:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,977,.LM430-.LFBB57
.LM430:
	cpi r24,lo8(32)
	breq .L371
	brsh .L372
	cpi r24,lo8(8)
	breq .L373
	cpi r24,lo8(16)
	breq .L374
	ret
.L372:
	cpi r24,lo8(-112)
	breq .L374
	cpi r24,lo8(-96)
	breq .L371
	ret
.L373:
.LBB133:
.LBB134:
	.stabn	68,0,981,.LM431-.LFBB57
.LM431:
	call rtc_get_setup
	.stabn	68,0,981,.LM432-.LFBB57
.LM432:
	sbiw r24,1
	brne .L376
	.stabn	68,0,982,.LM433-.LFBB57
.LM433:
	ldi r24,lo8(2)
	ldi r25,0
.L390:
	.stabn	68,0,984,.LM434-.LFBB57
.LM434:
	call rtc_set_setup
.L391:
.LBE134:
.LBE133:
	.stabn	68,0,997,.LM435-.LFBB57
.LM435:
	jmp set_handled
.L376:
.LBB136:
.LBB135:
	.stabn	68,0,984,.LM436-.LFBB57
.LM436:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L390
.L371:
.LBE135:
.LBE136:
	.stabn	68,0,990,.LM437-.LFBB57
.LM437:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L392:
	.stabn	68,0,996,.LM438-.LFBB57
.LM438:
	call rtc_setup_inc
	rjmp .L391
.L374:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L392
	.size	clock_setup, .-clock_setup
.Lscope57:
	.type	remd_check_handler, @function
remd_check_handler:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	remd_check_handler, .-remd_check_handler
	.type	wakeup_signal_check_handler, @function
wakeup_signal_check_handler:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	wakeup_signal_check_handler, .-wakeup_signal_check_handler
	.stabs	"save_settings_handler:f(0,1)",36,0,0,save_settings_handler
	.stabs	"key_event:P(0,13)",64,0,0,24
	.type	save_settings_handler, @function
save_settings_handler:
	.stabn	68,0,1388,.LM439-.LFBB58
.LM439:
.LFBB58:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,1389,.LM440-.LFBB58
.LM440:
	cpi r24,lo8(8)
	brne .L395
.LBB141:
.LBB142:
	.stabn	68,0,1392,.LM441-.LFBB58
.LM441:
	call config_save_to_storage
	.stabn	68,0,1394,.LM442-.LFBB58
.LM442:
	call set_handled
.LBB143:
.LBB144:
	.stabn	68,0,353,.LM443-.LFBB58
.LM443:
	lds r24,menu+5
	ori r24,lo8(2)
	sts menu+5,r24
.L395:
/* epilogue start */
.LBE144:
.LBE143:
.LBE142:
.LBE141:
	.stabn	68,0,1398,.LM444-.LFBB58
.LM444:
	ret
	.size	save_settings_handler, .-save_settings_handler
.Lscope58:
	.stabs	"update_menu:f(0,1)",36,0,0,update_menu
	.type	update_menu, @function
update_menu:
	.stabn	68,0,539,.LM445-.LFBB59
.LM445:
.LFBB59:
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
.LBB163:
.LBB164:
	.stabn	68,0,464,.LM446-.LFBB59
.LM446:
	call get_addr
.LBB165:
.LBB166:
	.stabn	68,0,391,.LM447-.LFBB59
.LM447:
	adiw r24,11
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  391 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
	movw r16,r28
	subi r16,-1
	sbci r17,-1
.LBE166:
.LBE165:
.LBE164:
.LBE163:
	.stabn	68,0,545,.LM448-.LFBB59
.LM448:
	tst r24
	brne .+2
	rjmp .L398
.LBB167:
.LBB168:
	.stabn	68,0,488,.LM449-.LFBB59
.LM449:
	call get_addr
.LBB169:
.LBB170:
.LBB171:
	.stabn	68,0,418,.LM450-.LFBB59
.LM450:
	adiw r24,18
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  418 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE171:
.LBE170:
.LBE169:
.LBE168:
.LBE167:
	.stabn	68,0,548,.LM451-.LFBB59
.LM451:
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	sbiw r24,0
	breq .L399
	.stabn	68,0,548,.LM452-.LFBB59
.LM452:
	movw r30,r24
	icall
	.stabn	68,0,548,.LM453-.LFBB59
.LM453:
	mov r14,r24
	mov r15,__zero_reg__
.L399:
.LBB172:
.LBB173:
	.stabn	68,0,458,.LM454-.LFBB59
.LM454:
	call get_addr
	movw r22,r24
.LBB174:
.LBB175:
	.stabn	68,0,384,.LM455-.LFBB59
.LM455:
	movw r24,r16
	call strcpy_P
.LBE175:
.LBE174:
.LBE173:
.LBE172:
	.stabn	68,0,548,.LM456-.LFBB59
.LM456:
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
.L402:
	.stabn	68,0,552,.LM457-.LFBB59
.LM457:
	movw r24,r16
	.stabn	68,0,554,.LM458-.LFBB59
.LM458:
	ldi r22,lo8(1)
	ldi r23,0
	call disp_msg
/* epilogue start */
	.stabn	68,0,555,.LM459-.LFBB59
.LM459:
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
.L398:
.LBB176:
.LBB177:
	.stabn	68,0,458,.LM460-.LFBB59
.LM460:
	call get_addr
	movw r22,r24
.LBB178:
.LBB179:
	.stabn	68,0,384,.LM461-.LFBB59
.LM461:
	movw r24,r16
	call strcpy_P
	rjmp .L402
.LBE179:
.LBE178:
.LBE177:
.LBE176:
	.size	update_menu, .-update_menu
	.stabs	"temp:(0,34)=ar(0,20);0;9;(0,21)",128,0,0,1
	.stabs	"buf:(0,35)=ar(0,20);0;4;(0,21)",128,0,0,11
	.stabn	192,0,0,.LFBB59-.LFBB59
	.stabn	224,0,0,.Lscope59-.LFBB59
.Lscope59:
	.stabs	"menu_init:F(0,1)",36,0,0,menu_init
.global	menu_init
	.type	menu_init, @function
menu_init:
	.stabn	68,0,562,.LM462-.LFBB60
.LM462:
.LFBB60:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM463-.LFBB60
.LM463:
	ldi r30,lo8(menu)
	ldi r31,hi8(menu)
	ldi r24,lo8(6)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,565,.LM464-.LFBB60
.LM464:
	ldi r24,lo8(-1)
	std Z+4,r24
	.stabn	68,0,566,.LM465-.LFBB60
.LM465:
	ld r24,Z
	andi r24,lo8(31)
	ori r24,lo8(96)
	st Z,r24
	ldi r30,lo8(menu+1)
	ldi r31,hi8(menu+1)
	ld r24,Z
	andi r24,lo8(-4)
	ori r24,lo8(2)
	st Z,r24
/* epilogue start */
	.stabn	68,0,567,.LM466-.LFBB60
.LM466:
	ret
	.size	menu_init, .-menu_init
.Lscope60:
	.stabs	"menu_enter:F(0,1)",36,0,0,menu_enter
.global	menu_enter
	.type	menu_enter, @function
menu_enter:
	.stabn	68,0,570,.LM467-.LFBB61
.LM467:
.LFBB61:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM468-.LFBB61
.LM468:
	ldi r30,lo8(menu)
	ldi r31,hi8(menu)
	std Z+4,__zero_reg__
	.stabn	68,0,572,.LM469-.LFBB61
.LM469:
	ld r24,Z
	andi r24,lo8(-32)
	st Z,r24
	.stabn	68,0,574,.LM470-.LFBB61
.LM470:
	jmp update_menu
	.size	menu_enter, .-menu_enter
.Lscope61:
	.stabs	"menu_is_active:F(0,36)=eFalse:0,True:1,;",36,0,0,menu_is_active
	.stabs	"_Bool:t(0,36)",128,0,0,0
.global	menu_is_active
	.type	menu_is_active, @function
menu_is_active:
	.stabn	68,0,578,.LM471-.LFBB62
.LM471:
.LFBB62:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,579,.LM472-.LFBB62
.LM472:
	lds r24,menu+4
	com r24
	.stabn	68,0,580,.LM473-.LFBB62
.LM473:
	rol r24
	clr r24
	rol r24
/* epilogue start */
	ret
	.size	menu_is_active, .-menu_is_active
.Lscope62:
	.stabs	"menu_handle:F(0,37)=r(0,37);-32768;32767;",36,0,0,menu_handle
	.stabs	"int:t(0,37)",128,0,0,0
	.stabs	"key_event:P(0,4)",64,0,0,29
.global	menu_handle
	.type	menu_handle, @function
menu_handle:
	.stabn	68,0,583,.LM474-.LFBB63
.LM474:
.LFBB63:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
.LBB222:
.LBB223:
	.stabn	68,0,579,.LM475-.LFBB63
.LM475:
	lds r28,menu+4
.LBE223:
.LBE222:
	.stabn	68,0,589,.LM476-.LFBB63
.LM476:
	ldi r25,0
	ldi r24,0
	.stabn	68,0,588,.LM477-.LFBB63
.LM477:
	sbrc r28,7
	rjmp .L406
.LBB224:
.LBB225:
	.stabn	68,0,341,.LM478-.LFBB63
.LM478:
	lds r24,menu+5
	andi r24,lo8(-16)
	sts menu+5,r24
	mov r30,r28
	lsl r30
	sbc r31,r31
.LBE225:
.LBE224:
	.stabn	68,0,593,.LM479-.LFBB63
.LM479:
	cpi r29,lo8(-124)
	brne .L408
.LBB226:
.LBB227:
	.stabn	68,0,367,.LM480-.LFBB63
.LM480:
	subi r30,lo8(-(menu+1))
	sbci r31,hi8(-(menu+1))
	ld r24,Z
.LBE227:
.LBE226:
	.stabn	68,0,594,.LM481-.LFBB63
.LM481:
	sbrs r24,2
	rjmp .L410
	.stabn	68,0,596,.LM482-.LFBB63
.LM482:
	call get_exit_func
	movw r30,r24
	.stabn	68,0,597,.LM483-.LFBB63
.LM483:
	or r24,r25
	breq .L410
	.stabn	68,0,598,.LM484-.LFBB63
.LM484:
	icall
.L410:
.LBB228:
.LBB229:
	.stabn	68,0,517,.LM485-.LFBB63
.LM485:
	lds r24,menu+4
	.stabn	68,0,517,.LM486-.LFBB63
.LM486:
	cpse r24,__zero_reg__
	rjmp .L412
.L413:
.LBE229:
.LBE228:
.LBB231:
.LBB232:
	.stabn	68,0,359,.LM487-.LFBB63
.LM487:
	ldi r24,lo8(-1)
	sts menu+4,r24
	.stabn	68,0,361,.LM488-.LFBB63
.LM488:
	lds r24,menu+5
	andi r24,lo8(-16)
	ori r24,lo8(5)
	sts menu+5,r24
.LBE232:
.LBE231:
	.stabn	68,0,601,.LM489-.LFBB63
.LM489:
	ldi r24,lo8(5)
	ldi r25,0
.L406:
/* epilogue start */
	.stabn	68,0,659,.LM490-.LFBB63
.LM490:
	pop r29
	pop r28
	ret
.L412:
.LBB233:
.LBB230:
	.stabn	68,0,520,.LM491-.LFBB63
.LM491:
	subi r24,lo8(-(-1))
	sts menu+4,r24
.LBE230:
.LBE233:
	.stabn	68,0,600,.LM492-.LFBB63
.LM492:
	sbrc r24,7
	rjmp .L413
	.stabn	68,0,602,.LM493-.LFBB63
.LM493:
	call update_menu
	.stabn	68,0,603,.LM494-.LFBB63
.LM494:
	call set_handled
	.stabn	68,0,604,.LM495-.LFBB63
.LM495:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L406
.L408:
.LBB234:
.LBB235:
	.stabn	68,0,367,.LM496-.LFBB63
.LM496:
	movw r26,r30
	subi r26,lo8(-(menu+1))
	sbci r27,hi8(-(menu+1))
	ld r24,X
.LBE235:
.LBE234:
	.stabn	68,0,607,.LM497-.LFBB63
.LM497:
	sbrc r24,2
	rjmp .L414
	.stabn	68,0,608,.LM498-.LFBB63
.LM498:
	cpi r29,lo8(4)
	breq .L415
	cpi r29,lo8(8)
	breq .L416
.L417:
	.stabn	68,0,658,.LM499-.LFBB63
.LM499:
	lds r24,menu+5
	andi r24,lo8(15)
	ldi r25,0
	rjmp .L406
.L415:
.LBB236:
.LBB237:
	.stabn	68,0,530,.LM500-.LFBB63
.LM500:
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	.stabn	68,0,530,.LM501-.LFBB63
.LM501:
	ld r18,Z
	mov r24,r18
	andi r24,lo8(31)
	ldi r25,0
	.stabn	68,0,530,.LM502-.LFBB63
.LM502:
	adiw r24,1
	.stabn	68,0,530,.LM503-.LFBB63
.LM503:
	mov r19,r18
	swap r19
	lsr r19
	andi r19,lo8(7)
	ldd r22,Z+1
	andi r22,lo8(3)
	lsl r22
	lsl r22
	lsl r22
	or r22,r19
	ldi r23,0
	.stabn	68,0,530,.LM504-.LFBB63
.LM504:
	call __divmodhi4
	.stabn	68,0,530,.LM505-.LFBB63
.LM505:
	andi r24,lo8(31)
	andi r18,lo8(-32)
	or r18,r24
	st Z,r18
.L439:
.LBE237:
.LBE236:
	.stabn	68,0,639,.LM506-.LFBB63
.LM506:
	call update_menu
	rjmp .L438
.L416:
.LBB238:
.LBB239:
	.stabn	68,0,494,.LM507-.LFBB63
.LM507:
	call get_addr
.LBB240:
.LBB241:
	.stabn	68,0,432,.LM508-.LFBB63
.LM508:
	adiw r24,22
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  432 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE241:
.LBE240:
.LBE239:
.LBE238:
	.stabn	68,0,618,.LM509-.LFBB63
.LM509:
	tst r24
	breq .L418
.LBB242:
.LBB243:
.LBB244:
.LBB245:
	.stabn	68,0,494,.LM510-.LFBB63
.LM510:
	call get_addr
.LBB246:
.LBB247:
	.stabn	68,0,432,.LM511-.LFBB63
.LM511:
	adiw r24,22
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  432 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE247:
.LBE246:
.LBE245:
.LBE244:
	.stabn	68,0,508,.LM512-.LFBB63
.LM512:
	ldi r30,lo8(1)
	add r30,r28
	.stabn	68,0,508,.LM513-.LFBB63
.LM513:
	sts menu+4,r30
	.stabn	68,0,510,.LM514-.LFBB63
.LM514:
	lsl r30
	sbc r31,r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	.stabn	68,0,511,.LM515-.LFBB63
.LM515:
	mov r25,r24
	swap r25
	lsl r25
	andi r25,lo8(-32)
	st Z,r25
	lsr r24
	lsr r24
	lsr r24
	andi r24,lo8(3)
	ldd r25,Z+1
	andi r25,lo8(-4)
	or r24,r25
.L440:
.LBE243:
.LBE242:
.LBB248:
.LBB249:
	.stabn	68,0,373,.LM516-.LFBB63
.LM516:
	std Z+1,r24
	rjmp .L439
.L418:
.LBE249:
.LBE248:
.LBB251:
.LBB252:
	.stabn	68,0,470,.LM517-.LFBB63
.LM517:
	call get_addr
.LBB253:
.LBB254:
.LBB255:
	.stabn	68,0,397,.LM518-.LFBB63
.LM518:
	adiw r24,12
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  397 "src/ds_menu.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE255:
.LBE254:
.LBE253:
.LBE252:
.LBE251:
	.stabn	68,0,623,.LM519-.LFBB63
.LM519:
	sbiw r24,0
	breq .L420
	.stabn	68,0,624,.LM520-.LFBB63
.LM520:
	movw r30,r24
	icall
.L420:
.LBB256:
.LBB257:
	.stabn	68,0,373,.LM521-.LFBB63
.LM521:
	lds r30,menu+4
	.stabn	68,0,373,.LM522-.LFBB63
.LM522:
	lsl r30
	sbc r31,r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	ldd r24,Z+1
	ori r24,lo8(1<<2)
	std Z+1,r24
.L438:
.LBE257:
.LBE256:
	.stabn	68,0,640,.LM523-.LFBB63
.LM523:
	call set_handled
	.stabn	68,0,641,.LM524-.LFBB63
.LM524:
	rjmp .L417
.L414:
	.stabn	68,0,632,.LM525-.LFBB63
.LM525:
	cpi r29,lo8(4)
	brne .L421
	.stabn	68,0,634,.LM526-.LFBB63
.LM526:
	call get_exit_func
	movw r30,r24
	.stabn	68,0,635,.LM527-.LFBB63
.LM527:
	or r24,r25
	breq .L422
	.stabn	68,0,636,.LM528-.LFBB63
.LM528:
	icall
.L422:
.LBB258:
.LBB250:
	.stabn	68,0,373,.LM529-.LFBB63
.LM529:
	lds r30,menu+4
	.stabn	68,0,373,.LM530-.LFBB63
.LM530:
	lsl r30
	sbc r31,r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	ldd r24,Z+1
	andi r24,lo8(~(1<<2))
	rjmp .L440
.L421:
.LBE250:
.LBE258:
.LBB259:
.LBB260:
	.stabn	68,0,482,.LM531-.LFBB63
.LM531:
	call get_addr
.LBB261:
.LBB262:
.LBB263:
	.stabn	68,0,411,.LM532-.LFBB63
.LM532:
	movw r20,r24
	subi r20,-16
	sbci r21,-1
	mov __tmp_reg__,r21
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  411 "src/ds_menu.c" 1
	out 59, r22
	movw r30, r20
	elpm r20, Z+
	elpm r21, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE263:
.LBE262:
.LBE261:
.LBE260:
.LBE259:
	.stabn	68,0,646,.LM533-.LFBB63
.LM533:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	brne .+2
	rjmp .L417
	.stabn	68,0,647,.LM534-.LFBB63
.LM534:
	mov r24,r29
	movw r30,r20
	icall
	.stabn	68,0,649,.LM535-.LFBB63
.LM535:
	lds r24,menu+5
	.stabn	68,0,649,.LM536-.LFBB63
.LM536:
	sbrs r24,1
	rjmp .L417
.LBB264:
.LBB265:
	.stabn	68,0,373,.LM537-.LFBB63
.LM537:
	lds r30,menu+4
	.stabn	68,0,373,.LM538-.LFBB63
.LM538:
	lsl r30
	sbc r31,r31
	subi r30,lo8(-(menu))
	sbci r31,hi8(-(menu))
	ldd r24,Z+1
	andi r24,lo8(~(1<<2))
	std Z+1,r24
.LBE265:
.LBE264:
	.stabn	68,0,651,.LM539-.LFBB63
.LM539:
	call update_menu
	rjmp .L417
	.size	menu_handle, .-menu_handle
.Lscope63:
	.local	menu
	.comm	menu,6,1
	.stabs	"menu:S(0,38)=(0,39)=xss_menu:",40,0,0,menu
	.stabs	"s_menu:T(0,39)=s6plane:(0,40)=ar(0,20);0;1;(0,41)=(0,42)=xss_menu_plane:,0,32;level:(0,6),32,8;res:(0,4),40,4;;",128,0,0,0
	.stabs	"menu_t:t(0,38)",128,0,0,0
	.stabs	"s_menu_plane:T(0,42)=s2index:(0,4),0,5;count:(0,4),5,5;is_active:(0,4),10,1;;",128,0,0,0
.global	desc_root
	.section	.progmem.data,"a",@progbits
	.type	desc_root, @object
	.size	desc_root, 437
desc_root:
	.string	"CLSE"
	.zero	6
	.zero	1
	.word	gs(clock_setup_activate)
	.word	gs(clock_setup_exit)
	.word	gs(clock_setup)
	.zero	5
	.string	"UtSE"
	.zero	6
	.zero	1
	.word	gs(wakeup_timer_setup_activate)
	.word	gs(disable_key_hold_repeat)
	.word	gs(wakeup_timer_setup)
	.zero	5
	.string	"EnSE"
	.zero	6
	.zero	9
	.word	desc_en_se
	.byte	10
	.string	"COtr"
	.zero	6
	.zero	1
	.word	gs(remd_trigger_counter_display)
	.zero	9
	.string	"HItr"
	.zero	6
	.zero	1
	.word	gs(trigger_times_activate)
	.word	gs(disable_key_hold_repeat)
	.word	gs(trigger_times_handler)
	.zero	5
	.string	"d-%.2i"
	.zero	4
	.byte	2
	.word	gs(remd_sensitivity_setup_activate)
	.word	gs(disable_key_hold_repeat)
	.word	gs(remd_sensitivity_setup)
	.word	gs(get_remd_sensitivity)
	.zero	3
	.string	"du-%i"
	.zero	5
	.byte	1
	.word	gs(duplex_mode_setup_activate)
	.zero	2
	.word	gs(duplex_mode_setup)
	.word	gs(get_duplex_mode)
	.zero	3
	.string	"UP-%i"
	.zero	5
	.byte	1
	.word	gs(wakeup_mode_setup_activate)
	.zero	2
	.word	gs(wakeup_mode_setup)
	.word	gs(get_wakeup_mode)
	.zero	3
	.string	"AL-%i"
	.zero	5
	.byte	1
	.word	gs(alarm_clock_setup_activate)
	.zero	2
	.word	gs(alarm_clock_setup)
	.word	gs(get_alarm_clock)
	.zero	3
	.string	"Fr-%i"
	.zero	5
	.byte	1
	.word	gs(hints_frequency_setup_activate)
	.zero	2
	.word	gs(hints_frequency_setup)
	.word	gs(get_hints_frequency)
	.zero	3
	.string	"Od-%i"
	.zero	5
	.byte	1
	.word	gs(hints_duty_cycle_setup_activate)
	.zero	2
	.word	gs(hints_duty_cycle_setup)
	.word	gs(get_hints_duty_cycle)
	.zero	3
	.string	"br-%i"
	.zero	5
	.byte	1
	.word	gs(light_hints_brightness_setup_activate)
	.zero	2
	.word	gs(light_hints_brightness_setup)
	.word	gs(get_light_hints_brightness)
	.zero	3
	.string	"LE-%i"
	.zero	5
	.byte	1
	.word	gs(sound_hints_volume_setup_activate)
	.zero	2
	.word	gs(sound_hints_volume_setup)
	.word	gs(get_sound_hints_volume)
	.zero	3
	.string	"F-%.2i"
	.zero	4
	.byte	2
	.word	gs(light_hints_duration_setup_activate)
	.word	gs(disable_key_hold_repeat)
	.word	gs(light_hints_duration_setup)
	.word	gs(get_light_hints_duration)
	.zero	3
	.string	"S-%.2i"
	.zero	4
	.byte	2
	.word	gs(sound_hints_duration_setup_activate)
	.word	gs(disable_key_hold_repeat)
	.word	gs(sound_hints_duration_setup)
	.word	gs(get_sound_hints_duration)
	.zero	3
	.string	"CHUP"
	.zero	6
	.zero	5
	.word	gs(wakeup_signal_check_handler)
	.zero	5
	.string	"CHdt"
	.zero	6
	.zero	5
	.word	gs(remd_check_handler)
	.zero	5
	.string	"SEdt"
	.zero	6
	.zero	1
	.word	gs(set_defaults_activate)
	.zero	2
	.word	gs(set_defaults_handler)
	.zero	5
	.string	"SAUE"
	.zero	6
	.zero	1
	.word	gs(save_settings_activate)
	.zero	2
	.word	gs(save_settings_handler)
	.zero	5
	.stabs	"desc_root:G(0,43)=ar(0,20);0;18;(0,44)=(0,45)=xss_menu_desc:",32,0,0,0
	.stabs	"s_menu_desc:T(0,45)=s23label:(0,46)=ar(0,20);0;10;(0,21),0,88;fmt:(0,4),88,8;activate:(0,47)=(0,11),96,16;exit_fn:(0,10),112,16;handler:(0,48)=(0,49)=*(0,50)=f(0,1),128,16;read_value:(0,51)=(0,52)=*(0,53)=f(0,4),144,16;sub_items:(0,54)=*(0,44),160,16;sub_count:(0,4),176,8;;",128,0,0,0
	.stabs	"pfn_activate:t(0,47)",128,0,0,0
	.stabs	"pfn_handler:t(0,48)",128,0,0,0
	.stabs	"pfn_read_value:t(0,51)",128,0,0,0
.global	desc_en_se
	.type	desc_en_se, @object
	.size	desc_en_se, 230
desc_en_se:
	.string	"bE-%i"
	.zero	5
	.byte	1
	.word	gs(ense_be_setup_activate)
	.zero	2
	.word	gs(ense_be_setup)
	.word	gs(get_before_hints_message)
	.zero	3
	.string	"AF-%i"
	.zero	5
	.byte	1
	.word	gs(ense_af_setup_activate)
	.zero	2
	.word	gs(ense_af_setup)
	.word	gs(get_after_hints_message)
	.zero	3
	.string	"Sc-%i"
	.zero	5
	.byte	1
	.word	gs(ense_sc_setup_activate)
	.zero	2
	.word	gs(ense_sc_setup)
	.word	gs(get_sleep_scenario_playback)
	.zero	3
	.string	"rd-%i"
	.zero	5
	.byte	1
	.word	gs(ense_recording_setup_activate)
	.zero	2
	.word	gs(ense_recording_setup)
	.word	gs(get_voice_recording)
	.zero	3
	.string	"rG-%i"
	.zero	5
	.byte	1
	.word	gs(ense_recording_gain_level_setup_activate)
	.zero	2
	.word	gs(ense_recording_gain_level_setup)
	.word	gs(get_recording_gain_level)
	.zero	3
	.string	"LE-%i"
	.zero	5
	.byte	1
	.word	gs(ense_music_volume_setup_activate)
	.zero	2
	.word	gs(ense_music_volume_setup)
	.word	gs(get_music_volume_level)
	.zero	3
	.string	"tu-%i"
	.zero	5
	.byte	1
	.word	gs(ense_tunes_setup_activate)
	.zero	2
	.word	gs(ense_tunes_setup)
	.word	gs(get_relax_tunes_playback)
	.zero	3
	.string	"dELr"
	.zero	6
	.zero	1
	.word	gs(ense_del_records_activate)
	.zero	2
	.word	gs(ense_del_records)
	.zero	5
	.string	"FL-%i"
	.zero	5
	.byte	1
	.word	gs(ense_fl_setup_activate)
	.zero	2
	.word	gs(ense_fl_setup)
	.word	gs(get_vibration_level)
	.zero	3
	.string	"SP-%i"
	.zero	5
	.byte	1
	.word	gs(ense_speaker_setup_activate)
	.zero	2
	.word	gs(ense_speaker_setup)
	.word	gs(get_loud_speaker)
	.zero	3
	.stabs	"desc_en_se:G(0,55)=ar(0,20);0;9;(0,44)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
