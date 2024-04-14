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
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	melody_on, @function
melody_on:
	.stabn	68,0,98,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,99,.LM1-.LFBB1
.LM1:
	out 0x24,__zero_reg__
	.stabn	68,0,102,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(13)
	out 0x25,r24
	.stabn	68,0,106,.LM3-.LFBB1
.LM3:
	ldi r24,lo8(78)
	out 0x23,r24
	.stabn	68,0,108,.LM4-.LFBB1
.LM4:
	in r24,0x36
	andi r24,lo8(63)
	out 0x36,r24
	.stabn	68,0,109,.LM5-.LFBB1
.LM5:
	in r24,0x37
	ori r24,lo8(-128)
	out 0x37,r24
/* epilogue start */
	.stabn	68,0,110,.LM6-.LFBB1
.LM6:
	ret
	.size	melody_on, .-melody_on
.Lscope1:
	.stabs	"melody_off:f(0,1)",36,0,0,melody_off
	.type	melody_off, @function
melody_off:
	.stabn	68,0,114,.LM7-.LFBB2
.LM7:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,116,.LM8-.LFBB2
.LM8:
	in r24,0x37
	andi r24,lo8(63)
	out 0x37,r24
	.stabn	68,0,118,.LM9-.LFBB2
.LM9:
	in r24,0x25
	andi r24,lo8(-8)
	out 0x25,r24
/* epilogue start */
	.stabn	68,0,119,.LM10-.LFBB2
.LM10:
	ret
	.size	melody_off, .-melody_off
.Lscope2:
	.stabs	"melody_get_char:f(0,4)=r(0,4);0;255;",36,0,0,melody_get_char
	.stabs	"uint16_t:t(0,5)=(0,6)=r(0,6);0;65535;",128,0,0,0
	.stabs	"uint32_t:t(0,7)=(0,8)=r(0,8);0;4294967295;",128,0,0,0
	.stabs	"char:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
	.stabs	"long unsigned int:t(0,8)",128,0,0,0
	.type	melody_get_char, @function
melody_get_char:
	.stabn	68,0,154,.LM11-.LFBB3
.LM11:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,155,.LM12-.LFBB3
.LM12:
	lds r24,melody+4
	.stabn	68,0,155,.LM13-.LFBB3
.LM13:
	cpse r24,__zero_reg__
	rjmp .L4
	.stabn	68,0,156,.LM14-.LFBB3
.LM14:
	lds r30,melody+2
	lds r31,melody+2+1
	.stabn	68,0,156,.LM15-.LFBB3
.LM15:
	ld r24,Z
	ret
.L4:
.LBB13:
.LBB14:
	.stabn	68,0,158,.LM16-.LFBB3
.LM16:
	lds r24,melody+2
	lds r25,melody+2+1
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  158 "src/sound/ds_tonegen.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
.LBE14:
.LBE13:
	.stabn	68,0,159,.LM17-.LFBB3
.LM17:
	ret
	.size	melody_get_char, .-melody_get_char
	.stabs	"__result:r(0,2)",64,0,0,24
	.stabn	192,0,0,.LBB14-.LFBB3
	.stabn	224,0,0,.LBE14-.LFBB3
.Lscope3:
	.stabs	"tone_on.part.0:f(0,1)",36,0,0,tone_on.part.0
	.stabs	"note:P(0,2)",64,0,0,29
	.stabs	"octave:P(0,2)",64,0,0,28
	.type	tone_on.part.0, @function
tone_on.part.0:
	.stabn	68,0,168,.LM18-.LFBB4
.LM18:
.LFBB4:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
	mov r28,r22
	.stabn	68,0,176,.LM19-.LFBB4
.LM19:
	call get_music_volume_level
	mov r22,r24
	ldi r24,lo8(2)
	ldi r25,0
	call pow_u16
	.stabn	68,0,176,.LM20-.LFBB4
.LM20:
	out 0x2a+1,r25
	out 0x2a,r24
.LBB15:
	.stabn	68,0,181,.LM21-.LFBB4
