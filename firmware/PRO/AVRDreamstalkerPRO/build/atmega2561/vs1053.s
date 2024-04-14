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
	.stabs	"vs1053_set_clockf:F(0,1)=(0,1)",36,0,0,vs1053_set_clockf
	.stabs	"uint16_t:t(0,2)=(0,3)=r(0,3);0;65535;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned int:t(0,3)",128,0,0,0
	.stabs	"xtal_freq:P(0,4)=(0,5)=r(0,5);0;4294967295;",64,0,0,16
	.stabs	"clock_doubler:p(0,6)=r(0,6);-32768;32767;",160,0,0,5
	.stabs	"uint32_t:t(0,4)",128,0,0,0
	.stabs	"long unsigned int:t(0,5)",128,0,0,0
	.stabs	"int:t(0,6)",128,0,0,0
.global	vs1053_set_clockf
	.type	vs1053_set_clockf, @function
vs1053_set_clockf:
	.stabn	68,0,67,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r22
	movw r18,r24
	std Y+5,r20
	std Y+6,r21
	.stabn	68,0,69,.LM1-.LFBB1
.LM1:
	cp r16,__zero_reg__
	ldi r24,-128
	cpc r17,r24
	ldi r24,-69
	cpc r18,r24
	cpc r19,__zero_reg__
	brne .L2
	.stabn	68,0,68,.LM2-.LFBB1
.LM2:
	ldi r24,0
	ldi r25,lo8(8)
	sts vs_reg+1,r25
	sts vs_reg,r24
.L3:
	.stabn	68,0,72,.LM3-.LFBB1
.LM3:
	ldd r26,Y+5
	ldd r27,Y+6
	or r26,r27
	breq .L4
	.stabn	68,0,73,.LM4-.LFBB1
.LM4:
	lds r24,vs_reg
	lds r25,vs_reg+1
	ori r25,32
	sts vs_reg+1,r25
	sts vs_reg,r24
.L4:
	.stabn	68,0,77,.LM5-.LFBB1
.LM5:
	lds r22,vs_reg
	lds r23,vs_reg+1
	ldi r24,lo8(3)
	call vs_sci_write
.LBB4:
.LBB5:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM6-.LFBB1
.LM6:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE5:
.LBE4:
	.stabs	"src/sound/vs1053.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,79,.LM7-.LFBB1
.LM7:
	adiw r28,6
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
.L2:
	.stabn	68,0,70,.LM8-.LFBB1
.LM8:
	movw r26,r18
	movw r24,r22
	subi r25,18
	sbci r26,122
	sbc r27,__zero_reg__
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	movw r22,r24
	movw r24,r26
	ldi r18,lo8(-96)
	ldi r19,lo8(15)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	.stabn	68,0,70,.LM9-.LFBB1
.LM9:
	ori r19,8
	sts vs_reg+1,r19
	sts vs_reg,r18
	rjmp .L3
	.size	vs1053_set_clockf, .-vs1053_set_clockf
.Lscope1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"VLSI/53_ima.cmd"
	.text
	.stabs	"vs1053_adpcm_rec_start:F(0,1)",36,0,0,vs1053_adpcm_rec_start
	.stabs	"pfnvs_patch_init:t(0,7)=(0,8)=*(0,9)=f(0,6)",128,0,0,0
.global	vs1053_adpcm_rec_start
	.type	vs1053_adpcm_rec_start, @function
vs1053_adpcm_rec_start:
	.stabn	68,0,82,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,83,.LM11-.LFBB2
.LM11:
	ldi r22,lo8(64)
	ldi r23,lo8(31)
	ldi r24,lo8(12)
	call vs_sci_write
	.stabn	68,0,88,.LM12-.LFBB2
.LM12:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(13)
	call vs_sci_write
	.stabn	68,0,91,.LM13-.LFBB2
.LM13:
	ldi r22,0
	ldi r23,lo8(16)
	ldi r24,lo8(14)
	call vs_sci_write
	.stabn	68,0,94,.LM14-.LFBB2
.LM14:
	ldi r22,lo8(2)
	ldi r23,0
	ldi r24,lo8(15)
	call vs_sci_write
	.stabn	68,0,96,.LM15-.LFBB2
.LM15:
	ldi r24,0
	call vs_sci_read
	movw r22,r24
	.stabn	68,0,96,.LM16-.LFBB2
.LM16:
	sts vs_reg+1,r25
	sts vs_reg,r24
	.stabn	68,0,98,.LM17-.LFBB2
.LM17:
	ori r23,16
	ldi r24,0
	call vs_sci_write
	.stabn	68,0,105,.LM18-.LFBB2
.LM18:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	jmp vs_patch_apply_from_file
	.size	vs1053_adpcm_rec_start, .-vs1053_adpcm_rec_start
.Lscope2:
	.stabs	"vs1053_adpcm_rec_stop:F(0,1)",36,0,0,vs1053_adpcm_rec_stop
.global	vs1053_adpcm_rec_stop
	.type	vs1053_adpcm_rec_stop, @function
vs1053_adpcm_rec_stop:
	.stabn	68,0,109,.LM19-.LFBB3
.LM19:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,111,.LM20-.LFBB3
.LM20:
	ldi r22,0
	ldi r23,lo8(16)
	ldi r25,0
	ldi r24,0
	jmp vs_sw_reset
	.size	vs1053_adpcm_rec_stop, .-vs1053_adpcm_rec_stop
.Lscope3:
	.stabs	"vs1053_suspend:F(0,1)",36,0,0,vs1053_suspend
.global	vs1053_suspend
	.type	vs1053_suspend, @function
vs1053_suspend:
	.stabn	68,0,115,.LM21-.LFBB4
.LM21:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,117,.LM22-.LFBB4
.LM22:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(3)
	call vs_sci_write
	.stabn	68,0,123,.LM23-.LFBB4
.LM23:
	jmp vs_analog_power_down
	.size	vs1053_suspend, .-vs1053_suspend
.Lscope4:
	.stabs	"vs1053_resume:F(0,1)",36,0,0,vs1053_resume
.global	vs1053_resume
	.type	vs1053_resume, @function
vs1053_resume:
	.stabn	68,0,127,.LM24-.LFBB5
.LM24:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,131,.LM25-.LFBB5
.LM25:
	ldi r22,lo8(-2)
	ldi r24,lo8(-2)
	call vs_set_volume
	.stabn	68,0,137,.LM26-.LFBB5
.LM26:
	ldi r20,lo8(1)
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(-128)
	ldi r24,lo8(-69)
	ldi r25,0
	jmp vs_set_clockf
	.size	vs1053_resume, .-vs1053_resume
.Lscope5:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
