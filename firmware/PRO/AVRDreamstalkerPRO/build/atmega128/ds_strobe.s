	.file	"ds_strobe.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/ds_strobe.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"strobe_do_transition:f(0,1)=(0,1)",36,0,0,strobe_do_transition
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"i:P(0,2)=r(0,2);0;65535;",64,0,0,24
	.stabs	"unsigned int:t(0,2)",128,0,0,0
	.type	strobe_do_transition, @function
strobe_do_transition:
	.stabn	68,0,52,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB34:
.LBB35:
	.stabn	68,0,45,.LM1-.LFBB1
.LM1:
	ldi r31,0
	ldi r30,0
	.stabn	68,0,44,.LM2-.LFBB1
.LM2:
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L2
	.stabn	68,0,47,.LM3-.LFBB1
.LM3:
	ldi r18,lo8(11)
	mul r18,r24
	movw r30,r0
	mul r18,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
.L2:
.LBE35:
.LBE34:
	.stabn	68,0,53,.LM4-.LFBB1
.LM4:
	ldd __tmp_reg__,Z+9
	ldd r31,Z+10
	mov r30,__tmp_reg__
	.stabn	68,0,53,.LM5-.LFBB1
.LM5:
	sbiw r30,0
	breq .L1
	.stabn	68,0,54,.LM6-.LFBB1
.LM6:
	ijmp
.L1:
/* epilogue start */
	.stabn	68,0,55,.LM7-.LFBB1
.LM7:
	ret
	.size	strobe_do_transition, .-strobe_do_transition
.Lscope1:
	.stabs	"strobe_isr:F(0,1)",36,0,0,strobe_isr
	.stabs	" :T(0,3)=eSTROBE_HIGH:0,STROBE_LOW:1,STROBE_TOGGLE:2,;",128,0,0,0
.global	strobe_isr
	.type	strobe_isr, @function
strobe_isr:
	.stabn	68,0,60,.LM8-.LFBB2
.LM8:
.LFBB2:
	push r4
	push r5
	push r6
	push r7
	push r10
	push r11
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 20 */
.L__stack_usage = 20
	ldi r24,lo8(strobes)
	ldi r25,hi8(strobes)
	std Y+6,r25
	std Y+5,r24
	.stabn	68,0,60,.LM9-.LFBB2
.LM9:
	ldi r17,0
	ldi r16,0
	.stabn	68,0,79,.LM10-.LFBB2
.LM10:
	ldi r24,lo8(100)
	mov r12,r24
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L13:
	.stabn	68,0,67,.LM11-.LFBB2
.LM11:
	ldd r30,Y+5
	ldd r31,Y+6
	ld r24,Z
	ldd r25,Z+1
	ldd r26,Z+2
	ldd r27,Z+3
	.stabn	68,0,67,.LM12-.LFBB2
.LM12:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L7
	.stabn	68,0,68,.LM13-.LFBB2
.LM13:
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,68,.LM14-.LFBB2
.LM14:
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L7
	.stabn	68,0,70,.LM15-.LFBB2
.LM15:
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
	.stabn	68,0,71,.LM16-.LFBB2
.LM16:
	std Z+7,__zero_reg__
	std Z+6,__zero_reg__
	.stabn	68,0,73,.LM17-.LFBB2
.LM17:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r16
	call strobe_do_transition
.L7:
	.stabn	68,0,77,.LM18-.LFBB2
.LM18:
	ldd r30,Y+5
	ldd r31,Y+6
	ldd r10,Z+6
	ldd r11,Z+7
	.stabn	68,0,77,.LM19-.LFBB2
.LM19:
	cp r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .L10
	.stabn	68,0,79,.LM20-.LFBB2
.LM20:
	ldd r18,Z+8
	ldi r19,0
	movw r26,r10
	call __umulhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,79,.LM21-.LFBB2
.LM21:
	movw r20,r14
	movw r18,r12
	call __udivmodsi4
	movw r4,r18
	movw r6,r20
	.stabn	68,0,81,.LM22-.LFBB2
