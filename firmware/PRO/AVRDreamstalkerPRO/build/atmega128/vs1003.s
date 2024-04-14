	.file	"vs1003.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs1003.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs1003_patch_rom:F(0,1)=(0,2)=*(0,3)=xss_vs_patch_rom:",36,0,0,vs1003_patch_rom
	.stabs	"pvs_patch_rom_t:t(0,1)",128,0,0,0
	.stabs	"s_vs_patch_rom:T(0,3)=s9revision:(0,4)=(0,5)=r(0,5);0;65535;,0,16;patch_count:(0,4),16,16;patch_data:(0,6)=ar(0,7)=r(0,7);0;65535;;0;0;(0,8)=(0,9)=xss_vs_patch_data:,32,40;;",128,0,0,0
	.stabs	"uint16_t:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.stabs	"s_vs_patch_data:T(0,9)=s5count:(0,4),0,16;instr:(0,10)=ar(0,7);0;0;(0,11)=(0,12)=xss_vs_sci_instr:,16,24;;",128,0,0,0
	.stabs	"s_vs_sci_instr:T(0,12)=s3reg:(0,13)=(0,14)=r(0,14);0;255;,0,8;data:(0,4),8,16;;",128,0,0,0
	.stabs	"uint8_t:t(0,13)",128,0,0,0
	.stabs	"unsigned char:t(0,14)",128,0,0,0
.global	vs1003_patch_rom
	.type	vs1003_patch_rom, @function
vs1003_patch_rom:
	.stabn	68,0,75,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,77,.LM1-.LFBB1
.LM1:
	ldi r24,lo8(__vs1003_patch_rom)
	ldi r25,hi8(__vs1003_patch_rom)
/* epilogue start */
	ret
	.size	vs1003_patch_rom, .-vs1003_patch_rom
.Lscope1:
	.stabs	"vs1003_init:F(0,15)=eFalse:0,True:1,;",36,0,0,vs1003_init
	.stabs	"_Bool:t(0,15)",128,0,0,0
.global	vs1003_init
	.type	vs1003_init, @function
vs1003_init:
	.stabn	68,0,82,.LM2-.LFBB2
.LM2:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,84,.LM3-.LFBB2
.LM3:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1003_init, .-vs1003_init
.Lscope2:
.global	vs1003_process_patches
	.type	vs1003_process_patches, @function
vs1003_process_patches:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1003_process_patches, .-vs1003_process_patches
	.stabs	"vs1003_suspend:F(0,16)=(0,16)",36,0,0,vs1003_suspend
	.stabs	"void:t(0,16)",128,0,0,0
.global	vs1003_suspend
	.type	vs1003_suspend, @function
vs1003_suspend:
	.stabn	68,0,92,.LM4-.LFBB3
.LM4:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,93,.LM5-.LFBB3
.LM5:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_is_set
	.stabn	68,0,93,.LM6-.LFBB3
.LM6:
	cpse r24,__zero_reg__
	rjmp .L4
	.stabn	68,0,96,.LM7-.LFBB3
.LM7:
	call vs_analog_power_down
	.stabn	68,0,98,.LM8-.LFBB3
.LM8:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	jmp vs_sci_set
.L4:
/* epilogue start */
	.stabn	68,0,99,.LM9-.LFBB3
.LM9:
	ret
	.size	vs1003_suspend, .-vs1003_suspend
.Lscope3:
	.stabs	"vs1003_resume:F(0,16)",36,0,0,vs1003_resume
.global	vs1003_resume
	.type	vs1003_resume, @function
vs1003_resume:
	.stabn	68,0,102,.LM10-.LFBB4
.LM10:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,103,.LM11-.LFBB4
.LM11:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_is_set
	.stabn	68,0,103,.LM12-.LFBB4
.LM12:
	tst r24
	breq .L6
	.stabn	68,0,106,.LM13-.LFBB4
.LM13:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_unset
	.stabn	68,0,108,.LM14-.LFBB4
.LM14:
	ldi r22,lo8(54)
	ldi r24,lo8(54)
	jmp vs_set_volume
.L6:
/* epilogue start */
	.stabn	68,0,109,.LM15-.LFBB4
.LM15:
	ret
	.size	vs1003_resume, .-vs1003_resume
.Lscope4:
	.stabs	"vs1003_set_clockf:F(0,16)",36,0,0,vs1003_set_clockf
	.stabs	"mult:P(0,4)",64,0,0,24
	.stabs	"add:P(0,4)",64,0,0,22
.global	vs1003_set_clockf
	.type	vs1003_set_clockf, @function
vs1003_set_clockf:
	.stabn	68,0,112,.LM16-.LFBB5
