	.file	"ds_batmon.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_batmon.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"batmon_adc_cb:f(0,1)=(0,1)",36,0,0,batmon_adc_cb
	.stabs	"uint32_t:t(0,2)=(0,3)=r(0,3);0;4294967295;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"long unsigned int:t(0,3)",128,0,0,0
	.stabs	"sample:P(0,4)=(0,5)=r(0,5);0;65535;",64,0,0,18
	.stabs	"uint16_t:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.type	batmon_adc_cb, @function
batmon_adc_cb:
	.stabn	68,0,71,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,72,.LM1-.LFBB1
.LM1:
	lds r24,bm
	lds r25,bm+1
	.stabn	68,0,72,.LM2-.LFBB1
.LM2:
	or r24,r25
	brne .L2
	.stabn	68,0,73,.LM3-.LFBB1
.LM3:
	sts bm+1,r19
	sts bm,r18
	ret
.L2:
.LBB4:
.LBB5:
	.stabn	68,0,75,.LM4-.LFBB1
.LM4:
	lds r20,bm
	lds r21,bm+1
	.stabn	68,0,75,.LM5-.LFBB1
.LM5:
	movw r24,r18
	ldi r27,0
	ldi r26,0
	.stabn	68,0,75,.LM6-.LFBB1
.LM6:
	add r24,r20
	adc r25,r21
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	.stabn	68,0,75,.LM7-.LFBB1
.LM7:
	lsr r27
	ror r26
	ror r25
	ror r24
	.stabn	68,0,75,.LM8-.LFBB1
.LM8:
	sts bm+1,r25
	sts bm,r24
/* epilogue start */
.LBE5:
.LBE4:
	.stabn	68,0,79,.LM9-.LFBB1
.LM9:
	ret
	.size	batmon_adc_cb, .-batmon_adc_cb
.Lscope1:
	.stabs	"batmon_init:F(0,1)",36,0,0,batmon_init
	.stabs	"uint8_t:t(0,6)=(0,7)=r(0,7);0;255;",128,0,0,0
	.stabs	"adc_channel_flag:T(0,8)=eADC_CF_VREF_256:1,ADC_CF_LEFT_ADJUST:2,;",128,0,0,0
	.stabs	"unsigned char:t(0,7)",128,0,0,0
.global	batmon_init
	.type	batmon_init, @function
batmon_init:
	.stabn	68,0,120,.LM10-.LFBB2
.LM10:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,124,.LM11-.LFBB2
.LM11:
	ldi r30,lo8(100)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-2)
	st Z,r24
	.stabn	68,0,125,.LM12-.LFBB2
.LM12:
	ldi r30,lo8(101)
	ldi r31,0
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
	.stabn	68,0,128,.LM13-.LFBB2
.LM13:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,lo8(2)
	call adc_setup_channel
	.stabn	68,0,130,.LM14-.LFBB2
.LM14:
	sts bm+3,__zero_reg__
/* epilogue start */
	.stabn	68,0,131,.LM15-.LFBB2
.LM15:
	ret
	.size	batmon_init, .-batmon_init
.Lscope2:
	.stabs	"batmon_start:F(0,1)",36,0,0,batmon_start
.global	batmon_start
	.type	batmon_start, @function
batmon_start:
	.stabn	68,0,134,.LM16-.LFBB3
.LM16:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,135,.LM17-.LFBB3
.LM17:
	ldi r30,lo8(bm)
	ldi r31,hi8(bm)
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,136,.LM18-.LFBB3
.LM18:
	std Z+2,__zero_reg__
	.stabn	68,0,137,.LM19-.LFBB3
.LM19:
	ldi r24,lo8(1)
	std Z+3,r24
/* epilogue start */
	.stabn	68,0,138,.LM20-.LFBB3
.LM20:
	ret
	.size	batmon_start, .-batmon_start
.Lscope3:
	.stabs	"batmon_stop:F(0,1)",36,0,0,batmon_stop
.global	batmon_stop
	.type	batmon_stop, @function
batmon_stop:
	.stabn	68,0,141,.LM21-.LFBB4
.LM21:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,142,.LM22-.LFBB4
.LM22:
	sts bm+3,__zero_reg__
/* epilogue start */
	.stabn	68,0,143,.LM23-.LFBB4
.LM23:
	ret
	.size	batmon_stop, .-batmon_stop
.Lscope4:
	.stabs	"batmon_is_running:F(0,9)=eFalse:0,True:1,;",36,0,0,batmon_is_running
	.stabs	"_Bool:t(0,9)",128,0,0,0
.global	batmon_is_running
	.type	batmon_is_running, @function
batmon_is_running:
	.stabn	68,0,146,.LM24-.LFBB5
