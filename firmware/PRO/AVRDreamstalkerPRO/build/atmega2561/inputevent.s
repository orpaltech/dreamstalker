	.file	"inputevent.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/input/inputevent.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"input_put_event.0:f(0,1)=(0,1),input_put_event.0,input_process",36,0,0,input_put_event.0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"EItem:P(0,2)=r(0,2);0;255;",64,0,0,24
	.stabs	"unsigned char:t(0,2)",128,0,0,0
	.type	input_put_event.0, @function
input_put_event.0:
	.stabn	68,0,116,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,117,.LM1-.LFBB1
.LM1:
	lds r25,v_InputEventCount
	.stabn	68,0,117,.LM2-.LFBB1
.LM2:
	cpi r25,lo8(8)
	brsh .L1
.LBB24:
.LBB25:
	.stabn	68,0,119,.LM3-.LFBB1
.LM3:
	lds r30,v_InputBufferIn
	ldi r31,0
	.stabn	68,0,119,.LM4-.LFBB1
.LM4:
	subi r30,lo8(-(v_InputBuffer))
	sbci r31,hi8(-(v_InputBuffer))
	st Z,r24
	.stabn	68,0,120,.LM5-.LFBB1
.LM5:
	lds r24,v_InputBufferIn
	subi r24,lo8(-(1))
	sts v_InputBufferIn,r24
	.stabn	68,0,121,.LM6-.LFBB1
.LM6:
	lds r24,v_InputBufferIn
	.stabn	68,0,121,.LM7-.LFBB1
.LM7:
	cpi r24,lo8(8)
	brne .L3
	.stabn	68,0,122,.LM8-.LFBB1
.LM8:
	sts v_InputBufferIn,__zero_reg__
.L3:
	.stabn	68,0,123,.LM9-.LFBB1
.LM9:
	lds r24,v_InputEventCount
	subi r24,lo8(-(1))
	sts v_InputEventCount,r24
.L1:
/* epilogue start */
.LBE25:
.LBE24:
	.stabn	68,0,125,.LM10-.LFBB1
.LM10:
	ret
	.size	input_put_event.0, .-input_put_event.0
.Lscope1:
	.stabs	"input_set_hold:F(0,1)",36,0,0,input_set_hold
	.stabs	"hold_cycles:P(0,3)=(0,4)=r(0,4);0;65535;",64,0,0,18
	.stabs	"uint16_t:t(0,3)",128,0,0,0
	.stabs	"unsigned int:t(0,4)",128,0,0,0
.global	input_set_hold
	.type	input_set_hold, @function
input_set_hold:
	.stabn	68,0,49,.LM11-.LFBB2
.LM11:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB26:
.LBB27:
.LBB28:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,50,.LM12-.LFBB2
.LM12:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE28:
.LBE27:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,51,.LM13-.LFBB2
.LM13:
	sts v_InputHoldCycles+1,r25
	sts v_InputHoldCycles,r24
.LBB29:
.LBB30:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,56,.LM14-.LFBB2
.LM14:
/* #APP */
 ;  56 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	sei
 ;  0 "" 2
	.stabn	68,0,57,.LM15-.LFBB2
.LM15:
/* #NOAPP */
/* epilogue start */
.LBE30:
.LBE29:
.LBE26:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,53,.LM16-.LFBB2
.LM16:
	ret
	.size	input_set_hold, .-input_set_hold
.Lscope2:
	.stabs	"input_set_hold_repeat:F(0,1)",36,0,0,input_set_hold_repeat
	.stabs	"repeat_cycles:P(0,3)",64,0,0,18
.global	input_set_hold_repeat
	.type	input_set_hold_repeat, @function
input_set_hold_repeat:
	.stabn	68,0,56,.LM17-.LFBB3
.LM17:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB31:
.LBB32:
.LBB33:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,50,.LM18-.LFBB3
.LM18:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE33:
.LBE32:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,58,.LM19-.LFBB3
.LM19:
	sts v_InputHoldRepeatCycles+1,r25
	sts v_InputHoldRepeatCycles,r24
.LBB34:
.LBB35:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext7
.Ltext7:
	.stabn	68,0,56,.LM20-.LFBB3
.LM20:
/* #APP */
 ;  56 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	sei
 ;  0 "" 2
	.stabn	68,0,57,.LM21-.LFBB3
.LM21:
/* #NOAPP */
/* epilogue start */
.LBE35:
.LBE34:
.LBE31:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext8
.Ltext8:
	.stabn	68,0,60,.LM22-.LFBB3
.LM22:
	ret
	.size	input_set_hold_repeat, .-input_set_hold_repeat
