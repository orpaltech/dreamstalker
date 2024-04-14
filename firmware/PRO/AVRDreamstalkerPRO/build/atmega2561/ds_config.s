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
	.stabn	68,0,392,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,399,.LM1-.LFBB1
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
	.stabn	68,0,396,.LM2-.LFBB1
.LM2:
	sts cfg+8,r24
.LBB265:
.LBB266:
	.stabn	68,0,480,.LM3-.LFBB1
.LM3:
	sts cfg+12,r20
.LBE266:
.LBE265:
.LBB267:
.LBB268:
	.stabn	68,0,482,.LM4-.LFBB1
.LM4:
	sts cfg+14,r19
.LBE268:
.LBE267:
.LBB269:
.LBB270:
.LBB271:
	.stabn	68,0,481,.LM5-.LFBB1
.LM5:
	sts cfg+13,r18
.LBE271:
.LBE270:
.LBE269:
.LBB272:
.LBB273:
	.stabn	68,0,483,.LM6-.LFBB1
.LM6:
	sts cfg+15,r25
.LBE273:
.LBE272:
.LBB274:
.LBB275:
	.stabn	68,0,479,.LM7-.LFBB1
.LM7:
	ldi r24,lo8(4)
	sts cfg+11,r24
.LBE275:
.LBE274:
.LBB276:
.LBB277:
.LBB278:
	.stabn	68,0,478,.LM8-.LFBB1
.LM8:
	ldi r24,lo8(2)
	sts cfg+10,r24
.LBE278:
.LBE277:
.LBE276:
.LBB279:
.LBB280:
	lds r24,cfg+17
	ori r24,lo8(63)
	sts cfg+17,r24
/* epilogue start */
.LBE280:
.LBE279:
	.stabn	68,0,434,.LM9-.LFBB1
.LM9:
	ret
	.size	set_wakeup_mode.part.0, .-set_wakeup_mode.part.0
.Lscope1:
	.section	.init3,"ax",@progbits
	.stabs	"wdt_init:F(0,1)",36,0,0,wdt_init
.global	wdt_init
	.type	wdt_init, @function
wdt_init:
	.stabn	68,0,237,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,241,.LM11-.LFBB2
.LM11:
	out 0x34,__zero_reg__
.LBB281:
.LBB282:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,470,.LM12-.LFBB2
.LM12:
/* #APP */
 ;  470 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	lds r24,96
	ori r24,24
	sts 96,r24
	sts 96,__zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE282:
.LBE281:
	.stabs	"src/ds_config.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,245,.LM13-.LFBB2
.LM13:
	.size	wdt_init, .-wdt_init
.Lscope2:
	.text
	.stabs	"soft_reset:F(0,1)",36,0,0,soft_reset
.global	soft_reset
	.type	soft_reset, @function
soft_reset:
	.stabn	68,0,248,.LM14-.LFBB3
.LM14:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB283:
.LBB284:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,428,.LM15-.LFBB3
.LM15:
	ldi r24,lo8(24)
	ldi r25,lo8(8)
/* #APP */
 ;  428 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	sts 96, r24
	out __SREG__,__tmp_reg__
	sts 96, r25
 	
 ;  0 "" 2
/* #NOAPP */
.L8:
	rjmp .L8
.LBE284:
.LBE283:
	.size	soft_reset, .-soft_reset
.Lscope3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"config"
	.text
	.stabs	"config_set_defaults:F(0,1)",36,0,0,config_set_defaults
.global	config_set_defaults
	.type	config_set_defaults, @function
config_set_defaults:
	.stabs	"src/ds_config.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,224,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,226,.LM17-.LFBB4
.LM17:
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call f_unlink
	.stabn	68,0,228,.LM18-.LFBB4
.LM18:
	call soft_reset
	.size	config_set_defaults, .-config_set_defaults
.Lscope4:
	.section	.rodata.str1.1
.LC1:
	.string	" OFF"
.LC2:
	.string	"  On"
	.text
	.stabs	"power_off_cycle:F(0,1)",36,0,0,power_off_cycle
.global	power_off_cycle
	.type	power_off_cycle, @function
power_off_cycle:
	.stabn	68,0,257,.LM19-.LFBB5
.LM19:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,258,.LM20-.LFBB5
.LM20:
	sbi 0x1d,0
	.stabn	68,0,260,.LM21-.LFBB5
.LM21:
	call rtc_hide
	.stabn	68,0,261,.LM22-.LFBB5
.LM22:
	ldi r22,lo8(-56)
	ldi r23,0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call disp_msg
	.stabn	68,0,262,.LM23-.LFBB5
.LM23:
	call disp_clear
	.stabn	68,0,263,.LM24-.LFBB5
.LM24:
	call disp_off
	.stabn	68,0,264,.LM25-.LFBB5
.LM25:
	call batmon_stop
	.stabn	68,0,265,.LM26-.LFBB5
.LM26:
	call adc_disable
	.stabn	68,0,267,.LM27-.LFBB5
.LM27:
	in r24,0x33
	andi r24,lo8(-15)
	ori r24,lo8(4)
	out 0x33,r24
	.stabn	68,0,268,.LM28-.LFBB5
.LM28:
	in r24,0x33
	ori r24,lo8(1)
	out 0x33,r24
	.stabn	68,0,269,.LM29-.LFBB5
.LM29:
	in r24,0x33
	ori r24,lo8(1)
	out 0x33,r24
/* #APP */
 ;  269 "src/ds_config.c" 1
	sleep
	
 ;  0 "" 2
/* #NOAPP */
	in r24,0x33
	andi r24,lo8(-2)
	out 0x33,r24
	.stabn	68,0,273,.LM30-.LFBB5
.LM30:
	in r24,0x33
	andi r24,lo8(-2)
	out 0x33,r24
	.stabn	68,0,275,.LM31-.LFBB5
.LM31:
	cbi 0x1d,0
	.stabn	68,0,277,.LM32-.LFBB5
.LM32:
	call adc_enable
	.stabn	68,0,278,.LM33-.LFBB5
.LM33:
	call batmon_start
	.stabn	68,0,279,.LM34-.LFBB5
.LM34:
	call disp_on
	.stabn	68,0,280,.LM35-.LFBB5
.LM35:
	ldi r22,lo8(-56)
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call disp_msg
	.stabn	68,0,282,.LM36-.LFBB5
.LM36:
	call soft_reset
	.size	power_off_cycle, .-power_off_cycle
.Lscope5:
	.stabs	"fw_version:F(0,5)=(0,6)=r(0,6);0;65535;",36,0,0,fw_version
	.stabs	"uint16_t:t(0,5)",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
.global	fw_version
	.type	fw_version, @function
fw_version:
	.stabn	68,0,286,.LM37-.LFBB6
.LM37:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB285:
	.stabn	68,0,287,.LM38-.LFBB6
.LM38:
	ldi r30,lo8(u_FirmwareVersion)
	ldi r31,hi8(u_FirmwareVersion)
/* #APP */
 ;  287 "src/ds_config.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE285:
	.stabn	68,0,288,.LM39-.LFBB6
.LM39:
	ret
	.size	fw_version, .-fw_version
.Lscope6:
	.stabs	"set_duplex_mode:F(0,1)",36,0,0,set_duplex_mode
	.stabs	"val:P(0,7)=(0,3)",64,0,0,24
	.stabs	"duplex_mode_t:t(0,7)",128,0,0,0
.global	set_duplex_mode
	.type	set_duplex_mode, @function
set_duplex_mode:
	.stabn	68,0,370,.LM40-.LFBB7
.LM40:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,371,.LM41-.LFBB7
.LM41:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(3)
	brsh .L12
	.stabn	68,0,372,.LM42-.LFBB7
.LM42:
	sts cfg+7,r24
.L12:
/* epilogue start */
	.stabn	68,0,373,.LM43-.LFBB7
.LM43:
	ret
	.size	set_duplex_mode, .-set_duplex_mode
.Lscope7:
	.stabs	"set_default_duplex_mode:F(0,1)",36,0,0,set_default_duplex_mode
.global	set_default_duplex_mode
	.type	set_default_duplex_mode, @function
set_default_duplex_mode:
	.stabn	68,0,376,.LM44-.LFBB8
.LM44:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB288:
.LBB289:
	.stabn	68,0,389,.LM45-.LFBB8
.LM45:
	sts cfg+7,__zero_reg__
/* epilogue start */
.LBE289:
.LBE288:
	.stabn	68,0,385,.LM46-.LFBB8
.LM46:
	ret
	.size	set_default_duplex_mode, .-set_default_duplex_mode
.Lscope8:
.global	set_invalid_duplex_mode
	.type	set_invalid_duplex_mode, @function
set_invalid_duplex_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts cfg+7,__zero_reg__
/* epilogue start */
	ret
	.size	set_invalid_duplex_mode, .-set_invalid_duplex_mode
	.stabs	"set_wakeup_mode:F(0,1)",36,0,0,set_wakeup_mode
	.stabs	"val:P(0,2)",64,0,0,24
.global	set_wakeup_mode
	.type	set_wakeup_mode, @function
set_wakeup_mode:
	.stabn	68,0,393,.LM47-.LFBB9
.LM47:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,394,.LM48-.LFBB9
.LM48:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(3)
	brsh .L16
	jmp set_wakeup_mode.part.0
.L16:
/* epilogue start */
	.stabn	68,0,434,.LM49-.LFBB9
.LM49:
	ret
	.size	set_wakeup_mode, .-set_wakeup_mode
.Lscope9:
	.stabs	"set_default_wakeup_mode:F(0,1)",36,0,0,set_default_wakeup_mode
.global	set_default_wakeup_mode
	.type	set_default_wakeup_mode, @function
set_default_wakeup_mode:
	.stabn	68,0,437,.LM50-.LFBB10
.LM50:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB292:
.LBB293:
	ldi r24,lo8(2)
	jmp set_wakeup_mode.part.0
.LBE293:
.LBE292:
	.size	set_default_wakeup_mode, .-set_default_wakeup_mode
.Lscope10:
	.stabs	"config_init:F(0,1)",36,0,0,config_init
.global	config_init
	.type	config_init, @function
config_init:
	.stabn	68,0,216,.LM51-.LFBB11
