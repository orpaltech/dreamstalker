	.file	"ds_config.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_config.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"set_wakeup_mode.part.0:f(0,1)=(0,1)",36,0,0,set_wakeup_mode.part.0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"val:P(0,2)=(0,3)=(0,4)=r(0,4);0;255;",64,0,0,24
	.stabs	"wakeup_mode_t:t(0,2)",128,0,0,0
	.stabs	"uint8_t:t(0,3)",128,0,0,0
	.stabs	"unsigned char:t(0,4)",128,0,0,0
	.type	set_wakeup_mode.part.0, @function
set_wakeup_mode.part.0:
	.stabn	68,0,485,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,492,.LM1-.LFBB1
.LM1:
	cpi r24,lo8(2)
	breq .L3
	ldi r20,lo8(3)
	ldi r19,lo8(2)
	cpi r24,lo8(3)
	brne .L5
	ldi r20,lo8(9)
	ldi r19,lo8(10)
	ldi r18,lo8(2)
	ldi r25,lo8(10)
	rjmp .L2
.L3:
	ldi r20,lo8(6)
	ldi r19,lo8(6)
.L5:
	ldi r18,lo8(3)
	ldi r25,0
.L2:
	.stabn	68,0,489,.LM2-.LFBB1
.LM2:
	sts cfg+11,r24
.LBB272:
.LBB273:
	.stabn	68,0,574,.LM3-.LFBB1
.LM3:
	sts cfg+15,r20
.LBE273:
.LBE272:
.LBB274:
.LBB275:
	.stabn	68,0,576,.LM4-.LFBB1
.LM4:
	sts cfg+17,r19
.LBE275:
.LBE274:
.LBB276:
.LBB277:
.LBB278:
	.stabn	68,0,575,.LM5-.LFBB1
.LM5:
	sts cfg+16,r18
.LBE278:
.LBE277:
.LBE276:
.LBB279:
.LBB280:
	.stabn	68,0,577,.LM6-.LFBB1
.LM6:
	sts cfg+18,r25
.LBE280:
.LBE279:
.LBB281:
.LBB282:
	.stabn	68,0,573,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(4)
	sts cfg+14,r24
.LBE282:
.LBE281:
.LBB283:
.LBB284:
.LBB285:
	.stabn	68,0,572,.LM8-.LFBB1
.LM8:
	ldi r24,lo8(2)
	sts cfg+13,r24
.LBE285:
.LBE284:
.LBE283:
.LBB286:
.LBB287:
	lds r24,cfg+20
	ori r24,lo8(126)
	sts cfg+20,r24
/* epilogue start */
.LBE287:
.LBE286:
	.stabn	68,0,527,.LM9-.LFBB1
.LM9:
	ret
	.size	set_wakeup_mode.part.0, .-set_wakeup_mode.part.0
.Lscope1:
	.stabs	"config_set_defaults:F(0,1)",36,0,0,config_set_defaults
.global	config_set_defaults
	.type	config_set_defaults, @function
config_set_defaults:
	.stabn	68,0,329,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB290:
.LBB291:
	.stabn	68,0,447,.LM11-.LFBB2
.LM11:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(eeprom_cfg)
	ldi r25,hi8(eeprom_cfg)
	call eeprom_update_word
.LBE291:
.LBE290:
	.stabn	68,0,333,.LM12-.LFBB2
.LM12:
	jmp soft_reset
	.size	config_set_defaults, .-config_set_defaults
.Lscope2:
	.stabs	"config_save_to_storage:F(0,1)",36,0,0,config_save_to_storage
.global	config_save_to_storage
	.type	config_save_to_storage, @function
config_save_to_storage:
	.stabn	68,0,337,.LM13-.LFBB3
.LM13:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB294:
.LBB295:
	.stabn	68,0,431,.LM14-.LFBB3
.LM14:
	ldi r24,lo8(2)
	ldi r25,lo8(-128)
	sts cfg+1,r25
	sts cfg,r24
	.stabn	68,0,432,.LM15-.LFBB3
.LM15:
	ldi r20,lo8(21)
	ldi r21,0
	ldi r22,lo8(eeprom_cfg)
	ldi r23,hi8(eeprom_cfg)
	ldi r24,lo8(cfg)
	ldi r25,hi8(cfg)
	jmp eeprom_update_block
.LBE295:
.LBE294:
	.size	config_save_to_storage, .-config_save_to_storage
.Lscope3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" OFF"
	.text
	.stabs	"power_off:F(0,1)",36,0,0,power_off
	.stabs	"e_rtc_oper_mode:T(0,5)=eRTC_OPM_DEFAULT:0,RTC_OPM_POWERSAVE:1,;",128,0,0,0
.global	power_off
	.type	power_off, @function
power_off:
	.stabn	68,0,347,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,348,.LM17-.LFBB4
.LM17:
	call rtc_hide
	.stabn	68,0,349,.LM18-.LFBB4
.LM18:
	ldi r22,lo8(-12)
	ldi r23,lo8(1)
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call disp_msg
	.stabn	68,0,351,.LM19-.LFBB4
.LM19:
	call codec_stop
	.stabn	68,0,353,.LM20-.LFBB4
.LM20:
	call disp_disable
	.stabn	68,0,355,.LM21-.LFBB4
.LM21:
	call batmon_stop
	.stabn	68,0,356,.LM22-.LFBB4
.LM22:
	call adc_disable
	.stabn	68,0,359,.LM23-.LFBB4
.LM23:
	ldi r24,lo8(1)
	ldi r25,0
	call rtc_start
	.stabn	68,0,364,.LM24-.LFBB4
.LM24:
	in r24,0x35
	andi r24,lo8(-29)
	ori r24,lo8(24)
	out 0x35,r24
.L9:
	.stabn	68,0,367,.LM25-.LFBB4
.LM25:
	ldi r24,lo8(1)
	call keybrd_enable_irq
	.stabn	68,0,372,.LM26-.LFBB4
.LM26:
	in r24,0x35
	ori r24,lo8(32)
	out 0x35,r24
/* #APP */
 ;  372 "src/ds_config.c" 1
	sleep
	
 ;  0 "" 2
/* #NOAPP */
	in r24,0x35
	andi r24,lo8(-33)
	out 0x35,r24
	.stabn	68,0,374,.LM27-.LFBB4
.LM27:
	ldi r24,lo8(1)
	call keybrd_disable_irq
	.stabn	68,0,376,.LM28-.LFBB4
.LM28:
	call keybrd_get_irq_keys
	.stabn	68,0,376,.LM29-.LFBB4
.LM29:
	cpi r24,lo8(1)
	brne .L9
	.stabn	68,0,379,.LM30-.LFBB4
.LM30:
	call rtc_wait_for_tick
	.stabn	68,0,380,.LM31-.LFBB4
.LM31:
	ldi r25,0
	ldi r24,0
	call rtc_start
	.stabn	68,0,382,.LM32-.LFBB4
.LM32:
	call disp_enable
	.stabn	68,0,384,.LM33-.LFBB4
.LM33:
	call adc_enable
	.stabn	68,0,385,.LM34-.LFBB4
.LM34:
	call batmon_start
	.stabn	68,0,387,.LM35-.LFBB4
.LM35:
	call rtc_show
	.stabn	68,0,390,.LM36-.LFBB4
.LM36:
	jmp keybrd_clear_events
	.size	power_off, .-power_off
.Lscope4:
	.stabs	"fw_version:F(0,6)=(0,7)=r(0,7);0;65535;",36,0,0,fw_version
	.stabs	"uint16_t:t(0,6)",128,0,0,0
	.stabs	"uint32_t:t(0,8)=(0,9)=r(0,9);0;4294967295;",128,0,0,0
	.stabs	"unsigned int:t(0,7)",128,0,0,0
	.stabs	"long unsigned int:t(0,9)",128,0,0,0
.global	fw_version
	.type	fw_version, @function
fw_version:
	.stabn	68,0,394,.LM37-.LFBB5
.LM37:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB296:
	.stabn	68,0,395,.LM38-.LFBB5
.LM38:
	ldi r24,lo8(u_FirmwareVersion)
	ldi r25,hi8(u_FirmwareVersion)
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  395 "src/ds_config.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE296:
	.stabn	68,0,396,.LM39-.LFBB5
.LM39:
	ret
	.size	fw_version, .-fw_version
.Lscope5:
	.stabs	"set_duplex_mode:F(0,1)",36,0,0,set_duplex_mode
	.stabs	"val:P(0,10)=(0,3)",64,0,0,24
	.stabs	"duplex_mode_t:t(0,10)",128,0,0,0
.global	set_duplex_mode
	.type	set_duplex_mode, @function
set_duplex_mode:
	.stabn	68,0,463,.LM40-.LFBB6
.LM40:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,464,.LM41-.LFBB6
.LM41:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(3)
	brsh .L12
	.stabn	68,0,465,.LM42-.LFBB6
.LM42:
	sts cfg+10,r24
.L12:
/* epilogue start */
	.stabn	68,0,466,.LM43-.LFBB6
.LM43:
	ret
	.size	set_duplex_mode, .-set_duplex_mode
.Lscope6:
	.stabs	"set_default_duplex_mode:F(0,1)",36,0,0,set_default_duplex_mode
.global	set_default_duplex_mode
	.type	set_default_duplex_mode, @function
set_default_duplex_mode:
	.stabn	68,0,469,.LM44-.LFBB7
.LM44:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB299:
.LBB300:
	.stabn	68,0,482,.LM45-.LFBB7
.LM45:
	sts cfg+10,__zero_reg__
/* epilogue start */
.LBE300:
.LBE299:
	.stabn	68,0,478,.LM46-.LFBB7
.LM46:
	ret
	.size	set_default_duplex_mode, .-set_default_duplex_mode
.Lscope7:
.global	set_invalid_duplex_mode
	.type	set_invalid_duplex_mode, @function
set_invalid_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts cfg+10,__zero_reg__
/* epilogue start */
	ret
	.size	set_invalid_duplex_mode, .-set_invalid_duplex_mode
	.stabs	"set_wakeup_mode:F(0,1)",36,0,0,set_wakeup_mode
	.stabs	"val:P(0,2)",64,0,0,24
.global	set_wakeup_mode
	.type	set_wakeup_mode, @function
set_wakeup_mode:
	.stabn	68,0,486,.LM47-.LFBB8
.LM47:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,487,.LM48-.LFBB8
.LM48:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(3)
	brsh .L16
	jmp set_wakeup_mode.part.0
.L16:
/* epilogue start */
	.stabn	68,0,527,.LM49-.LFBB8
.LM49:
	ret
	.size	set_wakeup_mode, .-set_wakeup_mode
.Lscope8:
	.stabs	"set_default_wakeup_mode:F(0,1)",36,0,0,set_default_wakeup_mode
.global	set_default_wakeup_mode
	.type	set_default_wakeup_mode, @function
set_default_wakeup_mode:
	.stabn	68,0,530,.LM50-.LFBB9
.LM50:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB303:
.LBB304:
	ldi r24,lo8(2)
	jmp set_wakeup_mode.part.0
.LBE304:
.LBE303:
	.size	set_default_wakeup_mode, .-set_default_wakeup_mode
.Lscope9:
	.stabs	"config_init:F(0,1)",36,0,0,config_init
.global	config_init
	.type	config_init, @function
config_init:
	.stabn	68,0,319,.LM51-.LFBB10
.LM51:
.LFBB10:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LBB378:
.LBB379:
	.stabn	68,0,405,.LM52-.LFBB10
.LM52:
	ldi r20,lo8(21)
	ldi r21,0
	ldi r22,lo8(eeprom_cfg)
	ldi r23,hi8(eeprom_cfg)
	ldi r24,lo8(cfg)
	ldi r25,hi8(cfg)
	call eeprom_read_block