.Lscope3:
	.stabs	"input_get_event:F(0,2)",36,0,0,input_get_event
.global	input_get_event
	.type	input_get_event, @function
input_get_event:
	.stabn	68,0,67,.LM23-.LFBB4
.LM23:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L7:
	.stabn	68,0,70,.LM24-.LFBB4
.LM24:
	lds r24,v_InputEventCount
	tst r24
	breq .L8
	.stabn	68,0,73,.LM25-.LFBB4
.LM25:
	lds r30,v_InputBufferOut
	ldi r31,0
	.stabn	68,0,73,.LM26-.LFBB4
.LM26:
	subi r30,lo8(-(v_InputBuffer))
	sbci r31,hi8(-(v_InputBuffer))
	ld r24,Z
	.stabn	68,0,75,.LM27-.LFBB4
.LM27:
	lds r25,v_InputBufferOut
	subi r25,lo8(-(1))
	sts v_InputBufferOut,r25
	.stabn	68,0,76,.LM28-.LFBB4
.LM28:
	lds r25,v_InputBufferOut
	.stabn	68,0,76,.LM29-.LFBB4
.LM29:
	cpi r25,lo8(8)
	brne .L9
	.stabn	68,0,77,.LM30-.LFBB4
.LM30:
	sts v_InputBufferOut,__zero_reg__
.L9:
.LBB36:
.LBB37:
.LBB38:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext9
.Ltext9:
	.stabn	68,0,50,.LM31-.LFBB4
.LM31:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE38:
.LBE37:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext10
.Ltext10:
	.stabn	68,0,80,.LM32-.LFBB4
.LM32:
	lds r25,v_InputEventCount
	subi r25,lo8(-(-1))
	sts v_InputEventCount,r25
.LBB39:
.LBB40:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext11
.Ltext11:
	.stabn	68,0,56,.LM33-.LFBB4
.LM33:
/* #APP */
 ;  56 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	sei
 ;  0 "" 2
	.stabn	68,0,57,.LM34-.LFBB4
.LM34:
/* #NOAPP */
/* epilogue start */
.LBE40:
.LBE39:
.LBE36:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext12
.Ltext12:
	.stabn	68,0,84,.LM35-.LFBB4
.LM35:
	ret
.L8:
	.stabn	68,0,71,.LM36-.LFBB4
.LM36:
/* #APP */
 ;  71 "src/input/inputevent.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L7
	.size	input_get_event, .-input_get_event
	.stabs	"c1:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LFBB4-.LFBB4
	.stabn	224,0,0,.Lscope4-.LFBB4
.Lscope4:
	.stabs	"input_wait_for_idle:F(0,1)",36,0,0,input_wait_for_idle
.global	input_wait_for_idle
	.type	input_wait_for_idle, @function
input_wait_for_idle:
	.stabn	68,0,88,.LM37-.LFBB5
.LM37:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L11:
	.stabn	68,0,89,.LM38-.LFBB5
.LM38:
	lds r24,v_InputState
	cpse r24,__zero_reg__
	rjmp .L12
/* epilogue start */
	.stabn	68,0,91,.LM39-.LFBB5
.LM39:
	ret
.L12:
	.stabn	68,0,90,.LM40-.LFBB5
.LM40:
/* #APP */
 ;  90 "src/input/inputevent.c" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	rjmp .L11
	.size	input_wait_for_idle, .-input_wait_for_idle
.Lscope5:
	.stabs	"input_clear_events:F(0,1)",36,0,0,input_clear_events
.global	input_clear_events
	.type	input_clear_events, @function
input_clear_events:
	.stabn	68,0,95,.LM41-.LFBB6
.LM41:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB41:
.LBB42:
.LBB43:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext13
.Ltext13:
	.stabn	68,0,50,.LM42-.LFBB6
.LM42:
/* #APP */
 ;  50 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE43:
.LBE42:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext14
.Ltext14:
	.stabn	68,0,97,.LM43-.LFBB6
.LM43:
	sts v_InputEventCount,__zero_reg__
	.stabn	68,0,98,.LM44-.LFBB6
.LM44:
	lds r24,v_InputBufferIn
	sts v_InputBufferOut,r24
.LBB44:
.LBB45:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h",132,0,0,.Ltext15
.Ltext15:
	.stabn	68,0,56,.LM45-.LFBB6
.LM45:
/* #APP */
 ;  56 "/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/atomic.h" 1
	sei
 ;  0 "" 2
	.stabn	68,0,57,.LM46-.LFBB6