.LM21:
	mov r24,r28
	subi r24,2
	sbc r25,r25
	movw r22,r24
	ldi r18,lo8(12)
	mul r18,r22
	movw r24,r0
	mul r18,r23
	add r25,r0
	clr __zero_reg__
	add r24,r29
	adc r25,__zero_reg__
	lsl r24
	rol r25
	subi r24,lo8(-(notes))
	sbci r25,hi8(-(notes))
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  181 "src/sound/ds_tonegen.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE15:
	.stabn	68,0,181,.LM22-.LFBB4
.LM22:
	out 0x26+1,r25
	out 0x26,r24
/* epilogue start */
	.stabn	68,0,182,.LM23-.LFBB4
.LM23:
	pop r29
	pop r28
	ret
	.size	tone_on.part.0, .-tone_on.part.0
.Lscope4:
	.stabs	"tonegen_beep:F(0,1)",36,0,0,tonegen_beep
	.stabs	"note:P(0,2)",64,0,0,28
	.stabs	"octave:P(0,2)",64,0,0,29
.global	tonegen_beep
	.type	tonegen_beep, @function
tonegen_beep:
	.stabn	68,0,191,.LM24-.LFBB5
.LM24:
.LFBB5:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r28,r22
	mov r29,r20
	.stabn	68,0,192,.LM25-.LFBB5
.LM25:
	lds r18,melody+13
	.stabn	68,0,192,.LM26-.LFBB5
.LM26:
	cpse r18,__zero_reg__
	rjmp .L7
	.stabn	68,0,195,.LM27-.LFBB5
.LM27:
	ldi r18,lo8(-1)
	sts melody+13,r18
	.stabn	68,0,196,.LM28-.LFBB5
.LM28:
	ldi r22,lo8(10)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,196,.LM29-.LFBB5
.LM29:
	sts melody+5+1,r23
	sts melody+5,r22
	.stabn	68,0,198,.LM30-.LFBB5
.LM30:
	call melody_on
.LBB18:
.LBB19:
	.stabn	68,0,170,.LM31-.LFBB5
.LM31:
	tst r28
	breq .L7
	mov r22,r29
	mov r24,r28
/* epilogue start */
.LBE19:
.LBE18:
	.stabn	68,0,201,.LM32-.LFBB5
.LM32:
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
	.stabn	68,0,204,.LM33-.LFBB6
.LM33:
.LFBB6:
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	.stabn	68,0,205,.LM34-.LFBB6
.LM34:
	ldi r18,lo8(mission_impossible)
	ldi r19,hi8(mission_impossible)
	sts melody+2+1,r19
	sts melody+2,r18
	.stabn	68,0,206,.LM35-.LFBB6
.LM35:
	sts melody+13,r24
	.stabn	68,0,207,.LM36-.LFBB6
.LM36:
	sts melody+5+1,__zero_reg__
	sts melody+5,__zero_reg__
	.stabn	68,0,208,.LM37-.LFBB6
.LM37:
	ldi r24,lo8(1)
	sts melody+4,r24
	.stabn	68,0,211,.LM38-.LFBB6
.LM38:
	call melody_get_char
	.stabn	68,0,211,.LM39-.LFBB6
.LM39:
	cpi r24,lo8(100)
	brne .L15
	.stabn	68,0,214,.LM40-.LFBB6
.LM40:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,214,.LM41-.LFBB6
.LM41:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,215,.LM42-.LFBB6
.LM42:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,215,.LM43-.LFBB6
.LM43:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,217,.LM44-.LFBB6
.LM44:
	sts melody+11,__zero_reg__
	.stabn	68,0,221,.LM45-.LFBB6
.LM45:
	ldi r28,lo8(10)
.L16:
	.stabn	68,0,218,.LM46-.LFBB6
.LM46:
	call melody_get_char
	.stabn	68,0,218,.LM47-.LFBB6
.LM47:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brsh .+2
	rjmp .L17
	.stabn	68,0,225,.LM48-.LFBB6
.LM48:
	lds r24,melody+11
	.stabn	68,0,225,.LM49-.LFBB6
.LM49:
	cpse r24,__zero_reg__
	rjmp .L18
	.stabn	68,0,226,.LM50-.LFBB6