.LM22:
	ldd r30,Y+5
	ldd r31,Y+6
	ldd r24,Z+4
	ldd r25,Z+5
	adiw r24,1
	.stabn	68,0,81,.LM23-.LFBB2
.LM23:
	movw r22,r10
	call __udivmodhi4
	.stabn	68,0,81,.LM24-.LFBB2
.LM24:
	std Z+5,r25
	std Z+4,r24
	.stabn	68,0,82,.LM25-.LFBB2
.LM25:
	movw r20,r24
	ldi r23,0
	ldi r22,0
	.stabn	68,0,82,.LM26-.LFBB2
.LM26:
	cp r20,r4
	cpc r21,r5
	cpc r22,r6
	cpc r23,r7
	breq .L11
	.stabn	68,0,82,.LM27-.LFBB2
.LM27:
	or r24,r25
	brne .L10
.L11:
	.stabn	68,0,84,.LM28-.LFBB2
.LM28:
	ldi r22,lo8(2)
	ldi r23,0
	movw r24,r16
	call strobe_do_transition
.L10:
	.stabn	68,0,64,.LM29-.LFBB2
.LM29:
	subi r16,-1
	sbci r17,-1
	ldd r24,Y+5
	ldd r25,Y+6
	adiw r24,11
	std Y+6,r25
	std Y+5,r24
	cpi r16,3
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L13
/* epilogue start */
	.stabn	68,0,88,.LM30-.LFBB2
.LM30:
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
	pop r11
	pop r10
	pop r7
	pop r6
	pop r5
	pop r4
	ret
	.size	strobe_isr, .-strobe_isr
	.stabs	"uint32_t:t(0,4)=(0,5)=r(0,5);0;4294967295;",128,0,0,0
	.stabs	"long unsigned int:t(0,5)",128,0,0,0
.Lscope2:
	.stabs	"strobe_init:F(0,1)",36,0,0,strobe_init
.global	strobe_init
	.type	strobe_init, @function
strobe_init:
	.stabn	68,0,93,.LM31-.LFBB3
.LM31:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,94,.LM32-.LFBB3
.LM32:
	ldi r30,lo8(strobes)
	ldi r31,hi8(strobes)
	ldi r24,lo8(33)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
/* epilogue start */
	.stabn	68,0,95,.LM33-.LFBB3
.LM33:
	ret
	.size	strobe_init, .-strobe_init
.Lscope3:
	.stabs	"strobe_is_active:F(0,6)=eFalse:0,True:1,;",36,0,0,strobe_is_active
	.stabs	"uint8_t:t(0,7)=(0,8)=r(0,8);0;255;",128,0,0,0
	.stabs	"_Bool:t(0,6)",128,0,0,0
	.stabs	"unsigned char:t(0,8)",128,0,0,0
	.stabs	"i:P(0,2)",64,0,0,18
.global	strobe_is_active
	.type	strobe_is_active, @function
strobe_is_active:
	.stabn	68,0,98,.LM34-.LFBB4
.LM34:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,99,.LM35-.LFBB4
.LM35:
	sbiw r24,3
	brlo .L17
	.stabn	68,0,100,.LM36-.LFBB4
.LM36:
	ret
.L17:
.LBB47:
.LBB48:
	.stabn	68,0,102,.LM37-.LFBB4
.LM37:
	in r25,__SREG__
.LBB49:
.LBB50:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,50,.LM38-.LFBB4
.LM38:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE50:
.LBE49:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,103,.LM39-.LFBB4
.LM39:
	ldi r24,lo8(11)
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	.stabn	68,0,103,.LM40-.LFBB4
.LM40:
	ld r20,Z
	ldd r21,Z+1
	ldd r22,Z+2
	ldd r23,Z+3
	ldi r24,lo8(1)
	or r20,r21
	or r20,r22
	or r20,r23
	brne .L18
	ldd r18,Z+6
	ldd r19,Z+7
	or r18,r19
	brne .L18
	ldi r24,0
