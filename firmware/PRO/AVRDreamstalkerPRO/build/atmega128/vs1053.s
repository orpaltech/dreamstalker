	.file	"vs1053.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs1053.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs1053_patch_rom:F(0,1)=(0,2)=*(0,3)=xss_vs_patch_rom:",36,0,0,vs1053_patch_rom
	.stabs	"pvs_patch_rom_t:t(0,1)",128,0,0,0
	.stabs	"s_vs_patch_rom:T(0,3)=s9revision:(0,4)=(0,5)=r(0,5);0;65535;,0,16;patch_count:(0,4),16,16;patch_data:(0,6)=ar(0,7)=r(0,7);0;65535;;0;0;(0,8)=(0,9)=xss_vs_patch_data:,32,40;;",128,0,0,0
	.stabs	"uint16_t:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.stabs	"s_vs_patch_data:T(0,9)=s5count:(0,4),0,16;instr:(0,10)=ar(0,7);0;0;(0,11)=(0,12)=xss_vs_sci_instr:,16,24;;",128,0,0,0
	.stabs	"s_vs_sci_instr:T(0,12)=s3reg:(0,13)=(0,14)=r(0,14);0;255;,0,8;data:(0,4),8,16;;",128,0,0,0
	.stabs	"uint8_t:t(0,13)",128,0,0,0
	.stabs	"unsigned char:t(0,14)",128,0,0,0
.global	vs1053_patch_rom
	.type	vs1053_patch_rom, @function
vs1053_patch_rom:
	.stabn	68,0,85,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,87,.LM1-.LFBB1
.LM1:
	ldi r24,lo8(__vs1053_patch_rom)
	ldi r25,hi8(__vs1053_patch_rom)
/* epilogue start */
	ret
	.size	vs1053_patch_rom, .-vs1053_patch_rom
.Lscope1:
	.stabs	"vs1053_init:F(0,15)=eFalse:0,True:1,;",36,0,0,vs1053_init
	.stabs	"_Bool:t(0,15)",128,0,0,0
.global	vs1053_init
	.type	vs1053_init, @function
vs1053_init:
	.stabn	68,0,92,.LM2-.LFBB2
.LM2:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,94,.LM3-.LFBB2
.LM3:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1053_init, .-vs1053_init
.Lscope2:
.global	vs1053_process_patches
	.type	vs1053_process_patches, @function
vs1053_process_patches:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1053_process_patches, .-vs1053_process_patches
	.stabs	"vs1053_set_clockf:F(0,16)=(0,16)",36,0,0,vs1053_set_clockf
	.stabs	"void:t(0,16)",128,0,0,0
	.stabs	"mult:P(0,4)",64,0,0,24
	.stabs	"add:P(0,4)",64,0,0,22
.global	vs1053_set_clockf
	.type	vs1053_set_clockf, @function
vs1053_set_clockf:
	.stabn	68,0,102,.LM4-.LFBB3
.LM4:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,116,.LM5-.LFBB3
.LM5:
	or r22,r24
	or r23,r25
	.stabn	68,0,118,.LM6-.LFBB3
.LM6:
	ldi r24,lo8(3)
	jmp vs_sci_write
	.size	vs1053_set_clockf, .-vs1053_set_clockf
.Lscope3:
	.stabs	"vs1053_playback_start:F(0,15)",36,0,0,vs1053_playback_start
.global	vs1053_playback_start
	.type	vs1053_playback_start, @function
vs1053_playback_start:
	.stabn	68,0,122,.LM7-.LFBB4
.LM7:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,123,.LM8-.LFBB4
.LM8:
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call vs_sw_reset
.LBB8:
.LBB9:
	.stabn	68,0,118,.LM9-.LFBB4
.LM9:
	ldi r22,0
	ldi r23,lo8(40)
	ldi r24,lo8(3)
	call vs_sci_write
.LBE9:
.LBE8:
	.stabn	68,0,129,.LM10-.LFBB4
.LM10:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1053_playback_start, .-vs1053_playback_start
.Lscope4:
	.stabs	"vs1053_playback_stop:F(0,16)",36,0,0,vs1053_playback_stop
.global	vs1053_playback_stop
	.type	vs1053_playback_stop, @function
vs1053_playback_stop:
	.stabn	68,0,132,.LM11-.LFBB5
.LM11:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,133,.LM12-.LFBB5
.LM12:
	ret
	.size	vs1053_playback_stop, .-vs1053_playback_stop
.Lscope5:
	.stabs	"vs1053_adpcm_rec_start:F(0,15)",36,0,0,vs1053_adpcm_rec_start
	.stabs	"gain:P(0,13)",64,0,0,28
.global	vs1053_adpcm_rec_start
	.type	vs1053_adpcm_rec_start, @function
vs1053_adpcm_rec_start:
	.stabn	68,0,136,.LM13-.LFBB6
.LM13:
.LFBB6:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r17,r24
	mov r29,r25
	mov r28,r22
.LBB10:
.LBB11:
	.stabn	68,0,118,.LM14-.LFBB6
.LM14:
	ldi r22,0
	ldi r23,lo8(-64)
	ldi r24,lo8(3)
	call vs_sci_write
.LBE11:
.LBE10:
	.stabn	68,0,139,.LM15-.LFBB6
.LM15:
	mov r22,r17
	mov r23,r29
	ldi r24,lo8(12)
	call vs_sci_write
	.stabn	68,0,145,.LM16-.LFBB6