.LM50:
	ldi r24,lo8(4)
	sts melody+11,r24
.L18:
	.stabn	68,0,229,.LM51-.LFBB6
.LM51:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,229,.LM52-.LFBB6
.LM52:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L15:
	.stabn	68,0,232,.LM53-.LFBB6
.LM53:
	call melody_get_char
	.stabn	68,0,232,.LM54-.LFBB6
.LM54:
	cpi r24,lo8(111)
	brne .L19
	.stabn	68,0,235,.LM55-.LFBB6
.LM55:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,235,.LM56-.LFBB6
.LM56:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,236,.LM57-.LFBB6
.LM57:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,236,.LM58-.LFBB6
.LM58:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,238,.LM59-.LFBB6
.LM59:
	call melody_get_char
	.stabn	68,0,238,.LM60-.LFBB6
.LM60:
	subi r24,lo8(-(-48))
	.stabn	68,0,238,.LM61-.LFBB6
.LM61:
	sts melody+12,r24
	.stabn	68,0,239,.LM62-.LFBB6
.LM62:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,239,.LM63-.LFBB6
.LM63:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,240,.LM64-.LFBB6
.LM64:
	lds r24,melody+12
	.stabn	68,0,240,.LM65-.LFBB6
.LM65:
	cpi r24,lo8(2)
	brlo .L20
	.stabn	68,0,240,.LM66-.LFBB6
.LM66:
	lds r24,melody+12
	.stabn	68,0,240,.LM67-.LFBB6
.LM67:
	cpi r24,lo8(8)
	brlo .L21
.L20:
	.stabn	68,0,241,.LM68-.LFBB6
.LM68:
	ldi r24,lo8(4)
	sts melody+12,r24
.L21:
	.stabn	68,0,244,.LM69-.LFBB6
.LM69:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,244,.LM70-.LFBB6
.LM70:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L19:
	.stabn	68,0,247,.LM71-.LFBB6
.LM71:
	call melody_get_char
	.stabn	68,0,247,.LM72-.LFBB6
.LM72:
	cpi r24,lo8(98)
	brne .L22
	.stabn	68,0,250,.LM73-.LFBB6
.LM73:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,250,.LM74-.LFBB6
.LM74:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,251,.LM75-.LFBB6
.LM75:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,251,.LM76-.LFBB6
.LM76:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,254,.LM77-.LFBB6
.LM77:
	sts melody+9+1,__zero_reg__
	sts melody+9,__zero_reg__
	.stabn	68,0,257,.LM78-.LFBB6
.LM78:
	ldi r28,lo8(10)
.L23:
	.stabn	68,0,255,.LM79-.LFBB6
.LM79:
	call melody_get_char
	.stabn	68,0,255,.LM80-.LFBB6
.LM80:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brsh .+2
	rjmp .L24
	.stabn	68,0,264,.LM81-.LFBB6
.LM81:
	lds r22,melody+9
	lds r23,melody+9+1
.LBB22:
.LBB23:
	.stabn	68,0,187,.LM82-.LFBB6
.LM82:
	ldi r24,lo8(96)
	ldi r25,lo8(-22)
	call __udivmodhi4
	movw r24,r22
	lsl r24
	rol r25
	lsl r24
	rol r25
.LBE23:
.LBE22:
	.stabn	68,0,265,.LM83-.LFBB6
.LM83:
	ldi r22,lo8(10)
	ldi r23,0
	call __udivmodhi4
	.stabn	68,0,263,.LM84-.LFBB6
.LM84:
	sts melody+9+1,r23
	sts melody+9,r22
	.stabn	68,0,268,.LM85-.LFBB6
.LM85:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,268,.LM86-.LFBB6
.LM86:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L22:
	.stabn	68,0,272,.LM87-.LFBB6
.LM87:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,272,.LM88-.LFBB6
.LM88:
	sts melody+1,r25
	sts melody,r24
/* epilogue start */
	.stabn	68,0,275,.LM89-.LFBB6
.LM89:
	pop r28
	pop r17
	pop r16
	.stabn	68,0,274,.LM90-.LFBB6
