	.file	"ds_sound.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/ds_sound.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"speaker_on:F(0,1)=(0,1)",36,0,0,speaker_on
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
.global	speaker_on
	.type	speaker_on, @function
speaker_on:
	.stabn	68,0,51,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,52,.LM1-.LFBB1
.LM1:
	cbi 0xe,5
.LBB10:
.LBB11:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE11:
.LBE10:
	.stabs	"src/sound/ds_sound.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,55,.LM3-.LFBB1
.LM3:
	ret
	.size	speaker_on, .-speaker_on
.Lscope1:
	.stabs	"speaker_off:F(0,1)",36,0,0,speaker_off
.global	speaker_off
	.type	speaker_off, @function
speaker_off:
	.stabn	68,0,58,.LM4-.LFBB2
.LM4:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,59,.LM5-.LFBB2
.LM5:
	sbi 0xe,5
.LBB12:
.LBB13:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,187,.LM6-.LFBB2
.LM6:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE13:
.LBE12:
	.stabs	"src/sound/ds_sound.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,62,.LM7-.LFBB2
.LM7:
	ret
	.size	speaker_off, .-speaker_off
.Lscope2:
	.stabs	"mic_power_on:F(0,1)",36,0,0,mic_power_on
.global	mic_power_on
	.type	mic_power_on, @function
mic_power_on:
	.stabn	68,0,69,.LM8-.LFBB3
.LM8:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,70,.LM9-.LFBB3
.LM9:
	sbi 0xe,6
.LBB14:
.LBB15:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM10-.LFBB3
.LM10:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE15:
.LBE14:
	.stabs	"src/sound/ds_sound.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,73,.LM11-.LFBB3
.LM11:
	ret
	.size	mic_power_on, .-mic_power_on
.Lscope3:
	.stabs	"mic_power_off:F(0,1)",36,0,0,mic_power_off
.global	mic_power_off
	.type	mic_power_off, @function
mic_power_off:
	.stabn	68,0,76,.LM12-.LFBB4
.LM12:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,77,.LM13-.LFBB4
.LM13:
	cbi 0xe,6
.LBB16:
.LBB17:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,187,.LM14-.LFBB4
.LM14:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE17:
.LBE16:
	.stabs	"src/sound/ds_sound.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,80,.LM15-.LFBB4
.LM15:
	ret
	.size	mic_power_off, .-mic_power_off
.Lscope4:
	.stabs	"sound_init:F(0,1)",36,0,0,sound_init
.global	sound_init
	.type	sound_init, @function
sound_init:
	.stabn	68,0,87,.LM16-.LFBB5
.LM16:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,88,.LM17-.LFBB5
.LM17:
	sbi 0xd,6
	.stabn	68,0,89,.LM18-.LFBB5
.LM18:
	sbi 0xd,5
	.stabn	68,0,92,.LM19-.LFBB5
.LM19:
	cbi 0x13,1
	.stabn	68,0,95,.LM20-.LFBB5
.LM20:
	sbi 0x14,1
	.stabn	68,0,98,.LM21-.LFBB5
.LM21:
	sbi 0xd,2
	.stabn	68,0,99,.LM22-.LFBB5
.LM22:
	cbi 0xe,2
	.stabn	68,0,102,.LM23-.LFBB5
.LM23:
	cbi 0x7,2
	.stabn	68,0,105,.LM24-.LFBB5
.LM24:
	sbi 0x8,2
	.stabn	68,0,107,.LM25-.LFBB5
.LM25:
	call speaker_off
	.stabn	68,0,109,.LM26-.LFBB5
.LM26:
	call mic_power_off
	.stabn	68,0,111,.LM27-.LFBB5
.LM27:
	jmp tonegen_init
	.size	sound_init, .-sound_init
.Lscope5:
	.stabs	"sound_start:F(0,1)",36,0,0,sound_start
.global	sound_start
	.type	sound_start, @function
sound_start:
	.stabn	68,0,115,.LM28-.LFBB6
.LM28:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,116,.LM29-.LFBB6
.LM29:
	call get_loud_speaker
	.stabn	68,0,116,.LM30-.LFBB6
.LM30:
	cpse r24,__zero_reg__
	.stabn	68,0,117,.LM31-.LFBB6
.LM31:
	jmp speaker_on
.L7:
	.stabn	68,0,119,.LM32-.LFBB6
.LM32:
	jmp speaker_off
	.size	sound_start, .-sound_start
.Lscope6:
	.stabs	"sound_stop:F(0,1)",36,0,0,sound_stop
.global	sound_stop
	.type	sound_stop, @function
sound_stop:
	.stabn	68,0,124,.LM33-.LFBB7
.LM33:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,126,.LM34-.LFBB7
.LM34:
	ret
	.size	sound_stop, .-sound_stop
.Lscope7:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
