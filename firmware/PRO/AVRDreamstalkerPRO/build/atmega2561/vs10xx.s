	.file	"vs10xx.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs10xx.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs_wait_for_dreq:f(0,1)=(0,1)",36,0,0,vs_wait_for_dreq
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"uint16_t:t(0,4)=(0,5)=r(0,5);0;65535;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.type	vs_wait_for_dreq, @function
vs_wait_for_dreq:
	.stabn	68,0,54,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L2:
	.stabn	68,0,55,.LM1-.LFBB1
.LM1:
	sbis 0x3,4
	rjmp .L2
/* epilogue start */
	.stabn	68,0,56,.LM2-.LFBB1
.LM2:
	ret
	.size	vs_wait_for_dreq, .-vs_wait_for_dreq
.Lscope1:
	.stabs	"vs_patch_file_close:f(0,1)",36,0,0,vs_patch_file_close
	.stabs	"patch:P(0,6)=*(0,7)=(0,8)=xss_vs_patch:",64,0,0,24
	.stabs	"s_vs_patch:T(0,8)=s8user_data:(0,9)=*(0,1),0,16;init:(0,10)=(0,11)=*(0,12)=f(0,13)=r(0,13);-32768;32767;,16,16;cleanup:(0,14)=(0,15)=*(0,16)=f(0,1),32,16;get_next_instr:(0,17)=(0,18)=*(0,19)=f(0,13),48,16;;",128,0,0,0
	.stabs	"pfnvs_patch_init:t(0,10)",128,0,0,0
	.stabs	"int:t(0,13)",128,0,0,0
	.stabs	"pfnvs_patch_cleanup:t(0,14)",128,0,0,0
	.stabs	"pfnvs_patch_get_next_instr:t(0,17)",128,0,0,0
	.type	vs_patch_file_close, @function
vs_patch_file_close:
	.stabn	68,0,185,.LM3-.LFBB2
.LM3:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,186,.LM4-.LFBB2
.LM4:
	ldi r24,lo8(shared_fp)
	ldi r25,hi8(shared_fp)
	jmp f_close
	.size	vs_patch_file_close, .-vs_patch_file_close
.Lscope2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%*s %x %x %x"
	.text
	.stabs	"vs_patch_file_next_instr:f(0,13)",36,0,0,vs_patch_file_next_instr
	.stabs	"patch:P(0,6)",64,0,0,24
	.stabs	"instr:P(0,20)=*(0,21)=(0,22)=xss_vs_sci_instr:",64,0,0,14
	.stabs	"s_vs_sci_instr:T(0,22)=s3reg:(0,2),0,8;data:(0,4),8,16;;",128,0,0,0
	.type	vs_patch_file_next_instr, @function
vs_patch_file_next_instr:
	.stabn	68,0,153,.LM5-.LFBB3
.LM5:
.LFBB3:
	push r12
	push r13
	push r14
	push r15
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
/* stack size = 14 */
.L__stack_usage = 14
	movw r14,r22
	.stabn	68,0,154,.LM6-.LFBB3
.LM6:
	movw r26,r24
	ld r16,X+
	ld r17,X
	.stabn	68,0,156,.LM7-.LFBB3
.LM7:
	movw r30,r16
	ldd r24,Z+25
	sbrs r24,7
	rjmp .L7
.L15:
	.stabn	68,0,173,.LM8-.LFBB3
.LM8:
	movw r26,r16
	adiw r26,2
	ld r25,X
	sbiw r26,2
	.stabn	68,0,173,.LM9-.LFBB3
.LM9:
	cpse r25,__zero_reg__
	rjmp .L20
.L19:
	.stabn	68,0,174,.LM10-.LFBB3
.LM10:
	ldi r24,lo8(2)
	ldi r25,0
	rjmp .L6
.L7:
	.stabn	68,0,158,.LM11-.LFBB3
.LM11:
	movw r12,r16
	ldi r27,4
	add r12,r27
	adc r13,__zero_reg__
	.stabn	68,0,158,.LM12-.LFBB3
.LM12:
	ldi r20,lo8(shared_fp)
	ldi r21,hi8(shared_fp)
	ldi r22,lo8(20)
	ldi r23,0
	movw r24,r12
	call f_gets
	.stabn	68,0,158,.LM13-.LFBB3
.LM13:
	or r24,r25
	brne .+2
	rjmp .L10
	.stabn	68,0,160,.LM14-.LFBB3
.LM14:
	ldi r22,lo8(35)
	ldi r23,0
	movw r24,r12
	call strchr
	.stabn	68,0,160,.LM15-.LFBB3
.LM15:
	or r24,r25
	breq .L11
.L21:
	.stabn	68,0,180,.LM16-.LFBB3
.LM16:
	ldi r24,lo8(1)
	ldi r25,0
.L6:
/* epilogue start */
	.stabn	68,0,181,.LM17-.LFBB3
.LM17:
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
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L11:
.LBB27:
.LBB28:
	.stabn	68,0,140,.LM18-.LFBB3
.LM18:
	movw r24,r28
	adiw r24,1
	push r25
	push r24
	adiw r24,2
	push r25
	push r24
	adiw r24,2
	push r25
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r13
	push r12
	call sscanf
	.stabn	68,0,140,.LM19-.LFBB3
.LM19:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	sbiw r24,3
	breq .L12