.LM46:
/* #NOAPP */
/* epilogue start */
.LBE45:
.LBE44:
.LBE41:
	.stabs	"src/input/inputevent.c",132,0,0,.Ltext16
.Ltext16:
	.stabn	68,0,100,.LM47-.LFBB6
.LM47:
	ret
	.size	input_clear_events, .-input_clear_events
.Lscope6:
	.stabs	"input_process:F(0,1)",36,0,0,input_process
	.stabs	"EInput:P(0,2)",64,0,0,24
.global	input_process
	.type	input_process, @function
input_process:
	.stabn	68,0,107,.LM48-.LFBB7
.LM48:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,128,.LM49-.LFBB7
.LM49:
	lds r25,InputLast.5
	cpse r25,r24
	rjmp .L15
	.stabn	68,0,129,.LM50-.LFBB7
.LM50:
	lds r25,InputDebounceCount.4
	subi r25,lo8(-(1))
.L16:
	sts InputDebounceCount.4,r25
	.stabn	68,0,137,.LM51-.LFBB7
.LM51:
	lds r19,v_InputState
	lds r18,InputLast.5
	.stabn	68,0,144,.LM52-.LFBB7
.LM52:
	lds r24,InputPressed.3
	.stabn	68,0,137,.LM53-.LFBB7
.LM53:
	cp r19,r18
	breq .L18
	.stabn	68,0,137,.LM54-.LFBB7
.LM54:
	cpi r25,lo8(30)
	brlo .L18
	.stabn	68,0,139,.LM55-.LFBB7
.LM55:
	sts v_InputState,r18
	.stabn	68,0,141,.LM56-.LFBB7
.LM56:
	lds r25,v_InputState
	.stabn	68,0,141,.LM57-.LFBB7
.LM57:
	tst r25
	brne .+2
	rjmp .L20
	.stabn	68,0,144,.LM58-.LFBB7
.LM58:
	tst r24
	breq .L21
	.stabn	68,0,144,.LM59-.LFBB7
.LM59:
	lds r25,InputSkipRelease.2
	cpse r25,__zero_reg__
	rjmp .L18
.L21:
	.stabn	68,0,147,.LM60-.LFBB7
.LM60:
	lds r25,v_InputState
	.stabn	68,0,147,.LM61-.LFBB7
.LM61:
	or r25,r24
	sts InputPressed.3,r25
	.stabn	68,0,149,.LM62-.LFBB7
.LM62:
	sts v_InputStateAge.1+1,__zero_reg__
	sts v_InputStateAge.1,__zero_reg__
.L18:
	.stabn	68,0,171,.LM63-.LFBB7
.LM63:
	lds r24,InputPressed.3
	.stabn	68,0,171,.LM64-.LFBB7
.LM64:
	tst r24
	breq .L23
	.stabn	68,0,173,.LM65-.LFBB7
.LM65:
	lds r18,v_InputStateAge.1
	lds r19,v_InputStateAge.1+1
	.stabn	68,0,171,.LM66-.LFBB7
.LM66:
	lds r25,InputSkipRelease.2
	cpse r25,__zero_reg__
	rjmp .L24
	.stabn	68,0,173,.LM67-.LFBB7
.LM67:
	lds r20,v_InputHoldCycles
	lds r21,v_InputHoldCycles+1
	or r20,r21
	breq .L23
	.stabn	68,0,173,.LM68-.LFBB7
.LM68:
	lds r20,v_InputHoldCycles
	lds r21,v_InputHoldCycles+1
.L41:
	.stabn	68,0,174,.LM69-.LFBB7
.LM69:
	cp r18,r20
	cpc r19,r21
	brlo .L23
	.stabn	68,0,177,.LM70-.LFBB7
.LM70:
	ldi r25,lo8(1)
	sts InputSkipRelease.2,r25
	.stabn	68,0,178,.LM71-.LFBB7
.LM71:
	sts v_InputStateAge.1+1,__zero_reg__
	sts v_InputStateAge.1,__zero_reg__
	.stabn	68,0,179,.LM72-.LFBB7
.LM72:
	ori r24,lo8(-128)
	call input_put_event.0
.L23:
	.stabn	68,0,183,.LM73-.LFBB7
.LM73:
	lds r24,v_InputStateAge.1
	lds r25,v_InputStateAge.1+1
	adiw r24,1
	sts v_InputStateAge.1+1,r25
	sts v_InputStateAge.1,r24
/* epilogue start */
	.stabn	68,0,185,.LM74-.LFBB7
.LM74:
	ret
.L15:
	.stabn	68,0,132,.LM75-.LFBB7
.LM75:
	sts InputLast.5,r24
	ldi r25,lo8(1)
	rjmp .L16
