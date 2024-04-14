	.file	"ds_tonegen.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/ds_tonegen.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"melody_on:f(0,1)=(0,1)",36,0,0,melody_on
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"uint16_t:t(0,4)=(0,5)=r(0,5);0;65535;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.type	melody_on, @function
melody_on:
	.stabn	68,0,122,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,123,.LM1-.LFBB1
.LM1:
	sts 164+1,__zero_reg__
	sts 164,__zero_reg__
	.stabn	68,0,126,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(8)
	sts 160,r24
	.stabn	68,0,127,.LM3-.LFBB1
.LM3:
	ldi r24,lo8(11)
	sts 161,r24
	.stabn	68,0,131,.LM4-.LFBB1
.LM4:
	ldi r24,lo8(-30)
	ldi r25,lo8(4)
	sts 168+1,r25
	sts 168,r24
	.stabn	68,0,133,.LM5-.LFBB1
.LM5:
	out 0x19,__zero_reg__
	.stabn	68,0,134,.LM6-.LFBB1
.LM6:
	ldi r24,lo8(2)
	sts 114,r24
/* epilogue start */
	.stabn	68,0,135,.LM7-.LFBB1
.LM7:
	ret
	.size	melody_on, .-melody_on
.Lscope1:
	.stabs	"melody_off:f(0,1)",36,0,0,melody_off
	.type	melody_off, @function
melody_off:
	.stabn	68,0,139,.LM8-.LFBB2
.LM8:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,141,.LM9-.LFBB2
.LM9:
	sts 114,__zero_reg__
	.stabn	68,0,143,.LM10-.LFBB2
.LM10:
	ldi r30,lo8(-95)
	ldi r31,0
	ld r24,Z
	andi r24,lo8(-8)
	st Z,r24
/* epilogue start */
	.stabn	68,0,144,.LM11-.LFBB2
.LM11:
	ret
	.size	melody_off, .-melody_off
.Lscope2:
	.stabs	"melody_get_char:f(0,6)=r(0,6);0;255;",36,0,0,melody_get_char
	.stabs	"char:t(0,6)",128,0,0,0
	.type	melody_get_char, @function
melody_get_char:
	.stabn	68,0,150,.LM12-.LFBB3
.LM12:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,152,.LM13-.LFBB3
.LM13:
	lds r30,melody+2
	lds r31,melody+2+1
	.stabn	68,0,151,.LM14-.LFBB3
.LM14:
	lds r24,melody+4
	cpse r24,__zero_reg__
	rjmp .L4
	.stabn	68,0,152,.LM15-.LFBB3
.LM15:
	ld r24,Z
	ret
.L4:
.LBB13:
.LBB14:
	.stabn	68,0,154,.LM16-.LFBB3
.LM16:
/* #APP */
 ;  154 "src/sound/ds_tonegen.c" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE14:
.LBE13:
	.stabn	68,0,155,.LM17-.LFBB3
.LM17:
	ret
	.size	melody_get_char, .-melody_get_char
	.stabs	"__result:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LBB14-.LFBB3
	.stabn	224,0,0,.LBE14-.LFBB3
.Lscope3:
	.stabs	"tone_on.part.0:f(0,1)",36,0,0,tone_on.part.0
	.stabs	"note:P(0,2)",64,0,0,24
	.stabs	"octave:P(0,2)",64,0,0,22
	.type	tone_on.part.0, @function
tone_on.part.0:
	.stabn	68,0,164,.LM18-.LFBB4
.LM18:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,173,.LM19-.LFBB4
.LM19:
	ldi r18,lo8(100)
	ldi r19,0
	sts 136+1,r19
	sts 136,r18
.LBB15:
	.stabn	68,0,178,.LM20-.LFBB4
.LM20:
	subi r22,2
	sbc r23,r23
	ldi r25,lo8(12)
	mul r25,r22
	movw r30,r0
	mul r25,r23
	add r31,r0
	clr __zero_reg__
	add r30,r24
	adc r31,__zero_reg__
	lsl r30
	rol r31
	subi r30,lo8(-(notes))
	sbci r31,hi8(-(notes))
/* #APP */
 ;  178 "src/sound/ds_tonegen.c" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE15:
	.stabn	68,0,178,.LM21-.LFBB4