.L18:
.LBE28:
.LBE27:
	.stabn	68,0,169,.LM20-.LFBB3
.LM20:
	ldi r25,0
	ldi r24,0
	rjmp .L6
.L12:
.LBB30:
.LBB29:
	.stabn	68,0,141,.LM21-.LFBB3
.LM21:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,2
	brne .L18
	.stabn	68,0,142,.LM22-.LFBB3
.LM22:
	ldd r24,Y+3
	movw r26,r14
	st X,r24
	.stabn	68,0,143,.LM23-.LFBB3
.LM23:
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r26,1+1
	st X,r25
	st -X,r24
	sbiw r26,1
.LBE29:
.LBE30:
	.stabn	68,0,164,.LM24-.LFBB3
.LM24:
	movw r30,r16
	ldd r24,Z+24
	subi r24,lo8(-(1))
	std Z+24,r24
.L14:
	.stabn	68,0,172,.LM25-.LFBB3
.LM25:
	movw r30,r16
	ldd r24,Z+25
	sbrs r24,7
	rjmp .L21
	rjmp .L15
.L10:
	.stabn	68,0,166,.LM26-.LFBB3
.LM26:
	lds r20,shared_fp+16
	lds r21,shared_fp+16+1
	lds r22,shared_fp+16+2
	lds r23,shared_fp+16+3
	lds r24,shared_fp+10
	lds r25,shared_fp+10+1
	lds r26,shared_fp+10+2
	lds r27,shared_fp+10+3
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brne .L18
	.stabn	68,0,167,.LM27-.LFBB3
.LM27:
	movw r26,r16
	adiw r26,25
	ld r24,X
	sbiw r26,25
	ori r24,lo8(-128)
	adiw r26,25
	st X,r24
	rjmp .L14
.L20:
	.stabn	68,0,173,.LM28-.LFBB3
.LM28:
	adiw r26,3
	ld r24,X
	sbiw r26,3
	mov r18,r24
	mov __tmp_reg__,r24
	lsl r0
	sbc r19,r19
	.stabn	68,0,173,.LM29-.LFBB3
.LM29:
	cp r25,r18
	cpc __zero_reg__,r19
	brne .+2
	rjmp .L19
	.stabn	68,0,177,.LM30-.LFBB3
.LM30:
	ld r30,X+
	ld r31,X
	sbiw r26,1
	.stabn	68,0,177,.LM31-.LFBB3
.LM31:
	ldi r25,lo8(1)
	add r25,r24
	adiw r26,3
	st X,r25
	.stabn	68,0,177,.LM32-.LFBB3
.LM32:
	ldi r25,lo8(3)
	.stabn	68,0,177,.LM33-.LFBB3
.LM33:
	muls r24,r25
	add r30,r0
	adc r31,r1
	clr __zero_reg__
	.stabn	68,0,177,.LM34-.LFBB3
.LM34:
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r25
	brne 0b
	rjmp .L21
	.size	vs_patch_file_next_instr, .-vs_patch_file_next_instr
	.stabs	"pfd:r(0,23)=*(0,24)=(0,25)=xss_vs_patch_file:",64,0,0,16
	.stabs	"s_vs_patch_file:T(0,25)=s26act:(0,26)=(0,27)=xss_vs_patch_act:,0,32;line:(0,28)=ar(0,29)=r(0,29);0;65535;;0;19;(0,30)=r(0,30);0;255;,32,160;num_instr:(0,2),192,8;flags:(0,2),200,8;;",128,0,0,0
	.stabs	"vs_patch_file_t:t(0,24)",128,0,0,0
	.stabs	"s_vs_patch_act:T(0,27)=s4instr:(0,20),0,16;num_instr:(0,2),16,8;index:(0,31)=(0,32)=r(0,32);-128;127;,24,8;;",128,0,0,0
	.stabs	"char:t(0,30)",128,0,0,0
	.stabs	"int8_t:t(0,31)",128,0,0,0
	.stabs	"signed char:t(0,32)",128,0,0,0
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabs	"op:(0,13)",128,0,0,5
	.stabs	"reg:(0,13)",128,0,0,3
	.stabs	"val:(0,13)",128,0,0,1
	.stabn	192,0,0,.LBB28-.LFBB3
	.stabn	224,0,0,.LBE28-.LFBB3
	.stabs	"op:(0,13)",128,0,0,5
	.stabs	"reg:(0,13)",128,0,0,3
	.stabs	"val:(0,13)",128,0,0,1
	.stabn	192,0,0,.LBB29-.LFBB3
	.stabn	224,0,0,.LBE29-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"vs_is_dreq:F(0,33)=eFalse:0,True:1,;",36,0,0,vs_is_dreq
	.stabs	"_Bool:t(0,33)",128,0,0,0
.global	vs_is_dreq
	.type	vs_is_dreq, @function
vs_is_dreq:
	.stabn	68,0,77,.LM35-.LFBB4
.LM35:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,78,.LM36-.LFBB4
.LM36:
	in r24,0x3
	.stabn	68,0,79,.LM37-.LFBB4
.LM37:
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	vs_is_dreq, .-vs_is_dreq
.Lscope4:
	.stabs	"vs_get_hw_spec:F(0,34)=(0,35)=xee_vs_hw_spec:",36,0,0,vs_get_hw_spec
	.stabs	"e_vs_hw_spec:T(0,35)=eVS_HWS_UNKNOWN:0,VS_HWS_1002:2,VS_HWS_1003:3,VS_HWS_1053:53,;",128,0,0,0