.LBE379:
.LBE378:
	.stabn	68,0,320,.LM53-.LFBB10
.LM53:
	lds r24,cfg
	lds r25,cfg+1
	cpi r24,2
	sbci r25,-128
	brne .+2
	rjmp .L19
.LBB380:
.LBB381:
.LBB382:
.LBB383:
	.stabn	68,0,558,.LM54-.LFBB10
.LM54:
	lds r24,cfg+2
	andi r24,lo8(-32)
	ori r24,lo8(8)
	sts cfg+2,r24
.LBE383:
.LBE382:
.LBB384:
.LBB385:
.LBB386:
	.stabn	68,0,564,.LM55-.LFBB10
.LM55:
	sts cfg+5,__zero_reg__
.LBE386:
.LBE385:
.LBE384:
.LBB387:
.LBB388:
.LBB389:
	.stabn	68,0,565,.LM56-.LFBB10
.LM56:
	sts cfg+6,__zero_reg__
.LBE389:
.LBE388:
.LBE387:
.LBB390:
.LBB391:
.LBB392:
	.stabn	68,0,567,.LM57-.LFBB10
.LM57:
	ldi r29,lo8(5)
	sts cfg+7,r29
.LBE392:
.LBE391:
.LBE390:
.LBB393:
.LBB394:
.LBB395:
	.stabn	68,0,568,.LM58-.LFBB10
.LM58:
	sts cfg+8,__zero_reg__
.LBE395:
.LBE394:
.LBE393:
.LBB396:
.LBB397:
.LBB398:
	.stabn	68,0,569,.LM59-.LFBB10
.LM59:
	ldi r28,lo8(4)
	sts cfg+9,r28
.LBE398:
.LBE397:
.LBE396:
.LBB399:
.LBB400:
.LBB401:
	.stabn	68,0,482,.LM60-.LFBB10
.LM60:
	sts cfg+10,__zero_reg__
.LBE401:
.LBE400:
.LBE399:
	.stabn	68,0,301,.LM61-.LFBB10
.LM61:
	call set_default_wakeup_mode
.LBB402:
.LBB403:
.LBB404:
	.stabn	68,0,566,.LM62-.LFBB10
.LM62:
	sts cfg+12,r29
.LBE404:
.LBE403:
.LBE402:
.LBB405:
.LBB406:
.LBB407:
	.stabn	68,0,572,.LM63-.LFBB10
.LM63:
	ldi r24,lo8(2)
	sts cfg+13,r24
.LBE407:
.LBE406:
.LBE405:
.LBB408:
.LBB409:
.LBB410:
	.stabn	68,0,573,.LM64-.LFBB10
.LM64:
	sts cfg+14,r28
.LBE410:
.LBE409:
.LBE408:
.LBB411:
.LBB412:
.LBB413:
	.stabn	68,0,574,.LM65-.LFBB10
.LM65:
	ldi r24,lo8(3)
	sts cfg+15,r24
.LBE413:
.LBE412:
.LBE411:
.LBB414:
.LBB415:
.LBB416:
	.stabn	68,0,575,.LM66-.LFBB10
.LM66:
	sts cfg+16,r24
.LBE416:
.LBE415:
.LBE414:
.LBB417:
.LBB418:
.LBB419:
	.stabn	68,0,576,.LM67-.LFBB10
.LM67:
	ldi r24,lo8(7)
	sts cfg+17,r24
.LBE419:
.LBE418:
.LBE417:
.LBB420:
.LBB421:
.LBB422:
	.stabn	68,0,577,.LM68-.LFBB10
.LM68:
	sts cfg+18,r24
.LBE422:
.LBE421:
.LBE420:
.LBB423:
.LBB424:
	.stabn	68,0,567,.LM69-.LFBB10
.LM69:
	lds r24,cfg+19
	andi r24,lo8(-25)
	sts cfg+19,r24
.LBE424:
.LBE423:
.LBB425:
.LBB426:
	.stabn	68,0,566,.LM70-.LFBB10
.LM70:
	lds r24,cfg+20
	andi r24,lo8(~(1<<0))
	sts cfg+20,r24
.LBE426:
.LBE425:
.LBE381:
.LBE380:
.LBB427:
.LBB428:
	.stabn	68,0,431,.LM71-.LFBB10
.LM71:
	ldi r24,lo8(2)
	ldi r25,lo8(-128)
	sts cfg+1,r25
	sts cfg,r24
	.stabn	68,0,432,.LM72-.LFBB10
.LM72:
	ldi r20,lo8(21)
	ldi r21,0
	ldi r22,lo8(eeprom_cfg)
	ldi r23,hi8(eeprom_cfg)
	ldi r24,lo8(cfg)
	ldi r25,hi8(cfg)
/* epilogue start */
.LBE428:
.LBE427:
	.stabn	68,0,326,.LM73-.LFBB10
.LM73:
	pop r29
	pop r28
.LBB430:
.LBB429:
	.stabn	68,0,432,.LM74-.LFBB10
.LM74:
	jmp eeprom_update_block
.L19:
/* epilogue start */
.LBE429:
.LBE430:
	.stabn	68,0,326,.LM75-.LFBB10
.LM75:
	pop r29
	pop r28
	ret
	.size	config_init, .-config_init
.Lscope10:
	.stabs	"set_invalid_wakeup_mode:F(0,1)",36,0,0,set_invalid_wakeup_mode
.global	set_invalid_wakeup_mode
	.type	set_invalid_wakeup_mode, @function
set_invalid_wakeup_mode:
	.stabn	68,0,542,.LM76-.LFBB11
.LM76:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,543,.LM77-.LFBB11
.LM77:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	std Z+11,__zero_reg__
.LBB431:
.LBB432:
	.stabn	68,0,572,.LM78-.LFBB11
.LM78:
	ldd r24,Z+20
	andi r24,lo8(-127)
	std Z+20,r24
/* epilogue start */
.LBE432:
.LBE431:
	.stabn	68,0,552,.LM79-.LFBB11
.LM79:
	ret
	.size	set_invalid_wakeup_mode, .-set_invalid_wakeup_mode
.Lscope11:
	.stabs	"get_before_hints_message:F(0,11)=eFalse:0,True:1,;",36,0,0,get_before_hints_message
	.stabs	"_Bool:t(0,11)",128,0,0,0
.global	get_before_hints_message
	.type	get_before_hints_message, @function
get_before_hints_message:
	.stabn	68,0,558,.LM80-.LFBB12
.LM80:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,558,.LM81-.LFBB12
.LM81:
	lds r24,cfg+2
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	get_before_hints_message, .-get_before_hints_message
.Lscope12:
	.stabs	"set_before_hints_message:F(0,1)",36,0,0,set_before_hints_message
	.stabs	"new_val:P(0,11)",64,0,0,24
.global	set_before_hints_message
	.type	set_before_hints_message, @function
set_before_hints_message:
	.stabn	68,0,558,.LM82-.LFBB13
.LM82:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,558,.LM83-.LFBB13
.LM83:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r25,Z
	bst r24,0
	bld r25,0
	st Z,r25
/* epilogue start */
	ret
	.size	set_before_hints_message, .-set_before_hints_message
.Lscope13:
	.stabs	"toggle_before_hints_message:F(0,1)",36,0,0,toggle_before_hints_message
.global	toggle_before_hints_message
	.type	toggle_before_hints_message, @function
toggle_before_hints_message:
	.stabn	68,0,558,.LM84-.LFBB14
.LM84:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB433:
.LBB434:
	.stabn	68,0,558,.LM85-.LFBB14
.LM85:
	lds r24,cfg+2
.LBE434:
.LBE433:
	com r24
	andi r24,lo8(1)
	jmp set_before_hints_message
	.size	toggle_before_hints_message, .-toggle_before_hints_message
.Lscope14:
	.stabs	"set_default_before_hints_message:F(0,1)",36,0,0,set_default_before_hints_message
.global	set_default_before_hints_message
	.type	set_default_before_hints_message, @function
set_default_before_hints_message:
	.stabn	68,0,558,.LM86-.LFBB15
.LM86:
.LFBB15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,558,.LM87-.LFBB15
.LM87:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r24,Z
	andi r24,lo8(~(1<<0))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_before_hints_message, .-set_default_before_hints_message
.Lscope15:
	.stabs	"get_after_hints_message:F(0,11)",36,0,0,get_after_hints_message
.global	get_after_hints_message
	.type	get_after_hints_message, @function
get_after_hints_message:
	.stabn	68,0,559,.LM88-.LFBB16
.LM88:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,559,.LM89-.LFBB16
.LM89:
	lds r24,cfg+2
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	get_after_hints_message, .-get_after_hints_message
.Lscope16:
	.stabs	"set_after_hints_message:F(0,1)",36,0,0,set_after_hints_message
	.stabs	"new_val:P(0,11)",64,0,0,24
.global	set_after_hints_message
	.type	set_after_hints_message, @function
set_after_hints_message:
	.stabn	68,0,559,.LM90-.LFBB17
.LM90:
.LFBB17:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,559,.LM91-.LFBB17
.LM91:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r25,Z
	bst r24,0
	bld r25,1
	st Z,r25
/* epilogue start */
	ret
	.size	set_after_hints_message, .-set_after_hints_message
.Lscope17:
	.stabs	"toggle_after_hints_message:F(0,1)",36,0,0,toggle_after_hints_message
.global	toggle_after_hints_message
	.type	toggle_after_hints_message, @function
toggle_after_hints_message:
	.stabn	68,0,559,.LM92-.LFBB18
.LM92:
.LFBB18:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,559,.LM93-.LFBB18
.LM93:
	call get_after_hints_message
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_after_hints_message
	.size	toggle_after_hints_message, .-toggle_after_hints_message
.Lscope18:
	.stabs	"set_default_after_hints_message:F(0,1)",36,0,0,set_default_after_hints_message
.global	set_default_after_hints_message
	.type	set_default_after_hints_message, @function
set_default_after_hints_message:
	.stabn	68,0,559,.LM94-.LFBB19
.LM94:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,559,.LM95-.LFBB19
.LM95:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r24,Z
	andi r24,lo8(~(1<<1))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_after_hints_message, .-set_default_after_hints_message
.Lscope19:
	.stabs	"get_voice_recording:F(0,11)",36,0,0,get_voice_recording
.global	get_voice_recording
	.type	get_voice_recording, @function
get_voice_recording:
	.stabn	68,0,560,.LM96-.LFBB20
.LM96:
.LFBB20:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,560,.LM97-.LFBB20
.LM97:
	lds r24,cfg+2
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	get_voice_recording, .-get_voice_recording
.Lscope20:
	.stabs	"set_voice_recording:F(0,1)",36,0,0,set_voice_recording
	.stabs	"new_val:P(0,11)",64,0,0,24
.global	set_voice_recording
	.type	set_voice_recording, @function
set_voice_recording:
	.stabn	68,0,560,.LM98-.LFBB21
.LM98:
.LFBB21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,560,.LM99-.LFBB21
.LM99:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r25,Z
	bst r24,0
	bld r25,2
	st Z,r25
/* epilogue start */
	ret
	.size	set_voice_recording, .-set_voice_recording
.Lscope21:
	.stabs	"toggle_voice_recording:F(0,1)",36,0,0,toggle_voice_recording
.global	toggle_voice_recording
	.type	toggle_voice_recording, @function
toggle_voice_recording:
	.stabn	68,0,560,.LM100-.LFBB22
.LM100:
.LFBB22:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,560,.LM101-.LFBB22
.LM101:
	call get_voice_recording
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_voice_recording
	.size	toggle_voice_recording, .-toggle_voice_recording