.LM21:
	sts 134+1,r25
	sts 134,r24
/* epilogue start */
	.stabn	68,0,179,.LM22-.LFBB4
.LM22:
	ret
	.size	tone_on.part.0, .-tone_on.part.0
	.stabs	"__addr16:r(0,4)",64,0,0,30
	.stabn	192,0,0,.LBB15-.LFBB4
	.stabn	224,0,0,.LBE15-.LFBB4
.Lscope4:
	.stabs	"tonegen_beep:F(0,1)",36,0,0,tonegen_beep
	.stabs	"note:P(0,2)",64,0,0,28
	.stabs	"octave:P(0,2)",64,0,0,29
.global	tonegen_beep
	.type	tonegen_beep, @function
tonegen_beep:
	.stabn	68,0,188,.LM23-.LFBB5
.LM23:
.LFBB5:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r28,r22
	mov r29,r20
	.stabn	68,0,189,.LM24-.LFBB5
.LM24:
	lds r18,melody+13
	.stabn	68,0,189,.LM25-.LFBB5
.LM25:
	cpse r18,__zero_reg__
	rjmp .L7
	.stabn	68,0,192,.LM26-.LFBB5
.LM26:
	ldi r18,lo8(-1)
	sts melody+13,r18
	.stabn	68,0,193,.LM27-.LFBB5
.LM27:
	ldi r22,lo8(10)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,193,.LM28-.LFBB5
.LM28:
	sts melody+5+1,r23
	sts melody+5,r22
	.stabn	68,0,195,.LM29-.LFBB5
.LM29:
	call melody_on
.LBB18:
.LBB19:
	.stabn	68,0,166,.LM30-.LFBB5
.LM30:
	tst r28
	breq .L7
	mov r22,r29
	mov r24,r28
/* epilogue start */
.LBE19:
.LBE18:
	.stabn	68,0,198,.LM31-.LFBB5
.LM31:
	pop r29
	pop r28
.LBB21:
.LBB20:
	jmp tone_on.part.0
.L7:
/* epilogue start */
.LBE20:
.LBE21:
	pop r29
	pop r28
	ret
	.size	tonegen_beep, .-tonegen_beep
.Lscope5:
	.stabs	"tonegen_melody:F(0,1)",36,0,0,tonegen_melody
	.stabs	"playback_times:P(0,2)",64,0,0,24
.global	tonegen_melody
	.type	tonegen_melody, @function
tonegen_melody:
	.stabn	68,0,201,.LM32-.LFBB6
.LM32:
.LFBB6:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	.stabn	68,0,202,.LM33-.LFBB6
.LM33:
	ldi r18,lo8(mission_impossible)
	ldi r19,hi8(mission_impossible)
	sts melody+2+1,r19
	sts melody+2,r18
	.stabn	68,0,203,.LM34-.LFBB6
.LM34:
	sts melody+13,r24
	.stabn	68,0,204,.LM35-.LFBB6
.LM35:
	sts melody+5+1,__zero_reg__
	sts melody+5,__zero_reg__
	.stabn	68,0,205,.LM36-.LFBB6
.LM36:
	ldi r24,lo8(1)
	sts melody+4,r24
	.stabn	68,0,208,.LM37-.LFBB6
.LM37:
	call melody_get_char
	.stabn	68,0,208,.LM38-.LFBB6
.LM38:
	cpi r24,lo8(100)
	brne .L15
	.stabn	68,0,212,.LM39-.LFBB6
.LM39:
	ldi r24,lo8(mission_impossible+2)
	ldi r25,hi8(mission_impossible+2)
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,214,.LM40-.LFBB6
.LM40:
	sts melody+11,__zero_reg__
	.stabn	68,0,218,.LM41-.LFBB6
.LM41:
	ldi r16,lo8(10)
.L16:
	.stabn	68,0,215,.LM42-.LFBB6
.LM42:
	call melody_get_char
	.stabn	68,0,217,.LM43-.LFBB6
.LM43:
	lds r17,melody+11
	.stabn	68,0,219,.LM44-.LFBB6
.LM44:
	lds r28,melody+2
	lds r29,melody+2+1
	adiw r28,1
	.stabn	68,0,215,.LM45-.LFBB6