.global	vs_get_hw_spec
	.type	vs_get_hw_spec, @function
vs_get_hw_spec:
	.stabn	68,0,107,.LM38-.LFBB5
.LM38:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,109,.LM39-.LFBB5
.LM39:
	lds r24,vs_hws
	lds r25,vs_hws+1
/* epilogue start */
	ret
	.size	vs_get_hw_spec, .-vs_get_hw_spec
.Lscope5:
	.stabs	"vs_suspend:F(0,1)",36,0,0,vs_suspend
.global	vs_suspend
	.type	vs_suspend, @function
vs_suspend:
	.stabn	68,0,233,.LM40-.LFBB6
.LM40:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB31:
.LBB32:
	.stabn	68,0,108,.LM41-.LFBB6
.LM41:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE32:
.LBE31:
	.stabn	68,0,234,.LM42-.LFBB6
.LM42:
	cpi r24,4
	cpc r25,__zero_reg__
	brsh .L25
	sbiw r24,2
	brlo .L24
	.stabn	68,0,237,.LM43-.LFBB6
.LM43:
	jmp vs1002_suspend
.L25:
	.stabn	68,0,234,.LM44-.LFBB6
.LM44:
	sbiw r24,53
	breq .L28
	ret
.L28:
	.stabn	68,0,241,.LM45-.LFBB6
.LM45:
	jmp vs1053_suspend
.L24:
/* epilogue start */
	.stabn	68,0,247,.LM46-.LFBB6
.LM46:
	ret
	.size	vs_suspend, .-vs_suspend
.Lscope6:
	.stabs	"vs_resume:F(0,1)",36,0,0,vs_resume
.global	vs_resume
	.type	vs_resume, @function
vs_resume:
	.stabn	68,0,250,.LM47-.LFBB7
.LM47:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB33:
.LBB34:
	.stabn	68,0,108,.LM48-.LFBB7
.LM48:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE34:
.LBE33:
	.stabn	68,0,251,.LM49-.LFBB7
.LM49:
	cpi r24,4
	cpc r25,__zero_reg__
	brsh .L30
	sbiw r24,2
	brlo .L29
	.stabn	68,0,254,.LM50-.LFBB7
.LM50:
	jmp vs1002_resume
.L30:
	.stabn	68,0,251,.LM51-.LFBB7
.LM51:
	sbiw r24,53
	breq .L33
	ret
.L33:
	.stabn	68,0,258,.LM52-.LFBB7
.LM52:
	jmp vs1053_resume
.L29:
/* epilogue start */
	.stabn	68,0,264,.LM53-.LFBB7
.LM53:
	ret
	.size	vs_resume, .-vs_resume
.Lscope7:
	.stabs	"vs_power_down:F(0,1)",36,0,0,vs_power_down
.global	vs_power_down
	.type	vs_power_down, @function
vs_power_down:
	.stabn	68,0,267,.LM54-.LFBB8
.LM54:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,269,.LM55-.LFBB8
.LM55:
	ret
	.size	vs_power_down, .-vs_power_down
.Lscope8:
	.stabs	"vs_sci_select:F(0,1)",36,0,0,vs_sci_select
.global	vs_sci_select
	.type	vs_sci_select, @function
vs_sci_select:
	.stabn	68,0,286,.LM56-.LFBB9
.LM56:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,287,.LM57-.LFBB9
.LM57:
	cbi 0x5,6
/* epilogue start */
	.stabn	68,0,288,.LM58-.LFBB9
.LM58:
	ret
	.size	vs_sci_select, .-vs_sci_select
.Lscope9:
	.stabs	"vs_sci_unsel:F(0,1)",36,0,0,vs_sci_unsel
.global	vs_sci_unsel
	.type	vs_sci_unsel, @function
vs_sci_unsel:
	.stabn	68,0,290,.LM59-.LFBB10
.LM59:
.LFBB10:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,291,.LM60-.LFBB10
.LM60:
	sbi 0x5,6
/* epilogue start */
	.stabn	68,0,292,.LM61-.LFBB10
.LM61:
	ret
	.size	vs_sci_unsel, .-vs_sci_unsel
.Lscope10:
	.stabs	"vs_hw_reset:F(0,1)",36,0,0,vs_hw_reset
.global	vs_hw_reset
	.type	vs_hw_reset, @function
vs_hw_reset:
	.stabn	68,0,205,.LM62-.LFBB11
.LM62:
.LFBB11:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,206,.LM63-.LFBB11
.LM63:
	cbi 0xe,7
.LBB35:
.LBB36:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM64-.LFBB11
.LM64:
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE36:
.LBE35:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,208,.LM65-.LFBB11
.LM65:
	sbi 0xe,7
.LBB37:
.LBB38:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,187,.LM66-.LFBB11
.LM66:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE38:
.LBE37:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,211,.LM67-.LFBB11
.LM67:
	call vs_sci_select
	ldi r28,lo8(10)
	ldi r29,0
.L38:
.LBB39:
	.stabn	68,0,214,.LM68-.LFBB11
.LM68:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,213,.LM69-.LFBB11
.LM69:
	sbiw r28,1
	brne .L38
.LBE39:
	.stabn	68,0,215,.LM70-.LFBB11