.Lscope22:
	.stabs	"set_default_voice_recording:F(0,1)",36,0,0,set_default_voice_recording
.global	set_default_voice_recording
	.type	set_default_voice_recording, @function
set_default_voice_recording:
	.stabn	68,0,560,.LM102-.LFBB23
.LM102:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,560,.LM103-.LFBB23
.LM103:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r24,Z
	andi r24,lo8(~(1<<2))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_voice_recording, .-set_default_voice_recording
.Lscope23:
	.stabs	"get_loud_speaker:F(0,11)",36,0,0,get_loud_speaker
.global	get_loud_speaker
	.type	get_loud_speaker, @function
get_loud_speaker:
	.stabn	68,0,561,.LM104-.LFBB24
.LM104:
.LFBB24:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,561,.LM105-.LFBB24
.LM105:
	lds r24,cfg+2
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	get_loud_speaker, .-get_loud_speaker
.Lscope24:
	.stabs	"set_loud_speaker:F(0,1)",36,0,0,set_loud_speaker
	.stabs	"new_val:P(0,11)",64,0,0,24
.global	set_loud_speaker
	.type	set_loud_speaker, @function
set_loud_speaker:
	.stabn	68,0,561,.LM106-.LFBB25
.LM106:
.LFBB25:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,561,.LM107-.LFBB25
.LM107:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r25,Z
	bst r24,0
	bld r25,3
	st Z,r25
/* epilogue start */
	ret
	.size	set_loud_speaker, .-set_loud_speaker
.Lscope25:
	.stabs	"toggle_loud_speaker:F(0,1)",36,0,0,toggle_loud_speaker
.global	toggle_loud_speaker
	.type	toggle_loud_speaker, @function
toggle_loud_speaker:
	.stabn	68,0,561,.LM108-.LFBB26
.LM108:
.LFBB26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,561,.LM109-.LFBB26
.LM109:
	call get_loud_speaker
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_loud_speaker
	.size	toggle_loud_speaker, .-toggle_loud_speaker
.Lscope26:
	.stabs	"set_default_loud_speaker:F(0,1)",36,0,0,set_default_loud_speaker
.global	set_default_loud_speaker
	.type	set_default_loud_speaker, @function
set_default_loud_speaker:
	.stabn	68,0,561,.LM110-.LFBB27
.LM110:
.LFBB27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,561,.LM111-.LFBB27
.LM111:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r24,Z
	ori r24,lo8(1<<3)
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_loud_speaker, .-set_default_loud_speaker
.Lscope27:
	.stabs	"get_alarm_clock:F(0,11)",36,0,0,get_alarm_clock
.global	get_alarm_clock
	.type	get_alarm_clock, @function
get_alarm_clock:
	.stabn	68,0,562,.LM112-.LFBB28
.LM112:
.LFBB28:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,562,.LM113-.LFBB28
.LM113:
	lds r24,cfg+2
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	get_alarm_clock, .-get_alarm_clock
.Lscope28:
	.stabs	"set_alarm_clock:F(0,1)",36,0,0,set_alarm_clock
	.stabs	"new_val:P(0,11)",64,0,0,24
.global	set_alarm_clock
	.type	set_alarm_clock, @function
set_alarm_clock:
	.stabn	68,0,562,.LM114-.LFBB29
.LM114:
.LFBB29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,562,.LM115-.LFBB29
.LM115:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r25,Z
	bst r24,0
	bld r25,4
	st Z,r25
/* epilogue start */
	ret
	.size	set_alarm_clock, .-set_alarm_clock
.Lscope29:
	.stabs	"toggle_alarm_clock:F(0,1)",36,0,0,toggle_alarm_clock
.global	toggle_alarm_clock
	.type	toggle_alarm_clock, @function
toggle_alarm_clock:
	.stabn	68,0,562,.LM116-.LFBB30
.LM116:
.LFBB30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,562,.LM117-.LFBB30
.LM117:
	call get_alarm_clock
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_alarm_clock
	.size	toggle_alarm_clock, .-toggle_alarm_clock
.Lscope30:
	.stabs	"set_default_alarm_clock:F(0,1)",36,0,0,set_default_alarm_clock
.global	set_default_alarm_clock
	.type	set_default_alarm_clock, @function
set_default_alarm_clock:
	.stabn	68,0,562,.LM118-.LFBB31
.LM118:
.LFBB31:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,562,.LM119-.LFBB31
.LM119:
	ldi r30,lo8(cfg+2)
	ldi r31,hi8(cfg+2)
	ld r24,Z
	andi r24,lo8(~(1<<4))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_alarm_clock, .-set_default_alarm_clock
.Lscope31:
	.stabs	"get_wakeup_timer_delay:F(0,12)=(0,6)",36,0,0,get_wakeup_timer_delay
	.stabs	"wakeup_timer_delay_t:t(0,12)",128,0,0,0
.global	get_wakeup_timer_delay
	.type	get_wakeup_timer_delay, @function
get_wakeup_timer_delay:
	.stabn	68,0,563,.LM120-.LFBB32
.LM120:
.LFBB32:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM121-.LFBB32
.LM121:
	lds r24,cfg+3
	lds r25,cfg+3+1
/* epilogue start */
	ret
	.size	get_wakeup_timer_delay, .-get_wakeup_timer_delay
.Lscope32:
	.stabs	"min_wakeup_timer_delay:F(0,12)",36,0,0,min_wakeup_timer_delay
.global	min_wakeup_timer_delay
	.type	min_wakeup_timer_delay, @function
min_wakeup_timer_delay:
	.stabn	68,0,563,.LM122-.LFBB33
.LM122:
.LFBB33:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM123-.LFBB33
.LM123:
	ldi r24,lo8(3)
	ldi r25,0
/* epilogue start */
	ret
	.size	min_wakeup_timer_delay, .-min_wakeup_timer_delay
.Lscope33:
	.stabs	"max_wakeup_timer_delay:F(0,12)",36,0,0,max_wakeup_timer_delay
.global	max_wakeup_timer_delay
	.type	max_wakeup_timer_delay, @function
max_wakeup_timer_delay:
	.stabn	68,0,563,.LM124-.LFBB34
.LM124:
.LFBB34:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM125-.LFBB34
.LM125:
	ldi r24,lo8(-16)
	ldi r25,0
/* epilogue start */
	ret
	.size	max_wakeup_timer_delay, .-max_wakeup_timer_delay
.Lscope34:
	.stabs	"step_wakeup_timer_delay:F(0,12)",36,0,0,step_wakeup_timer_delay
.global	step_wakeup_timer_delay
	.type	step_wakeup_timer_delay, @function
step_wakeup_timer_delay:
	.stabn	68,0,563,.LM126-.LFBB35
.LM126:
.LFBB35:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM127-.LFBB35
.LM127:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	step_wakeup_timer_delay, .-step_wakeup_timer_delay
.Lscope35:
	.stabs	"get_default_wakeup_timer_delay:F(0,12)",36,0,0,get_default_wakeup_timer_delay
.global	get_default_wakeup_timer_delay
	.type	get_default_wakeup_timer_delay, @function
get_default_wakeup_timer_delay:
	.stabn	68,0,563,.LM128-.LFBB36
.LM128:
.LFBB36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM129-.LFBB36
.LM129:
	ldi r24,lo8(-46)
	ldi r25,0
/* epilogue start */
	ret
	.size	get_default_wakeup_timer_delay, .-get_default_wakeup_timer_delay
.Lscope36:
	.stabs	"is_readonly_wakeup_timer_delay:F(0,11)",36,0,0,is_readonly_wakeup_timer_delay
.global	is_readonly_wakeup_timer_delay
	.type	is_readonly_wakeup_timer_delay, @function
is_readonly_wakeup_timer_delay:
	.stabn	68,0,563,.LM130-.LFBB37
.LM130:
.LFBB37:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM131-.LFBB37
.LM131:
	lds r24,cfg+19
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	is_readonly_wakeup_timer_delay, .-is_readonly_wakeup_timer_delay
.Lscope37:
	.stabs	"set_readonly_wakeup_timer_delay:F(0,1)",36,0,0,set_readonly_wakeup_timer_delay
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_wakeup_timer_delay
	.type	set_readonly_wakeup_timer_delay, @function
set_readonly_wakeup_timer_delay:
	.stabn	68,0,563,.LM132-.LFBB38
.LM132:
.LFBB38:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM133-.LFBB38
.LM133:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,0
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_wakeup_timer_delay, .-set_readonly_wakeup_timer_delay
.Lscope38:
	.stabs	"set_wakeup_timer_delay:F(0,1)",36,0,0,set_wakeup_timer_delay
	.stabs	"val:P(0,12)",64,0,0,18
.global	set_wakeup_timer_delay
	.type	set_wakeup_timer_delay, @function
set_wakeup_timer_delay:
	.stabn	68,0,563,.LM134-.LFBB39
.LM134:
.LFBB39:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,563,.LM135-.LFBB39
.LM135:
	sbiw r24,3
	cpi r24,-18
	cpc r25,__zero_reg__
	brsh .L49
	.stabn	68,0,563,.LM136-.LFBB39
.LM136:
	sts cfg+3+1,r19
	sts cfg+3,r18
.L49:
/* epilogue start */
	.stabn	68,0,563,.LM137-.LFBB39
.LM137:
	ret
	.size	set_wakeup_timer_delay, .-set_wakeup_timer_delay
.Lscope39:
	.stabs	"set_default_wakeup_timer_delay:F(0,1)",36,0,0,set_default_wakeup_timer_delay
.global	set_default_wakeup_timer_delay
	.type	set_default_wakeup_timer_delay, @function
set_default_wakeup_timer_delay:
	.stabn	68,0,563,.LM138-.LFBB40
.LM138:
.LFBB40:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB437:
.LBB438:
	.stabn	68,0,563,.LM139-.LFBB40
.LM139:
	ldi r24,lo8(-46)
	ldi r25,0
	sts cfg+3+1,r25
	sts cfg+3,r24
/* epilogue start */
.LBE438:
.LBE437:
	ret
	.size	set_default_wakeup_timer_delay, .-set_default_wakeup_timer_delay
.Lscope40:
	.stabs	"set_invalid_wakeup_timer_delay:F(0,1)",36,0,0,set_invalid_wakeup_timer_delay
.global	set_invalid_wakeup_timer_delay
	.type	set_invalid_wakeup_timer_delay, @function
set_invalid_wakeup_timer_delay:
	.stabn	68,0,563,.LM140-.LFBB41
.LM140:
.LFBB41:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM141-.LFBB41
.LM141:
	sts cfg+3+1,__zero_reg__
	sts cfg+3,__zero_reg__
/* epilogue start */
	ret
	.size	set_invalid_wakeup_timer_delay, .-set_invalid_wakeup_timer_delay
.Lscope41:
	.stabs	"get_invalid_wakeup_timer_delay:F(0,12)",36,0,0,get_invalid_wakeup_timer_delay
.global	get_invalid_wakeup_timer_delay
	.type	get_invalid_wakeup_timer_delay, @function
get_invalid_wakeup_timer_delay:
	.stabn	68,0,563,.LM142-.LFBB42
.LM142:
.LFBB42:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM143-.LFBB42
.LM143:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_invalid_wakeup_timer_delay, .-get_invalid_wakeup_timer_delay
.Lscope42:
	.stabs	"is_invalid_wakeup_timer_delay:F(0,11)",36,0,0,is_invalid_wakeup_timer_delay
.global	is_invalid_wakeup_timer_delay
	.type	is_invalid_wakeup_timer_delay, @function
is_invalid_wakeup_timer_delay:
	.stabn	68,0,563,.LM144-.LFBB43