.L18:
.LBB51:
.LBB52:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,70,.LM41-.LFBB4
.LM41:
	out __SREG__,r25
	.stabn	68,0,71,.LM42-.LFBB4
.LM42:
.LBE52:
.LBE51:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,103,.LM43-.LFBB4
.LM43:
	andi r24,lo8(1)
/* epilogue start */
.LBE48:
.LBE47:
	.stabn	68,0,105,.LM44-.LFBB4
.LM44:
	ret
	.size	strobe_is_active, .-strobe_is_active
.Lscope4:
	.stabs	"strobe_start:F(0,1)",36,0,0,strobe_start
	.stabs	"i:p(0,2)",160,0,0,5
	.stabs	"duty_cycle:P(0,7)",64,0,0,15
.global	strobe_start
	.type	strobe_start, @function
strobe_start:
	.stabn	68,0,108,.LM45-.LFBB5
.LM45:
.LFBB5:
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 14 */
.L__stack_usage = 14
	std Y+5,r24
	std Y+6,r25
	movw r16,r22
	movw r12,r20
	mov r15,r18
	.stabn	68,0,111,.LM46-.LFBB5
.LM46:
	ldd r24,Y+5
	ldd r25,Y+6
	call strobe_is_active
	.stabn	68,0,111,.LM47-.LFBB5
.LM47:
	cpse r24,__zero_reg__
	rjmp .L21
.LBB60:
.LBB61:
	.stabn	68,0,44,.LM48-.LFBB5
.LM48:
	ldd r18,Y+5
	ldd r19,Y+6
	cpi r18,3
	cpc r19,__zero_reg__
	brlo .+2
	rjmp .L21
.LBE61:
.LBE60:
.LBB62:
	.stabn	68,0,121,.LM49-.LFBB5
.LM49:
	in r14,__SREG__
.LBB63:
.LBB64:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,50,.LM50-.LFBB5
.LM50:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE64:
.LBE63:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,122,.LM51-.LFBB5
.LM51:
	movw r24,r16
	sbiw r24,0
	brne .L23
	ldi r24,lo8(1)
	ldi r25,0
.L23:
	movw r18,r24
	ldi r21,0
	ldi r20,0
	movw r24,r20
	movw r22,r18
	call rtc_msec_to_ticks
	movw r16,r22
	movw r18,r24
	.stabn	68,0,122,.LM52-.LFBB5
.LM52:
	ldi r24,lo8(11)
	ldd r20,Y+5
	ldd r21,Y+6
	mul r24,r20
	movw r30,r0
	mul r24,r21
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	st Z,r16
	std Z+1,r17
	std Z+2,r18
	std Z+3,r19
	.stabn	68,0,123,.LM53-.LFBB5
.LM53:
	movw r24,r12
	sbiw r24,0
	brne .L24
	ldi r24,lo8(1)
	ldi r25,0
.L24:
	movw r18,r24
	ldi r21,0
	ldi r20,0
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
	movw r24,r20
	movw r22,r18
	call rtc_msec_to_ticks
	mov r20,r22
	mov r21,r23
	.stabn	68,0,123,.LM54-.LFBB5
.LM54:
	ldi r24,lo8(11)
	ldd r18,Y+5
	ldd r19,Y+6
	mul r24,r18
	movw r30,r0
	mul r24,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	std Z+7,r21
	std Z+6,r20
	.stabn	68,0,124,.LM55-.LFBB5
.LM55:
	std Z+8,r15
	.stabn	68,0,125,.LM56-.LFBB5
.LM56:
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
.LBB65:
.LBB66:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,70,.LM57-.LFBB5
.LM57:
	out __SREG__,r14
	.stabn	68,0,71,.LM58-.LFBB5
.LM58:
.LBE66:
.LBE65:
.LBE62:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,127,.LM59-.LFBB5
.LM59:
	ldi r23,0
	ldi r22,0
	ldd r24,Y+5
	ldd r25,Y+6