.LM70:
	call vs_sci_unsel
.LBB40:
.LBB41:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM71-.LFBB11
.LM71:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE41:
.LBE40:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,217,.LM72-.LFBB11
.LM72:
	pop r29
	pop r28
	ret
	.size	vs_hw_reset, .-vs_hw_reset
.Lscope11:
	.stabs	"vs_sdi_select:F(0,1)",36,0,0,vs_sdi_select
.global	vs_sdi_select
	.type	vs_sdi_select, @function
vs_sdi_select:
	.stabn	68,0,295,.LM73-.LFBB12
.LM73:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,296,.LM74-.LFBB12
.LM74:
	cbi 0x5,7
/* epilogue start */
	.stabn	68,0,297,.LM75-.LFBB12
.LM75:
	ret
	.size	vs_sdi_select, .-vs_sdi_select
.Lscope12:
	.stabs	"vs_sdi_unsel:F(0,1)",36,0,0,vs_sdi_unsel
.global	vs_sdi_unsel
	.type	vs_sdi_unsel, @function
vs_sdi_unsel:
	.stabn	68,0,299,.LM76-.LFBB13
.LM76:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,300,.LM77-.LFBB13
.LM77:
	sbi 0x5,7
/* epilogue start */
	.stabn	68,0,301,.LM78-.LFBB13
.LM78:
	ret
	.size	vs_sdi_unsel, .-vs_sdi_unsel
.Lscope13:
	.stabs	"vs_set_clockf:F(0,1)",36,0,0,vs_set_clockf
.global	vs_set_clockf
	.type	vs_set_clockf, @function
vs_set_clockf:
	.stabn	68,0,304,.LM79-.LFBB14
.LM79:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB42:
.LBB43:
	.stabn	68,0,108,.LM80-.LFBB14
.LM80:
	lds r18,vs_hws
	lds r19,vs_hws+1
.LBE43:
.LBE42:
	.stabn	68,0,305,.LM81-.LFBB14
.LM81:
	cpi r18,3
	cpc r19,__zero_reg__
	breq .L43
	cpi r18,53
	cpc r19,__zero_reg__
	breq .L44
	cpi r18,2
	cpc r19,__zero_reg__
	brne .L42
	.stabn	68,0,307,.LM82-.LFBB14
.LM82:
	jmp vs1002_set_clockf
.L43:
	.stabn	68,0,311,.LM83-.LFBB14
.LM83:
	jmp vs1003_set_clockf
.L44:
	.stabn	68,0,315,.LM84-.LFBB14
.LM84:
	jmp vs1053_set_clockf
.L42:
/* epilogue start */
	.stabn	68,0,321,.LM85-.LFBB14
.LM85:
	ret
	.size	vs_set_clockf, .-vs_set_clockf
.Lscope14:
	.stabs	"vs_sci_read:F(0,4)",36,0,0,vs_sci_read
	.stabs	" :T(0,36)=eclock_div_1:0,clock_div_2:1,clock_div_4:2,clock_div_8:3,clock_div_16:4,clock_div_32:5,clock_div_64:6,clock_div_128:7,clock_div_256:8,;",128,0,0,0
	.stabs	"reg:P(0,2)",64,0,0,28
.global	vs_sci_read
	.type	vs_sci_read, @function
vs_sci_read:
	.stabn	68,0,342,.LM86-.LFBB15
.LM86:
.LFBB15:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.stabn	68,0,343,.LM87-.LFBB15
.LM87:
	call vs_wait_for_dreq
	.stabn	68,0,345,.LM88-.LFBB15
.LM88:
	ldi r24,lo8(3)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,345,.LM89-.LFBB15
.LM89:
	sts vs_div+1,r25
	sts vs_div,r24
	.stabn	68,0,347,.LM90-.LFBB15
.LM90:
	call vs_sci_select
	.stabn	68,0,350,.LM91-.LFBB15
.LM91:
	ldi r24,lo8(3)
	call spi_xchg
	.stabn	68,0,351,.LM92-.LFBB15
.LM92:
	mov r24,r28
	call spi_xchg
	.stabn	68,0,354,.LM93-.LFBB15
.LM93:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,354,.LM94-.LFBB15
.LM94:
	sts vs_reg,__zero_reg__
	sts vs_reg+1,r24
	.stabn	68,0,355,.LM95-.LFBB15
.LM95:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,355,.LM96-.LFBB15
.LM96:
	lds r18,vs_reg
	lds r19,vs_reg+1
	or r18,r24
	sts vs_reg+1,r19
	sts vs_reg,r18
	.stabn	68,0,357,.LM97-.LFBB15
.LM97:
	call vs_sci_unsel
	.stabn	68,0,358,.LM98-.LFBB15
.LM98:
	lds r24,vs_div
	lds r25,vs_div+1
	call spi_set_clk
	.stabn	68,0,360,.LM99-.LFBB15
.LM99:
	lds r24,vs_reg
	lds r25,vs_reg+1
/* epilogue start */
	pop r28
	ret
	.size	vs_sci_read, .-vs_sci_read
.Lscope15:
	.stabs	"vs_is_analog_power_down:F(0,33)",36,0,0,vs_is_analog_power_down
.global	vs_is_analog_power_down
	.type	vs_is_analog_power_down, @function
vs_is_analog_power_down:
	.stabn	68,0,226,.LM100-.LFBB16