.LM51:
.LFBB11:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LBB355:
.LBB356:
	.stabn	68,0,356,.LM52-.LFBB11
.LM52:
	ldi r20,lo8(1)
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r24,lo8(shared_fp)
	ldi r25,hi8(shared_fp)
	call f_open
	.stabn	68,0,356,.LM53-.LFBB11
.LM53:
	or r24,r25
	breq .L20
.LBE356:
.LBE355:
.LBB359:
.LBB360:
.LBB361:
.LBB362:
	.stabn	68,0,465,.LM54-.LFBB11
.LM54:
	lds r24,cfg
	andi r24,lo8(-32)
	ori r24,lo8(8)
	sts cfg,r24
.LBE362:
.LBE361:
.LBB363:
.LBB364:
.LBB365:
	.stabn	68,0,471,.LM55-.LFBB11
.LM55:
	sts cfg+3,__zero_reg__
.LBE365:
.LBE364:
.LBE363:
.LBB366:
.LBB367:
.LBB368:
	.stabn	68,0,472,.LM56-.LFBB11
.LM56:
	sts cfg+4,__zero_reg__
.LBE368:
.LBE367:
.LBE366:
.LBB369:
.LBB370:
.LBB371:
	.stabn	68,0,474,.LM57-.LFBB11
.LM57:
	ldi r28,lo8(3)
	sts cfg+5,r28
.LBE371:
.LBE370:
.LBE369:
.LBB372:
.LBB373:
.LBB374:
	.stabn	68,0,475,.LM58-.LFBB11
.LM58:
	ldi r29,lo8(4)
	sts cfg+6,r29
.LBE374:
.LBE373:
.LBE372:
.LBB375:
.LBB376:
.LBB377:
	.stabn	68,0,389,.LM59-.LFBB11
.LM59:
	sts cfg+7,__zero_reg__
.LBE377:
.LBE376:
.LBE375:
	.stabn	68,0,205,.LM60-.LFBB11
.LM60:
	call set_default_wakeup_mode
.LBB378:
.LBB379:
.LBB380:
	.stabn	68,0,473,.LM61-.LFBB11
.LM61:
	ldi r24,lo8(5)
	sts cfg+9,r24
.LBE380:
.LBE379:
.LBE378:
.LBB381:
.LBB382:
.LBB383:
	.stabn	68,0,478,.LM62-.LFBB11
.LM62:
	ldi r24,lo8(2)
	sts cfg+10,r24
.LBE383:
.LBE382:
.LBE381:
.LBB384:
.LBB385:
.LBB386:
	.stabn	68,0,479,.LM63-.LFBB11
.LM63:
	sts cfg+11,r29
.LBE386:
.LBE385:
.LBE384:
.LBB387:
.LBB388:
.LBB389:
	.stabn	68,0,480,.LM64-.LFBB11
.LM64:
	sts cfg+12,r28
.LBE389:
.LBE388:
.LBE387:
.LBB390:
.LBB391:
.LBB392:
	.stabn	68,0,481,.LM65-.LFBB11
.LM65:
	sts cfg+13,r28
.LBE392:
.LBE391:
.LBE390:
.LBB393:
.LBB394:
.LBB395:
	.stabn	68,0,482,.LM66-.LFBB11
.LM66:
	ldi r24,lo8(7)
	sts cfg+14,r24
.LBE395:
.LBE394:
.LBE393:
.LBB396:
.LBB397:
.LBB398:
	.stabn	68,0,483,.LM67-.LFBB11
.LM67:
	sts cfg+15,r24
/* epilogue start */
.LBE398:
.LBE397:
.LBE396:
.LBE360:
.LBE359:
	.stabn	68,0,221,.LM68-.LFBB11
.LM68:
	pop r29
	pop r28
	ret
.L20:
.LBB399:
.LBB357:
	.stabn	68,0,359,.LM69-.LFBB11
.LM69:
	ldi r18,lo8(brw)
	ldi r19,hi8(brw)
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(cfg)
	ldi r23,hi8(cfg)
	ldi r24,lo8(shared_fp)
	ldi r25,hi8(shared_fp)
	call f_read
	.stabn	68,0,360,.LM70-.LFBB11
.LM70:
	ldi r24,lo8(shared_fp)
	ldi r25,hi8(shared_fp)
/* epilogue start */
.LBE357:
.LBE399:
	.stabn	68,0,221,.LM71-.LFBB11
.LM71:
	pop r29
	pop r28
.LBB400:
.LBB358:
	.stabn	68,0,360,.LM72-.LFBB11
.LM72:
	jmp f_close
.LBE358:
.LBE400:
	.size	config_init, .-config_init
.Lscope11:
	.stabs	"set_invalid_wakeup_mode:F(0,1)",36,0,0,set_invalid_wakeup_mode
.global	set_invalid_wakeup_mode
	.type	set_invalid_wakeup_mode, @function
set_invalid_wakeup_mode:
	.stabn	68,0,449,.LM73-.LFBB12
.LM73:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,450,.LM74-.LFBB12
.LM74:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	std Z+8,__zero_reg__
.LBB401:
.LBB402:
	.stabn	68,0,478,.LM75-.LFBB12
.LM75:
	ldd r24,Z+17
	andi r24,lo8(-64)
	std Z+17,r24
/* epilogue start */
.LBE402:
.LBE401:
	.stabn	68,0,459,.LM76-.LFBB12
.LM76:
	ret
	.size	set_invalid_wakeup_mode, .-set_invalid_wakeup_mode
.Lscope12:
	.stabs	"get_before_hints_message:F(0,8)=eFalse:0,True:1,;",36,0,0,get_before_hints_message
	.stabs	"_Bool:t(0,8)",128,0,0,0
.global	get_before_hints_message
	.type	get_before_hints_message, @function
get_before_hints_message:
	.stabn	68,0,465,.LM77-.LFBB13
.LM77:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,465,.LM78-.LFBB13
.LM78:
	lds r24,cfg
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	get_before_hints_message, .-get_before_hints_message
.Lscope13:
	.stabs	"set_before_hints_message:F(0,1)",36,0,0,set_before_hints_message
	.stabs	"new_val:P(0,8)",64,0,0,24
.global	set_before_hints_message
	.type	set_before_hints_message, @function
set_before_hints_message:
	.stabn	68,0,465,.LM79-.LFBB14
.LM79:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,465,.LM80-.LFBB14
.LM80:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r25,Z
	bst r24,0
	bld r25,0
	st Z,r25
/* epilogue start */
	ret
	.size	set_before_hints_message, .-set_before_hints_message
.Lscope14:
	.stabs	"toggle_before_hints_message:F(0,1)",36,0,0,toggle_before_hints_message
.global	toggle_before_hints_message
	.type	toggle_before_hints_message, @function
toggle_before_hints_message:
	.stabn	68,0,465,.LM81-.LFBB15
.LM81:
.LFBB15:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB403:
.LBB404:
	.stabn	68,0,465,.LM82-.LFBB15
.LM82:
	lds r24,cfg
.LBE404:
.LBE403:
	com r24
	andi r24,lo8(1)
	jmp set_before_hints_message
	.size	toggle_before_hints_message, .-toggle_before_hints_message
.Lscope15:
	.stabs	"set_default_before_hints_message:F(0,1)",36,0,0,set_default_before_hints_message
.global	set_default_before_hints_message
	.type	set_default_before_hints_message, @function
set_default_before_hints_message:
	.stabn	68,0,465,.LM83-.LFBB16
.LM83:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,465,.LM84-.LFBB16
.LM84:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r24,Z
	andi r24,lo8(~(1<<0))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_before_hints_message, .-set_default_before_hints_message
.Lscope16:
	.stabs	"get_after_hints_message:F(0,8)",36,0,0,get_after_hints_message
.global	get_after_hints_message
	.type	get_after_hints_message, @function
get_after_hints_message:
	.stabn	68,0,466,.LM85-.LFBB17
.LM85:
.LFBB17:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,466,.LM86-.LFBB17
.LM86:
	lds r24,cfg
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	get_after_hints_message, .-get_after_hints_message
.Lscope17:
	.stabs	"set_after_hints_message:F(0,1)",36,0,0,set_after_hints_message
	.stabs	"new_val:P(0,8)",64,0,0,24
.global	set_after_hints_message
	.type	set_after_hints_message, @function
set_after_hints_message:
	.stabn	68,0,466,.LM87-.LFBB18
.LM87:
.LFBB18:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,466,.LM88-.LFBB18
.LM88:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r25,Z
	bst r24,0
	bld r25,1
	st Z,r25
/* epilogue start */
	ret
	.size	set_after_hints_message, .-set_after_hints_message
.Lscope18:
	.stabs	"toggle_after_hints_message:F(0,1)",36,0,0,toggle_after_hints_message
.global	toggle_after_hints_message
	.type	toggle_after_hints_message, @function
toggle_after_hints_message:
	.stabn	68,0,466,.LM89-.LFBB19
.LM89:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,466,.LM90-.LFBB19
.LM90:
	call get_after_hints_message
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_after_hints_message
	.size	toggle_after_hints_message, .-toggle_after_hints_message
.Lscope19:
	.stabs	"set_default_after_hints_message:F(0,1)",36,0,0,set_default_after_hints_message
.global	set_default_after_hints_message
	.type	set_default_after_hints_message, @function
set_default_after_hints_message:
	.stabn	68,0,466,.LM91-.LFBB20
.LM91:
.LFBB20:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,466,.LM92-.LFBB20
.LM92:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r24,Z
	andi r24,lo8(~(1<<1))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_after_hints_message, .-set_default_after_hints_message
.Lscope20:
	.stabs	"get_voice_recording:F(0,8)",36,0,0,get_voice_recording
.global	get_voice_recording
	.type	get_voice_recording, @function
get_voice_recording:
	.stabn	68,0,467,.LM93-.LFBB21
.LM93:
.LFBB21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,467,.LM94-.LFBB21
.LM94:
	lds r24,cfg
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	get_voice_recording, .-get_voice_recording
.Lscope21:
	.stabs	"set_voice_recording:F(0,1)",36,0,0,set_voice_recording
	.stabs	"new_val:P(0,8)",64,0,0,24
.global	set_voice_recording
	.type	set_voice_recording, @function