.LM45:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brsh .+2
	rjmp .L17
	.stabn	68,0,222,.LM46-.LFBB6
.LM46:
	cpse r17,__zero_reg__
	rjmp .L18
	.stabn	68,0,223,.LM47-.LFBB6
.LM47:
	ldi r24,lo8(4)
	sts melody+11,r24
.L18:
	.stabn	68,0,226,.LM48-.LFBB6
.LM48:
	sts melody+2+1,r29
	sts melody+2,r28
.L15:
	.stabn	68,0,229,.LM49-.LFBB6
.LM49:
	call melody_get_char
	.stabn	68,0,229,.LM50-.LFBB6
.LM50:
	cpi r24,lo8(111)
	brne .L19
	.stabn	68,0,232,.LM51-.LFBB6
.LM51:
	lds r28,melody+2
	lds r29,melody+2+1
	.stabn	68,0,233,.LM52-.LFBB6
.LM52:
	movw r24,r28
	adiw r24,2
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,235,.LM53-.LFBB6
.LM53:
	call melody_get_char
	.stabn	68,0,237,.LM54-.LFBB6
.LM54:
	ldi r25,lo8(-50)
	add r25,r24
	.stabn	68,0,235,.LM55-.LFBB6
.LM55:
	subi r24,lo8(-(-48))
	.stabn	68,0,237,.LM56-.LFBB6
.LM56:
	cpi r25,lo8(6)
	brlo .L25
	.stabn	68,0,238,.LM57-.LFBB6
.LM57:
	ldi r24,lo8(4)
.L25:
	sts melody+12,r24
	.stabn	68,0,241,.LM58-.LFBB6
.LM58:
	adiw r28,4
	sts melody+2+1,r29
	sts melody+2,r28
.L19:
	.stabn	68,0,244,.LM59-.LFBB6
.LM59:
	call melody_get_char
	.stabn	68,0,244,.LM60-.LFBB6
.LM60:
	cpi r24,lo8(98)
	brne .L22
	.stabn	68,0,248,.LM61-.LFBB6
.LM61:
	lds r24,melody+2
	lds r25,melody+2+1
	adiw r24,2
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,251,.LM62-.LFBB6
.LM62:
	sts melody+9+1,__zero_reg__
	sts melody+9,__zero_reg__
	.stabn	68,0,254,.LM63-.LFBB6
.LM63:
	ldi r19,lo8(10)
	mov r15,r19
.L23:
	.stabn	68,0,252,.LM64-.LFBB6
.LM64:
	call melody_get_char
	.stabn	68,0,254,.LM65-.LFBB6
.LM65:
	lds r16,melody+9
	lds r17,melody+9+1
	.stabn	68,0,256,.LM66-.LFBB6
.LM66:
	lds r28,melody+2
	lds r29,melody+2+1
	adiw r28,1
	.stabn	68,0,252,.LM67-.LFBB6
.LM67:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brlo .L24
.LBB22:
.LBB23:
	.stabn	68,0,184,.LM68-.LFBB6
.LM68:
	ldi r24,lo8(96)
	ldi r25,lo8(-22)
	movw r22,r16
	call __udivmodhi4
	movw r24,r22
	lsl r24
	rol r25
	lsl r24
	rol r25
.LBE23:
.LBE22:
	.stabn	68,0,262,.LM69-.LFBB6
.LM69:
	ldi r22,lo8(10)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,260,.LM70-.LFBB6
.LM70:
	sts melody+9+1,r23
	sts melody+9,r22
	.stabn	68,0,265,.LM71-.LFBB6
.LM71:
	sts melody+2+1,r29
	sts melody+2,r28
.L22:
	.stabn	68,0,269,.LM72-.LFBB6
.LM72:
	lds r24,melody+2
	lds r25,melody+2+1
	sts melody+1,r25
	sts melody,r24
/* epilogue start */
	.stabn	68,0,272,.LM73-.LFBB6
.LM73:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	.stabn	68,0,271,.LM74-.LFBB6
.LM74:
	jmp melody_on
.L17:
	.stabn	68,0,218,.LM75-.LFBB6
.LM75:
	call melody_get_char
	.stabn	68,0,218,.LM76-.LFBB6