.LM100:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,227,.LM101-.LFBB16
.LM101:
	ldi r24,lo8(11)
	call vs_sci_read
	movw r18,r24
	.stabn	68,0,227,.LM102-.LFBB16
.LM102:
	sts vs_reg+1,r25
	sts vs_reg,r24
	.stabn	68,0,229,.LM103-.LFBB16
.LM103:
	ldi r24,lo8(1)
	cpi r18,-1
	sbci r19,-1
	breq .L48
	ldi r24,0
.L48:
/* epilogue start */
	.stabn	68,0,230,.LM104-.LFBB16
.LM104:
	ret
	.size	vs_is_analog_power_down, .-vs_is_analog_power_down
.Lscope16:
	.stabs	"vs_sci_write:F(0,1)",36,0,0,vs_sci_write
	.stabs	"reg:P(0,2)",64,0,0,17
.global	vs_sci_write
	.type	vs_sci_write, @function
vs_sci_write:
	.stabn	68,0,363,.LM105-.LFBB17
.LM105:
.LFBB17:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	movw r28,r22
	.stabn	68,0,364,.LM106-.LFBB17
.LM106:
	call vs_wait_for_dreq
	.stabn	68,0,366,.LM107-.LFBB17
.LM107:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,366,.LM108-.LFBB17
.LM108:
	sts vs_div+1,r25
	sts vs_div,r24
	.stabn	68,0,368,.LM109-.LFBB17
.LM109:
	call vs_sci_select
	.stabn	68,0,371,.LM110-.LFBB17
.LM110:
	ldi r24,lo8(2)
	call spi_xchg
	.stabn	68,0,372,.LM111-.LFBB17
.LM111:
	mov r24,r17
	call spi_xchg
	.stabn	68,0,375,.LM112-.LFBB17
.LM112:
	mov r24,r29
	call spi_xchg
	.stabn	68,0,376,.LM113-.LFBB17
.LM113:
	mov r24,r28
	call spi_xchg
	.stabn	68,0,378,.LM114-.LFBB17
.LM114:
	call vs_sci_unsel
	.stabn	68,0,379,.LM115-.LFBB17
.LM115:
	lds r24,vs_div
	lds r25,vs_div+1
/* epilogue start */
	.stabn	68,0,380,.LM116-.LFBB17
.LM116:
	pop r29
	pop r28
	pop r17
	.stabn	68,0,379,.LM117-.LFBB17
.LM117:
	jmp spi_set_clk
	.size	vs_sci_write, .-vs_sci_write
.Lscope17:
	.stabs	"vs_patch_apply:F(0,33)",36,0,0,vs_patch_apply
	.stabs	"patch:P(0,6)",64,0,0,16
.global	vs_patch_apply
	.type	vs_patch_apply, @function
vs_patch_apply:
	.stabn	68,0,112,.LM118-.LFBB18
.LM118:
.LFBB18:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
	.stabn	68,0,116,.LM119-.LFBB18
.LM119:
	movw r26,r24
	adiw r26,2
	ld r30,X+
	ld r31,X
	.stabn	68,0,116,.LM120-.LFBB18
.LM120:
	sbiw r30,0
	brne .L54
.L55:
.LBB46:
.LBB47:
	.stabn	68,0,122,.LM121-.LFBB18
.LM121:
	movw r26,r16
	adiw r26,6
	ld r30,X+
	ld r31,X
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	eicall
	movw r14,r24
	.stabn	68,0,122,.LM122-.LFBB18
.LM122:
	or r24,r25
	brne .L57
.L56:
	.stabn	68,0,128,.LM123-.LFBB18
.LM123:
	movw r26,r16
	adiw r26,4
	ld r30,X+
	ld r31,X
	.stabn	68,0,128,.LM124-.LFBB18
.LM124:
	sbiw r30,0
	breq .L58
	.stabn	68,0,129,.LM125-.LFBB18
.LM125:
	movw r24,r16
	eicall
.L58:
	.stabn	68,0,131,.LM126-.LFBB18
.LM126:
	ldi r24,lo8(1)
	or r14,r15
	brne .L53
.L68:
.LBE47:
.LBE46:
	.stabn	68,0,119,.LM127-.LFBB18
.LM127:
	ldi r24,0
.L53:
/* epilogue start */
	.stabn	68,0,132,.LM128-.LFBB18
.LM128:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L57:
.LBB49:
.LBB48:
	.stabn	68,0,123,.LM129-.LFBB18
.LM129:
	ldi r27,2
	cp r14,r27
	cpc r15,__zero_reg__
	breq .L56
	.stabn	68,0,125,.LM130-.LFBB18
.LM130:
	ldd r22,Y+2
	ldd r23,Y+3
	ldd r24,Y+1
	call vs_sci_write
	rjmp .L55
.L54:
.LBE48:
.LBE49:
	.stabn	68,0,117,.LM131-.LFBB18
.LM131:
	eicall
	.stabn	68,0,118,.LM132-.LFBB18
.LM132:
	or r24,r25
	brne .L55
	rjmp .L68
	.size	vs_patch_apply, .-vs_patch_apply
	.stabs	"instr:(0,21)",128,0,0,1
	.stabs	"vs_sci_instr_t:t(0,21)",128,0,0,0
	.stabs	"ret:r(0,13)",64,0,0,14
	.stabn	192,0,0,.LBB47-.LFBB18
	.stabn	224,0,0,.LBE47-.LFBB18
	.stabs	"instr:(0,21)",128,0,0,1
	.stabs	"ret:r(0,13)",64,0,0,14
	.stabn	192,0,0,.LBB48-.LFBB18
	.stabn	224,0,0,.LBE48-.LFBB18
