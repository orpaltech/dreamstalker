	.file	"vs1002.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs1002.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs1002_patch_ima_adpcm_init:f(0,1)=r(0,1);-32768;32767;",36,0,0,vs1002_patch_ima_adpcm_init
	.stabs	"s_vs_sci_instr:T(0,2)=s3reg:(0,3)=(0,4)=r(0,4);0;255;,0,8;data:(0,5)=(0,6)=r(0,6);0;65535;,8,16;;",128,0,0,0
	.stabs	"int:t(0,1)",128,0,0,0
	.stabs	"uint8_t:t(0,3)",128,0,0,0
	.stabs	"unsigned char:t(0,4)",128,0,0,0
	.stabs	"uint16_t:t(0,5)",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
	.stabs	"patch:P(0,7)=*(0,8)=(0,9)=xss_vs_patch:",64,0,0,24
	.stabs	"s_vs_patch:T(0,9)=s8user_data:(0,10)=*(0,11)=(0,11),0,16;init:(0,12)=(0,13)=*(0,14)=f(0,1),16,16;cleanup:(0,15)=(0,16)=*(0,17)=f(0,11),32,16;get_next_instr:(0,18)=(0,19)=*(0,20)=f(0,1),48,16;;",128,0,0,0
	.stabs	"void:t(0,11)",128,0,0,0
	.stabs	"pfnvs_patch_init:t(0,12)",128,0,0,0
	.stabs	"pfnvs_patch_cleanup:t(0,15)",128,0,0,0
	.stabs	"pfnvs_patch_get_next_instr:t(0,18)",128,0,0,0
	.type	vs1002_patch_ima_adpcm_init, @function
vs1002_patch_ima_adpcm_init:
	.stabn	68,0,42,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,43,.LM1-.LFBB1
.LM1:
	movw r26,r24
	ld r30,X+
	ld r31,X
	.stabn	68,0,49,.LM2-.LFBB1
.LM2:
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,50,.LM3-.LFBB1
.LM3:
	std Z+3,__zero_reg__
	.stabn	68,0,51,.LM4-.LFBB1
.LM4:
	std Z+2,__zero_reg__
	.stabn	68,0,54,.LM5-.LFBB1
.LM5:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	vs1002_patch_ima_adpcm_init, .-vs1002_patch_ima_adpcm_init
	.stabs	"pfd:r(0,21)=*(0,22)=(0,23)=xss_vs_patch_file:",64,0,0,30
	.stabs	"s_vs_patch_file:T(0,23)=s26act:(0,24)=(0,25)=xss_vs_patch_act:,0,32;line:(0,26)=ar(0,27)=r(0,27);0;65535;;0;19;(0,28)=r(0,28);0;255;,32,160;num_instr:(0,3),192,8;flags:(0,3),200,8;;",128,0,0,0
	.stabs	"vs_patch_file_t:t(0,22)",128,0,0,0
	.stabs	"s_vs_patch_act:T(0,25)=s4instr:(0,29)=*(0,30)=(0,2),0,16;num_instr:(0,3),16,8;index:(0,31)=(0,32)=r(0,32);-128;127;,24,8;;",128,0,0,0
	.stabs	"char:t(0,28)",128,0,0,0
	.stabs	"int8_t:t(0,31)",128,0,0,0
	.stabs	"signed char:t(0,32)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.stabs	"vs1002_patch_ima_adpcm_apply:F(0,33)=eFalse:0,True:1,;",36,0,0,vs1002_patch_ima_adpcm_apply
	.stabs	"_Bool:t(0,33)",128,0,0,0
	.stabs	"file_name:P(0,34)=*(0,28)",64,0,0,24
.global	vs1002_patch_ima_adpcm_apply
	.type	vs1002_patch_ima_adpcm_apply, @function
vs1002_patch_ima_adpcm_apply:
	.stabn	68,0,57,.LM6-.LFBB2
.LM6:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,58,.LM7-.LFBB2
.LM7:
	ldi r22,lo8(gs(vs1002_patch_ima_adpcm_init))
	ldi r23,hi8(gs(vs1002_patch_ima_adpcm_init))
	jmp vs_patch_apply_from_file
	.size	vs1002_patch_ima_adpcm_apply, .-vs1002_patch_ima_adpcm_apply