.LM16:
	mov r23,r28
	lsl r23
	lsl r23
	ldi r22,0
	ldi r24,lo8(13)
	call vs_sci_write
	.stabn	68,0,152,.LM17-.LFBB6
.LM17:
	ldi r22,0
	ldi r23,lo8(16)
	.stabn	68,0,151,.LM18-.LFBB6
.LM18:
	tst r28
	breq .L10
	.stabn	68,0,154,.LM19-.LFBB6
.LM19:
	ldi r23,0
	ldi r22,0
.L10:
	ldi r24,lo8(14)
	call vs_sci_write
	.stabn	68,0,157,.LM20-.LFBB6
.LM20:
	ldi r22,lo8(2)
	ldi r23,0
	ldi r24,lo8(15)
	call vs_sci_write
	.stabn	68,0,161,.LM21-.LFBB6
.LM21:
	ldi r23,0
	ldi r22,0
	ldi r24,0
	ldi r25,lo8(16)
	call vs_sw_reset
	.stabn	68,0,167,.LM22-.LFBB6
.LM22:
	ldi r17,0
	ldi r16,0
	ldi r19,0
	ldi r18,0
	ldi r20,lo8(gs(vs_patch_apply))
	ldi r21,hi8(gs(vs_patch_apply))
	ldi r23,0
	ldi r22,0
	ldi r24,0
	call vs_patch_process_rom
	.stabn	68,0,170,.LM23-.LFBB6
.LM23:
	ldi r24,lo8(1)
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	vs1053_adpcm_rec_start, .-vs1053_adpcm_rec_start
.Lscope6:
	.stabs	"vs1053_adpcm_rec_stop:F(0,16)",36,0,0,vs1053_adpcm_rec_stop
.global	vs1053_adpcm_rec_stop
	.type	vs1053_adpcm_rec_stop, @function
vs1053_adpcm_rec_stop:
	.stabn	68,0,173,.LM24-.LFBB7
.LM24:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,175,.LM25-.LFBB7
.LM25:
	ldi r22,0
	ldi r23,lo8(16)
	ldi r25,0
	ldi r24,0
	jmp vs_sw_reset
	.size	vs1053_adpcm_rec_stop, .-vs1053_adpcm_rec_stop
.Lscope7:
	.stabs	"vs1053_suspend:F(0,16)",36,0,0,vs1053_suspend
.global	vs1053_suspend
	.type	vs1053_suspend, @function
vs1053_suspend:
	.stabn	68,0,179,.LM26-.LFBB8
.LM26:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,181,.LM27-.LFBB8
.LM27:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(3)
	call vs_sci_write
	.stabn	68,0,184,.LM28-.LFBB8
.LM28:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,lo8(5)
	call vs_sci_write
	.stabn	68,0,187,.LM29-.LFBB8
.LM29:
	jmp vs_analog_power_down
	.size	vs1053_suspend, .-vs1053_suspend
.Lscope8:
	.stabs	"vs1053_resume:F(0,16)",36,0,0,vs1053_resume
.global	vs1053_resume
	.type	vs1053_resume, @function
vs1053_resume:
	.stabn	68,0,191,.LM30-.LFBB9
.LM30:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,195,.LM31-.LFBB9
.LM31:
	ldi r22,lo8(54)
	ldi r24,lo8(54)
	call vs_set_volume
.LBB12:
.LBB13:
	.stabn	68,0,118,.LM32-.LFBB9
.LM32:
	ldi r22,0
	ldi r23,lo8(40)
	ldi r24,lo8(3)
	jmp vs_sci_write
.LBE13:
.LBE12:
	.size	vs1053_resume, .-vs1053_resume
.Lscope9:
.global	__vs1053_patch_rom
	.section	.progmem.data,"a",@progbits
	.type	__vs1053_patch_rom, @object
	.size	__vs1053_patch_rom, 210
__vs1053_patch_rom:
	.string	"\201\210\001"
	.string	"D"
	.string	"\007P\200\006"
	.string	""
	.string	"\006\220\027\006"
	.string	"\364\006"
	.string	"T\006"
	.string	""
	.string	"\006\020\n\006"
	.string	"\364\006"
	.string	"V\006\200\260\006$"
	.string	"\006\007"
	.string	"\006W\222\006"
	.string	"?\006$"
	.string	"\0060"
	.string	"\006\227\002\006"
	.string	"?\006$"
	.string	"\006"
	.string	""
	.string	"\006M"
	.string	"\006\024"
	.string	"\006\217\225\006"
	.string	""
	.string	"\006N\033\006\017(\006"
	.string	"\341\006\006"
	.string	"\006\026 \006"
	.string	"*\006\316\027\006\022>\006\027\270\006\024>\006\022\370\006\001>\006\021\270\006\007"
	.string	"\006\027\227\006 "
	.string	"\006\322\377\0060"
	.string	"\006\321\021\006\0211\006$\200\006\0047\006$\300\006\201;\006$\200\006\0011\006$\200\006\201;\006$\200\006\004?\006$\300\006\b(\006"
	.string	"H\006\3616\006\021\230\006\024(\006\221\234\006"
	.string	""
	.string	"\006M"
	.string	"\006\024(\006@\231\006?"
	.string	"\006\023"
	.string	"\nP"
	.stabs	"__vs1053_patch_rom:G(0,17)=ar(0,7);0;209;(0,13)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