.Lscope18:
	.stabs	"vs_patch_apply_from_file:F(0,33)",36,0,0,vs_patch_apply_from_file
	.stabs	" :T(0,37)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
	.stabs	"init_func:P(0,10)",64,0,0,22
.global	vs_patch_apply_from_file
	.type	vs_patch_apply_from_file, @function
vs_patch_apply_from_file:
	.stabn	68,0,191,.LM133-.LFBB19
.LM133:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,192,.LM134-.LFBB19
.LM134:
	sts vs_patch+2+1,r23
	sts vs_patch+2,r22
	.stabn	68,0,193,.LM135-.LFBB19
.LM135:
	ldi r18,lo8(gs(vs_patch_file_next_instr))
	ldi r19,hi8(gs(vs_patch_file_next_instr))
	sts vs_patch+6+1,r19
	sts vs_patch+6,r18
	.stabn	68,0,194,.LM136-.LFBB19
.LM136:
	ldi r18,lo8(gs(vs_patch_file_close))
	ldi r19,hi8(gs(vs_patch_file_close))
	sts vs_patch+4+1,r19
	sts vs_patch+4,r18
	.stabn	68,0,195,.LM137-.LFBB19
.LM137:
	ldi r30,lo8(vs_patch_file)
	ldi r31,hi8(vs_patch_file)
	sts vs_patch+1,r31
	sts vs_patch,r30
	.stabn	68,0,196,.LM138-.LFBB19
.LM138:
	ldi r18,lo8(26)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r18
	brne 0b
	.stabn	68,0,198,.LM139-.LFBB19
.LM139:
	ldi r20,lo8(1)
	movw r22,r24
	ldi r24,lo8(shared_fp)
	ldi r25,hi8(shared_fp)
	call f_open
	.stabn	68,0,198,.LM140-.LFBB19
.LM140:
	or r24,r25
	brne .L70
	.stabn	68,0,201,.LM141-.LFBB19
.LM141:
	ldi r24,lo8(vs_patch)
	ldi r25,hi8(vs_patch)
	jmp vs_patch_apply
.L70:
	.stabn	68,0,202,.LM142-.LFBB19
.LM142:
	ldi r24,0
/* epilogue start */
	ret
	.size	vs_patch_apply_from_file, .-vs_patch_apply_from_file
.Lscope19:
	.stabs	"vs_analog_power_down:F(0,1)",36,0,0,vs_analog_power_down
.global	vs_analog_power_down
	.type	vs_analog_power_down, @function
vs_analog_power_down:
	.stabn	68,0,220,.LM143-.LFBB20
.LM143:
.LFBB20:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,222,.LM144-.LFBB20
.LM144:
	ldi r22,lo8(-1)
	ldi r23,lo8(-1)
	ldi r24,lo8(11)
	jmp vs_sci_write
	.size	vs_analog_power_down, .-vs_analog_power_down
.Lscope20:
	.stabs	"vs_init:F(0,33)",36,0,0,vs_init
.global	vs_init
	.type	vs_init, @function
vs_init:
	.stabn	68,0,82,.LM145-.LFBB21
.LM145:
.LFBB21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,83,.LM146-.LFBB21
.LM146:
	sbi 0xd,7
	in r24,0x4
	ori r24,lo8(-64)
	out 0x4,r24
	cbi 0x4,4
	.stabn	68,0,85,.LM147-.LFBB21
.LM147:
	call spi_enable
	.stabn	68,0,87,.LM148-.LFBB21
.LM148:
	call vs_sci_unsel
	.stabn	68,0,88,.LM149-.LFBB21
.LM149:
	call vs_sdi_unsel
	.stabn	68,0,90,.LM150-.LFBB21
.LM150:
	call vs_hw_reset
.LBB54:
.LBB55:
	.stabn	68,0,61,.LM151-.LFBB21
.LM151:
	ldi r24,lo8(1)
	call vs_sci_read
	movw r18,r24
	.stabn	68,0,61,.LM152-.LFBB21
.LM152:
	sts vs_reg+1,r25
	sts vs_reg,r24
	.stabn	68,0,63,.LM153-.LFBB21
.LM153:
	sbrc r24,6
	rjmp .L75
	.stabn	68,0,66,.LM154-.LFBB21
.LM154:
	andi r24,48
	clr r25
	.stabn	68,0,66,.LM155-.LFBB21
.LM155:
	sbiw r24,48
	breq .L76
	.stabn	68,0,69,.LM156-.LFBB21
.LM156:
	sbrc r18,5
	rjmp .L77
	.stabn	68,0,73,.LM157-.LFBB21
.LM157:
	sts vs_hws+1,__zero_reg__
	sts vs_hws,__zero_reg__
.LBE55:
.LBE54:
	.stabn	68,0,95,.LM158-.LFBB21
.LM158:
	ldi r24,0
	ret
.L75:
.LBB58:
.LBB56:
	ldi r24,lo8(53)
	ldi r25,0
.L73:
	.stabn	68,0,70,.LM159-.LFBB21