.LM90:
	jmp melody_on
.L17:
	.stabn	68,0,220,.LM91-.LFBB6
.LM91:
	lds r17,melody+11
	.stabn	68,0,221,.LM92-.LFBB6
.LM92:
	call melody_get_char
	.stabn	68,0,221,.LM93-.LFBB6
.LM93:
	mul r17,r28
	add r24,r0
	clr __zero_reg__
	subi r24,lo8(-(-48))
	.stabn	68,0,219,.LM94-.LFBB6
.LM94:
	sts melody+11,r24
	.stabn	68,0,222,.LM95-.LFBB6
.LM95:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,222,.LM96-.LFBB6
.LM96:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	rjmp .L16
.L24:
	.stabn	68,0,257,.LM97-.LFBB6
.LM97:
	lds r16,melody+9
	lds r17,melody+9+1
	.stabn	68,0,258,.LM98-.LFBB6
.LM98:
	call melody_get_char
	.stabn	68,0,257,.LM99-.LFBB6
.LM99:
	mul r28,r16
	movw r18,r0
	mul r28,r17
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,258,.LM100-.LFBB6
.LM100:
	subi r18,48
	sbc r19,__zero_reg__
	add r18,r24
	adc r19,__zero_reg__
	.stabn	68,0,256,.LM101-.LFBB6
.LM101:
	sts melody+9+1,r19
	sts melody+9,r18
	.stabn	68,0,259,.LM102-.LFBB6
.LM102:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,259,.LM103-.LFBB6
.LM103:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	rjmp .L23
	.size	tonegen_melody, .-tonegen_melody
.Lscope6:
	.stabs	"tonegen_init:F(0,1)",36,0,0,tonegen_init
.global	tonegen_init
	.type	tonegen_init, @function
tonegen_init:
	.stabn	68,0,278,.LM104-.LFBB7
.LM104:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,279,.LM105-.LFBB7
.LM105:
	sbi 0x17,5
	.stabn	68,0,280,.LM106-.LFBB7
.LM106:
	cbi 0x18,5
	.stabn	68,0,284,.LM107-.LFBB7
.LM107:
	in r24,0x37
	andi r24,lo8(-53)
	out 0x37,r24
	.stabn	68,0,292,.LM108-.LFBB7
.LM108:
	out 0x2c+1,__zero_reg__
	out 0x2c,__zero_reg__
	.stabn	68,0,297,.LM109-.LFBB7
.LM109:
	ldi r24,lo8(-128)
	out 0x2f,r24
	.stabn	68,0,298,.LM110-.LFBB7
.LM110:
	ldi r24,lo8(17)
	out 0x2e,r24
	.stabn	68,0,300,.LM111-.LFBB7
.LM111:
	jmp melody_off
	.size	tonegen_init, .-tonegen_init
.Lscope7:
	.stabs	"__vector_9:F(0,1)",36,0,0,__vector_9
.global	__vector_9
	.type	__vector_9, @function
__vector_9:
	.stabn	68,0,308,.LM112-.LFBB8
.LM112:
.LFBB8:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
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
/* stack size = 20 */
.L__stack_usage = 20
	.stabn	68,0,312,.LM113-.LFBB8
.LM113:
	lds r24,melody+13
	.stabn	68,0,312,.LM114-.LFBB8
.LM114:
	sbrs r24,7
	rjmp .L27
	.stabn	68,0,314,.LM115-.LFBB8
.LM115:
	lds r24,melody+5
	lds r25,melody+5+1
	.stabn	68,0,314,.LM116-.LFBB8
.LM116:
	sbiw r24,1
	.stabn	68,0,314,.LM117-.LFBB8
.LM117:
	sts melody+5+1,r25
	sts melody+5,r24
	or r24,r25
	brne .L26
.LBB30:
.LBB31:
	.stabn	68,0,164,.LM118-.LFBB8
.LM118:
	out 0x2a+1,__zero_reg__
	out 0x2a,__zero_reg__
.LBE31:
.LBE30:
	.stabn	68,0,316,.LM119-.LFBB8