set_voice_recording:
	.stabn	68,0,467,.LM95-.LFBB22
.LM95:
.LFBB22:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,467,.LM96-.LFBB22
.LM96:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r25,Z
	bst r24,0
	bld r25,2
	st Z,r25
/* epilogue start */
	ret
	.size	set_voice_recording, .-set_voice_recording
.Lscope22:
	.stabs	"toggle_voice_recording:F(0,1)",36,0,0,toggle_voice_recording
.global	toggle_voice_recording
	.type	toggle_voice_recording, @function
toggle_voice_recording:
	.stabn	68,0,467,.LM97-.LFBB23
.LM97:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,467,.LM98-.LFBB23
.LM98:
	call get_voice_recording
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_voice_recording
	.size	toggle_voice_recording, .-toggle_voice_recording
.Lscope23:
	.stabs	"set_default_voice_recording:F(0,1)",36,0,0,set_default_voice_recording
.global	set_default_voice_recording
	.type	set_default_voice_recording, @function
set_default_voice_recording:
	.stabn	68,0,467,.LM99-.LFBB24
.LM99:
.LFBB24:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,467,.LM100-.LFBB24
.LM100:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r24,Z
	andi r24,lo8(~(1<<2))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_voice_recording, .-set_default_voice_recording
.Lscope24:
	.stabs	"get_speaker_enabled:F(0,8)",36,0,0,get_speaker_enabled
.global	get_speaker_enabled
	.type	get_speaker_enabled, @function
get_speaker_enabled:
	.stabn	68,0,468,.LM101-.LFBB25
.LM101:
.LFBB25:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,468,.LM102-.LFBB25
.LM102:
	lds r24,cfg
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	get_speaker_enabled, .-get_speaker_enabled
.Lscope25:
	.stabs	"set_speaker_enabled:F(0,1)",36,0,0,set_speaker_enabled
	.stabs	"new_val:P(0,8)",64,0,0,24
.global	set_speaker_enabled
	.type	set_speaker_enabled, @function
set_speaker_enabled:
	.stabn	68,0,468,.LM103-.LFBB26
.LM103:
.LFBB26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,468,.LM104-.LFBB26
.LM104:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r25,Z
	bst r24,0
	bld r25,3
	st Z,r25
/* epilogue start */
	ret
	.size	set_speaker_enabled, .-set_speaker_enabled
.Lscope26:
	.stabs	"toggle_speaker_enabled:F(0,1)",36,0,0,toggle_speaker_enabled
.global	toggle_speaker_enabled
	.type	toggle_speaker_enabled, @function
toggle_speaker_enabled:
	.stabn	68,0,468,.LM105-.LFBB27
.LM105:
.LFBB27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,468,.LM106-.LFBB27
.LM106:
	call get_speaker_enabled
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_speaker_enabled
	.size	toggle_speaker_enabled, .-toggle_speaker_enabled
.Lscope27:
	.stabs	"set_default_speaker_enabled:F(0,1)",36,0,0,set_default_speaker_enabled
.global	set_default_speaker_enabled
	.type	set_default_speaker_enabled, @function
set_default_speaker_enabled:
	.stabn	68,0,468,.LM107-.LFBB28
.LM107:
.LFBB28:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,468,.LM108-.LFBB28
.LM108:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r24,Z
	ori r24,lo8(1<<3)
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_speaker_enabled, .-set_default_speaker_enabled
.Lscope28:
	.stabs	"get_alarm_clock:F(0,8)",36,0,0,get_alarm_clock
.global	get_alarm_clock
	.type	get_alarm_clock, @function
get_alarm_clock:
	.stabn	68,0,469,.LM109-.LFBB29
.LM109:
.LFBB29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,469,.LM110-.LFBB29
.LM110:
	lds r24,cfg
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	get_alarm_clock, .-get_alarm_clock
.Lscope29:
	.stabs	"set_alarm_clock:F(0,1)",36,0,0,set_alarm_clock
	.stabs	"new_val:P(0,8)",64,0,0,24
.global	set_alarm_clock
	.type	set_alarm_clock, @function
set_alarm_clock:
	.stabn	68,0,469,.LM111-.LFBB30
.LM111:
.LFBB30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,469,.LM112-.LFBB30
.LM112:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r25,Z
	bst r24,0
	bld r25,4
	st Z,r25
/* epilogue start */
	ret
	.size	set_alarm_clock, .-set_alarm_clock
.Lscope30:
	.stabs	"toggle_alarm_clock:F(0,1)",36,0,0,toggle_alarm_clock
.global	toggle_alarm_clock
	.type	toggle_alarm_clock, @function
toggle_alarm_clock:
	.stabn	68,0,469,.LM113-.LFBB31
.LM113:
.LFBB31:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,469,.LM114-.LFBB31
.LM114:
	call get_alarm_clock
	ldi r25,lo8(1)
	eor r24,r25
	jmp set_alarm_clock
	.size	toggle_alarm_clock, .-toggle_alarm_clock
.Lscope31:
	.stabs	"set_default_alarm_clock:F(0,1)",36,0,0,set_default_alarm_clock
.global	set_default_alarm_clock
	.type	set_default_alarm_clock, @function
set_default_alarm_clock:
	.stabn	68,0,469,.LM115-.LFBB32
.LM115:
.LFBB32:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,469,.LM116-.LFBB32
.LM116:
	ldi r30,lo8(cfg)
	ldi r31,hi8(cfg)
	ld r24,Z
	andi r24,lo8(~(1<<4))
	st Z,r24
/* epilogue start */
	ret
	.size	set_default_alarm_clock, .-set_default_alarm_clock
.Lscope32:
	.stabs	"get_wakeup_timer_delay:F(0,9)=(0,5)",36,0,0,get_wakeup_timer_delay
	.stabs	"wakeup_timer_delay_t:t(0,9)",128,0,0,0
.global	get_wakeup_timer_delay
	.type	get_wakeup_timer_delay, @function
get_wakeup_timer_delay:
	.stabn	68,0,470,.LM117-.LFBB33
.LM117:
.LFBB33:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM118-.LFBB33
.LM118:
	lds r24,cfg+1
	lds r25,cfg+1+1
/* epilogue start */
	ret
	.size	get_wakeup_timer_delay, .-get_wakeup_timer_delay
.Lscope33:
	.stabs	"min_wakeup_timer_delay:F(0,9)",36,0,0,min_wakeup_timer_delay
.global	min_wakeup_timer_delay
	.type	min_wakeup_timer_delay, @function
min_wakeup_timer_delay:
	.stabn	68,0,470,.LM119-.LFBB34
.LM119:
.LFBB34:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM120-.LFBB34
.LM120:
	ldi r24,lo8(3)
	ldi r25,0
/* epilogue start */
	ret
	.size	min_wakeup_timer_delay, .-min_wakeup_timer_delay
.Lscope34:
	.stabs	"max_wakeup_timer_delay:F(0,9)",36,0,0,max_wakeup_timer_delay
.global	max_wakeup_timer_delay
	.type	max_wakeup_timer_delay, @function
max_wakeup_timer_delay:
	.stabn	68,0,470,.LM121-.LFBB35
.LM121:
.LFBB35:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM122-.LFBB35
.LM122:
	ldi r24,lo8(-16)
	ldi r25,0
/* epilogue start */
	ret
	.size	max_wakeup_timer_delay, .-max_wakeup_timer_delay
.Lscope35:
	.stabs	"step_wakeup_timer_delay:F(0,9)",36,0,0,step_wakeup_timer_delay
.global	step_wakeup_timer_delay
	.type	step_wakeup_timer_delay, @function
step_wakeup_timer_delay:
	.stabn	68,0,470,.LM123-.LFBB36
.LM123:
.LFBB36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM124-.LFBB36
.LM124:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	step_wakeup_timer_delay, .-step_wakeup_timer_delay
.Lscope36:
	.stabs	"get_default_wakeup_timer_delay:F(0,9)",36,0,0,get_default_wakeup_timer_delay
.global	get_default_wakeup_timer_delay
	.type	get_default_wakeup_timer_delay, @function
get_default_wakeup_timer_delay:
	.stabn	68,0,470,.LM125-.LFBB37
.LM125:
.LFBB37:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM126-.LFBB37
.LM126:
	ldi r24,lo8(-46)
	ldi r25,0
/* epilogue start */
	ret
	.size	get_default_wakeup_timer_delay, .-get_default_wakeup_timer_delay
.Lscope37:
	.stabs	"is_readonly_wakeup_timer_delay:F(0,8)",36,0,0,is_readonly_wakeup_timer_delay
.global	is_readonly_wakeup_timer_delay
	.type	is_readonly_wakeup_timer_delay, @function
is_readonly_wakeup_timer_delay:
	.stabn	68,0,470,.LM127-.LFBB38
.LM127:
.LFBB38:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM128-.LFBB38
.LM128:
	lds r24,cfg+16
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	is_readonly_wakeup_timer_delay, .-is_readonly_wakeup_timer_delay
.Lscope38:
	.stabs	"set_readonly_wakeup_timer_delay:F(0,1)",36,0,0,set_readonly_wakeup_timer_delay
.global	set_readonly_wakeup_timer_delay
	.type	set_readonly_wakeup_timer_delay, @function
set_readonly_wakeup_timer_delay:
	.stabn	68,0,470,.LM129-.LFBB39
.LM129:
.LFBB39:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM130-.LFBB39
.LM130:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,0
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_wakeup_timer_delay, .-set_readonly_wakeup_timer_delay
.Lscope39:
	.stabs	"set_wakeup_timer_delay:F(0,1)",36,0,0,set_wakeup_timer_delay
	.stabs	"val:P(0,9)",64,0,0,18
.global	set_wakeup_timer_delay
	.type	set_wakeup_timer_delay, @function
set_wakeup_timer_delay:
	.stabn	68,0,470,.LM131-.LFBB40
.LM131:
.LFBB40:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,470,.LM132-.LFBB40
.LM132:
	sbiw r24,3
	cpi r24,-18
	cpc r25,__zero_reg__
	brsh .L51
	.stabn	68,0,470,.LM133-.LFBB40
.LM133:
	sts cfg+1+1,r19
	sts cfg+1,r18