.LM159:
	sts vs_hws+1,r25
	sts vs_hws,r24
.LBE56:
.LBE58:
	.stabn	68,0,100,.LM160-.LFBB21
.LM160:
	ldi r20,lo8(1)
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(-128)
	ldi r24,lo8(-69)
	ldi r25,0
	call vs_set_clockf
	.stabn	68,0,101,.LM161-.LFBB21
.LM161:
	call vs_analog_power_down
	.stabn	68,0,103,.LM162-.LFBB21
.LM162:
	ldi r24,lo8(1)
/* epilogue start */
	.stabn	68,0,104,.LM163-.LFBB21
.LM163:
	ret
.L76:
.LBB59:
.LBB57:
	ldi r24,lo8(3)
	ldi r25,0
	rjmp .L73
.L77:
	ldi r24,lo8(2)
	ldi r25,0
	rjmp .L73
.LBE57:
.LBE59:
	.size	vs_init, .-vs_init
.Lscope21:
	.stabs	"vs_sw_reset:F(0,1)",36,0,0,vs_sw_reset
	.stabs	"mask_add:P(0,4)",64,0,0,16
	.stabs	"mask_remove:P(0,4)",64,0,0,28
.global	vs_sw_reset
	.type	vs_sw_reset, @function
vs_sw_reset:
	.stabn	68,0,272,.LM164-.LFBB22
.LM164:
.LFBB22:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	movw r28,r22
	.stabn	68,0,273,.LM165-.LFBB22
.LM165:
	ldi r24,0
	call vs_sci_read
	.stabn	68,0,274,.LM166-.LFBB22
.LM166:
	com r28
	com r29
	.stabn	68,0,274,.LM167-.LFBB22
.LM167:
	movw r22,r28
	and r22,r24
	and r23,r25
	.stabn	68,0,275,.LM168-.LFBB22
.LM168:
	or r22,r16
	or r23,r17
	ori r22,4
	sts vs_reg+1,r23
	sts vs_reg,r22
	.stabn	68,0,276,.LM169-.LFBB22
.LM169:
	ldi r24,0
	call vs_sci_write
.LBB60:
.LBB61:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,187,.LM170-.LFBB22
.LM170:
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE61:
.LBE60:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,278,.LM171-.LFBB22
.LM171:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	vs_sw_reset, .-vs_sw_reset
.Lscope22:
	.stabs	"vs_set_volume:F(0,1)",36,0,0,vs_set_volume
	.stabs	"left_db:P(0,2)",64,0,0,24
	.stabs	"right_db:P(0,2)",64,0,0,25
.global	vs_set_volume
	.type	vs_set_volume, @function
vs_set_volume:
	.stabn	68,0,324,.LM172-.LFBB23
.LM172:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r25,r22
	.stabn	68,0,330,.LM173-.LFBB23
.LM173:
	cpi r24,lo8(-1)
	brlo .L80
	ldi r24,lo8(-2)
.L80:
	mov r22,r24
	ldi r23,0
	.stabn	68,0,331,.LM174-.LFBB23
.LM174:
	mov r23,r22
	clr r22
	.stabn	68,0,331,.LM175-.LFBB23
.LM175:
	cpi r25,lo8(-1)
	brlo .L81
	ldi r25,lo8(-2)
.L81:
	or r22,r25
	.stabn	68,0,331,.LM176-.LFBB23
.LM176:
	sts vs_reg+1,r23
	sts vs_reg,r22
	.stabn	68,0,333,.LM177-.LFBB23
.LM177:
	ldi r24,lo8(11)
	call vs_sci_write