.LM144:
.LFBB43:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,563,.LM145-.LFBB43
.LM145:
	ldi r24,lo8(1)
	lds r18,cfg+3
	lds r19,cfg+3+1
	or r18,r19
	breq .L55
	ldi r24,0
.L55:
/* epilogue start */
	ret
	.size	is_invalid_wakeup_timer_delay, .-is_invalid_wakeup_timer_delay
.Lscope43:
	.stabs	"get_sleep_scenario_playback:F(0,13)=(0,3)",36,0,0,get_sleep_scenario_playback
	.stabs	"sleep_scenario_playback_t:t(0,13)",128,0,0,0
.global	get_sleep_scenario_playback
	.type	get_sleep_scenario_playback, @function
get_sleep_scenario_playback:
	.stabn	68,0,564,.LM146-.LFBB44
.LM146:
.LFBB44:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM147-.LFBB44
.LM147:
	lds r24,cfg+5
/* epilogue start */
	ret
	.size	get_sleep_scenario_playback, .-get_sleep_scenario_playback
.Lscope44:
	.stabs	"min_sleep_scenario_playback:F(0,13)",36,0,0,min_sleep_scenario_playback
.global	min_sleep_scenario_playback
	.type	min_sleep_scenario_playback, @function
min_sleep_scenario_playback:
	.stabn	68,0,564,.LM148-.LFBB45
.LM148:
.LFBB45:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM149-.LFBB45
.LM149:
	ldi r24,0
/* epilogue start */
	ret
	.size	min_sleep_scenario_playback, .-min_sleep_scenario_playback
.Lscope45:
	.stabs	"max_sleep_scenario_playback:F(0,13)",36,0,0,max_sleep_scenario_playback
.global	max_sleep_scenario_playback
	.type	max_sleep_scenario_playback, @function
max_sleep_scenario_playback:
	.stabn	68,0,564,.LM150-.LFBB46
.LM150:
.LFBB46:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM151-.LFBB46
.LM151:
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_sleep_scenario_playback, .-max_sleep_scenario_playback
.Lscope46:
	.stabs	"step_sleep_scenario_playback:F(0,13)",36,0,0,step_sleep_scenario_playback
.global	step_sleep_scenario_playback
	.type	step_sleep_scenario_playback, @function
step_sleep_scenario_playback:
	.stabn	68,0,564,.LM152-.LFBB47
.LM152:
.LFBB47:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM153-.LFBB47
.LM153:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_sleep_scenario_playback, .-step_sleep_scenario_playback
.Lscope47:
.global	get_default_sleep_scenario_playback
	.type	get_default_sleep_scenario_playback, @function
get_default_sleep_scenario_playback:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_default_sleep_scenario_playback, .-get_default_sleep_scenario_playback
	.stabs	"is_readonly_sleep_scenario_playback:F(0,11)",36,0,0,is_readonly_sleep_scenario_playback
.global	is_readonly_sleep_scenario_playback
	.type	is_readonly_sleep_scenario_playback, @function
is_readonly_sleep_scenario_playback:
	.stabn	68,0,564,.LM154-.LFBB48
.LM154:
.LFBB48:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM155-.LFBB48
.LM155:
	lds r24,cfg+19
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_sleep_scenario_playback, .-is_readonly_sleep_scenario_playback
.Lscope48:
	.stabs	"set_readonly_sleep_scenario_playback:F(0,1)",36,0,0,set_readonly_sleep_scenario_playback
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_sleep_scenario_playback
	.type	set_readonly_sleep_scenario_playback, @function
set_readonly_sleep_scenario_playback:
	.stabn	68,0,564,.LM156-.LFBB49
.LM156:
.LFBB49:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM157-.LFBB49
.LM157:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,1
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_sleep_scenario_playback, .-set_readonly_sleep_scenario_playback
.Lscope49:
	.stabs	"set_sleep_scenario_playback:F(0,1)",36,0,0,set_sleep_scenario_playback
	.stabs	"val:P(0,13)",64,0,0,24
.global	set_sleep_scenario_playback
	.type	set_sleep_scenario_playback, @function
set_sleep_scenario_playback:
	.stabn	68,0,564,.LM158-.LFBB50
.LM158:
.LFBB50:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,564,.LM159-.LFBB50
.LM159:
	cpi r24,lo8(10)
	brsh .L66
	.stabn	68,0,564,.LM160-.LFBB50
.LM160:
	sts cfg+5,r24
.L66:
/* epilogue start */
	.stabn	68,0,564,.LM161-.LFBB50
.LM161:
	ret
	.size	set_sleep_scenario_playback, .-set_sleep_scenario_playback
.Lscope50:
	.stabs	"set_default_sleep_scenario_playback:F(0,1)",36,0,0,set_default_sleep_scenario_playback
.global	set_default_sleep_scenario_playback
	.type	set_default_sleep_scenario_playback, @function
set_default_sleep_scenario_playback:
	.stabn	68,0,564,.LM162-.LFBB51
.LM162:
.LFBB51:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB441:
.LBB442:
	.stabn	68,0,564,.LM163-.LFBB51
.LM163:
	sts cfg+5,__zero_reg__
/* epilogue start */
.LBE442:
.LBE441:
	ret
	.size	set_default_sleep_scenario_playback, .-set_default_sleep_scenario_playback
.Lscope51:
	.stabs	"get_relax_tunes_playback:F(0,14)=(0,3)",36,0,0,get_relax_tunes_playback
	.stabs	"relax_tunes_playback_t:t(0,14)",128,0,0,0
.global	get_relax_tunes_playback
	.type	get_relax_tunes_playback, @function
get_relax_tunes_playback:
	.stabn	68,0,565,.LM164-.LFBB52
.LM164:
.LFBB52:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,565,.LM165-.LFBB52
.LM165:
	lds r24,cfg+6
/* epilogue start */
	ret
	.size	get_relax_tunes_playback, .-get_relax_tunes_playback
.Lscope52:
.global	min_relax_tunes_playback
	.type	min_relax_tunes_playback, @function
min_relax_tunes_playback:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	min_relax_tunes_playback, .-min_relax_tunes_playback
.global	max_relax_tunes_playback
	.type	max_relax_tunes_playback, @function
max_relax_tunes_playback:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_relax_tunes_playback, .-max_relax_tunes_playback
.global	step_relax_tunes_playback
	.type	step_relax_tunes_playback, @function
step_relax_tunes_playback:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_relax_tunes_playback, .-step_relax_tunes_playback
.global	get_default_relax_tunes_playback
	.type	get_default_relax_tunes_playback, @function
get_default_relax_tunes_playback:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_default_relax_tunes_playback, .-get_default_relax_tunes_playback
	.stabs	"is_readonly_relax_tunes_playback:F(0,11)",36,0,0,is_readonly_relax_tunes_playback
.global	is_readonly_relax_tunes_playback
	.type	is_readonly_relax_tunes_playback, @function
is_readonly_relax_tunes_playback:
	.stabn	68,0,565,.LM166-.LFBB53
.LM166:
.LFBB53:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,565,.LM167-.LFBB53
.LM167:
	lds r24,cfg+19
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_relax_tunes_playback, .-is_readonly_relax_tunes_playback
.Lscope53:
	.stabs	"set_readonly_relax_tunes_playback:F(0,1)",36,0,0,set_readonly_relax_tunes_playback
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_relax_tunes_playback
	.type	set_readonly_relax_tunes_playback, @function
set_readonly_relax_tunes_playback:
	.stabn	68,0,565,.LM168-.LFBB54
.LM168:
.LFBB54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,565,.LM169-.LFBB54
.LM169:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,2
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_relax_tunes_playback, .-set_readonly_relax_tunes_playback
.Lscope54:
	.stabs	"set_relax_tunes_playback:F(0,1)",36,0,0,set_relax_tunes_playback
	.stabs	"val:P(0,14)",64,0,0,24
.global	set_relax_tunes_playback
	.type	set_relax_tunes_playback, @function
set_relax_tunes_playback:
	.stabn	68,0,565,.LM170-.LFBB55
.LM170:
.LFBB55:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,565,.LM171-.LFBB55
.LM171:
	cpi r24,lo8(10)
	brsh .L76
	.stabn	68,0,565,.LM172-.LFBB55
.LM172:
	sts cfg+6,r24
.L76:
/* epilogue start */
	.stabn	68,0,565,.LM173-.LFBB55
.LM173:
	ret
	.size	set_relax_tunes_playback, .-set_relax_tunes_playback
.Lscope55:
	.stabs	"set_default_relax_tunes_playback:F(0,1)",36,0,0,set_default_relax_tunes_playback
.global	set_default_relax_tunes_playback
	.type	set_default_relax_tunes_playback, @function
set_default_relax_tunes_playback:
	.stabn	68,0,565,.LM174-.LFBB56
.LM174:
.LFBB56:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB445:
.LBB446:
	.stabn	68,0,565,.LM175-.LFBB56
.LM175:
	sts cfg+6,__zero_reg__
/* epilogue start */
.LBE446:
.LBE445:
	ret
	.size	set_default_relax_tunes_playback, .-set_default_relax_tunes_playback
.Lscope56:
	.stabs	"get_vibration_level:F(0,15)=(0,3)",36,0,0,get_vibration_level
	.stabs	"vibration_level_t:t(0,15)",128,0,0,0
.global	get_vibration_level
	.type	get_vibration_level, @function
get_vibration_level:
	.stabn	68,0,566,.LM176-.LFBB57
.LM176:
.LFBB57:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,566,.LM177-.LFBB57
.LM177:
	lds r24,cfg+12
/* epilogue start */
	ret
	.size	get_vibration_level, .-get_vibration_level
.Lscope57:
.global	min_vibration_level
	.type	min_vibration_level, @function
min_vibration_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	min_vibration_level, .-min_vibration_level
.global	max_vibration_level
	.type	max_vibration_level, @function
max_vibration_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_vibration_level, .-max_vibration_level
.global	step_vibration_level
	.type	step_vibration_level, @function
step_vibration_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_vibration_level, .-step_vibration_level
.global	get_default_vibration_level
	.type	get_default_vibration_level, @function
get_default_vibration_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(5)
/* epilogue start */
	ret
	.size	get_default_vibration_level, .-get_default_vibration_level
	.stabs	"is_readonly_vibration_level:F(0,11)",36,0,0,is_readonly_vibration_level
.global	is_readonly_vibration_level
	.type	is_readonly_vibration_level, @function
is_readonly_vibration_level:
	.stabn	68,0,566,.LM178-.LFBB58
.LM178:
.LFBB58:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,566,.LM179-.LFBB58
.LM179:
	lds r24,cfg+20
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	is_readonly_vibration_level, .-is_readonly_vibration_level
.Lscope58:
	.stabs	"set_readonly_vibration_level:F(0,1)",36,0,0,set_readonly_vibration_level
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_vibration_level
	.type	set_readonly_vibration_level, @function
set_readonly_vibration_level:
	.stabn	68,0,566,.LM180-.LFBB59
.LM180:
.LFBB59:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,566,.LM181-.LFBB59
.LM181:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,0
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_vibration_level, .-set_readonly_vibration_level
.Lscope59:
	.stabs	"set_vibration_level:F(0,1)",36,0,0,set_vibration_level
	.stabs	"val:P(0,15)",64,0,0,24
.global	set_vibration_level
	.type	set_vibration_level, @function
set_vibration_level:
	.stabn	68,0,566,.LM182-.LFBB60
.LM182:
.LFBB60:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,566,.LM183-.LFBB60
.LM183:
	cpi r24,lo8(10)
	brsh .L86
	.stabn	68,0,566,.LM184-.LFBB60
.LM184:
	sts cfg+12,r24
.L86:
/* epilogue start */
	.stabn	68,0,566,.LM185-.LFBB60