.LM119:
	call melody_off
	.stabn	68,0,317,.LM120-.LFBB8
.LM120:
	sts melody+13,__zero_reg__
.L26:
/* epilogue start */
	.stabn	68,0,416,.LM121-.LFBB8
.LM121:
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
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L27:
	.stabn	68,0,322,.LM122-.LFBB8
.LM122:
	lds r24,melody+13
	.stabn	68,0,322,.LM123-.LFBB8
.LM123:
	tst r24
	breq .L26
	.stabn	68,0,325,.LM124-.LFBB8
.LM124:
	lds r24,melody+5
	lds r25,melody+5+1
	.stabn	68,0,325,.LM125-.LFBB8
.LM125:
	or r24,r25
	breq .+2
	rjmp .L32
	.stabn	68,0,327,.LM126-.LFBB8
.LM126:
	sts melody+7+1,__zero_reg__
	sts melody+7,__zero_reg__
	.stabn	68,0,330,.LM127-.LFBB8
.LM127:
	ldi r28,lo8(10)
.L33:
	.stabn	68,0,328,.LM128-.LFBB8
.LM128:
	call melody_get_char
	.stabn	68,0,328,.LM129-.LFBB8
.LM129:
	subi r24,48
	sbc r25,r25
	sbiw r24,10
	brsh .+2
	rjmp .L34
	.stabn	68,0,335,.LM130-.LFBB8
.LM130:
	lds r24,melody+7
	lds r25,melody+7+1
	.stabn	68,0,335,.LM131-.LFBB8
.LM131:
	or r24,r25
	brne .+2
	rjmp .L35
	.stabn	68,0,337,.LM132-.LFBB8
.LM132:
	lds r24,melody+9
	lds r25,melody+9+1
	.stabn	68,0,337,.LM133-.LFBB8
.LM133:
	lds r22,melody+7
	lds r23,melody+7+1
.L51:
	.stabn	68,0,340,.LM134-.LFBB8
.LM134:
	call __udivmodhi4
	.stabn	68,0,339,.LM135-.LFBB8
.LM135:
	sts melody+7+1,r23
	sts melody+7,r22
	.stabn	68,0,342,.LM136-.LFBB8
.LM136:
	call melody_get_char
	subi r24,lo8(-(-65))
	ldi r28,0
	cpi r24,lo8(39)
	brsh .L37
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(CSWTCH.12))
	sbci r31,hi8(-(CSWTCH.12))
	ld r28,Z
.L37:
	.stabn	68,0,377,.LM137-.LFBB8
.LM137:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,377,.LM138-.LFBB8
.LM138:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,380,.LM139-.LFBB8
.LM139:
	call melody_get_char
	.stabn	68,0,380,.LM140-.LFBB8
.LM140:
	cpi r24,lo8(35)
	brne .L38
	.stabn	68,0,381,.LM141-.LFBB8
.LM141:
	subi r28,lo8(-(1))
	.stabn	68,0,382,.LM142-.LFBB8
.LM142:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,382,.LM143-.LFBB8
.LM143:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L38:
	.stabn	68,0,386,.LM144-.LFBB8
.LM144:
	call melody_get_char
	.stabn	68,0,386,.LM145-.LFBB8
.LM145:
	cpi r24,lo8(46)
	brne .L39
	.stabn	68,0,387,.LM146-.LFBB8
.LM146:
	lds r24,melody+7
	lds r25,melody+7+1
	.stabn	68,0,387,.LM147-.LFBB8
.LM147:
	lds r18,melody+7
	lds r19,melody+7+1
	.stabn	68,0,387,.LM148-.LFBB8
.LM148:
	lsr r25
	ror r24
	.stabn	68,0,387,.LM149-.LFBB8
.LM149:
	add r24,r18
	adc r25,r19
	sts melody+7+1,r25
	sts melody+7,r24
	.stabn	68,0,388,.LM150-.LFBB8
.LM150:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,388,.LM151-.LFBB8
.LM151:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L39:
	.stabn	68,0,392,.LM152-.LFBB8
.LM152:
	call melody_get_char
	.stabn	68,0,392,.LM153-.LFBB8