.LM24:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,147,.LM25-.LFBB5
.LM25:
	lds r24,bm+3
/* epilogue start */
	.stabn	68,0,148,.LM26-.LFBB5
.LM26:
	ret
	.size	batmon_is_running, .-batmon_is_running
.Lscope5:
	.stabs	"batmon_battery_level:F(0,6)",36,0,0,batmon_battery_level
.global	batmon_battery_level
	.type	batmon_battery_level, @function
batmon_battery_level:
	.stabn	68,0,151,.LM27-.LFBB6
.LM27:
.LFBB6:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	.stabn	68,0,152,.LM28-.LFBB6
.LM28:
	lds r18,bm
	lds r19,bm+1
	.stabn	68,0,152,.LM29-.LFBB6
.LM29:
	ldi r26,lo8(100)
	ldi r27,0
	call __umulhisi3
	.stabn	68,0,152,.LM30-.LFBB6
.LM30:
	ldi r18,lo8(-52)
	ldi r19,lo8(1)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	mov r24,r18
/* epilogue start */
	.stabn	68,0,153,.LM31-.LFBB6
.LM31:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	batmon_battery_level, .-batmon_battery_level
.Lscope6:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"btLo"
	.text
	.stabs	"batmon_isr:F(0,1)",36,0,0,batmon_isr
.global	batmon_isr
	.type	batmon_isr, @function
batmon_isr:
	.stabn	68,0,92,.LM32-.LFBB7
.LM32:
.LFBB7:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	.stabn	68,0,95,.LM33-.LFBB7
.LM33:
	lds r24,bm+3
	.stabn	68,0,95,.LM34-.LFBB7
.LM34:
	tst r24
	breq .L9
	.stabn	68,0,99,.LM35-.LFBB7
.LM35:
	lds r24,bm+2
	ldi r25,0
	.stabn	68,0,99,.LM36-.LFBB7
.LM36:
	adiw r24,1
	.stabn	68,0,99,.LM37-.LFBB7
.LM37:
	ldi r22,lo8(3)
	ldi r23,0
	call __divmodhi4
	.stabn	68,0,99,.LM38-.LFBB7
.LM38:
	sts bm+2,r24
	.stabn	68,0,100,.LM39-.LFBB7
.LM39:
	lds r24,bm+2
	.stabn	68,0,100,.LM40-.LFBB7
.LM40:
	cpse r24,__zero_reg__
	rjmp .L9
	.stabn	68,0,102,.LM41-.LFBB7
.LM41:
	lds r24,bm
	lds r25,bm+1
	.stabn	68,0,102,.LM42-.LFBB7
.LM42:
	or r24,r25
	brne .L13
.L14:
	.stabn	68,0,112,.LM43-.LFBB7
.LM43:
	sts bm+1,__zero_reg__
	sts bm,__zero_reg__
.LBB8:
.LBB9:
	.stabn	68,0,85,.LM44-.LFBB7
.LM44:
	ldi r20,lo8(gs(batmon_adc_cb))
	ldi r21,hi8(gs(batmon_adc_cb))
	ldi r22,lo8(32)
	ldi r23,0
	ldi r24,lo8(2)
/* epilogue start */
.LBE9:
.LBE8:
	.stabn	68,0,116,.LM45-.LFBB7
.LM45:
	pop r28
.LBB11:
.LBB10:
	.stabn	68,0,85,.LM46-.LFBB7
.LM46:
	jmp adc_start
.L13:
.LBE10:
.LBE11:
	.stabn	68,0,104,.LM47-.LFBB7
.LM47:
	call batmon_battery_level
	mov r28,r24
	.stabn	68,0,105,.LM48-.LFBB7
.LM48:
	cpi r24,lo8(85)
	brsh .L14
	.stabn	68,0,106,.LM49-.LFBB7
.LM49:
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call disp_text
	.stabn	68,0,108,.LM50-.LFBB7
.LM50:
	cpi r28,lo8(70)
	brsh .L14
.L9:
/* epilogue start */
	.stabn	68,0,116,.LM51-.LFBB7
.LM51:
	pop r28
	ret
	.size	batmon_isr, .-batmon_isr
	.stabs	"lvl:r(0,6)",64,0,0,28
	.stabn	192,0,0,.LFBB7-.LFBB7
	.stabn	224,0,0,.Lscope7-.LFBB7
.Lscope7:
	.local	bm
	.comm	bm,4,1
	.stabs	"bm:S(0,10)=(0,11)=xss_batmon_context:",40,0,0,bm
	.stabs	"s_batmon_context:T(0,11)=s4battery_level:(0,4),0,16;timer_ticks:(0,6),16,8;active:(0,9),24,8;;",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