.LM16:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,122,.LM17-.LFBB5
.LM17:
	or r22,r24
	or r23,r25
	.stabn	68,0,124,.LM18-.LFBB5
.LM18:
	ldi r24,lo8(3)
	jmp vs_sci_write
	.size	vs1003_set_clockf, .-vs1003_set_clockf
.Lscope5:
	.stabs	"vs1003_playback_start:F(0,15)",36,0,0,vs1003_playback_start
.global	vs1003_playback_start
	.type	vs1003_playback_start, @function
vs1003_playback_start:
	.stabn	68,0,128,.LM19-.LFBB6
.LM19:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,129,.LM20-.LFBB6
.LM20:
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call vs_sw_reset
.LBB6:
.LBB7:
	.stabn	68,0,124,.LM21-.LFBB6
.LM21:
	ldi r22,0
	ldi r23,lo8(80)
	ldi r24,lo8(3)
	call vs_sci_write
.LBE7:
.LBE6:
	.stabn	68,0,135,.LM22-.LFBB6
.LM22:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1003_playback_start, .-vs1003_playback_start
.Lscope6:
	.stabs	"vs1003_playback_stop:F(0,16)",36,0,0,vs1003_playback_stop
.global	vs1003_playback_stop
	.type	vs1003_playback_stop, @function
vs1003_playback_stop:
	.stabn	68,0,138,.LM23-.LFBB7
.LM23:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,139,.LM24-.LFBB7
.LM24:
	ret
	.size	vs1003_playback_stop, .-vs1003_playback_stop
.Lscope7:
	.stabs	"vs1003_adpcm_rec_start:F(0,15)",36,0,0,vs1003_adpcm_rec_start
	.stabs	"sample_rate:P(0,4)",64,0,0,28
	.stabs	"gain:P(0,13)",64,0,0,17
	.stabs	"highpass_filter:P(0,15)",64,0,0,16
.global	vs1003_adpcm_rec_start
	.type	vs1003_adpcm_rec_start, @function
vs1003_adpcm_rec_start:
	.stabn	68,0,142,.LM25-.LFBB8
.LM25:
.LFBB8:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	mov r17,r22
	mov r16,r20
.LBB8:
.LBB9:
	.stabn	68,0,124,.LM26-.LFBB8
.LM26:
	ldi r22,0
	ldi r23,lo8(-64)
	ldi r24,lo8(3)
	call vs_sci_write
.LBE9:
.LBE8:
	.stabn	68,0,154,.LM27-.LFBB8
.LM27:
	movw r18,r28
	ldi r21,0
	ldi r20,0
	mov r21,r20
	mov r20,r19
	mov r19,r18
	clr r18
	.stabn	68,0,154,.LM28-.LFBB8
.LM28:
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(-18)
	ldi r25,lo8(2)
	call __udivmodsi4
	.stabn	68,0,157,.LM29-.LFBB8
.LM29:
	movw r22,r18
	ldi r24,lo8(12)
	call vs_sci_write
	.stabn	68,0,163,.LM30-.LFBB8
.LM30:
	mov r23,r17
	lsl r23
	lsl r23
	ldi r22,0
	ldi r24,lo8(13)
	call vs_sci_write
	.stabn	68,0,168,.LM31-.LFBB8
.LM31:
	ldi r24,0
	ldi r25,lo8(16)
	tst r16
	breq .L12
	ldi r24,0
	ldi r25,lo8(48)
.L12:
	.stabn	68,0,168,.LM32-.LFBB8
.LM32:
	ldi r23,0
	ldi r22,0
	call vs_sw_reset
	.stabn	68,0,171,.LM33-.LFBB8
.LM33:
	ldi r24,lo8(1)
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	vs1003_adpcm_rec_start, .-vs1003_adpcm_rec_start
.Lscope8:
	.stabs	"vs1003_adpcm_rec_stop:F(0,16)",36,0,0,vs1003_adpcm_rec_stop
.global	vs1003_adpcm_rec_stop
	.type	vs1003_adpcm_rec_stop, @function
vs1003_adpcm_rec_stop:
	.stabn	68,0,174,.LM34-.LFBB9
.LM34:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,176,.LM35-.LFBB9
.LM35:
	ldi r22,0
	ldi r23,lo8(48)
	ldi r25,0
	ldi r24,0
	jmp vs_sw_reset
	.size	vs1003_adpcm_rec_stop, .-vs1003_adpcm_rec_stop
.Lscope9:
.global	__vs1003_patch_rom
	.section	.progmem.data,"a",@progbits
	.type	__vs1003_patch_rom, @object
	.size	__vs1003_patch_rom, 4
__vs1003_patch_rom:
	.string	"\201\210"
	.string	""
	.stabs	"__vs1003_patch_rom:G(0,17)=ar(0,7);0;3;(0,13)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