.LM153:
	subi r24,48
	sbc r25,r25
	.stabn	68,0,392,.LM154-.LFBB8
.LM154:
	sbiw r24,10
	brlo .+2
	rjmp .L40
	.stabn	68,0,393,.LM155-.LFBB8
.LM155:
	call melody_get_char
	.stabn	68,0,393,.LM156-.LFBB8
.LM156:
	ldi r29,lo8(-48)
	add r29,r24
	.stabn	68,0,394,.LM157-.LFBB8
.LM157:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,394,.LM158-.LFBB8
.LM158:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L41:
	.stabn	68,0,400,.LM159-.LFBB8
.LM159:
	call melody_get_char
	.stabn	68,0,400,.LM160-.LFBB8
.LM160:
	cpi r24,lo8(44)
	brne .L42
	.stabn	68,0,401,.LM161-.LFBB8
.LM161:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,401,.LM162-.LFBB8
.LM162:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
.L42:
.LBB32:
.LBB33:
	.stabn	68,0,170,.LM163-.LFBB8
.LM163:
	tst r28
	breq .L32
	mov r22,r29
	mov r24,r28
	call tone_on.part.0
.L32:
.LBE33:
.LBE32:
	.stabn	68,0,406,.LM164-.LFBB8
.LM164:
	lds r24,melody+5
	lds r25,melody+5+1
	.stabn	68,0,406,.LM165-.LFBB8
.LM165:
	adiw r24,1
	.stabn	68,0,406,.LM166-.LFBB8
.LM166:
	sts melody+5+1,r25
	sts melody+5,r24
	.stabn	68,0,406,.LM167-.LFBB8
.LM167:
	lds r18,melody+7
	lds r19,melody+7+1
	.stabn	68,0,406,.LM168-.LFBB8
.LM168:
	cp r24,r18
	cpc r25,r19
	brsh .+2
	rjmp .L26
	.stabn	68,0,407,.LM169-.LFBB8
.LM169:
	sts melody+5+1,__zero_reg__
	sts melody+5,__zero_reg__
.LBB34:
.LBB35:
	.stabn	68,0,164,.LM170-.LFBB8
.LM170:
	out 0x2a+1,__zero_reg__
	out 0x2a,__zero_reg__
.LBE35:
.LBE34:
	.stabn	68,0,410,.LM171-.LFBB8
.LM171:
	call melody_get_char
	.stabn	68,0,410,.LM172-.LFBB8
.LM172:
	cpse r24,__zero_reg__
	rjmp .L26
	.stabn	68,0,411,.LM173-.LFBB8
.LM173:
	lds r24,melody
	lds r25,melody+1
	.stabn	68,0,411,.LM174-.LFBB8
.LM174:
	sts melody+2+1,r25
	sts melody+2,r24
	.stabn	68,0,412,.LM175-.LFBB8
.LM175:
	lds r24,melody+13
	.stabn	68,0,412,.LM176-.LFBB8
.LM176:
	subi r24,lo8(-(-1))
	.stabn	68,0,412,.LM177-.LFBB8
.LM177:
	sts melody+13,r24
	cpse r24,__zero_reg__
	rjmp .L26
	.stabn	68,0,413,.LM178-.LFBB8
.LM178:
	call melody_off
	rjmp .L26
.L34:
	.stabn	68,0,330,.LM179-.LFBB8
.LM179:
	lds r16,melody+7
	lds r17,melody+7+1
	.stabn	68,0,331,.LM180-.LFBB8
.LM180:
	call melody_get_char
	.stabn	68,0,330,.LM181-.LFBB8
.LM181:
	mul r28,r16
	movw r18,r0
	mul r28,r17
	add r19,r0
	clr __zero_reg__
	.stabn	68,0,331,.LM182-.LFBB8
.LM182:
	subi r18,48
	sbc r19,__zero_reg__
	add r18,r24
	adc r19,__zero_reg__
	.stabn	68,0,329,.LM183-.LFBB8
.LM183:
	sts melody+7+1,r19
	sts melody+7,r18
	.stabn	68,0,332,.LM184-.LFBB8