.LM185:
	ret
	.size	set_vibration_level, .-set_vibration_level
.Lscope60:
	.stabs	"set_default_vibration_level:F(0,1)",36,0,0,set_default_vibration_level
.global	set_default_vibration_level
	.type	set_default_vibration_level, @function
set_default_vibration_level:
	.stabn	68,0,566,.LM186-.LFBB61
.LM186:
.LFBB61:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB449:
.LBB450:
	.stabn	68,0,566,.LM187-.LFBB61
.LM187:
	ldi r24,lo8(5)
	sts cfg+12,r24
/* epilogue start */
.LBE450:
.LBE449:
	ret
	.size	set_default_vibration_level, .-set_default_vibration_level
.Lscope61:
	.stabs	"get_music_volume_level:F(0,16)=(0,3)",36,0,0,get_music_volume_level
	.stabs	"music_volume_level_t:t(0,16)",128,0,0,0
.global	get_music_volume_level
	.type	get_music_volume_level, @function
get_music_volume_level:
	.stabn	68,0,567,.LM188-.LFBB62
.LM188:
.LFBB62:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,567,.LM189-.LFBB62
.LM189:
	lds r24,cfg+7
/* epilogue start */
	ret
	.size	get_music_volume_level, .-get_music_volume_level
.Lscope62:
.global	min_music_volume_level
	.type	min_music_volume_level, @function
min_music_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_music_volume_level, .-min_music_volume_level
.global	max_music_volume_level
	.type	max_music_volume_level, @function
max_music_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_music_volume_level, .-max_music_volume_level
.global	step_music_volume_level
	.type	step_music_volume_level, @function
step_music_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_music_volume_level, .-step_music_volume_level
	.stabs	"get_default_music_volume_level:F(0,16)",36,0,0,get_default_music_volume_level
.global	get_default_music_volume_level
	.type	get_default_music_volume_level, @function
get_default_music_volume_level:
	.stabn	68,0,567,.LM190-.LFBB63
.LM190:
.LFBB63:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,567,.LM191-.LFBB63
.LM191:
	ldi r24,lo8(5)
/* epilogue start */
	ret
	.size	get_default_music_volume_level, .-get_default_music_volume_level
.Lscope63:
	.stabs	"is_readonly_music_volume_level:F(0,11)",36,0,0,is_readonly_music_volume_level
.global	is_readonly_music_volume_level
	.type	is_readonly_music_volume_level, @function
is_readonly_music_volume_level:
	.stabn	68,0,567,.LM192-.LFBB64
.LM192:
.LFBB64:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,567,.LM193-.LFBB64
.LM193:
	lds r24,cfg+19
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_music_volume_level, .-is_readonly_music_volume_level
.Lscope64:
	.stabs	"set_readonly_music_volume_level:F(0,1)",36,0,0,set_readonly_music_volume_level
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_music_volume_level
	.type	set_readonly_music_volume_level, @function
set_readonly_music_volume_level:
	.stabn	68,0,567,.LM194-.LFBB65
.LM194:
.LFBB65:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,567,.LM195-.LFBB65
.LM195:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,3
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_music_volume_level, .-set_readonly_music_volume_level
.Lscope65:
	.stabs	"set_music_volume_level:F(0,1)",36,0,0,set_music_volume_level
	.stabs	"val:P(0,16)",64,0,0,24
.global	set_music_volume_level
	.type	set_music_volume_level, @function
set_music_volume_level:
	.stabn	68,0,567,.LM196-.LFBB66
.LM196:
.LFBB66:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,567,.LM197-.LFBB66
.LM197:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L96
	.stabn	68,0,567,.LM198-.LFBB66
.LM198:
	sts cfg+7,r24
.L96:
/* epilogue start */
	.stabn	68,0,567,.LM199-.LFBB66
.LM199:
	ret
	.size	set_music_volume_level, .-set_music_volume_level
.Lscope66:
	.stabs	"set_default_music_volume_level:F(0,1)",36,0,0,set_default_music_volume_level
.global	set_default_music_volume_level
	.type	set_default_music_volume_level, @function
set_default_music_volume_level:
	.stabn	68,0,567,.LM200-.LFBB67
.LM200:
.LFBB67:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB453:
.LBB454:
	.stabn	68,0,567,.LM201-.LFBB67
.LM201:
	ldi r24,lo8(5)
	sts cfg+7,r24
/* epilogue start */
.LBE454:
.LBE453:
	ret
	.size	set_default_music_volume_level, .-set_default_music_volume_level
.Lscope67:
	.stabs	"get_recording_gain_level:F(0,17)=(0,3)",36,0,0,get_recording_gain_level
	.stabs	"recording_gain_level_t:t(0,17)",128,0,0,0
.global	get_recording_gain_level
	.type	get_recording_gain_level, @function
get_recording_gain_level:
	.stabn	68,0,568,.LM202-.LFBB68
.LM202:
.LFBB68:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM203-.LFBB68
.LM203:
	lds r24,cfg+8
/* epilogue start */
	ret
	.size	get_recording_gain_level, .-get_recording_gain_level
.Lscope68:
.global	min_recording_gain_level
	.type	min_recording_gain_level, @function
min_recording_gain_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	min_recording_gain_level, .-min_recording_gain_level
	.stabs	"max_recording_gain_level:F(0,17)",36,0,0,max_recording_gain_level
.global	max_recording_gain_level
	.type	max_recording_gain_level, @function
max_recording_gain_level:
	.stabn	68,0,568,.LM204-.LFBB69
.LM204:
.LFBB69:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM205-.LFBB69
.LM205:
	ldi r24,lo8(64)
/* epilogue start */
	ret
	.size	max_recording_gain_level, .-max_recording_gain_level
.Lscope69:
.global	step_recording_gain_level
	.type	step_recording_gain_level, @function
step_recording_gain_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_recording_gain_level, .-step_recording_gain_level
.global	get_default_recording_gain_level
	.type	get_default_recording_gain_level, @function
get_default_recording_gain_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_default_recording_gain_level, .-get_default_recording_gain_level
	.stabs	"is_readonly_recording_gain_level:F(0,11)",36,0,0,is_readonly_recording_gain_level
.global	is_readonly_recording_gain_level
	.type	is_readonly_recording_gain_level, @function
is_readonly_recording_gain_level:
	.stabn	68,0,568,.LM206-.LFBB70
.LM206:
.LFBB70:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM207-.LFBB70
.LM207:
	lds r24,cfg+19
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_recording_gain_level, .-is_readonly_recording_gain_level
.Lscope70:
	.stabs	"set_readonly_recording_gain_level:F(0,1)",36,0,0,set_readonly_recording_gain_level
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_recording_gain_level
	.type	set_readonly_recording_gain_level, @function
set_readonly_recording_gain_level:
	.stabn	68,0,568,.LM208-.LFBB71
.LM208:
.LFBB71:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM209-.LFBB71
.LM209:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,4
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_recording_gain_level, .-set_readonly_recording_gain_level
.Lscope71:
	.stabs	"set_recording_gain_level:F(0,1)",36,0,0,set_recording_gain_level
	.stabs	"val:P(0,17)",64,0,0,24
.global	set_recording_gain_level
	.type	set_recording_gain_level, @function
set_recording_gain_level:
	.stabn	68,0,568,.LM210-.LFBB72
.LM210:
.LFBB72:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,568,.LM211-.LFBB72
.LM211:
	cpi r24,lo8(65)
	brsh .L106
	.stabn	68,0,568,.LM212-.LFBB72
.LM212:
	sts cfg+8,r24
.L106:
/* epilogue start */
	.stabn	68,0,568,.LM213-.LFBB72
.LM213:
	ret
	.size	set_recording_gain_level, .-set_recording_gain_level
.Lscope72:
	.stabs	"set_default_recording_gain_level:F(0,1)",36,0,0,set_default_recording_gain_level
.global	set_default_recording_gain_level
	.type	set_default_recording_gain_level, @function
set_default_recording_gain_level:
	.stabn	68,0,568,.LM214-.LFBB73
.LM214:
.LFBB73:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB457:
.LBB458:
	.stabn	68,0,568,.LM215-.LFBB73
.LM215:
	sts cfg+8,__zero_reg__
/* epilogue start */
.LBE458:
.LBE457:
	ret
	.size	set_default_recording_gain_level, .-set_default_recording_gain_level
.Lscope73:
	.stabs	"get_remd_sensitivity:F(0,18)=(0,3)",36,0,0,get_remd_sensitivity
	.stabs	"remd_sensitivity_t:t(0,18)",128,0,0,0
.global	get_remd_sensitivity
	.type	get_remd_sensitivity, @function
get_remd_sensitivity:
	.stabn	68,0,569,.LM216-.LFBB74
.LM216:
.LFBB74:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM217-.LFBB74
.LM217:
	lds r24,cfg+9
/* epilogue start */
	ret
	.size	get_remd_sensitivity, .-get_remd_sensitivity
.Lscope74:
	.stabs	"min_remd_sensitivity:F(0,18)",36,0,0,min_remd_sensitivity
.global	min_remd_sensitivity
	.type	min_remd_sensitivity, @function
min_remd_sensitivity:
	.stabn	68,0,569,.LM218-.LFBB75
.LM218:
.LFBB75:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM219-.LFBB75
.LM219:
	ldi r24,lo8(2)
/* epilogue start */
	ret
	.size	min_remd_sensitivity, .-min_remd_sensitivity
.Lscope75:
	.stabs	"max_remd_sensitivity:F(0,18)",36,0,0,max_remd_sensitivity
.global	max_remd_sensitivity
	.type	max_remd_sensitivity, @function
max_remd_sensitivity:
	.stabn	68,0,569,.LM220-.LFBB76
.LM220:
.LFBB76:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM221-.LFBB76
.LM221:
	ldi r24,lo8(7)
/* epilogue start */
	ret
	.size	max_remd_sensitivity, .-max_remd_sensitivity
.Lscope76:
.global	step_remd_sensitivity
	.type	step_remd_sensitivity, @function
step_remd_sensitivity:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_remd_sensitivity, .-step_remd_sensitivity
	.stabs	"get_default_remd_sensitivity:F(0,18)",36,0,0,get_default_remd_sensitivity
.global	get_default_remd_sensitivity
	.type	get_default_remd_sensitivity, @function
get_default_remd_sensitivity:
	.stabn	68,0,569,.LM222-.LFBB77
.LM222:
.LFBB77:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM223-.LFBB77
.LM223:
	ldi r24,lo8(4)
/* epilogue start */
	ret
	.size	get_default_remd_sensitivity, .-get_default_remd_sensitivity
.Lscope77:
	.stabs	"is_readonly_remd_sensitivity:F(0,11)",36,0,0,is_readonly_remd_sensitivity
.global	is_readonly_remd_sensitivity
	.type	is_readonly_remd_sensitivity, @function
is_readonly_remd_sensitivity:
	.stabn	68,0,569,.LM224-.LFBB78
.LM224:
.LFBB78:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM225-.LFBB78
.LM225:
	lds r24,cfg+19
	bst r24,5
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_remd_sensitivity, .-is_readonly_remd_sensitivity
.Lscope78:
	.stabs	"set_readonly_remd_sensitivity:F(0,1)",36,0,0,set_readonly_remd_sensitivity
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_remd_sensitivity
	.type	set_readonly_remd_sensitivity, @function
set_readonly_remd_sensitivity:
	.stabn	68,0,569,.LM226-.LFBB79
.LM226:
.LFBB79:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM227-.LFBB79
.LM227:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,5
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_remd_sensitivity, .-set_readonly_remd_sensitivity
.Lscope79:
	.stabs	"set_remd_sensitivity:F(0,1)",36,0,0,set_remd_sensitivity
	.stabs	"val:P(0,18)",64,0,0,24