.Lscope2:
	.stabs	"vs1002_set_clockf:F(0,11)",36,0,0,vs1002_set_clockf
	.stabs	"xtal_freq:P(0,35)=(0,36)=r(0,36);0;4294967295;",64,0,0,22
	.stabs	"clock_doubler:P(0,1)",64,0,0,20
	.stabs	"uint32_t:t(0,35)",128,0,0,0
	.stabs	"long unsigned int:t(0,36)",128,0,0,0
.global	vs1002_set_clockf
	.type	vs1002_set_clockf, @function
vs1002_set_clockf:
	.stabn	68,0,76,.LM8-.LFBB3
.LM8:
.LFBB3:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 8 */
.L__stack_usage = 8
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	std Y+6,r21
	std Y+5,r20
	.stabn	68,0,77,.LM9-.LFBB3
.LM9:
	ldi r18,lo8(-48)
	ldi r19,lo8(7)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	.stabn	68,0,78,.LM10-.LFBB3
.LM10:
	ldd r24,Y+5
	ldd r25,Y+6
	or r24,r25
	brne .L4
.L6:
	.stabn	68,0,79,.LM11-.LFBB3
.LM11:
	sts vs_reg+1,r19
	sts vs_reg,r18
	.stabn	68,0,81,.LM12-.LFBB3
.LM12:
	lds r22,vs_reg
	lds r23,vs_reg+1
	ldi r24,lo8(3)
	call vs_sci_write
.LBB12:
.LBB13:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM13-.LFBB3
.LM13:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE13:
.LBE12:
	.stabs	"src/sound/vs1002.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,83,.LM14-.LFBB3
.LM14:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
.L4:
	.stabn	68,0,79,.LM15-.LFBB3
.LM15:
	ori r19,128
	rjmp .L6
	.size	vs1002_set_clockf, .-vs1002_set_clockf
.Lscope3:
	.stabs	"vs1002_suspend:F(0,11)",36,0,0,vs1002_suspend
.global	vs1002_suspend
	.type	vs1002_suspend, @function
vs1002_suspend:
	.stabn	68,0,86,.LM16-.LFBB4
.LM16:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,87,.LM17-.LFBB4
.LM17:
	ldi r24,0
	call vs_sci_read
	.stabn	68,0,87,.LM18-.LFBB4
.LM18:
	sts vs_reg,r24
	sts vs_reg+1,r25
	.stabn	68,0,88,.LM19-.LFBB4
.LM19:
	sbrc r24,4
	rjmp .L7
	.stabn	68,0,92,.LM20-.LFBB4
.LM20:
	call vs_analog_power_down
	.stabn	68,0,94,.LM21-.LFBB4
.LM21:
	lds r22,vs_reg
	lds r23,vs_reg+1
	ori r22,16
	ldi r24,0
	call vs_sci_write
.LBB14:
.LBB15:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,187,.LM22-.LFBB4
.LM22:
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.L7:
/* epilogue start */
.LBE15:
.LBE14:
	.stabs	"src/sound/vs1002.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,96,.LM23-.LFBB4
.LM23:
	ret
	.size	vs1002_suspend, .-vs1002_suspend
.Lscope4:
	.stabs	"vs1002_resume:F(0,11)",36,0,0,vs1002_resume
.global	vs1002_resume
	.type	vs1002_resume, @function
vs1002_resume:
	.stabn	68,0,99,.LM24-.LFBB5
.LM24:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,100,.LM25-.LFBB5
.LM25:
	ldi r24,0
	call vs_sci_read
	movw r22,r24
	.stabn	68,0,100,.LM26-.LFBB5
.LM26:
	sts vs_reg+1,r25
	sts vs_reg,r24
	.stabn	68,0,101,.LM27-.LFBB5
.LM27:
	sbrs r24,4
	rjmp .L9
	.stabn	68,0,104,.LM28-.LFBB5