.L51:
/* epilogue start */
	.stabn	68,0,470,.LM134-.LFBB40
.LM134:
	ret
	.size	set_wakeup_timer_delay, .-set_wakeup_timer_delay
.Lscope40:
	.stabs	"set_default_wakeup_timer_delay:F(0,1)",36,0,0,set_default_wakeup_timer_delay
.global	set_default_wakeup_timer_delay
	.type	set_default_wakeup_timer_delay, @function
set_default_wakeup_timer_delay:
	.stabn	68,0,470,.LM135-.LFBB41
.LM135:
.LFBB41:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB407:
.LBB408:
	.stabn	68,0,470,.LM136-.LFBB41
.LM136:
	ldi r24,lo8(-46)
	ldi r25,0
	sts cfg+1+1,r25
	sts cfg+1,r24
/* epilogue start */
.LBE408:
.LBE407:
	ret
	.size	set_default_wakeup_timer_delay, .-set_default_wakeup_timer_delay
.Lscope41:
	.stabs	"set_invalid_wakeup_timer_delay:F(0,1)",36,0,0,set_invalid_wakeup_timer_delay
.global	set_invalid_wakeup_timer_delay
	.type	set_invalid_wakeup_timer_delay, @function
set_invalid_wakeup_timer_delay:
	.stabn	68,0,470,.LM137-.LFBB42
.LM137:
.LFBB42:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM138-.LFBB42
.LM138:
	sts cfg+1+1,__zero_reg__
	sts cfg+1,__zero_reg__
/* epilogue start */
	ret
	.size	set_invalid_wakeup_timer_delay, .-set_invalid_wakeup_timer_delay
.Lscope42:
	.stabs	"get_invalid_wakeup_timer_delay:F(0,9)",36,0,0,get_invalid_wakeup_timer_delay
.global	get_invalid_wakeup_timer_delay
	.type	get_invalid_wakeup_timer_delay, @function
get_invalid_wakeup_timer_delay:
	.stabn	68,0,470,.LM139-.LFBB43
.LM139:
.LFBB43:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM140-.LFBB43
.LM140:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	get_invalid_wakeup_timer_delay, .-get_invalid_wakeup_timer_delay
.Lscope43:
	.stabs	"is_invalid_wakeup_timer_delay:F(0,8)",36,0,0,is_invalid_wakeup_timer_delay
.global	is_invalid_wakeup_timer_delay
	.type	is_invalid_wakeup_timer_delay, @function
is_invalid_wakeup_timer_delay:
	.stabn	68,0,470,.LM141-.LFBB44
.LM141:
.LFBB44:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,470,.LM142-.LFBB44
.LM142:
	ldi r24,lo8(1)
	lds r18,cfg+1
	lds r19,cfg+1+1
	or r18,r19
	breq .L57
	ldi r24,0
.L57:
/* epilogue start */
	ret
	.size	is_invalid_wakeup_timer_delay, .-is_invalid_wakeup_timer_delay
.Lscope44:
	.stabs	"get_sleep_scenario_playback:F(0,10)=(0,3)",36,0,0,get_sleep_scenario_playback
	.stabs	"sleep_scenario_playback_t:t(0,10)",128,0,0,0
.global	get_sleep_scenario_playback
	.type	get_sleep_scenario_playback, @function
get_sleep_scenario_playback:
	.stabn	68,0,471,.LM143-.LFBB45
.LM143:
.LFBB45:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM144-.LFBB45
.LM144:
	lds r24,cfg+3
/* epilogue start */
	ret
	.size	get_sleep_scenario_playback, .-get_sleep_scenario_playback
.Lscope45:
	.stabs	"min_sleep_scenario_playback:F(0,10)",36,0,0,min_sleep_scenario_playback
.global	min_sleep_scenario_playback
	.type	min_sleep_scenario_playback, @function
min_sleep_scenario_playback:
	.stabn	68,0,471,.LM145-.LFBB46
.LM145:
.LFBB46:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM146-.LFBB46
.LM146:
	ldi r24,0
/* epilogue start */
	ret
	.size	min_sleep_scenario_playback, .-min_sleep_scenario_playback
.Lscope46:
	.stabs	"max_sleep_scenario_playback:F(0,10)",36,0,0,max_sleep_scenario_playback
.global	max_sleep_scenario_playback
	.type	max_sleep_scenario_playback, @function
max_sleep_scenario_playback:
	.stabn	68,0,471,.LM147-.LFBB47
.LM147:
.LFBB47:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM148-.LFBB47
.LM148:
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_sleep_scenario_playback, .-max_sleep_scenario_playback
.Lscope47:
	.stabs	"step_sleep_scenario_playback:F(0,10)",36,0,0,step_sleep_scenario_playback
.global	step_sleep_scenario_playback
	.type	step_sleep_scenario_playback, @function
step_sleep_scenario_playback:
	.stabn	68,0,471,.LM149-.LFBB48
.LM149:
.LFBB48:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM150-.LFBB48
.LM150:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_sleep_scenario_playback, .-step_sleep_scenario_playback
.Lscope48:
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
	.stabs	"is_readonly_sleep_scenario_playback:F(0,8)",36,0,0,is_readonly_sleep_scenario_playback
.global	is_readonly_sleep_scenario_playback
	.type	is_readonly_sleep_scenario_playback, @function
is_readonly_sleep_scenario_playback:
	.stabn	68,0,471,.LM151-.LFBB49
.LM151:
.LFBB49:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM152-.LFBB49
.LM152:
	lds r24,cfg+16
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_sleep_scenario_playback, .-is_readonly_sleep_scenario_playback
.Lscope49:
	.stabs	"set_readonly_sleep_scenario_playback:F(0,1)",36,0,0,set_readonly_sleep_scenario_playback
.global	set_readonly_sleep_scenario_playback
	.type	set_readonly_sleep_scenario_playback, @function
set_readonly_sleep_scenario_playback:
	.stabn	68,0,471,.LM153-.LFBB50
.LM153:
.LFBB50:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM154-.LFBB50
.LM154:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,1
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_sleep_scenario_playback, .-set_readonly_sleep_scenario_playback
.Lscope50:
	.stabs	"set_sleep_scenario_playback:F(0,1)",36,0,0,set_sleep_scenario_playback
	.stabs	"val:P(0,10)",64,0,0,24
.global	set_sleep_scenario_playback
	.type	set_sleep_scenario_playback, @function
set_sleep_scenario_playback:
	.stabn	68,0,471,.LM155-.LFBB51
.LM155:
.LFBB51:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,471,.LM156-.LFBB51
.LM156:
	cpi r24,lo8(10)
	brsh .L68
	.stabn	68,0,471,.LM157-.LFBB51
.LM157:
	sts cfg+3,r24
.L68:
/* epilogue start */
	.stabn	68,0,471,.LM158-.LFBB51
.LM158:
	ret
	.size	set_sleep_scenario_playback, .-set_sleep_scenario_playback
.Lscope51:
	.stabs	"set_default_sleep_scenario_playback:F(0,1)",36,0,0,set_default_sleep_scenario_playback
.global	set_default_sleep_scenario_playback
	.type	set_default_sleep_scenario_playback, @function
set_default_sleep_scenario_playback:
	.stabn	68,0,471,.LM159-.LFBB52
.LM159:
.LFBB52:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB411:
.LBB412:
	.stabn	68,0,471,.LM160-.LFBB52
.LM160:
	sts cfg+3,__zero_reg__
/* epilogue start */
.LBE412:
.LBE411:
	ret
	.size	set_default_sleep_scenario_playback, .-set_default_sleep_scenario_playback
.Lscope52:
	.stabs	"get_relax_tunes_playback:F(0,11)=(0,3)",36,0,0,get_relax_tunes_playback
	.stabs	"relax_tunes_playback_t:t(0,11)",128,0,0,0
.global	get_relax_tunes_playback
	.type	get_relax_tunes_playback, @function
get_relax_tunes_playback:
	.stabn	68,0,472,.LM161-.LFBB53
.LM161:
.LFBB53:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,472,.LM162-.LFBB53
.LM162:
	lds r24,cfg+4
/* epilogue start */
	ret
	.size	get_relax_tunes_playback, .-get_relax_tunes_playback
.Lscope53:
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
	.stabs	"is_readonly_relax_tunes_playback:F(0,8)",36,0,0,is_readonly_relax_tunes_playback
.global	is_readonly_relax_tunes_playback
	.type	is_readonly_relax_tunes_playback, @function
is_readonly_relax_tunes_playback:
	.stabn	68,0,472,.LM163-.LFBB54
.LM163:
.LFBB54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,472,.LM164-.LFBB54
.LM164:
	lds r24,cfg+16
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_relax_tunes_playback, .-is_readonly_relax_tunes_playback
.Lscope54:
	.stabs	"set_readonly_relax_tunes_playback:F(0,1)",36,0,0,set_readonly_relax_tunes_playback
.global	set_readonly_relax_tunes_playback
	.type	set_readonly_relax_tunes_playback, @function
set_readonly_relax_tunes_playback:
	.stabn	68,0,472,.LM165-.LFBB55
.LM165:
.LFBB55:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,472,.LM166-.LFBB55
.LM166:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,2
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_relax_tunes_playback, .-set_readonly_relax_tunes_playback
.Lscope55:
	.stabs	"set_relax_tunes_playback:F(0,1)",36,0,0,set_relax_tunes_playback
	.stabs	"val:P(0,11)",64,0,0,24
.global	set_relax_tunes_playback
	.type	set_relax_tunes_playback, @function
set_relax_tunes_playback:
	.stabn	68,0,472,.LM167-.LFBB56
.LM167:
.LFBB56:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,472,.LM168-.LFBB56
.LM168:
	cpi r24,lo8(10)
	brsh .L78
	.stabn	68,0,472,.LM169-.LFBB56
.LM169:
	sts cfg+4,r24
.L78:
/* epilogue start */
	.stabn	68,0,472,.LM170-.LFBB56
.LM170:
	ret
	.size	set_relax_tunes_playback, .-set_relax_tunes_playback
.Lscope56:
	.stabs	"set_default_relax_tunes_playback:F(0,1)",36,0,0,set_default_relax_tunes_playback
.global	set_default_relax_tunes_playback
	.type	set_default_relax_tunes_playback, @function