.LM184:
	lds r24,melody+2
	lds r25,melody+2+1
	.stabn	68,0,332,.LM185-.LFBB8
.LM185:
	adiw r24,1
	sts melody+2+1,r25
	sts melody+2,r24
	rjmp .L33
.L35:
	.stabn	68,0,340,.LM186-.LFBB8
.LM186:
	lds r24,melody+9
	lds r25,melody+9+1
	.stabn	68,0,340,.LM187-.LFBB8
.LM187:
	lds r22,melody+11
	ldi r23,0
	rjmp .L51
.L40:
	.stabn	68,0,396,.LM188-.LFBB8
.LM188:
	lds r29,melody+12
	rjmp .L41
	.size	__vector_9, .-__vector_9
	.stabs	"note:r(0,2)",64,0,0,28
	.stabs	"octave:r(0,2)",64,0,0,29
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
	.stabs	"melody:S(0,9)=(0,10)=xss_tonegen_melody:",40,0,0,melody
	.stabs	"s_tonegen_melody:T(0,10)=s14head:(0,11)=*(0,4),0,16;sound:(0,11),16,16;access_mode:(0,2),32,8;ticks:(0,5),40,16;duration:(0,5),56,16;whole_duration:(0,5),72,16;note_default_len:(0,2),88,8;octave_default:(0,2),96,8;count:(0,12)=(0,13)=r(0,13);-128;127;,104,8;;",128,0,0,0
	.stabs	"int8_t:t(0,12)",128,0,0,0
	.stabs	"signed char:t(0,13)",128,0,0,0
.global	fur_elise
	.section	.progmem.data,"a",@progbits
	.type	fur_elise, @object
	.size	fur_elise, 123
fur_elise:
	.string	"d=16,o=4,b=90:e5,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,8b,p,e,G#,B,8c5,p,e,e,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,8b,p,e,c5,b,8a,8p"
	.stabs	"fur_elise:G(0,14)=ar(0,15)=r(0,15);0;65535;;0;122;(0,4)",32,0,0,0
.global	moonlight_sonata
	.type	moonlight_sonata, @object
	.size	moonlight_sonata, 157
moonlight_sonata:
	.string	"d=4,o=5,b=70:8g#4,8c#,8e,8g#4,8c#,8e,8g#4,8c#,8e,8g#4,8c#,8e,8a4,8c#,8e,8a4,8c#,8e,8a4,8d,8f#,8a4,8d,8f#,8g#4,8c,8f#,8g#4,8c#,8e,8g#4,8c#,8d#,8f#4,8c,8d#,c#"
	.stabs	"moonlight_sonata:G(0,16)=ar(0,15);0;156;(0,4)",32,0,0,0
.global	mission_impossible
	.type	mission_impossible, @object
	.size	mission_impossible, 250
mission_impossible:
	.string	"d=16,o=6,b=90:32d,32d#,32d,32d#,32d,32d#,32d,32d#,32d,32d,32d#,32e,32f,32f#,32g,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,a#,g,2d,32p,a#,g,2c#,32p,a#,g,2c,a#5,8c,2p,32p,a#5,g5,2f#,32p,a#5,g5,2f,32p,a#5,g5,2e,d#,8d"
	.stabs	"mission_impossible:G(0,17)=ar(0,15);0;249;(0,4)",32,0,0,0
.global	indiana_jones
	.type	indiana_jones, @object
	.size	indiana_jones, 186
indiana_jones:
	.string	"d=4,o=5,b=250:E,8p,8F,8G,8p,1C6,8p.,D,8p,8E,1F,p.,G,8p,8A,8B,8p,1F6,p,A,8p,8B,2C6,2D6,2E6,E,8p,8F,8G,8p,1C6,p,D6,8p,8E6,1F.6,G,8p,8G,E.6,8p,D6,8p,8G,E.6,8p,D6,8p,8G,F.6,8p,E6,8p,8D6,2C6"
	.stabs	"indiana_jones:G(0,18)=ar(0,15);0;185;(0,4)",32,0,0,0
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
	.stabs	"notes:G(0,19)=ar(0,15);0;72;(0,5)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