.L20:
	.stabn	68,0,155,.LM76-.LFBB7
.LM76:
	tst r24
	breq .L18
	.stabn	68,0,158,.LM77-.LFBB7
.LM77:
	lds r25,InputSkipRelease.2
	cpse r25,__zero_reg__
	rjmp .L22
	.stabn	68,0,160,.LM78-.LFBB7
.LM78:
	call input_put_event.0
.L22:
	.stabn	68,0,162,.LM79-.LFBB7
.LM79:
	sts InputSkipRelease.2,__zero_reg__
	.stabn	68,0,164,.LM80-.LFBB7
.LM80:
	sts InputPressed.3,__zero_reg__
	rjmp .L18
.L24:
	.stabn	68,0,174,.LM81-.LFBB7
.LM81:
	lds r20,v_InputHoldRepeatCycles
	lds r21,v_InputHoldRepeatCycles+1
	or r20,r21
	breq .L23
	.stabn	68,0,174,.LM82-.LFBB7
.LM82:
	lds r20,v_InputHoldRepeatCycles
	lds r21,v_InputHoldRepeatCycles+1
	rjmp .L41
	.size	input_process, .-input_process
	.stabs	"InputDebounceCount:V(0,2)",40,0,0,InputDebounceCount.4
	.stabs	"InputLast:V(0,2)",40,0,0,InputLast.5
	.stabs	"InputPressed:V(0,2)",40,0,0,InputPressed.3
	.stabs	"InputSkipRelease:V(0,2)",40,0,0,InputSkipRelease.2
	.stabs	"v_InputStateAge:V(0,4)",40,0,0,v_InputStateAge.1
	.stabn	192,0,0,.LFBB7-.LFBB7
	.stabn	224,0,0,.Lscope7-.LFBB7
.Lscope7:
	.local	v_InputStateAge.1
	.comm	v_InputStateAge.1,2,1
	.stabs	"v_InputStateAge:V(0,4)",40,0,0,v_InputStateAge.1
	.local	InputSkipRelease.2
	.comm	InputSkipRelease.2,1,1
	.stabs	"InputSkipRelease:V(0,2)",40,0,0,InputSkipRelease.2
	.local	InputPressed.3
	.comm	InputPressed.3,1,1
	.stabs	"InputPressed:V(0,2)",40,0,0,InputPressed.3
	.local	InputDebounceCount.4
	.comm	InputDebounceCount.4,1,1
	.stabs	"InputDebounceCount:V(0,2)",40,0,0,InputDebounceCount.4
	.local	InputLast.5
	.comm	InputLast.5,1,1
	.stabs	"InputLast:V(0,2)",40,0,0,InputLast.5
.global	v_InputBufferOut
	.section .bss
	.type	v_InputBufferOut, @object
	.size	v_InputBufferOut, 1
v_InputBufferOut:
	.zero	1
	.stabs	"v_InputBufferOut:G(0,2)",32,0,0,0
.global	v_InputBufferIn
	.type	v_InputBufferIn, @object
	.size	v_InputBufferIn, 1
v_InputBufferIn:
	.zero	1
	.stabs	"v_InputBufferIn:G(0,2)",32,0,0,0
.global	v_InputBuffer
	.type	v_InputBuffer, @object
	.size	v_InputBuffer, 8
v_InputBuffer:
	.zero	8
	.stabs	"v_InputBuffer:G(0,5)=ar(0,6)=r(0,6);0;65535;;0;7;(0,2)",32,0,0,0
.global	v_InputHoldRepeatCycles
	.data
	.type	v_InputHoldRepeatCycles, @object
	.size	v_InputHoldRepeatCycles, 2
v_InputHoldRepeatCycles:
	.word	50
	.stabs	"v_InputHoldRepeatCycles:G(0,7)=r(0,7);0;65535;",32,0,0,0
	.stabs	"short unsigned int:t(0,7)",128,0,0,0
.global	v_InputHoldCycles
	.type	v_InputHoldCycles, @object
	.size	v_InputHoldCycles, 2
v_InputHoldCycles:
	.word	400
	.stabs	"v_InputHoldCycles:G(0,7)",32,0,0,0
.global	v_InputEventCount
	.section .bss
	.type	v_InputEventCount, @object
	.size	v_InputEventCount, 1
v_InputEventCount:
	.zero	1
	.stabs	"v_InputEventCount:G(0,2)",32,0,0,0
.global	v_InputState
	.type	v_InputState, @object
	.size	v_InputState, 1
v_InputState:
	.zero	1
	.stabs	"v_InputState:G(0,2)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