set_default_relax_tunes_playback:
	.stabn	68,0,472,.LM171-.LFBB57
.LM171:
.LFBB57:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB415:
.LBB416:
	.stabn	68,0,472,.LM172-.LFBB57
.LM172:
	sts cfg+4,__zero_reg__
/* epilogue start */
.LBE416:
.LBE415:
	ret
	.size	set_default_relax_tunes_playback, .-set_default_relax_tunes_playback
.Lscope57:
	.stabs	"get_vibration_level:F(0,12)=(0,3)",36,0,0,get_vibration_level
	.stabs	"vibration_level_t:t(0,12)",128,0,0,0
.global	get_vibration_level
	.type	get_vibration_level, @function
get_vibration_level:
	.stabn	68,0,473,.LM173-.LFBB58
.LM173:
.LFBB58:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,473,.LM174-.LFBB58
.LM174:
	lds r24,cfg+9
/* epilogue start */
	ret
	.size	get_vibration_level, .-get_vibration_level
.Lscope58:
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
	.stabs	"get_default_vibration_level:F(0,12)",36,0,0,get_default_vibration_level
.global	get_default_vibration_level
	.type	get_default_vibration_level, @function
get_default_vibration_level:
	.stabn	68,0,473,.LM175-.LFBB59
.LM175:
.LFBB59:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,473,.LM176-.LFBB59
.LM176:
	ldi r24,lo8(5)
/* epilogue start */
	ret
	.size	get_default_vibration_level, .-get_default_vibration_level
.Lscope59:
	.stabs	"is_readonly_vibration_level:F(0,8)",36,0,0,is_readonly_vibration_level
.global	is_readonly_vibration_level
	.type	is_readonly_vibration_level, @function
is_readonly_vibration_level:
	.stabn	68,0,473,.LM177-.LFBB60
.LM177:
.LFBB60:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,473,.LM178-.LFBB60
.LM178:
	lds r24,cfg+16
	rol r24
	clr r24
	rol r24
/* epilogue start */
	ret
	.size	is_readonly_vibration_level, .-is_readonly_vibration_level
.Lscope60:
	.stabs	"set_readonly_vibration_level:F(0,1)",36,0,0,set_readonly_vibration_level
.global	set_readonly_vibration_level
	.type	set_readonly_vibration_level, @function
set_readonly_vibration_level:
	.stabn	68,0,473,.LM179-.LFBB61
.LM179:
.LFBB61:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,473,.LM180-.LFBB61
.LM180:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,7
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_vibration_level, .-set_readonly_vibration_level
.Lscope61:
	.stabs	"set_vibration_level:F(0,1)",36,0,0,set_vibration_level
	.stabs	"val:P(0,12)",64,0,0,24
.global	set_vibration_level
	.type	set_vibration_level, @function
set_vibration_level:
	.stabn	68,0,473,.LM181-.LFBB62
.LM181:
.LFBB62:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,473,.LM182-.LFBB62
.LM182:
	cpi r24,lo8(10)
	brsh .L88
	.stabn	68,0,473,.LM183-.LFBB62
.LM183:
	sts cfg+9,r24
.L88:
/* epilogue start */
	.stabn	68,0,473,.LM184-.LFBB62
.LM184:
	ret
	.size	set_vibration_level, .-set_vibration_level
.Lscope62:
	.stabs	"set_default_vibration_level:F(0,1)",36,0,0,set_default_vibration_level
.global	set_default_vibration_level
	.type	set_default_vibration_level, @function
set_default_vibration_level:
	.stabn	68,0,473,.LM185-.LFBB63
.LM185:
.LFBB63:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB419:
.LBB420:
	.stabn	68,0,473,.LM186-.LFBB63
.LM186:
	ldi r24,lo8(5)
	sts cfg+9,r24
/* epilogue start */
.LBE420:
.LBE419:
	ret
	.size	set_default_vibration_level, .-set_default_vibration_level
.Lscope63:
	.stabs	"get_volume_level:F(0,13)=(0,3)",36,0,0,get_volume_level
	.stabs	"volume_level_t:t(0,13)",128,0,0,0
.global	get_volume_level
	.type	get_volume_level, @function
get_volume_level:
	.stabn	68,0,474,.LM187-.LFBB64
.LM187:
.LFBB64:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,474,.LM188-.LFBB64
.LM188:
	lds r24,cfg+5
/* epilogue start */
	ret
	.size	get_volume_level, .-get_volume_level
.Lscope64:
.global	min_volume_level
	.type	min_volume_level, @function
min_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	min_volume_level, .-min_volume_level
.global	max_volume_level
	.type	max_volume_level, @function
max_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(9)
/* epilogue start */
	ret
	.size	max_volume_level, .-max_volume_level
.global	step_volume_level
	.type	step_volume_level, @function
step_volume_level:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_volume_level, .-step_volume_level
	.stabs	"get_default_volume_level:F(0,13)",36,0,0,get_default_volume_level
.global	get_default_volume_level
	.type	get_default_volume_level, @function
get_default_volume_level:
	.stabn	68,0,474,.LM189-.LFBB65
.LM189:
.LFBB65:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,474,.LM190-.LFBB65
.LM190:
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	get_default_volume_level, .-get_default_volume_level
.Lscope65:
	.stabs	"is_readonly_volume_level:F(0,8)",36,0,0,is_readonly_volume_level
.global	is_readonly_volume_level
	.type	is_readonly_volume_level, @function
is_readonly_volume_level:
	.stabn	68,0,474,.LM191-.LFBB66
.LM191:
.LFBB66:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,474,.LM192-.LFBB66
.LM192:
	lds r24,cfg+16
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_volume_level, .-is_readonly_volume_level
.Lscope66:
	.stabs	"set_readonly_volume_level:F(0,1)",36,0,0,set_readonly_volume_level
.global	set_readonly_volume_level
	.type	set_readonly_volume_level, @function
set_readonly_volume_level:
	.stabn	68,0,474,.LM193-.LFBB67
.LM193:
.LFBB67:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,474,.LM194-.LFBB67
.LM194:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,3
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_volume_level, .-set_readonly_volume_level
.Lscope67:
	.stabs	"set_volume_level:F(0,1)",36,0,0,set_volume_level
	.stabs	"val:P(0,13)",64,0,0,24
.global	set_volume_level
	.type	set_volume_level, @function
set_volume_level:
	.stabn	68,0,474,.LM195-.LFBB68
.LM195:
.LFBB68:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,474,.LM196-.LFBB68
.LM196:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L98
	.stabn	68,0,474,.LM197-.LFBB68
.LM197:
	sts cfg+5,r24
.L98:
/* epilogue start */
	.stabn	68,0,474,.LM198-.LFBB68
.LM198:
	ret
	.size	set_volume_level, .-set_volume_level
.Lscope68:
	.stabs	"set_default_volume_level:F(0,1)",36,0,0,set_default_volume_level
.global	set_default_volume_level
	.type	set_default_volume_level, @function
set_default_volume_level:
	.stabn	68,0,474,.LM199-.LFBB69
.LM199:
.LFBB69:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB423:
.LBB424:
	.stabn	68,0,474,.LM200-.LFBB69
.LM200:
	ldi r24,lo8(3)
	sts cfg+5,r24
/* epilogue start */
.LBE424:
.LBE423:
	ret
	.size	set_default_volume_level, .-set_default_volume_level
.Lscope69:
	.stabs	"get_rem_detect_sensitivity:F(0,14)=(0,3)",36,0,0,get_rem_detect_sensitivity
	.stabs	"rem_detect_sensitivity_t:t(0,14)",128,0,0,0
.global	get_rem_detect_sensitivity
	.type	get_rem_detect_sensitivity, @function
get_rem_detect_sensitivity:
	.stabn	68,0,475,.LM201-.LFBB70
.LM201:
.LFBB70:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM202-.LFBB70
.LM202:
	lds r24,cfg+6
/* epilogue start */
	ret
	.size	get_rem_detect_sensitivity, .-get_rem_detect_sensitivity
.Lscope70:
	.stabs	"min_rem_detect_sensitivity:F(0,14)",36,0,0,min_rem_detect_sensitivity
.global	min_rem_detect_sensitivity
	.type	min_rem_detect_sensitivity, @function
min_rem_detect_sensitivity:
	.stabn	68,0,475,.LM203-.LFBB71
.LM203:
.LFBB71:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM204-.LFBB71
.LM204:
	ldi r24,lo8(2)
/* epilogue start */
	ret
	.size	min_rem_detect_sensitivity, .-min_rem_detect_sensitivity
.Lscope71:
	.stabs	"max_rem_detect_sensitivity:F(0,14)",36,0,0,max_rem_detect_sensitivity
.global	max_rem_detect_sensitivity
	.type	max_rem_detect_sensitivity, @function
max_rem_detect_sensitivity:
	.stabn	68,0,475,.LM205-.LFBB72
.LM205:
.LFBB72:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM206-.LFBB72
.LM206:
	ldi r24,lo8(7)
/* epilogue start */
	ret
	.size	max_rem_detect_sensitivity, .-max_rem_detect_sensitivity
.Lscope72:
.global	step_rem_detect_sensitivity
	.type	step_rem_detect_sensitivity, @function
step_rem_detect_sensitivity:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	step_rem_detect_sensitivity, .-step_rem_detect_sensitivity
	.stabs	"get_default_rem_detect_sensitivity:F(0,14)",36,0,0,get_default_rem_detect_sensitivity
.global	get_default_rem_detect_sensitivity
	.type	get_default_rem_detect_sensitivity, @function
get_default_rem_detect_sensitivity:
	.stabn	68,0,475,.LM207-.LFBB73
.LM207:
.LFBB73:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM208-.LFBB73
.LM208:
	ldi r24,lo8(4)
/* epilogue start */
	ret
	.size	get_default_rem_detect_sensitivity, .-get_default_rem_detect_sensitivity
.Lscope73:
	.stabs	"is_readonly_rem_detect_sensitivity:F(0,8)",36,0,0,is_readonly_rem_detect_sensitivity
.global	is_readonly_rem_detect_sensitivity
	.type	is_readonly_rem_detect_sensitivity, @function