.LBB62:
.LBB63:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,187,.LM178-.LFBB23
.LM178:
	ldi r24,lo8(1999)
	ldi r25,hi8(1999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE63:
.LBE62:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,335,.LM179-.LFBB23
.LM179:
	ret
	.size	vs_set_volume, .-vs_set_volume
.Lscope23:
	.stabs	"vs_sdi_write:F(0,4)",36,0,0,vs_sdi_write
	.stabs	"data:P(0,38)=*(0,2)",64,0,0,16
	.stabs	"len:P(0,4)",64,0,0,28
.global	vs_sdi_write
	.type	vs_sdi_write, @function
vs_sdi_write:
	.stabn	68,0,387,.LM180-.LFBB24
.LM180:
.LFBB24:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	movw r28,r22
	.stabn	68,0,389,.LM181-.LFBB24
.LM181:
	sbiw r28,0
	breq .L83
	.stabn	68,0,391,.LM182-.LFBB24
.LM182:
	ldi r24,lo8(1)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,391,.LM183-.LFBB24
.LM183:
	sts vs_div+1,r25
	sts vs_div,r24
	.stabn	68,0,393,.LM184-.LFBB24
.LM184:
	call vs_sdi_select
	ldi r24,lo8(32)
	mov r14,r24
	mov r15,__zero_reg__
.L85:
	.stabn	68,0,396,.LM185-.LFBB24
.LM185:
	call vs_wait_for_dreq
	ldi r20,lo8(32)
	ldi r21,0
	cp r28,r14
	cpc r29,r15
	brsh .L84
	movw r20,r28
.L84:
	.stabn	68,0,399,.LM186-.LFBB24
.LM186:
	sts cnt.0+1,r21
	sts cnt.0,r20
	.stabn	68,0,403,.LM187-.LFBB24
.LM187:
	ldi r23,0
	ldi r22,0
	movw r24,r16
	call spi_xmit_multi
	.stabn	68,0,405,.LM188-.LFBB24
.LM188:
	lds r24,cnt.0
	lds r25,cnt.0+1
	add r16,r24
	adc r17,r25
	.stabn	68,0,406,.LM189-.LFBB24
.LM189:
	sub r28,r24
	sbc r29,r25
	.stabn	68,0,395,.LM190-.LFBB24
.LM190:
	brne .L85
	.stabn	68,0,409,.LM191-.LFBB24
.LM191:
	call vs_sdi_unsel
	.stabn	68,0,410,.LM192-.LFBB24
.LM192:
	lds r24,vs_div
	lds r25,vs_div+1
	call spi_set_clk
.L83:
	.stabn	68,0,412,.LM193-.LFBB24
.LM193:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	vs_sdi_write, .-vs_sdi_write
	.stabs	"cnt:V(0,4)",40,0,0,cnt.0
	.stabn	192,0,0,.LFBB24-.LFBB24
	.stabn	224,0,0,.Lscope24-.LFBB24
.Lscope24:
	.stabs	"vs_adpcm_rec_start:F(0,13)",36,0,0,vs_adpcm_rec_start
.global	vs_adpcm_rec_start
	.type	vs_adpcm_rec_start, @function
vs_adpcm_rec_start:
	.stabn	68,0,419,.LM194-.LFBB25
.LM194:
.LFBB25:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB64:
.LBB65:
	.stabn	68,0,108,.LM195-.LFBB25
.LM195:
	lds r18,vs_hws
	lds r19,vs_hws+1
.LBE65:
.LBE64:
	.stabn	68,0,420,.LM196-.LFBB25
.LM196:
	cpi r18,3
	cpc r19,__zero_reg__
	breq .L91
	cpi r18,53
	cpc r19,__zero_reg__
	breq .L92
	cpi r18,2
	cpc r19,__zero_reg__
	brne .L94
	.stabn	68,0,422,.LM197-.LFBB25
.LM197:
	call vs1002_adpcm_rec_start
.L95:
	.stabn	68,0,434,.LM198-.LFBB25
.LM198:
	ldi r24,lo8(1)
	ldi r25,0
	.stabn	68,0,426,.LM199-.LFBB25
.LM199:
	ret
.L91:
	.stabn	68,0,425,.LM200-.LFBB25
.LM200:
	call vs1003_adpcm_rec_start
	rjmp .L95
.L92:
	.stabn	68,0,428,.LM201-.LFBB25
.LM201:
	call vs1053_adpcm_rec_start
	rjmp .L95
.L94:
	.stabn	68,0,420,.LM202-.LFBB25
.LM202:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	.stabn	68,0,435,.LM203-.LFBB25
.LM203:
	ret
	.size	vs_adpcm_rec_start, .-vs_adpcm_rec_start
.Lscope25:
	.stabs	"vs_adpcm_rec_stop:F(0,1)",36,0,0,vs_adpcm_rec_stop
.global	vs_adpcm_rec_stop
	.type	vs_adpcm_rec_stop, @function
vs_adpcm_rec_stop:
	.stabn	68,0,438,.LM204-.LFBB26
.LM204:
.LFBB26:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB66:
.LBB67:
	.stabn	68,0,108,.LM205-.LFBB26
.LM205:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE67:
.LBE66:
	.stabn	68,0,439,.LM206-.LFBB26
.LM206:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L97
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L98
	sbiw r24,2
	brne .L96
	.stabn	68,0,441,.LM207-.LFBB26
.LM207:
	jmp vs1002_adpcm_rec_stop
.L97:
	.stabn	68,0,444,.LM208-.LFBB26
.LM208:
	jmp vs1003_adpcm_rec_stop
.L98:
	.stabn	68,0,447,.LM209-.LFBB26
.LM209:
	jmp vs1053_adpcm_rec_stop
.L96:
/* epilogue start */
	.stabn	68,0,452,.LM210-.LFBB26
.LM210:
	ret
	.size	vs_adpcm_rec_stop, .-vs_adpcm_rec_stop
.Lscope26:
	.local	cnt.0
	.comm	cnt.0,2,1
	.stabs	"cnt:V(0,4)",40,0,0,cnt.0
	.local	vs_div
	.comm	vs_div,2,1
	.stabs	"vs_div:S(0,39)=(0,36)",40,0,0,vs_div
	.stabs	"clock_div_t:t(0,39)",128,0,0,0
.global	vs_reg
	.section .bss
	.type	vs_reg, @object
	.size	vs_reg, 2
vs_reg:
	.zero	2
	.stabs	"vs_reg:G(0,4)",32,0,0,0
	.local	vs_hws
	.comm	vs_hws,2,1
	.stabs	"vs_hws:S(0,34)",38,0,0,vs_hws
	.stabs	"vs_hw_spec_t:t(0,34)",128,0,0,0
	.local	vs_patch_file
	.comm	vs_patch_file,26,1
	.stabs	"vs_patch_file:S(0,24)",40,0,0,vs_patch_file
	.local	vs_patch
	.comm	vs_patch,8,1
	.stabs	"vs_patch:S(0,7)",40,0,0,vs_patch
	.stabs	"vs_patch_t:t(0,7)",128,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