.LM76:
	mul r17,r16
	add r24,r0
	clr __zero_reg__
	subi r24,lo8(-(-48))
	.stabn	68,0,216,.LM77-.LFBB6
.LM77:
	sts melody+11,r24
	.stabn	68,0,219,.LM78-.LFBB6
.LM78:
	sts melody+2+1,r29
	sts melody+2,r28
	rjmp .L16
.L24:
	.stabn	68,0,255,.LM79-.LFBB6
.LM79:
	call melody_get_char
	.stabn	68,0,254,.LM80-.LFBB6
.LM80:
	mul r15,r16
	movw r18,r0
	mul r15,r17
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,255,.LM81-.LFBB6
.LM81:
	subi r18,48
	sbc r19,__zero_reg__
	add r18,r24
	adc r19,__zero_reg__
	.stabn	68,0,253,.LM82-.LFBB6
.LM82:
	sts melody+9+1,r19
	sts melody+9,r18
	.stabn	68,0,256,.LM83-.LFBB6
.LM83:
	sts melody+2+1,r29
	sts melody+2,r28
	rjmp .L23
	.size	tonegen_melody, .-tonegen_melody
.Lscope6:
	.stabs	"tonegen_init:F(0,1)",36,0,0,tonegen_init
.global	tonegen_init
	.type	tonegen_init, @function
tonegen_init:
	.stabn	68,0,275,.LM84-.LFBB7
.LM84:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,276,.LM85-.LFBB7
.LM85:
	sbi 0x4,5
	.stabn	68,0,277,.LM86-.LFBB7
.LM86:
	cbi 0x5,5
	.stabn	68,0,289,.LM87-.LFBB7
.LM87:
	sts 132+1,__zero_reg__
	sts 132,__zero_reg__
	.stabn	68,0,294,.LM88-.LFBB7
.LM88:
	ldi r24,lo8(-128)
	sts 128,r24
	.stabn	68,0,295,.LM89-.LFBB7
.LM89:
	ldi r24,lo8(17)
	sts 129,r24
	.stabn	68,0,297,.LM90-.LFBB7
.LM90:
	jmp melody_off
	.size	tonegen_init, .-tonegen_init
.Lscope7:
	.stabs	"__vector_42:F(0,1)",36,0,0,__vector_42
.global	__vector_42
	.type	__vector_42, @function
__vector_42:
	.stabn	68,0,305,.LM91-.LFBB8
.LM91:
.LFBB8:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 25 */
.L__stack_usage = 25
	.stabn	68,0,309,.LM92-.LFBB8
.LM92:
	lds r24,melody+13
	.stabn	68,0,309,.LM93-.LFBB8
.LM93:
	sbrs r24,7
	rjmp .L28
	.stabn	68,0,311,.LM94-.LFBB8
.LM94:
	lds r24,melody+5
	lds r25,melody+5+1
	sbiw r24,1
	.stabn	68,0,311,.LM95-.LFBB8
.LM95:
	sts melody+5+1,r25
	sts melody+5,r24
	or r24,r25
	brne .L27
.LBB30:
.LBB31:
	.stabn	68,0,160,.LM96-.LFBB8
.LM96:
	sts 136+1,__zero_reg__
	sts 136,__zero_reg__
.LBE31:
.LBE30:
	.stabn	68,0,313,.LM97-.LFBB8
.LM97:
	call melody_off
	.stabn	68,0,314,.LM98-.LFBB8
.LM98:
	sts melody+13,__zero_reg__
.L27:
/* epilogue start */
	.stabn	68,0,413,.LM99-.LFBB8
.LM99:
	pop r31
	pop r30
	pop r29
	pop r28
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L28:
	.stabn	68,0,319,.LM100-.LFBB8
.LM100:
	lds r24,melody+13
	.stabn	68,0,319,.LM101-.LFBB8
.LM101:
	tst r24
	breq .L27
	.stabn	68,0,322,.LM102-.LFBB8
.LM102:
	lds r28,melody+5
	lds r29,melody+5+1
	.stabn	68,0,322,.LM103-.LFBB8
.LM103:
	sbiw r28,0
	breq .+2
	rjmp .L33
	.stabn	68,0,324,.LM104-.LFBB8