is_readonly_rem_detect_sensitivity:
	.stabn	68,0,475,.LM209-.LFBB74
.LM209:
.LFBB74:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM210-.LFBB74
.LM210:
	lds r24,cfg+16
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_rem_detect_sensitivity, .-is_readonly_rem_detect_sensitivity
.Lscope74:
	.stabs	"set_readonly_rem_detect_sensitivity:F(0,1)",36,0,0,set_readonly_rem_detect_sensitivity
.global	set_readonly_rem_detect_sensitivity
	.type	set_readonly_rem_detect_sensitivity, @function
set_readonly_rem_detect_sensitivity:
	.stabn	68,0,475,.LM211-.LFBB75
.LM211:
.LFBB75:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM212-.LFBB75
.LM212:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,4
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_rem_detect_sensitivity, .-set_readonly_rem_detect_sensitivity
.Lscope75:
	.stabs	"set_rem_detect_sensitivity:F(0,1)",36,0,0,set_rem_detect_sensitivity
	.stabs	"val:P(0,14)",64,0,0,24
.global	set_rem_detect_sensitivity
	.type	set_rem_detect_sensitivity, @function
set_rem_detect_sensitivity:
	.stabn	68,0,475,.LM213-.LFBB76
.LM213:
.LFBB76:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,475,.LM214-.LFBB76
.LM214:
	ldi r25,lo8(-2)
	add r25,r24
	cpi r25,lo8(6)
	brsh .L108
	.stabn	68,0,475,.LM215-.LFBB76
.LM215:
	sts cfg+6,r24
.L108:
/* epilogue start */
	.stabn	68,0,475,.LM216-.LFBB76
.LM216:
	ret
	.size	set_rem_detect_sensitivity, .-set_rem_detect_sensitivity
.Lscope76:
	.stabs	"set_default_rem_detect_sensitivity:F(0,1)",36,0,0,set_default_rem_detect_sensitivity
.global	set_default_rem_detect_sensitivity
	.type	set_default_rem_detect_sensitivity, @function
set_default_rem_detect_sensitivity:
	.stabn	68,0,475,.LM217-.LFBB77
.LM217:
.LFBB77:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB427:
.LBB428:
	.stabn	68,0,475,.LM218-.LFBB77
.LM218:
	ldi r24,lo8(4)
	sts cfg+6,r24
/* epilogue start */
.LBE428:
.LBE427:
	ret
	.size	set_default_rem_detect_sensitivity, .-set_default_rem_detect_sensitivity
.Lscope77:
	.stabs	"get_duplex_mode:F(0,7)",36,0,0,get_duplex_mode
.global	get_duplex_mode
	.type	get_duplex_mode, @function
get_duplex_mode:
	.stabn	68,0,476,.LM219-.LFBB78
.LM219:
.LFBB78:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,476,.LM220-.LFBB78
.LM220:
	lds r24,cfg+7
/* epilogue start */
	ret
	.size	get_duplex_mode, .-get_duplex_mode
.Lscope78:
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
	.stabs	"is_readonly_duplex_mode:F(0,8)",36,0,0,is_readonly_duplex_mode
.global	is_readonly_duplex_mode
	.type	is_readonly_duplex_mode, @function
is_readonly_duplex_mode:
	.stabn	68,0,476,.LM221-.LFBB79
.LM221:
.LFBB79:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,476,.LM222-.LFBB79
.LM222:
	lds r24,cfg+16
	bst r24,5
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_duplex_mode, .-is_readonly_duplex_mode
.Lscope79:
	.stabs	"set_readonly_duplex_mode:F(0,1)",36,0,0,set_readonly_duplex_mode
.global	set_readonly_duplex_mode
	.type	set_readonly_duplex_mode, @function
set_readonly_duplex_mode:
	.stabn	68,0,476,.LM223-.LFBB80
.LM223:
.LFBB80:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,476,.LM224-.LFBB80
.LM224:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,5
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_duplex_mode, .-set_readonly_duplex_mode
.Lscope80:
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
	.stabs	"is_invalid_duplex_mode:F(0,8)",36,0,0,is_invalid_duplex_mode
.global	is_invalid_duplex_mode
	.type	is_invalid_duplex_mode, @function
is_invalid_duplex_mode:
	.stabn	68,0,476,.LM225-.LFBB81
.LM225:
.LFBB81:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,476,.LM226-.LFBB81
.LM226:
	ldi r24,lo8(1)
	lds r25,cfg+7
	cpse r25,__zero_reg__
	ldi r24,0
.L120:
/* epilogue start */
	ret
	.size	is_invalid_duplex_mode, .-is_invalid_duplex_mode
.Lscope81:
	.stabs	"get_wakeup_mode:F(0,2)",36,0,0,get_wakeup_mode
.global	get_wakeup_mode
	.type	get_wakeup_mode, @function
get_wakeup_mode:
	.stabn	68,0,477,.LM227-.LFBB82
.LM227:
.LFBB82:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,477,.LM228-.LFBB82
.LM228:
	lds r24,cfg+8
/* epilogue start */
	ret
	.size	get_wakeup_mode, .-get_wakeup_mode
.Lscope82:
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
.global	max_wakeup_mode
	.type	max_wakeup_mode, @function
max_wakeup_mode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
/* epilogue start */
	ret
	.size	max_wakeup_mode, .-max_wakeup_mode
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
	.stabs	"is_readonly_wakeup_mode:F(0,8)",36,0,0,is_readonly_wakeup_mode
.global	is_readonly_wakeup_mode
	.type	is_readonly_wakeup_mode, @function
is_readonly_wakeup_mode:
	.stabn	68,0,477,.LM229-.LFBB83
.LM229:
.LFBB83:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,477,.LM230-.LFBB83
.LM230:
	lds r24,cfg+16
	bst r24,6
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_wakeup_mode, .-is_readonly_wakeup_mode
.Lscope83:
	.stabs	"set_readonly_wakeup_mode:F(0,1)",36,0,0,set_readonly_wakeup_mode
.global	set_readonly_wakeup_mode
	.type	set_readonly_wakeup_mode, @function
set_readonly_wakeup_mode:
	.stabn	68,0,477,.LM231-.LFBB84
.LM231:
.LFBB84:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,477,.LM232-.LFBB84
.LM232:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ld r25,Z
	bst r24,0
	bld r25,6
	st Z,r25
/* epilogue start */
	ret
	.size	set_readonly_wakeup_mode, .-set_readonly_wakeup_mode
.Lscope84:
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
	.stabs	"is_invalid_wakeup_mode:F(0,8)",36,0,0,is_invalid_wakeup_mode
.global	is_invalid_wakeup_mode
	.type	is_invalid_wakeup_mode, @function
is_invalid_wakeup_mode:
	.stabn	68,0,477,.LM233-.LFBB85
.LM233:
.LFBB85:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,477,.LM234-.LFBB85
.LM234:
	ldi r24,lo8(1)
	lds r25,cfg+8
	cpse r25,__zero_reg__
	ldi r24,0
.L133:
/* epilogue start */
	ret
	.size	is_invalid_wakeup_mode, .-is_invalid_wakeup_mode
.Lscope85:
	.stabs	"get_hints_frequency:F(0,15)=(0,3)",36,0,0,get_hints_frequency
	.stabs	"hints_frequency_t:t(0,15)",128,0,0,0
.global	get_hints_frequency
	.type	get_hints_frequency, @function
get_hints_frequency:
	.stabn	68,0,478,.LM235-.LFBB86
.LM235:
.LFBB86:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,478,.LM236-.LFBB86
.LM236:
	lds r24,cfg+10
/* epilogue start */
	ret
	.size	get_hints_frequency, .-get_hints_frequency
.Lscope86:
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
	.stabs	"is_readonly_hints_frequency:F(0,8)",36,0,0,is_readonly_hints_frequency
.global	is_readonly_hints_frequency
	.type	is_readonly_hints_frequency, @function
is_readonly_hints_frequency:
	.stabn	68,0,478,.LM237-.LFBB87
.LM237:
.LFBB87:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,478,.LM238-.LFBB87
.LM238:
	lds r24,cfg+17
	andi r24,lo8(1)
/* epilogue start */
	ret
	.size	is_readonly_hints_frequency, .-is_readonly_hints_frequency
.Lscope87:
	.stabs	"set_readonly_hints_frequency:F(0,1)",36,0,0,set_readonly_hints_frequency
.global	set_readonly_hints_frequency
	.type	set_readonly_hints_frequency, @function
set_readonly_hints_frequency:
	.stabn	68,0,478,.LM239-.LFBB88
.LM239:
.LFBB88:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,478,.LM240-.LFBB88
.LM240:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,0
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_hints_frequency, .-set_readonly_hints_frequency
.Lscope88:
	.stabs	"set_hints_frequency:F(0,1)",36,0,0,set_hints_frequency
	.stabs	"val:P(0,15)",64,0,0,24
.global	set_hints_frequency
	.type	set_hints_frequency, @function
set_hints_frequency:
	.stabn	68,0,478,.LM241-.LFBB89
.LM241:
.LFBB89:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,478,.LM242-.LFBB89
.LM242:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L144
	.stabn	68,0,478,.LM243-.LFBB89
.LM243:
	sts cfg+10,r24
.L144:
/* epilogue start */
	.stabn	68,0,478,.LM244-.LFBB89
.LM244:
	ret
	.size	set_hints_frequency, .-set_hints_frequency
.Lscope89:
	.stabs	"set_default_hints_frequency:F(0,1)",36,0,0,set_default_hints_frequency
.global	set_default_hints_frequency
	.type	set_default_hints_frequency, @function
set_default_hints_frequency:
	.stabn	68,0,478,.LM245-.LFBB90
.LM245:
.LFBB90:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB431:
.LBB432:
	.stabn	68,0,478,.LM246-.LFBB90
.LM246:
	ldi r24,lo8(2)
	sts cfg+10,r24
/* epilogue start */
.LBE432:
.LBE431:
	ret
	.size	set_default_hints_frequency, .-set_default_hints_frequency
.Lscope90:
	.stabs	"get_hints_duty_cycle:F(0,16)=(0,3)",36,0,0,get_hints_duty_cycle
	.stabs	"hints_duty_cycle_t:t(0,16)",128,0,0,0