.LM28:
	andi r22,239
	ldi r24,0
	call vs_sci_write
.LBB16:
.LBB17:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM29-.LFBB5
.LM29:
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.L9:
/* epilogue start */
.LBE17:
.LBE16:
	.stabs	"src/sound/vs1002.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,106,.LM30-.LFBB5
.LM30:
	ret
	.size	vs1002_resume, .-vs1002_resume
.Lscope5:
	.stabs	"vs1002_adpcm_rec_start:F(0,11)",36,0,0,vs1002_adpcm_rec_start
	.stabs	"highpass_filter:P(0,1)",64,0,0,28
.global	vs1002_adpcm_rec_start
	.type	vs1002_adpcm_rec_start, @function
vs1002_adpcm_rec_start:
	.stabn	68,0,109,.LM31-.LFBB6
.LM31:
.LFBB6:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	.stabn	68,0,117,.LM32-.LFBB6
.LM32:
	ldi r22,lo8(12)
	ldi r23,0
	ldi r24,lo8(12)
	call vs_sci_write
	.stabn	68,0,122,.LM33-.LFBB6
.LM33:
	ldi r22,0
	ldi r23,lo8(4)
	ldi r24,lo8(13)
	call vs_sci_write
	.stabn	68,0,125,.LM34-.LFBB6
.LM34:
	ldi r22,lo8(64)
	ldi r23,lo8(31)
	ldi r24,lo8(5)
	call vs_sci_write
.LBB22:
.LBB23:
	.stabn	68,0,64,.LM35-.LFBB6
.LM35:
	ldi r22,lo8(48)
	ldi r23,0
	ldi r24,lo8(10)
	call vs_sci_write
.LBB24:
.LBB25:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,187,.LM36-.LFBB6
.LM36:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE25:
.LBE24:
.LBE23:
.LBE22:
	.stabs	"src/sound/vs1002.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,133,.LM37-.LFBB6
.LM37:
	ldi r23,0
	ldi r22,0
	ldi r24,0
	ldi r25,lo8(48)
	.stabn	68,0,132,.LM38-.LFBB6
.LM38:
	or r28,r29
	brne .L17
	.stabn	68,0,135,.LM39-.LFBB6
.LM39:
	ldi r22,0
	ldi r23,lo8(32)
	ldi r24,0
	ldi r25,lo8(16)
.L17:
	call vs_sw_reset
	.stabn	68,0,138,.LM40-.LFBB6
.LM40:
	ldi r20,lo8(1)
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(-128)
	ldi r24,lo8(-69)
	ldi r25,0
/* epilogue start */
	.stabn	68,0,139,.LM41-.LFBB6
.LM41:
	pop r29
	pop r28
	.stabn	68,0,138,.LM42-.LFBB6
.LM42:
	jmp vs_set_clockf
	.size	vs1002_adpcm_rec_start, .-vs1002_adpcm_rec_start
.Lscope6:
	.stabs	"vs1002_adpcm_rec_stop:F(0,11)",36,0,0,vs1002_adpcm_rec_stop
.global	vs1002_adpcm_rec_stop
	.type	vs1002_adpcm_rec_stop, @function
vs1002_adpcm_rec_stop:
	.stabn	68,0,142,.LM43-.LFBB7
.LM43:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB30:
.LBB31:
	.stabn	68,0,71,.LM44-.LFBB7
.LM44:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(10)
	call vs_sci_write
.LBB32:
.LBB33:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,187,.LM45-.LFBB7
.LM45:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE33:
.LBE32:
.LBE31:
.LBE30:
	.stabs	"src/sound/vs1002.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,146,.LM46-.LFBB7
.LM46:
	ldi r22,0
	ldi r23,lo8(48)
	ldi r25,0
	ldi r24,0
	call vs_sw_reset
	.stabn	68,0,149,.LM47-.LFBB7
.LM47:
	ldi r20,lo8(1)
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(-128)
	ldi r24,lo8(-69)
	ldi r25,0
	jmp vs_set_clockf
	.size	vs1002_adpcm_rec_stop, .-vs1002_adpcm_rec_stop
.Lscope7:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