/* epilogue start */
	.stabn	68,0,128,.LM60-.LFBB5
.LM60:
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
	.stabn	68,0,127,.LM61-.LFBB5
.LM61:
	jmp strobe_do_transition
.L21:
/* epilogue start */
	.stabn	68,0,128,.LM62-.LFBB5
.LM62:
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
	.size	strobe_start, .-strobe_start
.Lscope5:
	.stabs	"strobe_stop:F(0,1)",36,0,0,strobe_stop
	.stabs	"i:P(0,2)",64,0,0,24
.global	strobe_stop
	.type	strobe_stop, @function
strobe_stop:
	.stabn	68,0,131,.LM63-.LFBB6
.LM63:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB74:
.LBB75:
	.stabn	68,0,44,.LM64-.LFBB6
.LM64:
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L25
.LBE75:
.LBE74:
.LBB76:
	.stabn	68,0,136,.LM65-.LFBB6
.LM65:
	in r18,__SREG__
.LBB77:
.LBB78:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,50,.LM66-.LFBB6
.LM66:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE78:
.LBE77:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,137,.LM67-.LFBB6
.LM67:
	ldi r19,lo8(11)
	mul r19,r24
	movw r30,r0
	mul r19,r25
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
	.stabn	68,0,138,.LM68-.LFBB6
.LM68:
	std Z+7,__zero_reg__
	std Z+6,__zero_reg__
.LBB79:
.LBB80:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,70,.LM69-.LFBB6
.LM69:
	out __SREG__,r18
	.stabn	68,0,71,.LM70-.LFBB6
.LM70:
.LBE80:
.LBE79:
.LBE76:
	.stabs	"src/ds_strobe.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,140,.LM71-.LFBB6
.LM71:
	ldi r22,lo8(1)
	ldi r23,0
	jmp strobe_do_transition
.L25:
/* epilogue start */
	.stabn	68,0,141,.LM72-.LFBB6
.LM72:
	ret
	.size	strobe_stop, .-strobe_stop
.Lscope6:
	.stabs	"strobe_set_cb:F(0,1)",36,0,0,strobe_set_cb
	.stabs	"i:P(0,2)",64,0,0,18
	.stabs	"trans_func:P(0,9)=(0,10)=*(0,11)=f(0,1)",64,0,0,24
	.stabs	"pfn_strobe_transition:t(0,9)",128,0,0,0
.global	strobe_set_cb
	.type	strobe_set_cb, @function
strobe_set_cb:
	.stabn	68,0,144,.LM73-.LFBB7
.LM73:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	.stabn	68,0,145,.LM74-.LFBB7
.LM74:
	cpi r18,3
	cpc r19,__zero_reg__
	brsh .L27
	.stabn	68,0,148,.LM75-.LFBB7
.LM75:
	ldi r20,lo8(11)
	mul r20,r18
	movw r30,r0
	mul r20,r19
	add r31,r0
	clr __zero_reg__
	subi r30,lo8(-(strobes))
	sbci r31,hi8(-(strobes))
	std Z+10,r23
	std Z+9,r22
.L27:
/* epilogue start */
	.stabn	68,0,149,.LM76-.LFBB7
.LM76:
	ret
	.size	strobe_set_cb, .-strobe_set_cb
.Lscope7:
	.local	strobes
	.comm	strobes,33,1
	.stabs	"strobes:S(0,12)=ar(0,13)=r(0,13);0;65535;;0;2;(0,14)=(0,15)=xss_strobe_context:",40,0,0,strobes
	.stabs	"s_strobe_context:T(0,15)=s11duration_ticks:(0,4),0,32;period_ticks:(0,16)=(0,2),32,16;period:(0,16),48,16;duty_cycle:(0,7),64,8;transition:(0,9),72,16;;",128,0,0,0
	.stabs	"uint16_t:t(0,16)",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