.global	set_remd_sensitivity
	.type	set_remd_sensitivity, @function
set_remd_sensitivity:
	.stabn	68,0,569,.LM228-.LFBB80
.LM228:
.LFBB80:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,569,.LM229-.LFBB80
.LM229:
	ldi r25,lo8(-2)
	add r25,r24
	cpi r25,lo8(6)
	brsh .L116
	.stabn	68,0,569,.LM230-.LFBB80
.LM230:
	sts cfg+9,r24
.L116:
/* epilogue start */
	.stabn	68,0,569,.LM231-.LFBB80
.LM231:
	ret
	.size	set_remd_sensitivity, .-set_remd_sensitivity
.Lscope80:
	.stabs	"set_default_remd_sensitivity:F(0,1)",36,0,0,set_default_remd_sensitivity
.global	set_default_remd_sensitivity
	.type	set_default_remd_sensitivity, @function
set_default_remd_sensitivity:
	.stabn	68,0,569,.LM232-.LFBB81
.LM232:
.LFBB81:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB461:
.LBB462:
	.stabn	68,0,569,.LM233-.LFBB81
.LM233:
	ldi r24,lo8(4)
	sts cfg+9,r24
/* epilogue start */
.LBE462:
.LBE461:
	ret
	.size	set_default_remd_sensitivity, .-set_default_remd_sensitivity
.Lscope81:
	.stabs	"get_duplex_mode:F(0,10)",36,0,0,get_duplex_mode
.global	get_duplex_mode
	.type	get_duplex_mode, @function
get_duplex_mode:
	.stabn	68,0,570,.LM234-.LFBB82
.LM234:
.LFBB82:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,570,.LM235-.LFBB82
.LM235:
	lds r24,cfg+10
/* epilogue start */
	ret
	.size	get_duplex_mode, .-get_duplex_mode
.Lscope82:
.global	min_duplex_mode
	.type	min_duplex_mode, @function
min_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_duplex_mode, .-min_duplex_mode
.global	max_duplex_mode
	.type	max_duplex_mode, @function
max_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	max_duplex_mode, .-max_duplex_mode
.global	step_duplex_mode
	.type	step_duplex_mode, @function
step_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_duplex_mode, .-step_duplex_mode
.global	get_default_duplex_mode
	.type	get_default_duplex_mode, @function
get_default_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_default_duplex_mode, .-get_default_duplex_mode
	.stabs	"is_readonly_duplex_mode:F(0,11)",36,0,0,is_readonly_duplex_mode
.global	is_readonly_duplex_mode
	.type	is_readonly_duplex_mode, @function
is_readonly_duplex_mode:
	.stabn	68,0,570,.LM236-.LFBB83
.LM236:
.LFBB83:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,570,.LM237-.LFBB83
.LM237:
	lds r24,cfg+19
	bst r24,6
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_duplex_mode, .-is_readonly_duplex_mode
.Lscope83:
	.stabs	"set_readonly_duplex_mode:F(0,1)",36,0,0,set_readonly_duplex_mode
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_duplex_mode
	.type	set_readonly_duplex_mode, @function
set_readonly_duplex_mode:
	.stabn	68,0,570,.LM238-.LFBB84
.LM238:
.LFBB84:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,570,.LM239-.LFBB84
.LM239:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,6
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_duplex_mode, .-set_readonly_duplex_mode
.Lscope84:
.global	get_invalid_duplex_mode
	.type	get_invalid_duplex_mode, @function
get_invalid_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_invalid_duplex_mode, .-get_invalid_duplex_mode
	.stabs	"is_invalid_duplex_mode:F(0,11)",36,0,0,is_invalid_duplex_mode
.global	is_invalid_duplex_mode
	.type	is_invalid_duplex_mode, @function
is_invalid_duplex_mode:
	.stabn	68,0,570,.LM240-.LFBB85
.LM240:
.LFBB85:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,570,.LM241-.LFBB85
.LM241:
	ldi r24,lo8(1)
	lds r25,cfg+10
	cpse r25,__zero_reg__
	ldi r24,0
.L128:
/* epilogue start */
	ret
	.size	is_invalid_duplex_mode, .-is_invalid_duplex_mode
.Lscope85:
	.stabs	"get_wakeup_mode:F(0,2)",36,0,0,get_wakeup_mode
.global	get_wakeup_mode
	.type	get_wakeup_mode, @function
get_wakeup_mode:
	.stabn	68,0,571,.LM242-.LFBB86
.LM242:
.LFBB86:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM243-.LFBB86
.LM243:
	lds r24,cfg+11
/* epilogue start */
	ret
	.size	get_wakeup_mode, .-get_wakeup_mode
.Lscope86:
.global	min_wakeup_mode
	.type	min_wakeup_mode, @function
min_wakeup_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_wakeup_mode, .-min_wakeup_mode
	.stabs	"max_wakeup_mode:F(0,2)",36,0,0,max_wakeup_mode
.global	max_wakeup_mode
	.type	max_wakeup_mode, @function
max_wakeup_mode:
	.stabn	68,0,571,.LM244-.LFBB87
.LM244:
.LFBB87:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM245-.LFBB87
.LM245:
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	max_wakeup_mode, .-max_wakeup_mode
.Lscope87:
.global	step_wakeup_mode
	.type	step_wakeup_mode, @function
step_wakeup_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_wakeup_mode, .-step_wakeup_mode
.global	get_default_wakeup_mode
	.type	get_default_wakeup_mode, @function
get_default_wakeup_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(2)
/* epilogue start */
	ret
	.size	get_default_wakeup_mode, .-get_default_wakeup_mode
	.stabs	"is_readonly_wakeup_mode:F(0,11)",36,0,0,is_readonly_wakeup_mode
.global	is_readonly_wakeup_mode
	.type	is_readonly_wakeup_mode, @function
is_readonly_wakeup_mode:
	.stabn	68,0,571,.LM246-.LFBB88
.LM246:
.LFBB88:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM247-.LFBB88
.LM247:
	lds r24,cfg+19
	rol r24
	clr r24
	rol r24
/* epilogue start */
	ret
	.size	is_readonly_wakeup_mode, .-is_readonly_wakeup_mode
.Lscope88:
	.stabs	"set_readonly_wakeup_mode:F(0,1)",36,0,0,set_readonly_wakeup_mode
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_wakeup_mode
	.type	set_readonly_wakeup_mode, @function
set_readonly_wakeup_mode:
	.stabn	68,0,571,.LM248-.LFBB89
.LM248:
.LFBB89:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM249-.LFBB89
.LM249:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ld r25,Z
	bst r24,0
	bld r25,7
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_wakeup_mode, .-set_readonly_wakeup_mode
.Lscope89:
.global	get_invalid_wakeup_mode
	.type	get_invalid_wakeup_mode, @function
get_invalid_wakeup_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_invalid_wakeup_mode, .-get_invalid_wakeup_mode
	.stabs	"is_invalid_wakeup_mode:F(0,11)",36,0,0,is_invalid_wakeup_mode
.global	is_invalid_wakeup_mode
	.type	is_invalid_wakeup_mode, @function
is_invalid_wakeup_mode:
	.stabn	68,0,571,.LM250-.LFBB90
.LM250:
.LFBB90:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,571,.LM251-.LFBB90
.LM251:
	ldi r24,lo8(1)
	lds r25,cfg+11
	cpse r25,__zero_reg__
	ldi r24,0
.L141:
/* epilogue start */
	ret
	.size	is_invalid_wakeup_mode, .-is_invalid_wakeup_mode
.Lscope90:
	.stabs	"get_hints_frequency:F(0,19)=(0,3)",36,0,0,get_hints_frequency
	.stabs	"hints_frequency_t:t(0,19)",128,0,0,0
.global	get_hints_frequency
	.type	get_hints_frequency, @function
get_hints_frequency:
	.stabn	68,0,572,.LM252-.LFBB91
.LM252:
.LFBB91:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,572,.LM253-.LFBB91
.LM253:
	lds r24,cfg+13
/* epilogue start */
	ret
	.size	get_hints_frequency, .-get_hints_frequency
.Lscope91:
.global	min_hints_frequency
	.type	min_hints_frequency, @function
min_hints_frequency:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_hints_frequency, .-min_hints_frequency
.global	max_hints_frequency
	.type	max_hints_frequency, @function
max_hints_frequency:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_hints_frequency, .-max_hints_frequency
.global	step_hints_frequency
	.type	step_hints_frequency, @function
step_hints_frequency:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_hints_frequency, .-step_hints_frequency
.global	get_default_hints_frequency
	.type	get_default_hints_frequency, @function
get_default_hints_frequency:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(2)
/* epilogue start */
	ret
	.size	get_default_hints_frequency, .-get_default_hints_frequency
	.stabs	"is_readonly_hints_frequency:F(0,11)",36,0,0,is_readonly_hints_frequency
.global	is_readonly_hints_frequency
	.type	is_readonly_hints_frequency, @function
is_readonly_hints_frequency:
	.stabn	68,0,572,.LM254-.LFBB92
.LM254:
.LFBB92:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,572,.LM255-.LFBB92
.LM255:
	lds r24,cfg+20
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_hints_frequency, .-is_readonly_hints_frequency
.Lscope92:
	.stabs	"set_readonly_hints_frequency:F(0,1)",36,0,0,set_readonly_hints_frequency
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_hints_frequency
	.type	set_readonly_hints_frequency, @function
set_readonly_hints_frequency:
	.stabn	68,0,572,.LM256-.LFBB93
.LM256:
.LFBB93:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,572,.LM257-.LFBB93
.LM257:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,1
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_hints_frequency, .-set_readonly_hints_frequency
.Lscope93:
	.stabs	"set_hints_frequency:F(0,1)",36,0,0,set_hints_frequency
	.stabs	"val:P(0,19)",64,0,0,24
.global	set_hints_frequency
	.type	set_hints_frequency, @function
set_hints_frequency:
	.stabn	68,0,572,.LM258-.LFBB94
.LM258:
.LFBB94:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,572,.LM259-.LFBB94
.LM259:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L152
	.stabn	68,0,572,.LM260-.LFBB94
.LM260:
	sts cfg+13,r24
.L152:
/* epilogue start */
	.stabn	68,0,572,.LM261-.LFBB94
.LM261:
	ret
	.size	set_hints_frequency, .-set_hints_frequency
.Lscope94:
	.stabs	"set_default_hints_frequency:F(0,1)",36,0,0,set_default_hints_frequency
.global	set_default_hints_frequency
	.type	set_default_hints_frequency, @function
set_default_hints_frequency:
	.stabn	68,0,572,.LM262-.LFBB95
.LM262:
.LFBB95:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB465:
.LBB466:
	.stabn	68,0,572,.LM263-.LFBB95
.LM263:
	ldi r24,lo8(2)
	sts cfg+13,r24
/* epilogue start */
.LBE466:
.LBE465:
	ret
	.size	set_default_hints_frequency, .-set_default_hints_frequency
.Lscope95:
	.stabs	"get_hints_duty_cycle:F(0,20)=(0,3)",36,0,0,get_hints_duty_cycle
	.stabs	"hints_duty_cycle_t:t(0,20)",128,0,0,0
.global	get_hints_duty_cycle
	.type	get_hints_duty_cycle, @function
get_hints_duty_cycle:
	.stabn	68,0,573,.LM264-.LFBB96
.LM264:
.LFBB96:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,573,.LM265-.LFBB96
.LM265:
	lds r24,cfg+14
/* epilogue start */
	ret
	.size	get_hints_duty_cycle, .-get_hints_duty_cycle
.Lscope96:
.global	min_hints_duty_cycle
	.type	min_hints_duty_cycle, @function
