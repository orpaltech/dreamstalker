	.file	"ds_remd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_remd.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"remd_adc_cb:f(0,1)=(0,1)",36,0,0,remd_adc_cb
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"sample:p(0,4)=(0,5)=r(0,5);0;65535;",160,0,0,1
	.stabs	"uint16_t:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.type	remd_adc_cb, @function
remd_adc_cb:
	.stabn	68,0,46,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,55,.LM1-.LFBB1
.LM1:
	ldi r22,lo8(2)
	movw r24,r28
	adiw r24,1
	call uart0_send_buf
/* epilogue start */
	.stabn	68,0,57,.LM2-.LFBB1
.LM2:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	remd_adc_cb, .-remd_adc_cb
.Lscope1:
	.stabs	"remd_init:F(0,6)=eFalse:0,True:1,;",36,0,0,remd_init
	.stabs	"_Bool:t(0,6)",128,0,0,0
.global	remd_init
	.type	remd_init, @function
remd_init:
	.stabn	68,0,62,.LM3-.LFBB2
.LM3:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,64,.LM4-.LFBB2
.LM4:
	sbi 0x7,0
	.stabn	68,0,66,.LM5-.LFBB2
.LM5:
	sbi 0x8,0
	.stabn	68,0,69,.LM6-.LFBB2
.LM6:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	remd_init, .-remd_init
.Lscope2:
	.stabs	"remd_uninit:F(0,1)",36,0,0,remd_uninit
.global	remd_uninit
	.type	remd_uninit, @function
remd_uninit:
	.stabn	68,0,72,.LM7-.LFBB3
.LM7:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,74,.LM8-.LFBB3
.LM8:
	cbi 0x7,0
	.stabn	68,0,75,.LM9-.LFBB3
.LM9:
	in r24,0x8
	andi r24,lo8(1)
	out 0x8,r24
/* epilogue start */
	.stabn	68,0,76,.LM10-.LFBB3
.LM10:
	ret
	.size	remd_uninit, .-remd_uninit
.Lscope3:
	.stabs	"remd_start:F(0,6)",36,0,0,remd_start
.global	remd_start
	.type	remd_start, @function
remd_start:
	.stabn	68,0,79,.LM11-.LFBB4
.LM11:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,80,.LM12-.LFBB4
.LM12:
	lds r24,remd_status
	.stabn	68,0,80,.LM13-.LFBB4
.LM13:
	cpse r24,__zero_reg__
	rjmp .L4
	.stabn	68,0,83,.LM14-.LFBB4
.LM14:
	ldi r20,lo8(gs(remd_adc_cb))
	ldi r21,hi8(gs(remd_adc_cb))
	ldi r23,0
	ldi r22,0
	call adc_start
	.stabn	68,0,83,.LM15-.LFBB4
.LM15:
	tst r24
	breq .L4
	.stabn	68,0,87,.LM16-.LFBB4
.LM16:
	cbi 0x8,0
	.stabn	68,0,89,.LM17-.LFBB4
.LM17:
	ldi r25,lo8(1)
	sts remd_status,r25
.L4:
/* epilogue start */
	.stabn	68,0,91,.LM18-.LFBB4
.LM18:
	ret
	.size	remd_start, .-remd_start
.Lscope4:
	.stabs	"remd_stop:F(0,1)",36,0,0,remd_stop
.global	remd_stop
	.type	remd_stop, @function
remd_stop:
	.stabn	68,0,94,.LM19-.LFBB5
.LM19:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,95,.LM20-.LFBB5
.LM20:
	lds r24,remd_status
	tst r24
	breq .L9
	.stabn	68,0,99,.LM21-.LFBB5
.LM21:
	sbi 0x8,0
	.stabn	68,0,101,.LM22-.LFBB5
.LM22:
	ldi r24,0
	call adc_stop
	.stabn	68,0,103,.LM23-.LFBB5
.LM23:
	sts remd_status,__zero_reg__
.L9:
/* epilogue start */
	.stabn	68,0,104,.LM24-.LFBB5
.LM24:
	ret
	.size	remd_stop, .-remd_stop
.Lscope5:
	.stabs	"remd_is_running:F(0,6)",36,0,0,remd_is_running
.global	remd_is_running
	.type	remd_is_running, @function
remd_is_running:
	.stabn	68,0,107,.LM25-.LFBB6
.LM25:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,109,.LM26-.LFBB6
.LM26:
	lds r24,remd_status
/* epilogue start */
	ret
	.size	remd_is_running, .-remd_is_running
.Lscope6:
	.local	remd_status
	.comm	remd_status,1,1
	.stabs	"remd_status:S(0,6)",38,0,0,remd_status
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