.LM104:
	sts melody+7+1,__zero_reg__
	sts melody+7,__zero_reg__
	.stabn	68,0,327,.LM105-.LFBB8
.LM105:
	ldi r19,lo8(10)
	mov r11,r19
.L34:
	.stabn	68,0,325,.LM106-.LFBB8
.LM106:
	call melody_get_char
	.stabn	68,0,327,.LM107-.LFBB8
.LM107:
	lds r16,melody+7
	lds r17,melody+7+1
	.stabn	68,0,329,.LM108-.LFBB8
.LM108:
	lds r14,melody+2
	lds r15,melody+2+1
	.stabn	68,0,329,.LM109-.LFBB8
.LM109:
	movw r12,r14
	ldi r25,-1
	sub r12,r25
	sbc r13,r25
	.stabn	68,0,325,.LM110-.LFBB8
.LM110:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brsh .+2
	rjmp .L35
	.stabn	68,0,334,.LM111-.LFBB8
.LM111:
	lds r24,melody+9
	lds r25,melody+9+1
	.stabn	68,0,334,.LM112-.LFBB8
.LM112:
	movw r22,r16
	.stabn	68,0,332,.LM113-.LFBB8
.LM113:
	or r16,r17
	brne .L52
	.stabn	68,0,337,.LM114-.LFBB8
.LM114:
	lds r22,melody+11
	ldi r23,0
.L52:
	.stabn	68,0,337,.LM115-.LFBB8
.LM115:
	call __udivmodhi4
	movw r16,r22
	.stabn	68,0,333,.LM116-.LFBB8
.LM116:
	sts melody+7+1,r23
	sts melody+7,r22
	.stabn	68,0,339,.LM117-.LFBB8
.LM117:
	call melody_get_char
	subi r24,lo8(-(-65))
	mov r11,__zero_reg__
	cpi r24,lo8(39)
	brsh .L38
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(CSWTCH.12))
	sbci r31,hi8(-(CSWTCH.12))
	ld r11,Z
.L38:
	.stabn	68,0,374,.LM118-.LFBB8
.LM118:
	sts melody+2+1,r13
	sts melody+2,r12
	.stabn	68,0,377,.LM119-.LFBB8
.LM119:
	call melody_get_char
	.stabn	68,0,377,.LM120-.LFBB8
.LM120:
	cpi r24,lo8(35)
	brne .L39
	.stabn	68,0,378,.LM121-.LFBB8
.LM121:
	inc r11
	.stabn	68,0,379,.LM122-.LFBB8
.LM122:
	ldi r24,2
	add r14,r24
	adc r15,__zero_reg__
	sts melody+2+1,r15
	sts melody+2,r14
.L39:
	.stabn	68,0,383,.LM123-.LFBB8
.LM123:
	call melody_get_char
	.stabn	68,0,383,.LM124-.LFBB8
.LM124:
	cpi r24,lo8(46)
	brne .L40
	.stabn	68,0,384,.LM125-.LFBB8
.LM125:
	movw r24,r16
	lsr r25
	ror r24
	.stabn	68,0,384,.LM126-.LFBB8
.LM126:
	add r24,r16
	adc r25,r17
	sts melody+7+1,r25
	sts melody+7,r24
	.stabn	68,0,385,.LM127-.LFBB8
.LM127:
	lds r24,melody+2
	lds r25,melody+2+1
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L40:
	.stabn	68,0,389,.LM128-.LFBB8
.LM128:
	call melody_get_char
	.stabn	68,0,389,.LM129-.LFBB8
.LM129:
	subi r24,48
	sbc r25,r25
	.stabn	68,0,393,.LM130-.LFBB8
.LM130:
	lds r17,melody+12
	.stabn	68,0,389,.LM131-.LFBB8
.LM131:
	sbiw r24,10
	brsh .L42
	.stabn	68,0,390,.LM132-.LFBB8
.LM132:
	call melody_get_char
	.stabn	68,0,390,.LM133-.LFBB8
.LM133:
	ldi r17,lo8(-48)
	add r17,r24
	.stabn	68,0,391,.LM134-.LFBB8