.global	get_hints_duty_cycle
	.type	get_hints_duty_cycle, @function
get_hints_duty_cycle:
	.stabn	68,0,479,.LM247-.LFBB91
.LM247:
.LFBB91:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,479,.LM248-.LFBB91
.LM248:
	lds r24,cfg+11
/* epilogue start */
	ret
	.size	get_hints_duty_cycle, .-get_hints_duty_cycle
.Lscope91:
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
	.stabs	"is_readonly_hints_duty_cycle:F(0,8)",36,0,0,is_readonly_hints_duty_cycle
.global	is_readonly_hints_duty_cycle
	.type	is_readonly_hints_duty_cycle, @function
is_readonly_hints_duty_cycle:
	.stabn	68,0,479,.LM249-.LFBB92
.LM249:
.LFBB92:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,479,.LM250-.LFBB92
.LM250:
	lds r24,cfg+17
	lsr r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_hints_duty_cycle, .-is_readonly_hints_duty_cycle
.Lscope92:
	.stabs	"set_readonly_hints_duty_cycle:F(0,1)",36,0,0,set_readonly_hints_duty_cycle
.global	set_readonly_hints_duty_cycle
	.type	set_readonly_hints_duty_cycle, @function
set_readonly_hints_duty_cycle:
	.stabn	68,0,479,.LM251-.LFBB93
.LM251:
.LFBB93:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,479,.LM252-.LFBB93
.LM252:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,1
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_hints_duty_cycle, .-set_readonly_hints_duty_cycle
.Lscope93:
	.stabs	"set_hints_duty_cycle:F(0,1)",36,0,0,set_hints_duty_cycle
	.stabs	"val:P(0,16)",64,0,0,24
.global	set_hints_duty_cycle
	.type	set_hints_duty_cycle, @function
set_hints_duty_cycle:
	.stabn	68,0,479,.LM253-.LFBB94
.LM253:
.LFBB94:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,479,.LM254-.LFBB94
.LM254:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L154
	.stabn	68,0,479,.LM255-.LFBB94
.LM255:
	sts cfg+11,r24
.L154:
/* epilogue start */
	.stabn	68,0,479,.LM256-.LFBB94
.LM256:
	ret
	.size	set_hints_duty_cycle, .-set_hints_duty_cycle
.Lscope94:
	.stabs	"set_default_hints_duty_cycle:F(0,1)",36,0,0,set_default_hints_duty_cycle
.global	set_default_hints_duty_cycle
	.type	set_default_hints_duty_cycle, @function
set_default_hints_duty_cycle:
	.stabn	68,0,479,.LM257-.LFBB95
.LM257:
.LFBB95:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB435:
.LBB436:
	.stabn	68,0,479,.LM258-.LFBB95
.LM258:
	ldi r24,lo8(4)
	sts cfg+11,r24
/* epilogue start */
.LBE436:
.LBE435:
	ret
	.size	set_default_hints_duty_cycle, .-set_default_hints_duty_cycle
.Lscope95:
	.stabs	"get_light_hints_brightness:F(0,17)=(0,3)",36,0,0,get_light_hints_brightness
	.stabs	"light_hints_brightness_t:t(0,17)",128,0,0,0
.global	get_light_hints_brightness
	.type	get_light_hints_brightness, @function
get_light_hints_brightness:
	.stabn	68,0,480,.LM259-.LFBB96
.LM259:
.LFBB96:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,480,.LM260-.LFBB96
.LM260:
	lds r24,cfg+12
/* epilogue start */
	ret
	.size	get_light_hints_brightness, .-get_light_hints_brightness
.Lscope96:
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
	.stabs	"is_readonly_light_hints_brightness:F(0,8)",36,0,0,is_readonly_light_hints_brightness
.global	is_readonly_light_hints_brightness
	.type	is_readonly_light_hints_brightness, @function
is_readonly_light_hints_brightness:
	.stabn	68,0,480,.LM261-.LFBB97
.LM261:
.LFBB97:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,480,.LM262-.LFBB97
.LM262:
	lds r24,cfg+17
	bst r24,2
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_light_hints_brightness, .-is_readonly_light_hints_brightness
.Lscope97:
	.stabs	"set_readonly_light_hints_brightness:F(0,1)",36,0,0,set_readonly_light_hints_brightness
.global	set_readonly_light_hints_brightness
	.type	set_readonly_light_hints_brightness, @function
set_readonly_light_hints_brightness:
	.stabn	68,0,480,.LM263-.LFBB98
.LM263:
.LFBB98:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,480,.LM264-.LFBB98
.LM264:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,2
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_light_hints_brightness, .-set_readonly_light_hints_brightness
.Lscope98:
	.stabs	"set_light_hints_brightness:F(0,1)",36,0,0,set_light_hints_brightness
	.stabs	"val:P(0,17)",64,0,0,24
.global	set_light_hints_brightness
	.type	set_light_hints_brightness, @function
set_light_hints_brightness:
	.stabn	68,0,480,.LM265-.LFBB99
.LM265:
.LFBB99:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,480,.LM266-.LFBB99
.LM266:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L164
	.stabn	68,0,480,.LM267-.LFBB99
.LM267:
	sts cfg+12,r24
.L164:
/* epilogue start */
	.stabn	68,0,480,.LM268-.LFBB99
.LM268:
	ret
	.size	set_light_hints_brightness, .-set_light_hints_brightness
.Lscope99:
	.stabs	"set_default_light_hints_brightness:F(0,1)",36,0,0,set_default_light_hints_brightness
.global	set_default_light_hints_brightness
	.type	set_default_light_hints_brightness, @function
set_default_light_hints_brightness:
	.stabn	68,0,480,.LM269-.LFBB100
.LM269:
.LFBB100:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB439:
.LBB440:
	.stabn	68,0,480,.LM270-.LFBB100
.LM270:
	ldi r24,lo8(3)
	sts cfg+12,r24
/* epilogue start */
.LBE440:
.LBE439:
	ret
	.size	set_default_light_hints_brightness, .-set_default_light_hints_brightness
.Lscope100:
	.stabs	"get_sound_hints_volume:F(0,18)=(0,3)",36,0,0,get_sound_hints_volume
	.stabs	"sound_hints_volume_t:t(0,18)",128,0,0,0
.global	get_sound_hints_volume
	.type	get_sound_hints_volume, @function
get_sound_hints_volume:
	.stabn	68,0,481,.LM271-.LFBB101
.LM271:
.LFBB101:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,481,.LM272-.LFBB101
.LM272:
	lds r24,cfg+13
/* epilogue start */
	ret
	.size	get_sound_hints_volume, .-get_sound_hints_volume
.Lscope101:
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
	.stabs	"is_readonly_sound_hints_volume:F(0,8)",36,0,0,is_readonly_sound_hints_volume
.global	is_readonly_sound_hints_volume
	.type	is_readonly_sound_hints_volume, @function
is_readonly_sound_hints_volume:
	.stabn	68,0,481,.LM273-.LFBB102
.LM273:
.LFBB102:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,481,.LM274-.LFBB102
.LM274:
	lds r24,cfg+17
	bst r24,3
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_sound_hints_volume, .-is_readonly_sound_hints_volume
.Lscope102:
	.stabs	"set_readonly_sound_hints_volume:F(0,1)",36,0,0,set_readonly_sound_hints_volume
.global	set_readonly_sound_hints_volume
	.type	set_readonly_sound_hints_volume, @function
set_readonly_sound_hints_volume:
	.stabn	68,0,481,.LM275-.LFBB103
.LM275:
.LFBB103:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,481,.LM276-.LFBB103
.LM276:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,3
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_sound_hints_volume, .-set_readonly_sound_hints_volume
.Lscope103:
	.stabs	"set_sound_hints_volume:F(0,1)",36,0,0,set_sound_hints_volume
	.stabs	"val:P(0,18)",64,0,0,24
.global	set_sound_hints_volume
	.type	set_sound_hints_volume, @function
set_sound_hints_volume:
	.stabn	68,0,481,.LM277-.LFBB104
.LM277:
.LFBB104:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,481,.LM278-.LFBB104
.LM278:
	ldi r25,lo8(-1)
	add r25,r24
	cpi r25,lo8(9)
	brsh .L174
	.stabn	68,0,481,.LM279-.LFBB104
.LM279:
	sts cfg+13,r24
.L174:
/* epilogue start */
	.stabn	68,0,481,.LM280-.LFBB104
.LM280:
	ret
	.size	set_sound_hints_volume, .-set_sound_hints_volume
.Lscope104:
	.stabs	"set_default_sound_hints_volume:F(0,1)",36,0,0,set_default_sound_hints_volume
.global	set_default_sound_hints_volume
	.type	set_default_sound_hints_volume, @function
set_default_sound_hints_volume:
	.stabn	68,0,481,.LM281-.LFBB105
.LM281:
.LFBB105:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB443:
.LBB444:
	.stabn	68,0,481,.LM282-.LFBB105
.LM282:
	ldi r24,lo8(3)
	sts cfg+13,r24
/* epilogue start */
.LBE444:
.LBE443:
	ret
	.size	set_default_sound_hints_volume, .-set_default_sound_hints_volume
.Lscope105:
	.stabs	"get_light_hints_duration:F(0,19)=(0,3)",36,0,0,get_light_hints_duration
	.stabs	"light_hints_duration_t:t(0,19)",128,0,0,0
.global	get_light_hints_duration
	.type	get_light_hints_duration, @function
get_light_hints_duration:
	.stabn	68,0,482,.LM283-.LFBB106
.LM283:
.LFBB106:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,482,.LM284-.LFBB106
.LM284:
	lds r24,cfg+14
/* epilogue start */
	ret
	.size	get_light_hints_duration, .-get_light_hints_duration
.Lscope106:
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
	.stabs	"max_light_hints_duration:F(0,19)",36,0,0,max_light_hints_duration
.global	max_light_hints_duration
	.type	max_light_hints_duration, @function
max_light_hints_duration:
	.stabn	68,0,482,.LM285-.LFBB107
.LM285:
.LFBB107:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,482,.LM286-.LFBB107
.LM286:
	ldi r24,lo8(99)
/* epilogue start */
	ret
	.size	max_light_hints_duration, .-max_light_hints_duration