min_hints_duty_cycle:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_hints_duty_cycle, .-min_hints_duty_cycle
.global	max_hints_duty_cycle
	.type	max_hints_duty_cycle, @function
max_hints_duty_cycle:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_hints_duty_cycle, .-max_hints_duty_cycle
.global	step_hints_duty_cycle
	.type	step_hints_duty_cycle, @function
step_hints_duty_cycle:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_hints_duty_cycle, .-step_hints_duty_cycle
.global	get_default_hints_duty_cycle
	.type	get_default_hints_duty_cycle, @function
get_default_hints_duty_cycle:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(4)
/* epilogue start */
	ret
	.size	get_default_hints_duty_cycle, .-get_default_hints_duty_cycle
	.stabs	"is_readonly_hints_duty_cycle:F(0,11)",36,0,0,is_readonly_hints_duty_cycle
.global	is_readonly_hints_duty_cycle
	.type	is_readonly_hints_duty_cycle, @function
is_readonly_hints_duty_cycle:
	.stabn	68,0,573,.LM266-.LFBB97
.LM266:
.LFBB97:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,573,.LM267-.LFBB97
.LM267:
	lds r24,cfg+20
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_hints_duty_cycle, .-is_readonly_hints_duty_cycle
.Lscope97:
	.stabs	"set_readonly_hints_duty_cycle:F(0,1)",36,0,0,set_readonly_hints_duty_cycle
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_hints_duty_cycle
	.type	set_readonly_hints_duty_cycle, @function
set_readonly_hints_duty_cycle:
	.stabn	68,0,573,.LM268-.LFBB98
.LM268:
.LFBB98:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,573,.LM269-.LFBB98
.LM269:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,2
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_hints_duty_cycle, .-set_readonly_hints_duty_cycle
.Lscope98:
	.stabs	"set_hints_duty_cycle:F(0,1)",36,0,0,set_hints_duty_cycle
	.stabs	"val:P(0,20)",64,0,0,24
.global	set_hints_duty_cycle
	.type	set_hints_duty_cycle, @function
set_hints_duty_cycle:
	.stabn	68,0,573,.LM270-.LFBB99
.LM270:
.LFBB99:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,573,.LM271-.LFBB99
.LM271:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L162
	.stabn	68,0,573,.LM272-.LFBB99
.LM272:
	sts cfg+14,r24
.L162:
/* epilogue start */
	.stabn	68,0,573,.LM273-.LFBB99
.LM273:
	ret
	.size	set_hints_duty_cycle, .-set_hints_duty_cycle
.Lscope99:
	.stabs	"set_default_hints_duty_cycle:F(0,1)",36,0,0,set_default_hints_duty_cycle
.global	set_default_hints_duty_cycle
	.type	set_default_hints_duty_cycle, @function
set_default_hints_duty_cycle:
	.stabn	68,0,573,.LM274-.LFBB100
.LM274:
.LFBB100:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB469:
.LBB470:
	.stabn	68,0,573,.LM275-.LFBB100
.LM275:
	ldi r24,lo8(4)
	sts cfg+14,r24
/* epilogue start */
.LBE470:
.LBE469:
	ret
	.size	set_default_hints_duty_cycle, .-set_default_hints_duty_cycle
.Lscope100:
	.stabs	"get_light_hints_brightness:F(0,21)=(0,3)",36,0,0,get_light_hints_brightness
	.stabs	"light_hints_brightness_t:t(0,21)",128,0,0,0
.global	get_light_hints_brightness
	.type	get_light_hints_brightness, @function
get_light_hints_brightness:
	.stabn	68,0,574,.LM276-.LFBB101
.LM276:
.LFBB101:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,574,.LM277-.LFBB101
.LM277:
	lds r24,cfg+15
/* epilogue start */
	ret
	.size	get_light_hints_brightness, .-get_light_hints_brightness
.Lscope101:
.global	min_light_hints_brightness
	.type	min_light_hints_brightness, @function
min_light_hints_brightness:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_light_hints_brightness, .-min_light_hints_brightness
.global	max_light_hints_brightness
	.type	max_light_hints_brightness, @function
max_light_hints_brightness:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_light_hints_brightness, .-max_light_hints_brightness
.global	step_light_hints_brightness
	.type	step_light_hints_brightness, @function
step_light_hints_brightness:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_light_hints_brightness, .-step_light_hints_brightness
.global	get_default_light_hints_brightness
	.type	get_default_light_hints_brightness, @function
get_default_light_hints_brightness:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	get_default_light_hints_brightness, .-get_default_light_hints_brightness
	.stabs	"is_readonly_light_hints_brightness:F(0,11)",36,0,0,is_readonly_light_hints_brightness
.global	is_readonly_light_hints_brightness
	.type	is_readonly_light_hints_brightness, @function
is_readonly_light_hints_brightness:
	.stabn	68,0,574,.LM278-.LFBB102
.LM278:
.LFBB102:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,574,.LM279-.LFBB102
.LM279:
	lds r24,cfg+20
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_light_hints_brightness, .-is_readonly_light_hints_brightness
.Lscope102:
	.stabs	"set_readonly_light_hints_brightness:F(0,1)",36,0,0,set_readonly_light_hints_brightness
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_light_hints_brightness
	.type	set_readonly_light_hints_brightness, @function
set_readonly_light_hints_brightness:
	.stabn	68,0,574,.LM280-.LFBB103
.LM280:
.LFBB103:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,574,.LM281-.LFBB103
.LM281:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,3
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_light_hints_brightness, .-set_readonly_light_hints_brightness
.Lscope103:
	.stabs	"set_light_hints_brightness:F(0,1)",36,0,0,set_light_hints_brightness
	.stabs	"val:P(0,21)",64,0,0,24
.global	set_light_hints_brightness
	.type	set_light_hints_brightness, @function
set_light_hints_brightness:
	.stabn	68,0,574,.LM282-.LFBB104
.LM282:
.LFBB104:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,574,.LM283-.LFBB104
.LM283:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L172
	.stabn	68,0,574,.LM284-.LFBB104
.LM284:
	sts cfg+15,r24
.L172:
/* epilogue start */
	.stabn	68,0,574,.LM285-.LFBB104
.LM285:
	ret
	.size	set_light_hints_brightness, .-set_light_hints_brightness
.Lscope104:
	.stabs	"set_default_light_hints_brightness:F(0,1)",36,0,0,set_default_light_hints_brightness
.global	set_default_light_hints_brightness
	.type	set_default_light_hints_brightness, @function
set_default_light_hints_brightness:
	.stabn	68,0,574,.LM286-.LFBB105
.LM286:
.LFBB105:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB473:
.LBB474:
	.stabn	68,0,574,.LM287-.LFBB105
.LM287:
	ldi r24,lo8(3)
	sts cfg+15,r24
/* epilogue start */
.LBE474:
.LBE473:
	ret
	.size	set_default_light_hints_brightness, .-set_default_light_hints_brightness
.Lscope105:
	.stabs	"get_sound_hints_volume:F(0,22)=(0,3)",36,0,0,get_sound_hints_volume
	.stabs	"sound_hints_volume_t:t(0,22)",128,0,0,0
.global	get_sound_hints_volume
	.type	get_sound_hints_volume, @function
get_sound_hints_volume:
	.stabn	68,0,575,.LM288-.LFBB106
.LM288:
.LFBB106:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,575,.LM289-.LFBB106
.LM289:
	lds r24,cfg+16
/* epilogue start */
	ret
	.size	get_sound_hints_volume, .-get_sound_hints_volume
.Lscope106:
.global	min_sound_hints_volume
	.type	min_sound_hints_volume, @function
min_sound_hints_volume:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_sound_hints_volume, .-min_sound_hints_volume
.global	max_sound_hints_volume
	.type	max_sound_hints_volume, @function
max_sound_hints_volume:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_sound_hints_volume, .-max_sound_hints_volume
.global	step_sound_hints_volume
	.type	step_sound_hints_volume, @function
step_sound_hints_volume:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_sound_hints_volume, .-step_sound_hints_volume
.global	get_default_sound_hints_volume
	.type	get_default_sound_hints_volume, @function
get_default_sound_hints_volume:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	get_default_sound_hints_volume, .-get_default_sound_hints_volume
	.stabs	"is_readonly_sound_hints_volume:F(0,11)",36,0,0,is_readonly_sound_hints_volume
.global	is_readonly_sound_hints_volume
	.type	is_readonly_sound_hints_volume, @function
is_readonly_sound_hints_volume:
	.stabn	68,0,575,.LM290-.LFBB107
.LM290:
.LFBB107:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,575,.LM291-.LFBB107
.LM291:
	lds r24,cfg+20
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_sound_hints_volume, .-is_readonly_sound_hints_volume
.Lscope107:
	.stabs	"set_readonly_sound_hints_volume:F(0,1)",36,0,0,set_readonly_sound_hints_volume
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_sound_hints_volume
	.type	set_readonly_sound_hints_volume, @function
set_readonly_sound_hints_volume:
	.stabn	68,0,575,.LM292-.LFBB108
.LM292:
.LFBB108:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,575,.LM293-.LFBB108
.LM293:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,4
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_sound_hints_volume, .-set_readonly_sound_hints_volume
.Lscope108:
	.stabs	"set_sound_hints_volume:F(0,1)",36,0,0,set_sound_hints_volume
	.stabs	"val:P(0,22)",64,0,0,24
.global	set_sound_hints_volume
	.type	set_sound_hints_volume, @function
set_sound_hints_volume:
	.stabn	68,0,575,.LM294-.LFBB109
.LM294:
.LFBB109:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,575,.LM295-.LFBB109
.LM295:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L182
	.stabn	68,0,575,.LM296-.LFBB109
.LM296:
	sts cfg+16,r24
.L182:
/* epilogue start */
	.stabn	68,0,575,.LM297-.LFBB109
.LM297:
	ret
	.size	set_sound_hints_volume, .-set_sound_hints_volume
.Lscope109:
	.stabs	"set_default_sound_hints_volume:F(0,1)",36,0,0,set_default_sound_hints_volume
.global	set_default_sound_hints_volume
	.type	set_default_sound_hints_volume, @function
set_default_sound_hints_volume:
	.stabn	68,0,575,.LM298-.LFBB110
.LM298:
.LFBB110:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB477:
.LBB478:
	.stabn	68,0,575,.LM299-.LFBB110
.LM299:
	ldi r24,lo8(3)
	sts cfg+16,r24
/* epilogue start */
.LBE478:
.LBE477:
	ret
	.size	set_default_sound_hints_volume, .-set_default_sound_hints_volume
.Lscope110:
	.stabs	"get_light_hints_duration:F(0,23)=(0,3)",36,0,0,get_light_hints_duration
	.stabs	"light_hints_duration_t:t(0,23)",128,0,0,0
.global	get_light_hints_duration
	.type	get_light_hints_duration, @function
get_light_hints_duration:
	.stabn	68,0,576,.LM300-.LFBB111
.LM300:
.LFBB111:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM301-.LFBB111
.LM301:
	lds r24,cfg+17
/* epilogue start */
	ret
	.size	get_light_hints_duration, .-get_light_hints_duration
.Lscope111:
.global	min_light_hints_duration
	.type	min_light_hints_duration, @function
min_light_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	min_light_hints_duration, .-min_light_hints_duration
	.stabs	"max_light_hints_duration:F(0,23)",36,0,0,max_light_hints_duration
.global	max_light_hints_duration
	.type	max_light_hints_duration, @function
max_light_hints_duration:
	.stabn	68,0,576,.LM302-.LFBB112
.LM302:
.LFBB112:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM303-.LFBB112
.LM303:
	ldi r24,lo8(99)
/* epilogue start */
	ret
	.size	max_light_hints_duration, .-max_light_hints_duration