.LM134:
	lds r24,melody+2
	lds r25,melody+2+1
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L42:
	.stabn	68,0,397,.LM135-.LFBB8
.LM135:
	call melody_get_char
	.stabn	68,0,397,.LM136-.LFBB8
.LM136:
	cpi r24,lo8(44)
	brne .L43
	.stabn	68,0,398,.LM137-.LFBB8
.LM137:
	lds r24,melody+2
	lds r25,melody+2+1
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L43:
.LBB32:
.LBB33:
	.stabn	68,0,166,.LM138-.LFBB8
.LM138:
	tst r11
	breq .L33
	mov r22,r17
	mov r24,r11
	call tone_on.part.0
.L33:
.LBE33:
.LBE32:
	.stabn	68,0,403,.LM139-.LFBB8
.LM139:
	adiw r28,1
	.stabn	68,0,403,.LM140-.LFBB8
.LM140:
	sts melody+5+1,r29
	sts melody+5,r28
	lds r24,melody+7
	lds r25,melody+7+1
	cp r28,r24
	cpc r29,r25
	brsh .+2
	rjmp .L27
	.stabn	68,0,404,.LM141-.LFBB8
.LM141:
	sts melody+5+1,__zero_reg__
	sts melody+5,__zero_reg__
.LBB34:
.LBB35:
	.stabn	68,0,160,.LM142-.LFBB8
.LM142:
	sts 136+1,__zero_reg__
	sts 136,__zero_reg__
.LBE35:
.LBE34:
	.stabn	68,0,407,.LM143-.LFBB8
.LM143:
	call melody_get_char
	.stabn	68,0,407,.LM144-.LFBB8
.LM144:
	cpse r24,__zero_reg__
	rjmp .L27
	.stabn	68,0,408,.LM145-.LFBB8
.LM145:
	lds r24,melody
	lds r25,melody+1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,409,.LM146-.LFBB8
.LM146:
	lds r24,melody+13
	.stabn	68,0,409,.LM147-.LFBB8
.LM147:
	subi r24,lo8(-(-1))
	.stabn	68,0,409,.LM148-.LFBB8
.LM148:
	sts melody+13,r24
	cpse r24,__zero_reg__
	rjmp .L27
	.stabn	68,0,410,.LM149-.LFBB8
.LM149:
	call melody_off
	rjmp .L27
.L35:
	.stabn	68,0,328,.LM150-.LFBB8
.LM150:
	call melody_get_char
	.stabn	68,0,327,.LM151-.LFBB8
.LM151:
	mul r11,r16
	movw r18,r0
	mul r11,r17
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,328,.LM152-.LFBB8
.LM152:
	subi r18,48
	sbc r19,__zero_reg__
	add r18,r24
	adc r19,__zero_reg__
	.stabn	68,0,326,.LM153-.LFBB8
.LM153:
	sts melody+7+1,r19
	sts melody+7,r18
	.stabn	68,0,329,.LM154-.LFBB8
.LM154:
	sts melody+2+1,r13
	sts melody+2,r12
	rjmp .L34
	.size	__vector_42, .-__vector_42
	.stabs	"note:r(0,2)",64,0,0,11
	.stabs	"octave:r(0,2)",64,0,0,17
	.stabn	192,0,0,.LFBB8-.LFBB8
	.stabn	224,0,0,.Lscope8-.LFBB8
.Lscope8:
	.section	.rodata
	.type	CSWTCH.12, @object
	.size	CSWTCH.12, 39
CSWTCH.12:
	.byte	10
	.byte	12
	.byte	1
	.byte	3
	.byte	5
	.byte	6
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	12
	.byte	1
	.byte	3
	.byte	5
	.byte	6
	.byte	8
	.local	melody
	.comm	melody,14,1
	.stabs	"melody:S(0,7)=(0,8)=xss_tonegen_melody:",40,0,0,melody
	.stabs	"s_tonegen_melody:T(0,8)=s14head:(0,9)=*(0,6),0,16;sound:(0,9),16,16;access_mode:(0,2),32,8;ticks:(0,4),40,16;duration:(0,4),56,16;whole_duration:(0,4),72,16;note_default_len:(0,2),88,8;octave_default:(0,2),96,8;count:(0,10)=(0,11)=r(0,11);-128;127;,104,8;;",128,0,0,0
	.stabs	"tonegen_melody_t:t(0,7)",128,0,0,0
	.stabs	"int8_t:t(0,10)",128,0,0,0
	.stabs	"signed char:t(0,11)",128,0,0,0