.Lscope107:
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
	.stabs	"is_readonly_light_hints_duration:F(0,8)",36,0,0,is_readonly_light_hints_duration
.global	is_readonly_light_hints_duration
	.type	is_readonly_light_hints_duration, @function
is_readonly_light_hints_duration:
	.stabn	68,0,482,.LM287-.LFBB108
.LM287:
.LFBB108:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,482,.LM288-.LFBB108
.LM288:
	lds r24,cfg+17
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	is_readonly_light_hints_duration, .-is_readonly_light_hints_duration
.Lscope108:
	.stabs	"set_readonly_light_hints_duration:F(0,1)",36,0,0,set_readonly_light_hints_duration
.global	set_readonly_light_hints_duration
	.type	set_readonly_light_hints_duration, @function
set_readonly_light_hints_duration:
	.stabn	68,0,482,.LM289-.LFBB109
.LM289:
.LFBB109:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,482,.LM290-.LFBB109
.LM290:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,4
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_light_hints_duration, .-set_readonly_light_hints_duration
.Lscope109:
	.stabs	"set_light_hints_duration:F(0,1)",36,0,0,set_light_hints_duration
	.stabs	"val:P(0,19)",64,0,0,24
.global	set_light_hints_duration
	.type	set_light_hints_duration, @function
set_light_hints_duration:
	.stabn	68,0,482,.LM291-.LFBB110
.LM291:
.LFBB110:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,482,.LM292-.LFBB110
.LM292:
	cpi r24,lo8(100)
	brsh .L184
	.stabn	68,0,482,.LM293-.LFBB110
.LM293:
	sts cfg+14,r24
.L184:
/* epilogue start */
	.stabn	68,0,482,.LM294-.LFBB110
.LM294:
	ret
	.size	set_light_hints_duration, .-set_light_hints_duration
.Lscope110:
	.stabs	"set_default_light_hints_duration:F(0,1)",36,0,0,set_default_light_hints_duration
.global	set_default_light_hints_duration
	.type	set_default_light_hints_duration, @function
set_default_light_hints_duration:
	.stabn	68,0,482,.LM295-.LFBB111
.LM295:
.LFBB111:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB447:
.LBB448:
	.stabn	68,0,482,.LM296-.LFBB111
.LM296:
	ldi r24,lo8(7)
	sts cfg+14,r24
/* epilogue start */
.LBE448:
.LBE447:
	ret
	.size	set_default_light_hints_duration, .-set_default_light_hints_duration
.Lscope111:
	.stabs	"get_sound_hints_duration:F(0,20)=(0,3)",36,0,0,get_sound_hints_duration
	.stabs	"sound_hints_duration_t:t(0,20)",128,0,0,0
.global	get_sound_hints_duration
	.type	get_sound_hints_duration, @function
get_sound_hints_duration:
	.stabn	68,0,483,.LM297-.LFBB112
.LM297:
.LFBB112:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,483,.LM298-.LFBB112
.LM298:
	lds r24,cfg+15
/* epilogue start */
	ret
	.size	get_sound_hints_duration, .-get_sound_hints_duration
.Lscope112:
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
	.stabs	"is_readonly_sound_hints_duration:F(0,8)",36,0,0,is_readonly_sound_hints_duration
.global	is_readonly_sound_hints_duration
	.type	is_readonly_sound_hints_duration, @function
is_readonly_sound_hints_duration:
	.stabn	68,0,483,.LM299-.LFBB113
.LM299:
.LFBB113:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,483,.LM300-.LFBB113
.LM300:
	lds r24,cfg+17
	bst r24,5
	clr r24
	bld r24,0
/* epilogue start */
	ret
	.size	is_readonly_sound_hints_duration, .-is_readonly_sound_hints_duration
.Lscope113:
	.stabs	"set_readonly_sound_hints_duration:F(0,1)",36,0,0,set_readonly_sound_hints_duration
.global	set_readonly_sound_hints_duration
	.type	set_readonly_sound_hints_duration, @function
set_readonly_sound_hints_duration:
	.stabn	68,0,483,.LM301-.LFBB114
.LM301:
.LFBB114:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,483,.LM302-.LFBB114
.LM302:
	ldi r30,lo8(cfg+16)
	ldi r31,hi8(cfg+16)
	ldd r25,Z+1
	bst r24,0
	bld r25,5
	std Z+1,r25
/* epilogue start */
	ret
	.size	set_readonly_sound_hints_duration, .-set_readonly_sound_hints_duration
.Lscope114:
	.stabs	"set_sound_hints_duration:F(0,1)",36,0,0,set_sound_hints_duration
	.stabs	"val:P(0,20)",64,0,0,24
.global	set_sound_hints_duration
	.type	set_sound_hints_duration, @function
set_sound_hints_duration:
	.stabn	68,0,483,.LM303-.LFBB115
.LM303:
.LFBB115:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,483,.LM304-.LFBB115
.LM304:
	cpi r24,lo8(100)
	brsh .L194
	.stabn	68,0,483,.LM305-.LFBB115
.LM305:
	sts cfg+15,r24
.L194:
/* epilogue start */
	.stabn	68,0,483,.LM306-.LFBB115
.LM306:
	ret
	.size	set_sound_hints_duration, .-set_sound_hints_duration
.Lscope115:
	.stabs	"set_default_sound_hints_duration:F(0,1)",36,0,0,set_default_sound_hints_duration
.global	set_default_sound_hints_duration
	.type	set_default_sound_hints_duration, @function
set_default_sound_hints_duration:
	.stabn	68,0,483,.LM307-.LFBB116
.LM307:
.LFBB116:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB451:
.LBB452:
	.stabn	68,0,483,.LM308-.LFBB116
.LM308:
	ldi r24,lo8(7)
	sts cfg+15,r24
/* epilogue start */
.LBE452:
.LBE451:
	ret
	.size	set_default_sound_hints_duration, .-set_default_sound_hints_duration
.Lscope116:
	.stabs	"get_trigger_counter:F(0,21)=(0,3)",36,0,0,get_trigger_counter
	.stabs	"trigger_counter_t:t(0,21)",128,0,0,0
.global	get_trigger_counter
	.type	get_trigger_counter, @function
get_trigger_counter:
	.stabn	68,0,484,.LM309-.LFBB117
.LM309:
.LFBB117:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,484,.LM310-.LFBB117
.LM310:
	lds r24,v_trigger_counter
/* epilogue start */
	ret
	.size	get_trigger_counter, .-get_trigger_counter
.Lscope117:
	.stabs	"inc_trigger_counter:F(0,1)",36,0,0,inc_trigger_counter
.global	inc_trigger_counter
	.type	inc_trigger_counter, @function
inc_trigger_counter:
	.stabn	68,0,484,.LM311-.LFBB118
.LM311:
.LFBB118:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,484,.LM312-.LFBB118
.LM312:
	lds r24,v_trigger_counter
	subi r24,lo8(-(1))
	sts v_trigger_counter,r24
/* epilogue start */
	ret
	.size	inc_trigger_counter, .-inc_trigger_counter
.Lscope118:
	.stabs	"reset_trigger_counter:F(0,1)",36,0,0,reset_trigger_counter
.global	reset_trigger_counter
	.type	reset_trigger_counter, @function
reset_trigger_counter:
	.stabn	68,0,484,.LM313-.LFBB119
.LM313:
.LFBB119:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,484,.LM314-.LFBB119
.LM314:
	sts v_trigger_counter,__zero_reg__
/* epilogue start */
	ret
	.size	reset_trigger_counter, .-reset_trigger_counter
.Lscope119:
	.local	v_trigger_counter
	.comm	v_trigger_counter,1,1
	.stabs	"v_trigger_counter:S(0,21)",38,0,0,v_trigger_counter
	.local	cfg
	.comm	cfg,18,1
	.stabs	"cfg:S(0,22)=(0,23)=xss_dreamstalker_config:",40,0,0,cfg
	.stabs	"s_dreamstalker_config:T(0,23)=s18props:(0,24)=(0,25)=xss_dreamstalker_config_props:,0,128;states:(0,26)=(0,27)=xss_dreamstalker_config_states:,128,16;;",128,0,0,0
	.stabs	"dreamstalker_config_t:t(0,22)",128,0,0,0
	.stabs	"s_dreamstalker_config_props:T(0,25)=s16before_hints_message:(0,4),0,1;after_hints_message:(0,4),1,1;voice_recording:(0,4),2,1;speaker_enabled:(0,4),3,1;alarm_clock:(0,4),4,1;wakeup_timer_delay:(0,9),8,16;sleep_scenario_playback:(0,10),24,8;relax_tunes_playback:(0,11),32,8;volume_level:(0,13),40,8;rem_detect_sensitivity:(0,14),48,8;duplex_mode:(0,7),56,8;wakeup_mode:(0,2),64,8;vibration_level:(0,12),72,8;hints_frequency:(0,15),80,8;hints_duty_cycle:(0,16),88,8;light_hints_brightness:(0,17),96,8;sound_hints_volume:(0,18),104,8;light_hints_duration:(0,19),112,8;sound_hints_duration:(0,20),120,8;;",128,0,0,0
	.stabs	"s_dreamstalker_config_states:T(0,27)=s2wakeup_timer_delay__RO:(0,4),0,1;sleep_scenario_playback__RO:(0,4),1,1;relax_tunes_playback__RO:(0,4),2,1;volume_level__RO:(0,4),3,1;rem_detect_sensitivity__RO:(0,4),4,1;duplex_mode__RO:(0,4),5,1;wakeup_mode__RO:(0,4),6,1;vibration_level__RO:(0,4),7,1;hints_frequency__RO:(0,4),8,1;hints_duty_cycle__RO:(0,4),9,1;light_hints_brightness__RO:(0,4),10,1;sound_hints_volume__RO:(0,4),11,1;light_hints_duration__RO:(0,4),12,1;sound_hints_duration__RO:(0,4),13,1;;",128,0,0,0
.global	u_FirmwareVersion
	.section	.progmem.data,"a",@progbits
	.type	u_FirmwareVersion, @object
	.size	u_FirmwareVersion, 2
u_FirmwareVersion:
	.word	258
	.stabs	"u_FirmwareVersion:G(0,5)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