.Lscope112:
.global	step_light_hints_duration
	.type	step_light_hints_duration, @function
step_light_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_light_hints_duration, .-step_light_hints_duration
.global	get_default_light_hints_duration
	.type	get_default_light_hints_duration, @function
get_default_light_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(7)
/* epilogue start */
	ret
	.size	get_default_light_hints_duration, .-get_default_light_hints_duration
	.stabs	"is_readonly_light_hints_duration:F(0,11)",36,0,0,is_readonly_light_hints_duration
.global	is_readonly_light_hints_duration
	.type	is_readonly_light_hints_duration, @function
is_readonly_light_hints_duration:
	.stabn	68,0,576,.LM304-.LFBB113
.LM304:
.LFBB113:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM305-.LFBB113
.LM305:
	lds r24,cfg+20
	bst r24,5
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_light_hints_duration, .-is_readonly_light_hints_duration
.Lscope113:
	.stabs	"set_readonly_light_hints_duration:F(0,1)",36,0,0,set_readonly_light_hints_duration
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_light_hints_duration
	.type	set_readonly_light_hints_duration, @function
set_readonly_light_hints_duration:
	.stabn	68,0,576,.LM306-.LFBB114
.LM306:
.LFBB114:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM307-.LFBB114
.LM307:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,5
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_light_hints_duration, .-set_readonly_light_hints_duration
.Lscope114:
	.stabs	"set_light_hints_duration:F(0,1)",36,0,0,set_light_hints_duration
	.stabs	"val:P(0,23)",64,0,0,24
.global	set_light_hints_duration
	.type	set_light_hints_duration, @function
set_light_hints_duration:
	.stabn	68,0,576,.LM308-.LFBB115
.LM308:
.LFBB115:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,576,.LM309-.LFBB115
.LM309:
	cpi r24,lo8(100)
	brsh .L192
	.stabn	68,0,576,.LM310-.LFBB115
.LM310:
	sts cfg+17,r24
.L192:
/* epilogue start */
	.stabn	68,0,576,.LM311-.LFBB115
.LM311:
	ret
	.size	set_light_hints_duration, .-set_light_hints_duration
.Lscope115:
	.stabs	"set_default_light_hints_duration:F(0,1)",36,0,0,set_default_light_hints_duration
.global	set_default_light_hints_duration
	.type	set_default_light_hints_duration, @function
set_default_light_hints_duration:
	.stabn	68,0,576,.LM312-.LFBB116
.LM312:
.LFBB116:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB481:
.LBB482:
	.stabn	68,0,576,.LM313-.LFBB116
.LM313:
	ldi r24,lo8(7)
	sts cfg+17,r24
/* epilogue start */
.LBE482:
.LBE481:
	ret
	.size	set_default_light_hints_duration, .-set_default_light_hints_duration
.Lscope116:
	.stabs	"get_sound_hints_duration:F(0,24)=(0,3)",36,0,0,get_sound_hints_duration
	.stabs	"sound_hints_duration_t:t(0,24)",128,0,0,0
.global	get_sound_hints_duration
	.type	get_sound_hints_duration, @function
get_sound_hints_duration:
	.stabn	68,0,577,.LM314-.LFBB117
.LM314:
.LFBB117:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,577,.LM315-.LFBB117
.LM315:
	lds r24,cfg+18
/* epilogue start */
	ret
	.size	get_sound_hints_duration, .-get_sound_hints_duration
.Lscope117:
.global	min_sound_hints_duration
	.type	min_sound_hints_duration, @function
min_sound_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
/* epilogue start */
	ret
	.size	min_sound_hints_duration, .-min_sound_hints_duration
.global	max_sound_hints_duration
	.type	max_sound_hints_duration, @function
max_sound_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(99)
/* epilogue start */
	ret
	.size	max_sound_hints_duration, .-max_sound_hints_duration
.global	step_sound_hints_duration
	.type	step_sound_hints_duration, @function
step_sound_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_sound_hints_duration, .-step_sound_hints_duration
.global	get_default_sound_hints_duration
	.type	get_default_sound_hints_duration, @function
get_default_sound_hints_duration:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(7)
/* epilogue start */
	ret
	.size	get_default_sound_hints_duration, .-get_default_sound_hints_duration
	.stabs	"is_readonly_sound_hints_duration:F(0,11)",36,0,0,is_readonly_sound_hints_duration
.global	is_readonly_sound_hints_duration
	.type	is_readonly_sound_hints_duration, @function
is_readonly_sound_hints_duration:
	.stabn	68,0,577,.LM316-.LFBB118
.LM316:
.LFBB118:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,577,.LM317-.LFBB118
.LM317:
	lds r24,cfg+20
	bst r24,6
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_sound_hints_duration, .-is_readonly_sound_hints_duration
.Lscope118:
	.stabs	"set_readonly_sound_hints_duration:F(0,1)",36,0,0,set_readonly_sound_hints_duration
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_readonly_sound_hints_duration
	.type	set_readonly_sound_hints_duration, @function
set_readonly_sound_hints_duration:
	.stabn	68,0,577,.LM318-.LFBB119
.LM318:
.LFBB119:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,577,.LM319-.LFBB119
.LM319:
	ldi r30,lo8(cfg+19)
	ldi r31,hi8(cfg+19)
	ldd r25,Z+1
	bst r24,0
	bld r25,6
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_sound_hints_duration, .-set_readonly_sound_hints_duration
.Lscope119:
	.stabs	"set_sound_hints_duration:F(0,1)",36,0,0,set_sound_hints_duration
	.stabs	"val:P(0,24)",64,0,0,24
.global	set_sound_hints_duration
	.type	set_sound_hints_duration, @function
set_sound_hints_duration:
	.stabn	68,0,577,.LM320-.LFBB120
.LM320:
.LFBB120:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,577,.LM321-.LFBB120
.LM321:
	cpi r24,lo8(100)
	brsh .L202
	.stabn	68,0,577,.LM322-.LFBB120
.LM322:
	sts cfg+18,r24
.L202:
/* epilogue start */
	.stabn	68,0,577,.LM323-.LFBB120
.LM323:
	ret
	.size	set_sound_hints_duration, .-set_sound_hints_duration
.Lscope120:
	.stabs	"set_default_sound_hints_duration:F(0,1)",36,0,0,set_default_sound_hints_duration
.global	set_default_sound_hints_duration
	.type	set_default_sound_hints_duration, @function
set_default_sound_hints_duration:
	.stabn	68,0,577,.LM324-.LFBB121
.LM324:
.LFBB121:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB485:
.LBB486:
	.stabn	68,0,577,.LM325-.LFBB121
.LM325:
	ldi r24,lo8(7)
	sts cfg+18,r24
/* epilogue start */
.LBE486:
.LBE485:
	ret
	.size	set_default_sound_hints_duration, .-set_default_sound_hints_duration
.Lscope121:
	.stabs	"get_remd_trigger_counter:F(0,25)=(0,3)",36,0,0,get_remd_trigger_counter
	.stabs	"remd_trigger_counter_t:t(0,25)",128,0,0,0
.global	get_remd_trigger_counter
	.type	get_remd_trigger_counter, @function
get_remd_trigger_counter:
	.stabn	68,0,578,.LM326-.LFBB122
.LM326:
.LFBB122:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,578,.LM327-.LFBB122
.LM327:
	lds r24,v_remd_trigger_counter
/* epilogue start */
	ret
	.size	get_remd_trigger_counter, .-get_remd_trigger_counter
.Lscope122:
	.stabs	"inc_remd_trigger_counter:F(0,1)",36,0,0,inc_remd_trigger_counter
.global	inc_remd_trigger_counter
	.type	inc_remd_trigger_counter, @function
inc_remd_trigger_counter:
	.stabn	68,0,578,.LM328-.LFBB123
.LM328:
.LFBB123:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,578,.LM329-.LFBB123
.LM329:
	lds r24,v_remd_trigger_counter
	subi r24,lo8(-(1))
	sts v_remd_trigger_counter,r24
/* epilogue start */
	ret
	.size	inc_remd_trigger_counter, .-inc_remd_trigger_counter
.Lscope123:
	.stabs	"reset_remd_trigger_counter:F(0,1)",36,0,0,reset_remd_trigger_counter
.global	reset_remd_trigger_counter
	.type	reset_remd_trigger_counter, @function
reset_remd_trigger_counter:
	.stabn	68,0,578,.LM330-.LFBB124
.LM330:
.LFBB124:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,578,.LM331-.LFBB124
.LM331:
	sts v_remd_trigger_counter,__zero_reg__
/* epilogue start */
	ret
	.size	reset_remd_trigger_counter, .-reset_remd_trigger_counter
.Lscope124:
	.local	v_remd_trigger_counter
	.comm	v_remd_trigger_counter,1,1
	.stabs	"v_remd_trigger_counter:S(0,25)",38,0,0,v_remd_trigger_counter
	.local	cfg
	.comm	cfg,21,1
	.stabs	"cfg:S(0,26)=(0,27)=xss_dreamstalker_config:",40,0,0,cfg
	.stabs	"s_dreamstalker_config:T(0,27)=s21signature:(0,6),0,16;props:(0,28)=(0,29)=xss_dreamstalker_config_props:,16,136;states:(0,30)=(0,31)=xss_dreamstalker_config_states:,152,16;;",128,0,0,0
	.stabs	"dreamstalker_config_t:t(0,26)",128,0,0,0
	.stabs	"s_dreamstalker_config_props:T(0,29)=s17before_hints_message:(0,3),0,1;after_hints_message:(0,3),1,1;voice_recording:(0,3),2,1;loud_speaker:(0,3),3,1;alarm_clock:(0,3),4,1;wakeup_timer_delay:(0,12),8,16;sleep_scenario_playback:(0,13),24,8;relax_tunes_playback:(0,14),32,8;music_volume_level:(0,16),40,8;recording_gain_level:(0,17),48,8;remd_sensitivity:(0,18),56,8;duplex_mode:(0,10),64,8;wakeup_mode:(0,2),72,8;vibration_level:(0,15),80,8;hints_frequency:(0,19),88,8;hints_duty_cycle:(0,20),96,8;light_hints_brightness:(0,21),104,8;sound_hints_volume:(0,22),112,8;light_hints_duration:(0,23),120,8;sound_hints_duration:(0,24),128,8;;",128,0,0,0
	.stabs	"s_dreamstalker_config_states:T(0,31)=s2wakeup_timer_delay__RO:(0,3),0,1;sleep_scenario_playback__RO:(0,3),1,1;relax_tunes_playback__RO:(0,3),2,1;music_volume_level__RO:(0,3),3,1;recording_gain_level__RO:(0,3),4,1;remd_sensitivity__RO:(0,3),5,1;duplex_mode__RO:(0,3),6,1;wakeup_mode__RO:(0,3),7,1;vibration_level__RO:(0,3),8,1;hints_frequency__RO:(0,3),9,1;hints_duty_cycle__RO:(0,3),10,1;light_hints_brightness__RO:(0,3),11,1;sound_hints_volume__RO:(0,3),12,1;light_hints_duration__RO:(0,3),13,1;sound_hints_duration__RO:(0,3),14,1;;",128,0,0,0
	.section	.eeprom,"aw"
	.type	eeprom_cfg, @object
	.size	eeprom_cfg, 21
eeprom_cfg:
	.zero	21
	.stabs	"eeprom_cfg:S(0,26)",40,0,0,eeprom_cfg
.global	u_FirmwareVersion
	.section	.progmem.data,"a",@progbits
	.type	u_FirmwareVersion, @object
	.size	u_FirmwareVersion, 2
u_FirmwareVersion:
	.word	258
	.stabs	"u_FirmwareVersion:G(0,6)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