.global	fur_elise
	.section	.progmem.data,"a",@progbits
	.type	fur_elise, @object
	.size	fur_elise, 123
fur_elise:
	.string	"d=16,o=4,b=90:e5,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,8b,p,e,G#,B,8c5,p,e,e,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,8b,p,e,c5,b,8a,8p"
	.stabs	"fur_elise:G(0,12)=ar(0,13)=r(0,13);0;65535;;0;122;(0,6)",32,0,0,0
.global	moonlight_sonata
	.type	moonlight_sonata, @object
	.size	moonlight_sonata, 157
moonlight_sonata:
	.string	"d=4,o=5,b=70:8g#4,8c#,8e,8g#4,8c#,8e,8g#4,8c#,8e,8g#4,8c#,8e,8a4,8c#,8e,8a4,8c#,8e,8a4,8d,8f#,8a4,8d,8f#,8g#4,8c,8f#,8g#4,8c#,8e,8g#4,8c#,8d#,8f#4,8c,8d#,c#"
	.stabs	"moonlight_sonata:G(0,14)=ar(0,13);0;156;(0,6)",32,0,0,0
.global	mission_impossible
	.type	mission_impossible, @object
	.size	mission_impossible, 250
mission_impossible:
	.string	"d=16,o=6,b=90:32d,32d#,32d,32d#,32d,32d#,32d,32d#,32d,32d,32d#,32e,32f,32f#,32g,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,a#,g,2d,32p,a#,g,2c#,32p,a#,g,2c,a#5,8c,2p,32p,a#5,g5,2f#,32p,a#5,g5,2f,32p,a#5,g5,2e,d#,8d"
	.stabs	"mission_impossible:G(0,15)=ar(0,13);0;249;(0,6)",32,0,0,0
.global	indiana_jones
	.type	indiana_jones, @object
	.size	indiana_jones, 186
indiana_jones:
	.string	"d=4,o=5,b=250:E,8p,8F,8G,8p,1C6,8p.,D,8p,8E,1F,p.,G,8p,8A,8B,8p,1F6,p,A,8p,8B,2C6,2D6,2E6,E,8p,8F,8G,8p,1C6,p,D6,8p,8E6,1F.6,G,8p,8G,E.6,8p,D6,8p,8G,E.6,8p,D6,8p,8G,F.6,8p,E6,8p,8D6,2C6"
	.stabs	"indiana_jones:G(0,16)=ar(0,13);0;185;(0,6)",32,0,0,0
.global	notes
	.type	notes, @object
	.size	notes, 146
notes:
	.word	0
	.word	-4383
	.word	-7816
	.word	-11055
	.word	-14109
	.word	-16998
	.word	-19722
	.word	-22293
	.word	-24720
	.word	-27011
	.word	-29172
	.word	-31213
	.word	32397
	.word	30579
	.word	28862
	.word	27242
	.word	25714
	.word	24270
	.word	22908
	.word	21622
	.word	20408
	.word	19263
	.word	18182
	.word	17162
	.word	16198
	.word	15289
	.word	14431
	.word	13621
	.word	12856
	.word	12135
	.word	11454
	.word	10811
	.word	10204
	.word	9632
	.word	9091
	.word	8581
	.word	8099
	.word	7645
	.word	7215
	.word	6811
	.word	6428
	.word	6067
	.word	5727
	.word	5406
	.word	5102
	.word	4816
	.word	4546
	.word	4290
	.word	4050
	.word	3822
	.word	3608
	.word	3405
	.word	3214
	.word	3034
	.word	2864
	.word	2703
	.word	2551
	.word	2408
	.word	2273
	.word	2145
	.word	2025
	.word	1911
	.word	1804
	.word	1703
	.word	1607
	.word	1517
	.word	1432
	.word	1351
	.word	1276
	.word	1204
	.word	1136
	.word	1073
	.word	1012
	.stabs	"notes:G(0,17)=ar(0,13);0;72;(0,4)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
