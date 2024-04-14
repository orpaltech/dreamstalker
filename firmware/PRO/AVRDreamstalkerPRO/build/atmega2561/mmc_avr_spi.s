	.file	"mmc_avr_spi.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/fatfs/mmc_avr_spi.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"deselect:f(0,1)=(0,1)",36,0,0,deselect
	.stabs	"uint8_t:t(0,2)=(0,3)=r(0,3);0;255;",128,0,0,0
	.stabs	"void:t(0,1)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.type	deselect, @function
deselect:
	.stabn	68,0,185,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,186,.LM1-.LFBB1
.LM1:
	sbi 0x5,0
	.stabn	68,0,187,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(-1)
	jmp spi_xchg
	.size	deselect, .-deselect
.Lscope1:
	.stabs	"power_off:f(0,1)",36,0,0,power_off
	.type	power_off, @function
power_off:
	.stabn	68,0,100,.LM3-.LFBB2
.LM3:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,102,.LM4-.LFBB2
.LM4:
	call spi_disable
	.stabn	68,0,106,.LM5-.LFBB2
.LM5:
	cbi 0x4,0
	.stabn	68,0,107,.LM6-.LFBB2
.LM6:
	sbi 0x5,0
/* epilogue start */
	.stabn	68,0,111,.LM7-.LFBB2
.LM7:
	ret
	.size	power_off, .-power_off
.Lscope2:
	.stabs	"rcvr_datablock:f(0,4)=r(0,4);-32768;32767;",36,0,0,rcvr_datablock
	.stabs	"int:t(0,4)",128,0,0,0
	.stabs	"btr:P(0,5)=(0,6)=r(0,6);0;65535;",64,0,0,28
	.stabs	"UINT:t(0,5)",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
	.type	rcvr_datablock, @function
rcvr_datablock:
	.stabn	68,0,220,.LM8-.LFBB3
.LM8:
.LFBB3:
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
	.stabn	68,0,224,.LM9-.LFBB3
.LM9:
	ldi r24,lo8(20)
	sts Timer1,r24
.L5:
	.stabn	68,0,226,.LM10-.LFBB3
.LM10:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,227,.LM11-.LFBB3
.LM11:
	cpi r24,lo8(-1)
	brne .L4
	.stabn	68,0,227,.LM12-.LFBB3
.LM12:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L5
.L10:
	.stabn	68,0,228,.LM13-.LFBB3
.LM13:
	ldi r25,0
	ldi r24,0
	rjmp .L3
.L4:
	.stabn	68,0,228,.LM14-.LFBB3
.LM14:
	cpi r24,lo8(-2)
	brne .L10
	movw r30,r16
.LBB6:
.LBB7:
.LBB8:
.LBB9:
	.stabn	68,0,128,.LM15-.LFBB3
.LM15:
	ldi r24,lo8(-1)
.L9:
	out 0x2e,r24
.L7:
	.stabn	68,0,129,.LM16-.LFBB3
.LM16:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L7
	.stabn	68,0,130,.LM17-.LFBB3
.LM17:
	in r25,0x2e
	.stabn	68,0,130,.LM18-.LFBB3
.LM18:
	st Z,r25
	.stabn	68,0,131,.LM19-.LFBB3
.LM19:
	out 0x2e,r24
.L8:
	.stabn	68,0,132,.LM20-.LFBB3
.LM20:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L8
	.stabn	68,0,133,.LM21-.LFBB3
.LM21:
	in r25,0x2e
	.stabn	68,0,133,.LM22-.LFBB3
.LM22:
	std Z+1,r25
	.stabn	68,0,134,.LM23-.LFBB3
.LM23:
	sbiw r28,2
	.stabn	68,0,134,.LM24-.LFBB3
.LM24:
	adiw r30,2
	sbiw r28,0
	brne .L9
.LBE9:
.LBE8:
	.stabn	68,0,231,.LM25-.LFBB3
.LM25:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,232,.LM26-.LFBB3
.LM26:
	ldi r24,lo8(-1)
	call spi_xchg
	ldi r24,lo8(1)
	ldi r25,0
.L3:
/* epilogue start */
.LBE7:
.LBE6:
	.stabn	68,0,235,.LM27-.LFBB3
.LM27:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	rcvr_datablock, .-rcvr_datablock
	.stabs	"token:r(0,7)=(0,3)",64,0,0,24
	.stabs	"BYTE:t(0,7)",128,0,0,0
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabs	"cnt:r(0,5)",64,0,0,28
	.stabn	192,0,0,.LBB8-.LFBB3
	.stabn	224,0,0,.LBE8-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"wait_ready.constprop.0:f(0,4)",36,0,0,wait_ready.constprop.0
	.type	wait_ready.constprop.0, @function
wait_ready.constprop.0:
	.stabn	68,0,160,.LM28-.LFBB4
.LM28:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,168,.LM29-.LFBB4
.LM29:
/* #APP */
 ;  168 "src/fatfs/mmc_avr_spi.c" 1
	cli
 ;  0 "" 2
	.stabn	68,0,168,.LM30-.LFBB4
.LM30:
/* #NOAPP */
	ldi r24,lo8(50)
	ldi r25,0
	sts Timer2+1,r25
	sts Timer2,r24
	.stabn	68,0,168,.LM31-.LFBB4
.LM31:
/* #APP */
 ;  168 "src/fatfs/mmc_avr_spi.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L17:
	.stabn	68,0,170,.LM32-.LFBB4
.LM32:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,171,.LM33-.LFBB4
.LM33:
/* #APP */
 ;  171 "src/fatfs/mmc_avr_spi.c" 1
	cli
 ;  0 "" 2
	.stabn	68,0,171,.LM34-.LFBB4
.LM34:
/* #NOAPP */
	lds r18,Timer2
	lds r19,Timer2+1
	.stabn	68,0,171,.LM35-.LFBB4
.LM35:
/* #APP */
 ;  171 "src/fatfs/mmc_avr_spi.c" 1
	sei
 ;  0 "" 2
	.stabn	68,0,172,.LM36-.LFBB4
.LM36:
/* #NOAPP */
	cpi r24,lo8(-1)
	breq .L16
	or r18,r19
	brne .L17
.L16:
	.stabn	68,0,174,.LM37-.LFBB4
.LM37:
	ldi r18,lo8(1)
	ldi r19,0
	cpi r24,lo8(-1)
	breq .L18
	ldi r19,0
	ldi r18,0
.L18:
	.stabn	68,0,175,.LM38-.LFBB4
.LM38:
	movw r24,r18
/* epilogue start */
	ret
	.size	wait_ready.constprop.0, .-wait_ready.constprop.0
	.stabs	"d:r(0,7)",64,0,0,24
	.stabs	"wt:r(0,5)",64,0,0,18
	.stabn	192,0,0,.LFBB4-.LFBB4
	.stabn	224,0,0,.Lscope4-.LFBB4
.Lscope4:
	.stabs	"select:f(0,4)",36,0,0,select
	.type	select, @function
select:
	.stabn	68,0,198,.LM39-.LFBB5
.LM39:
.LFBB5:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,199,.LM40-.LFBB5
.LM40:
	cbi 0x5,0
	.stabn	68,0,200,.LM41-.LFBB5
.LM41:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,202,.LM42-.LFBB5
.LM42:
	call wait_ready.constprop.0
	movw r28,r24
	.stabn	68,0,202,.LM43-.LFBB5
.LM43:
	or r24,r25
	brne .L28
	.stabn	68,0,205,.LM44-.LFBB5
.LM44:
	call deselect
.L26:
	.stabn	68,0,207,.LM45-.LFBB5
.LM45:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	ret
.L28:
	.stabn	68,0,203,.LM46-.LFBB5
.LM46:
	ldi r28,lo8(1)
	ldi r29,0
	rjmp .L26
	.size	select, .-select
.Lscope5:
	.stabs	"send_cmd:f(0,7)",36,0,0,send_cmd
	.stabs	"cmd:P(0,7)",64,0,0,28
	.type	send_cmd, @function
send_cmd:
	.stabn	68,0,281,.LM47-.LFBB6
.LM47:
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
	mov r28,r24
	mov r29,r20
	mov r17,r21
	mov r16,r22
	mov r15,r23
	.stabn	68,0,285,.LM48-.LFBB6
.LM48:
	sbrs r24,7
	rjmp .L30
	.stabn	68,0,287,.LM49-.LFBB6
.LM49:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(55)
	call send_cmd
	.stabn	68,0,288,.LM50-.LFBB6
.LM50:
	cpi r24,lo8(2)
	brsh .L29
	.stabn	68,0,286,.LM51-.LFBB6
.LM51:
	andi r28,lo8(127)
.L30:
	.stabn	68,0,293,.LM52-.LFBB6
.LM52:
	cpi r28,lo8(12)
	brne .L32
.L35:
	.stabn	68,0,299,.LM53-.LFBB6
.LM53:
	mov r24,r28
	ori r24,lo8(64)
	call spi_xchg
	.stabn	68,0,300,.LM54-.LFBB6
.LM54:
	mov r24,r15
	call spi_xchg
	.stabn	68,0,301,.LM55-.LFBB6
.LM55:
	mov r24,r16
	call spi_xchg
	.stabn	68,0,302,.LM56-.LFBB6
.LM56:
	mov r24,r17
	call spi_xchg
	.stabn	68,0,303,.LM57-.LFBB6
.LM57:
	mov r24,r29
	call spi_xchg
	.stabn	68,0,305,.LM58-.LFBB6
.LM58:
	ldi r24,lo8(-107)
	.stabn	68,0,305,.LM59-.LFBB6
.LM59:
	tst r28
	breq .L33
	.stabn	68,0,306,.LM60-.LFBB6
.LM60:
	ldi r24,lo8(-121)
	.stabn	68,0,306,.LM61-.LFBB6
.LM61:
	cpi r28,lo8(8)
	breq .L33
	.stabn	68,0,304,.LM62-.LFBB6
.LM62:
	ldi r24,lo8(1)
.L33:
	.stabn	68,0,307,.LM63-.LFBB6
.LM63:
	call spi_xchg
	.stabn	68,0,310,.LM64-.LFBB6
.LM64:
	cpi r28,lo8(12)
	brne .L36
	.stabn	68,0,310,.LM65-.LFBB6
.LM65:
	ldi r24,lo8(-1)
	call spi_xchg
.L36:
	.stabn	68,0,304,.LM66-.LFBB6
.LM66:
	ldi r28,lo8(10)
.L37:
	.stabn	68,0,313,.LM67-.LFBB6
.LM67:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,314,.LM68-.LFBB6
.LM68:
	sbrs r24,7
	rjmp .L29
	.stabn	68,0,314,.LM69-.LFBB6
.LM69:
	subi r28,lo8(-(-1))
	brne .L37
.L29:
/* epilogue start */
	.stabn	68,0,317,.LM70-.LFBB6
.LM70:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
.L32:
	.stabn	68,0,294,.LM71-.LFBB6
.LM71:
	call deselect
	.stabn	68,0,295,.LM72-.LFBB6
.LM72:
	call select
	.stabn	68,0,295,.LM73-.LFBB6
.LM73:
	or r24,r25
	brne .L35
	.stabn	68,0,295,.LM74-.LFBB6
.LM74:
	ldi r24,lo8(-1)
	rjmp .L29
	.size	send_cmd, .-send_cmd
	.stabs	"n:r(0,7)",64,0,0,24
	.stabs	"res:r(0,7)",64,0,0,24
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"xmit_datablock:f(0,4)",36,0,0,xmit_datablock
	.stabs	"token:P(0,7)",64,0,0,28
	.type	xmit_datablock, @function
xmit_datablock:
	.stabn	68,0,249,.LM75-.LFBB7
.LM75:
.LFBB7:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	mov r29,r25
	mov r28,r22
	.stabn	68,0,253,.LM76-.LFBB7
.LM76:
	call wait_ready.constprop.0
	movw r18,r24
	.stabn	68,0,253,.LM77-.LFBB7
.LM77:
	or r24,r25
	breq .L43
	.stabn	68,0,256,.LM78-.LFBB7
.LM78:
	mov r24,r28
	call spi_xchg
	.stabn	68,0,257,.LM79-.LFBB7
.LM79:
	ldi r18,lo8(1)
	ldi r19,0
	.stabn	68,0,257,.LM80-.LFBB7
.LM80:
	cpi r28,lo8(-3)
	breq .L43
	mov r30,r17
	mov r31,r29
	movw r24,r30
	subi r25,-2
.L47:
.LBB14:
.LBB15:
.LBB16:
.LBB17:
	.stabn	68,0,146,.LM81-.LFBB7
.LM81:
	ld r18,Z
	.stabn	68,0,146,.LM82-.LFBB7
.LM82:
	out 0x2e,r18
.L45:
	.stabn	68,0,147,.LM83-.LFBB7
.LM83:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L45
	.stabn	68,0,148,.LM84-.LFBB7
.LM84:
	ldd r18,Z+1
	.stabn	68,0,148,.LM85-.LFBB7
.LM85:
	out 0x2e,r18
.L46:
	.stabn	68,0,149,.LM86-.LFBB7
.LM86:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L46
	.stabn	68,0,150,.LM87-.LFBB7
.LM87:
	adiw r30,2
	cp r30,r24
	cpc r31,r25
	brne .L47
.LBE17:
.LBE16:
	.stabn	68,0,260,.LM88-.LFBB7
.LM88:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,260,.LM89-.LFBB7
.LM89:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,262,.LM90-.LFBB7
.LM90:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,264,.LM91-.LFBB7
.LM91:
	andi r24,lo8(31)
	ldi r25,lo8(1)
	cpi r24,lo8(5)
	breq .L48
	ldi r25,0
.L48:
	mov r18,r25
	ldi r19,0
.L43:
.LBE15:
.LBE14:
	.stabn	68,0,267,.LM92-.LFBB7
.LM92:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	xmit_datablock, .-xmit_datablock
.Lscope7:
	.stabs	"mmc_disk_initialize:F(0,8)=(0,7)",36,0,0,mmc_disk_initialize
	.stabs	" :T(0,9)=eclock_div_1:0,clock_div_2:1,clock_div_4:2,clock_div_8:3,clock_div_16:4,clock_div_32:5,clock_div_64:6,clock_div_128:7,clock_div_256:8,;",128,0,0,0
	.stabs	"DSTATUS:t(0,8)",128,0,0,0
.global	mmc_disk_initialize
	.type	mmc_disk_initialize, @function
mmc_disk_initialize:
	.stabn	68,0,333,.LM93-.LFBB8
.LM93:
.LFBB8:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 12 */
.L__stack_usage = 12
	.stabn	68,0,337,.LM94-.LFBB8
.LM94:
	call power_off
	.stabn	68,0,338,.LM95-.LFBB8
.LM95:
	ldi r24,lo8(10)
	sts Timer1,r24
.L60:
	.stabn	68,0,338,.LM96-.LFBB8
.LM96:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L60
	.stabn	68,0,339,.LM97-.LFBB8
.LM97:
	lds r24,Stat
	.stabn	68,0,339,.LM98-.LFBB8
.LM98:
	sbrs r24,1
	rjmp .L61
.L75:
	.stabn	68,0,378,.LM99-.LFBB8
.LM99:
	lds r24,Stat
/* epilogue start */
	.stabn	68,0,379,.LM100-.LFBB8
.LM100:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L61:
.LBB20:
.LBB21:
	.stabn	68,0,90,.LM101-.LFBB8
.LM101:
	sbi 0x4,0
	.stabn	68,0,91,.LM102-.LFBB8
.LM102:
	sbi 0x5,0
	.stabn	68,0,94,.LM103-.LFBB8
.LM103:
	call spi_enable
.LBE21:
.LBE20:
	.stabn	68,0,342,.LM104-.LFBB8
.LM104:
	ldi r24,lo8(7)
	ldi r25,0
	call spi_set_clk
	ldi r17,lo8(10)
.L63:
	.stabn	68,0,343,.LM105-.LFBB8
.LM105:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,343,.LM106-.LFBB8
.LM106:
	subi r17,lo8(-(-1))
	brne .L63
	.stabn	68,0,346,.LM107-.LFBB8
.LM107:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,0
	call send_cmd
	mov r16,r24
	.stabn	68,0,346,.LM108-.LFBB8
.LM108:
	cpi r24,lo8(1)
	breq .+2
	rjmp .L64
	.stabn	68,0,347,.LM109-.LFBB8
.LM109:
	ldi r24,lo8(100)
	sts Timer1,r24
	.stabn	68,0,348,.LM110-.LFBB8
.LM110:
	ldi r20,lo8(-86)
	ldi r21,lo8(1)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(8)
	call send_cmd
	.stabn	68,0,348,.LM111-.LFBB8
.LM111:
	cpi r24,lo8(1)
	breq .+2
	rjmp .L65
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r12,r28
	ldi r24,5
	add r12,r24
	adc r13,__zero_reg__
	movw r14,r16
.L66:
	.stabn	68,0,349,.LM112-.LFBB8
.LM112:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,349,.LM113-.LFBB8
.LM113:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	.stabn	68,0,349,.LM114-.LFBB8
.LM114:
	cp r30,r12
	cpc r31,r13
	brne .L66
	.stabn	68,0,350,.LM115-.LFBB8
.LM115:
	ldd r24,Y+3
	cpi r24,lo8(1)
	breq .+2
	rjmp .L64
	.stabn	68,0,350,.LM116-.LFBB8
.LM116:
	ldd r24,Y+4
	cpi r24,lo8(-86)
	breq .+2
	rjmp .L64
.L68:
	.stabn	68,0,351,.LM117-.LFBB8
.LM117:
	lds r24,Timer1
	.stabn	68,0,351,.LM118-.LFBB8
.LM118:
	tst r24
	breq .L67
	.stabn	68,0,351,.LM119-.LFBB8
.LM119:
	ldi r20,0
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(64)
	ldi r24,lo8(-87)
	call send_cmd
	.stabn	68,0,351,.LM120-.LFBB8
.LM120:
	cpse r24,__zero_reg__
	rjmp .L68
.L67:
	.stabn	68,0,352,.LM121-.LFBB8
.LM121:
	lds r24,Timer1
	.stabn	68,0,352,.LM122-.LFBB8
.LM122:
	tst r24
	breq .L64
	.stabn	68,0,352,.LM123-.LFBB8
.LM123:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(58)
	call send_cmd
	.stabn	68,0,352,.LM124-.LFBB8
.LM124:
	cpse r24,__zero_reg__
	rjmp .L64
.L69:
	.stabn	68,0,353,.LM125-.LFBB8
.LM125:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,353,.LM126-.LFBB8
.LM126:
	movw r30,r16
	st Z+,r24
	movw r16,r30
	.stabn	68,0,353,.LM127-.LFBB8
.LM127:
	cp r30,r12
	cpc r31,r13
	brne .L69
	.stabn	68,0,354,.LM128-.LFBB8
.LM128:
	ldd r24,Y+1
	ldi r17,lo8(8)
	sbrs r24,6
	rjmp .L70
	ldi r17,lo8(24)
	rjmp .L70
.L65:
	.stabn	68,0,358,.LM129-.LFBB8
.LM129:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(-87)
	call send_cmd
	.stabn	68,0,361,.LM130-.LFBB8
.LM130:
	ldi r17,lo8(1)
	.stabn	68,0,358,.LM131-.LFBB8
.LM131:
	cpi r24,lo8(2)
	brsh .L73
	.stabn	68,0,359,.LM132-.LFBB8
.LM132:
	ldi r17,lo8(4)
	.stabn	68,0,359,.LM133-.LFBB8
.LM133:
	ldi r16,lo8(-87)
.L73:
	.stabn	68,0,363,.LM134-.LFBB8
.LM134:
	lds r24,Timer1
	.stabn	68,0,363,.LM135-.LFBB8
.LM135:
	tst r24
	breq .L72
	.stabn	68,0,363,.LM136-.LFBB8
.LM136:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	mov r24,r16
	call send_cmd
	.stabn	68,0,363,.LM137-.LFBB8
.LM137:
	cpse r24,__zero_reg__
	rjmp .L73
.L72:
	.stabn	68,0,364,.LM138-.LFBB8
.LM138:
	lds r24,Timer1
	.stabn	68,0,364,.LM139-.LFBB8
.LM139:
	tst r24
	breq .L64
	.stabn	68,0,364,.LM140-.LFBB8
.LM140:
	ldi r20,0
	ldi r21,lo8(2)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(16)
	call send_cmd
	.stabn	68,0,364,.LM141-.LFBB8
.LM141:
	cpse r24,__zero_reg__
.L64:
	.stabn	68,0,365,.LM142-.LFBB8
.LM142:
	ldi r17,0
.L70:
	.stabn	68,0,368,.LM143-.LFBB8
.LM143:
	sts CardType,r17
	.stabn	68,0,369,.LM144-.LFBB8
.LM144:
	call deselect
	.stabn	68,0,371,.LM145-.LFBB8
.LM145:
	tst r17
	breq .L74
	.stabn	68,0,372,.LM146-.LFBB8
.LM146:
	lds r24,Stat
	andi r24,lo8(-2)
	sts Stat,r24
	.stabn	68,0,373,.LM147-.LFBB8
.LM147:
	ldi r24,lo8(1)
	ldi r25,0
	call spi_set_clk
	rjmp .L75
.L74:
	.stabn	68,0,375,.LM148-.LFBB8
.LM148:
	call power_off
	rjmp .L75
	.size	mmc_disk_initialize, .-mmc_disk_initialize
	.stabs	"cmd:r(0,7)",64,0,0,16
	.stabs	"ty:r(0,7)",64,0,0,17
	.stabs	"ocr:(0,10)=ar(0,11)=r(0,11);0;65535;;0;3;(0,7)",128,0,0,1
	.stabn	192,0,0,.LFBB8-.LFBB8
	.stabn	224,0,0,.Lscope8-.LFBB8
.Lscope8:
	.stabs	"mmc_disk_status:F(0,8)",36,0,0,mmc_disk_status
.global	mmc_disk_status
	.type	mmc_disk_status, @function
mmc_disk_status:
	.stabn	68,0,388,.LM149-.LFBB9
.LM149:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,389,.LM150-.LFBB9
.LM150:
	lds r24,Stat
/* epilogue start */
	.stabn	68,0,390,.LM151-.LFBB9
.LM151:
	ret
	.size	mmc_disk_status, .-mmc_disk_status
.Lscope9:
	.stabs	"mmc_disk_read:F(0,12)=(0,13)=eRES_OK:0,RES_ERROR:1,RES_WRPRT:2,RES_NOTRDY:3,RES_PARERR:4,;",36,0,0,mmc_disk_read
	.stabs	"DWORD:t(0,14)=(0,15)=(0,16)=r(0,16);0;4294967295;",128,0,0,0
	.stabs	" :T(0,13)",128,0,0,0
	.stabs	"uint32_t:t(0,15)",128,0,0,0
	.stabs	"long unsigned int:t(0,16)",128,0,0,0
	.stabs	"buff:P(0,17)=*(0,7)",64,0,0,16
	.stabs	"sector:P(0,18)=(0,14)",64,0,0,20
	.stabs	"count:p(0,5)",160,0,0,2
	.stabs	"LBA_t:t(0,18)",128,0,0,0
.global	mmc_disk_read
	.type	mmc_disk_read, @function
mmc_disk_read:
	.stabn	68,0,403,.LM152-.LFBB10
.LM152:
.LFBB10:
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r16,r24
	std Y+2,r18
	std Y+3,r19
	.stabn	68,0,408,.LM153-.LFBB10
.LM153:
	ldd r18,Y+2
	ldd r19,Y+3
	.stabn	68,0,408,.LM154-.LFBB10
.LM154:
	ldi r24,lo8(4)
	.stabn	68,0,408,.LM155-.LFBB10
.LM155:
	or r18,r19
	breq .L115
	.stabn	68,0,409,.LM156-.LFBB10
.LM156:
	lds r24,Stat
	.stabn	68,0,409,.LM157-.LFBB10
.LM157:
	sbrc r24,0
	rjmp .L109
	.stabn	68,0,411,.LM158-.LFBB10
.LM158:
	lds r24,CardType
	sbrc r24,4
	rjmp .L102
	.stabn	68,0,411,.LM159-.LFBB10
.LM159:
	ldi r24,9
	1:
	lsl r20
	rol r21
	rol r22
	rol r23
	dec r24
	brne 1b
.L102:
	.stabn	68,0,413,.LM160-.LFBB10
.LM160:
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,1
	brne .L110
	ldi r25,lo8(17)
	std Y+1,r25
.L103:
	.stabn	68,0,414,.LM161-.LFBB10
.LM161:
	ldd r24,Y+1
	call send_cmd
	.stabn	68,0,414,.LM162-.LFBB10
.LM162:
	cpse r24,__zero_reg__
	rjmp .L104
.L106:
	.stabn	68,0,416,.LM163-.LFBB10
.LM163:
	ldi r22,0
	ldi r23,lo8(2)
	movw r24,r16
	call rcvr_datablock
	.stabn	68,0,416,.LM164-.LFBB10
.LM164:
	or r24,r25
	breq .L105
	.stabn	68,0,417,.LM165-.LFBB10
.LM165:
	subi r17,-2
	.stabn	68,0,418,.LM166-.LFBB10
.LM166:
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,1
	std Y+3,r25
	std Y+2,r24
	or r24,r25
	brne .L106
.L105:
	.stabn	68,0,419,.LM167-.LFBB10
.LM167:
	ldd r25,Y+1
	cpi r25,lo8(18)
	brne .L104
	.stabn	68,0,419,.LM168-.LFBB10
.LM168:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(12)
	call send_cmd
.L104:
	.stabn	68,0,421,.LM169-.LFBB10
.LM169:
	call deselect
	.stabn	68,0,423,.LM170-.LFBB10
.LM170:
	ldi r24,lo8(1)
	ldd r18,Y+2
	ldd r19,Y+3
	or r18,r19
	brne .L115
	ldi r24,0
.L115:
	.stabn	68,0,409,.LM171-.LFBB10
.LM171:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,424,.LM172-.LFBB10
.LM172:
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L110:
	.stabn	68,0,413,.LM173-.LFBB10
.LM173:
	ldi r18,lo8(18)
	std Y+1,r18
	rjmp .L103
.L109:
	.stabn	68,0,409,.LM174-.LFBB10
.LM174:
	ldi r24,lo8(3)
	rjmp .L115
	.size	mmc_disk_read, .-mmc_disk_read
	.stabs	"sect:r(0,14)",64,0,0,20
	.stabn	192,0,0,.LFBB10-.LFBB10
	.stabn	224,0,0,.Lscope10-.LFBB10
.Lscope10:
	.stabs	"mmc_disk_write:F(0,12)",36,0,0,mmc_disk_write
	.stabs	"buff:P(0,19)=*(0,7)",64,0,0,16
	.stabs	"sector:P(0,18)",64,0,0,12
	.stabs	"count:P(0,5)",64,0,0,28
.global	mmc_disk_write
	.type	mmc_disk_write, @function
mmc_disk_write:
	.stabn	68,0,438,.LM175-.LFBB11
.LM175:
.LFBB11:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r16,r24
	movw r12,r20
	movw r14,r22
	movw r28,r18
	.stabn	68,0,442,.LM176-.LFBB11
.LM176:
	ldi r24,lo8(4)
	.stabn	68,0,442,.LM177-.LFBB11
.LM177:
	sbiw r28,0
	breq .L140
	.stabn	68,0,443,.LM178-.LFBB11
.LM178:
	lds r24,Stat
	.stabn	68,0,443,.LM179-.LFBB11
.LM179:
	sbrc r24,0
	rjmp .L128
	.stabn	68,0,444,.LM180-.LFBB11
.LM180:
	lds r24,Stat
	.stabn	68,0,444,.LM181-.LFBB11
.LM181:
	sbrc r24,2
	rjmp .L129
	.stabn	68,0,446,.LM182-.LFBB11
.LM182:
	lds r24,CardType
	.stabn	68,0,446,.LM183-.LFBB11
.LM183:
	sbrc r24,4
	rjmp .L118
	.stabn	68,0,446,.LM184-.LFBB11
.LM184:
	ldi r25,9
	1:
	lsl r12
	rol r13
	rol r14
	rol r15
	dec r25
	brne 1b
.L118:
	.stabn	68,0,448,.LM185-.LFBB11
.LM185:
	cpi r28,1
	cpc r29,__zero_reg__
	brne .L119
	.stabn	68,0,449,.LM186-.LFBB11
.LM186:
	movw r22,r14
	movw r20,r12
	ldi r24,lo8(24)
	call send_cmd
	.stabn	68,0,449,.LM187-.LFBB11
.LM187:
	cpse r24,__zero_reg__
	rjmp .L120
	.stabn	68,0,450,.LM188-.LFBB11
.LM188:
	ldi r22,lo8(-2)
	movw r24,r16
	call xmit_datablock
	movw r18,r24
	.stabn	68,0,450,.LM189-.LFBB11
.LM189:
	ldi r25,lo8(1)
	or r18,r19
	breq .L121
	ldi r25,0
.L121:
	mov r28,r25
	ldi r24,0
	mov r29,r24
.L122:
	.stabn	68,0,464,.LM190-.LFBB11
.LM190:
	call deselect
	.stabn	68,0,466,.LM191-.LFBB11
.LM191:
	ldi r24,lo8(1)
	or r28,r29
	brne .L140
	ldi r24,0
.L140:
	.stabn	68,0,444,.LM192-.LFBB11
.LM192:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,467,.LM193-.LFBB11
.LM193:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L119:
	.stabn	68,0,455,.LM194-.LFBB11
.LM194:
	andi r24,lo8(12)
	breq .L123
	.stabn	68,0,455,.LM195-.LFBB11
.LM195:
	movw r20,r28
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(-105)
	call send_cmd
.L123:
	.stabn	68,0,456,.LM196-.LFBB11
.LM196:
	movw r22,r14
	movw r20,r12
	ldi r24,lo8(25)
	call send_cmd
	.stabn	68,0,456,.LM197-.LFBB11
.LM197:
	cpse r24,__zero_reg__
	rjmp .L122
.L125:
	.stabn	68,0,458,.LM198-.LFBB11
.LM198:
	ldi r22,lo8(-4)
	movw r24,r16
	call xmit_datablock
	.stabn	68,0,458,.LM199-.LFBB11
.LM199:
	or r24,r25
	breq .L124
	.stabn	68,0,459,.LM200-.LFBB11
.LM200:
	subi r17,-2
	.stabn	68,0,460,.LM201-.LFBB11
.LM201:
	sbiw r28,1
	brne .L125
.L124:
	.stabn	68,0,461,.LM202-.LFBB11
.LM202:
	ldi r22,lo8(-3)
	ldi r25,0
	ldi r24,0
	call xmit_datablock
	.stabn	68,0,461,.LM203-.LFBB11
.LM203:
	or r24,r25
	brne .L122
.L120:
	.stabn	68,0,461,.LM204-.LFBB11
.LM204:
	ldi r28,lo8(1)
	ldi r29,0
	rjmp .L122
.L128:
	.stabn	68,0,443,.LM205-.LFBB11
.LM205:
	ldi r24,lo8(3)
	rjmp .L140
.L129:
	.stabn	68,0,444,.LM206-.LFBB11
.LM206:
	ldi r24,lo8(2)
	rjmp .L140
	.size	mmc_disk_write, .-mmc_disk_write
	.stabs	"sect:r(0,14)",64,0,0,12
	.stabn	192,0,0,.LFBB11-.LFBB11
	.stabn	224,0,0,.Lscope11-.LFBB11
.Lscope11:
	.stabs	"mmc_disk_ioctl:F(0,12)",36,0,0,mmc_disk_ioctl
	.stabs	"WORD:t(0,20)=(0,21)=(0,6)",128,0,0,0
	.stabs	"uint16_t:t(0,21)",128,0,0,0
	.stabs	"cmd:P(0,7)",64,0,0,24
	.stabs	"buff:P(0,22)=*(0,1)",64,0,0,16
.global	mmc_disk_ioctl
	.type	mmc_disk_ioctl, @function
mmc_disk_ioctl:
	.stabn	68,0,480,.LM207-.LFBB12
.LM207:
.LFBB12:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,16
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 16 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r16,r22
	.stabn	68,0,494,.LM208-.LFBB12
.LM208:
	lds r25,Stat
	.stabn	68,0,494,.LM209-.LFBB12
.LM209:
	sbrc r25,0
	rjmp .L195
	.stabn	68,0,497,.LM210-.LFBB12
.LM210:
	cpi r24,lo8(58)
	brsh .L196
	cpi r24,lo8(50)
	brsh .L143
	cpi r24,lo8(3)
	brne .+2
	rjmp .L144
	brsh .L145
	tst r24
	breq .L146
	cpi r24,lo8(1)
	breq .L147
.L196:
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L141
.L143:
	subi r24,lo8(-(-51))
	cpi r24,lo8(7)
	brlo .+2
	rjmp .L148
	mov r30,r24
	ldi r31,0
	clr r24
	subi r30,pm_lo8(-(.L150))
	sbci r31,pm_hi8(-(.L150))
	sbci r24,pm_hh8(-(.L150))
	jmp __tablejump2__
	.section	.jumptables.gcc.mmc_disk_ioctl,"a",@progbits
	.p2align	1
.L150:
	.word gs(.L156)
	.word gs(.L155)
	.word gs(.L154)
	.word gs(.L153)
	.word gs(.L152)
	.word gs(.L151)
	.word gs(.L149)
	.text
.L145:
	cpi r24,lo8(7)
	brne .L196
	.stabn	68,0,592,.LM211-.LFBB12
.LM211:
	call power_off
	.stabn	68,0,593,.LM212-.LFBB12
.LM212:
	lds r24,Stat
	ori r24,lo8(1)
	sts Stat,r24
	rjmp .L230
.L146:
	.stabn	68,0,499,.LM213-.LFBB12
.LM213:
	call select
.L235:
	.stabn	68,0,586,.LM214-.LFBB12
.LM214:
	movw r18,r24
	.stabn	68,0,586,.LM215-.LFBB12
.LM215:
	ldi r25,lo8(1)
	or r18,r19
	brne .+2
	rjmp .L194
.L232:
	.stabn	68,0,627,.LM216-.LFBB12
.LM216:
	ldi r25,0
	rjmp .L194
.L147:
	.stabn	68,0,504,.LM217-.LFBB12
.LM217:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(9)
	call send_cmd
	.stabn	68,0,504,.LM218-.LFBB12
.LM218:
	tst r24
	breq .L159
.L202:
	.stabn	68,0,496,.LM219-.LFBB12
.LM219:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L192
.L159:
	.stabn	68,0,504,.LM220-.LFBB12
.LM220:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,504,.LM221-.LFBB12
.LM221:
	or r24,r25
	breq .L202
	.stabn	68,0,505,.LM222-.LFBB12
.LM222:
	ldd r25,Y+1
	swap r25
	lsr r25
	lsr r25
	andi r25,lo8(3)
	ldd r18,Y+9
	ldd r20,Y+10
	ldd r24,Y+8
	.stabn	68,0,505,.LM223-.LFBB12
.LM223:
	cpi r25,lo8(1)
	brne .L162
	.stabn	68,0,506,.LM224-.LFBB12
.LM224:
	ldi r19,0
	.stabn	68,0,506,.LM225-.LFBB12
.LM225:
	mov r19,r18
	clr r18
	.stabn	68,0,506,.LM226-.LFBB12
.LM226:
	add r18,r20
	adc r19,__zero_reg__
	.stabn	68,0,506,.LM227-.LFBB12
.LM227:
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,506,.LM228-.LFBB12
.LM228:
	movw r26,r24
	clr r25
	clr r24
	clr r24
	clr r25
	andi r26,63
	clr r27
	.stabn	68,0,506,.LM229-.LFBB12
.LM229:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	add r24,r18
	adc r25,r19
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	.stabn	68,0,507,.LM230-.LFBB12
.LM230:
	ldi r18,10
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r18
	brne 1b
.L231:
	.stabn	68,0,531,.LM231-.LFBB12
.LM231:
	movw r30,r16
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.L229:
	.stabn	68,0,535,.LM232-.LFBB12
.LM232:
	ldi r17,0
	ldi r16,0
.L192:
	.stabn	68,0,629,.LM233-.LFBB12
.LM233:
	call deselect
	.stabn	68,0,630,.LM234-.LFBB12
.LM234:
	rjmp .L141
.L162:
	.stabn	68,0,510,.LM235-.LFBB12
.LM235:
	swap r18
	lsr r18
	lsr r18
	andi r18,lo8(3)
	.stabn	68,0,510,.LM236-.LFBB12
.LM236:
	ldi r31,lo8(4)
	mul r24,r31
	movw r24,r0
	clr __zero_reg__
	.stabn	68,0,510,.LM237-.LFBB12
.LM237:
	add r24,r18
	adc r25,__zero_reg__
	.stabn	68,0,510,.LM238-.LFBB12
.LM238:
	adiw r24,1
	.stabn	68,0,510,.LM239-.LFBB12
.LM239:
	ldd r18,Y+7
	ldi r19,0
	.stabn	68,0,510,.LM240-.LFBB12
.LM240:
	mov r19,r18
	clr r18
	lsl r19
	lsl r19
	clr r18
	andi r19,12
	.stabn	68,0,510,.LM241-.LFBB12
.LM241:
	add r24,r18
	adc r25,r19
	.stabn	68,0,510,.LM242-.LFBB12
.LM242:
	ldi r27,0
	ldi r26,0
	.stabn	68,0,509,.LM243-.LFBB12
.LM243:
	ldd r18,Y+6
	andi r18,lo8(15)
	.stabn	68,0,509,.LM244-.LFBB12
.LM244:
	ldd r19,Y+11
	rol r19
	clr r19
	rol r19
	.stabn	68,0,509,.LM245-.LFBB12
.LM245:
	add r18,r19
	.stabn	68,0,509,.LM246-.LFBB12
.LM246:
	subi r18,lo8(-(2))
	.stabn	68,0,509,.LM247-.LFBB12
.LM247:
	lsl r20
	andi r20,lo8(6)
	.stabn	68,0,509,.LM248-.LFBB12
.LM248:
	add r18,r20
	.stabn	68,0,511,.LM249-.LFBB12
.LM249:
	subi r18,9
	sbc r19,r19
.L236:
	.stabn	68,0,524,.LM250-.LFBB12
.LM250:
	rjmp 2f
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	2:
	dec r18
	brpl 1b
	rjmp .L231
.L144:
	.stabn	68,0,519,.LM251-.LFBB12
.LM251:
	lds r24,CardType
	.stabn	68,0,520,.LM252-.LFBB12
.LM252:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	.stabn	68,0,519,.LM253-.LFBB12
.LM253:
	sbrs r24,3
	rjmp .L163
	.stabn	68,0,520,.LM254-.LFBB12
.LM254:
	ldi r24,lo8(-115)
	call send_cmd
	.stabn	68,0,520,.LM255-.LFBB12
.LM255:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,521,.LM256-.LFBB12
.LM256:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,522,.LM257-.LFBB12
.LM257:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,522,.LM258-.LFBB12
.LM258:
	or r24,r25
	brne .+2
	rjmp .L202
	ldi r22,lo8(48)
	mov r15,r22
.L167:
	.stabn	68,0,523,.LM259-.LFBB12
.LM259:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,523,.LM260-.LFBB12
.LM260:
	dec r15
	cpse r15,__zero_reg__
	rjmp .L167
	.stabn	68,0,524,.LM261-.LFBB12
.LM261:
	ldd r18,Y+11
	swap r18
	andi r18,lo8(15)
	.stabn	68,0,524,.LM262-.LFBB12
.LM262:
	ldi r24,lo8(16)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	rjmp .L236
.L163:
	.stabn	68,0,529,.LM263-.LFBB12
.LM263:
	ldi r24,lo8(9)
	call send_cmd
	.stabn	68,0,529,.LM264-.LFBB12
.LM264:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,529,.LM265-.LFBB12
.LM265:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,529,.LM266-.LFBB12
.LM266:
	or r24,r25
	brne .+2
	rjmp .L202
	.stabn	68,0,531,.LM267-.LFBB12
.LM267:
	ldd r24,Y+11
	ldi r25,0
	.stabn	68,0,531,.LM268-.LFBB12
.LM268:
	ldd r18,Y+12
	.stabn	68,0,530,.LM269-.LFBB12
.LM269:
	lds r19,CardType
	sbrs r19,2
	rjmp .L168
	.stabn	68,0,531,.LM270-.LFBB12
.LM270:
	lsl r24
	rol r25
	andi r24,126
	clr r25
	.stabn	68,0,531,.LM271-.LFBB12
.LM271:
	rol r18
	clr r18
	rol r18
	.stabn	68,0,531,.LM272-.LFBB12
.LM272:
	subi r18,lo8(-(1))
	add r24,r18
	adc r25,__zero_reg__
	.stabn	68,0,531,.LM273-.LFBB12
.LM273:
	ldd r18,Y+14
	swap r18
	lsr r18
	lsr r18
	andi r18,lo8(3)
	.stabn	68,0,531,.LM274-.LFBB12
.LM274:
	subi r18,1
	sbc r19,r19
	.stabn	68,0,531,.LM275-.LFBB12
.LM275:
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r18
	brpl 1b
	ldi r27,0
	ldi r26,0
	rjmp .L231
.L168:
	.stabn	68,0,533,.LM276-.LFBB12
.LM276:
	ldi r31,lo8(8)
	mul r18,r31
	movw r20,r0
	clr __zero_reg__
	andi r20,24
	clr r21
	.stabn	68,0,533,.LM277-.LFBB12
.LM277:
	swap r18
	lsr r18
	andi r18,lo8(7)
	.stabn	68,0,533,.LM278-.LFBB12
.LM278:
	add r18,r20
	mov r19,r21
	adc r19,__zero_reg__
	.stabn	68,0,533,.LM279-.LFBB12
.LM279:
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,533,.LM280-.LFBB12
.LM280:
	asr r25
	ror r24
	asr r25
	ror r24
	.stabn	68,0,533,.LM281-.LFBB12
.LM281:
	andi r24,31
	clr r25
	.stabn	68,0,533,.LM282-.LFBB12
.LM282:
	adiw r24,1
	.stabn	68,0,533,.LM283-.LFBB12
.LM283:
	mul r18,r24
	movw r20,r0
	mul r18,r25
	add r21,r0
	mul r19,r24
	add r21,r0
	clr r1
	ldi r23,0
	ldi r22,0
	movw r30,r16
	st Z,r20
	std Z+1,r21
	std Z+2,r22
	std Z+3,r23
	rjmp .L229
.L148:
	.stabn	68,0,557,.LM284-.LFBB12
.LM284:
	lds r24,CardType
	movw r30,r22
	st Z,r24
.L230:
	.stabn	68,0,594,.LM285-.LFBB12
.LM285:
	ldi r17,0
	ldi r16,0
.L141:
	.stabn	68,0,637,.LM286-.LFBB12
.LM286:
	movw r24,r16
/* epilogue start */
	adiw r28,16
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
.L156:
	.stabn	68,0,562,.LM287-.LFBB12
.LM287:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(9)
.L239:
	.stabn	68,0,569,.LM288-.LFBB12
.LM288:
	call send_cmd
	.stabn	68,0,569,.LM289-.LFBB12
.LM289:
	ldi r22,lo8(16)
	ldi r23,0
	.stabn	68,0,569,.LM290-.LFBB12
.LM290:
	cpse r24,__zero_reg__
	rjmp .L202
.L234:
	.stabn	68,0,586,.LM291-.LFBB12
.LM291:
	movw r24,r16
	call rcvr_datablock
	rjmp .L235
.L155:
	.stabn	68,0,569,.LM292-.LFBB12
.LM292:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(10)
	rjmp .L239
.L154:
	.stabn	68,0,576,.LM293-.LFBB12
.LM293:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(58)
	call send_cmd
	.stabn	68,0,576,.LM294-.LFBB12
.LM294:
	cpse r24,__zero_reg__
	rjmp .L202
	movw r14,r16
	ldi r31,4
	add r14,r31
	adc r15,__zero_reg__
.L174:
	movw r12,r16
	.stabn	68,0,577,.LM295-.LFBB12
.LM295:
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,577,.LM296-.LFBB12
.LM296:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,577,.LM297-.LFBB12
.LM297:
	movw r30,r12
	st Z,r24
	.stabn	68,0,577,.LM298-.LFBB12
.LM298:
	cp r14,r16
	cpc r15,r17
	brne .L174
	rjmp .L229
.L153:
	.stabn	68,0,584,.LM299-.LFBB12
.LM299:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(-115)
	call send_cmd
	.stabn	68,0,584,.LM300-.LFBB12
.LM300:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,585,.LM301-.LFBB12
.LM301:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,586,.LM302-.LFBB12
.LM302:
	ldi r22,lo8(64)
	ldi r23,0
	rjmp .L234
.L152:
	.stabn	68,0,599,.LM303-.LFBB12
.LM303:
	movw r30,r22
	ldd r20,Z+3
	ldd r21,Z+4
	ldd r22,Z+5
	ldd r23,Z+6
	ldi r26,9
	1:
	lsl r20
	rol r21
	rol r22
	rol r23
	dec r26
	brne 1b
	.stabn	68,0,599,.LM304-.LFBB12
.LM304:
	ldd r24,Z+1
	ldd r25,Z+2
	sbiw r24,1
	.stabn	68,0,599,.LM305-.LFBB12
.LM305:
	andi r25,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,599,.LM306-.LFBB12
.LM306:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,599,.LM307-.LFBB12
.LM307:
	ld r24,Z
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,599,.LM308-.LFBB12
.LM308:
	ldi r18,28
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r18
	brne 1b
	.stabn	68,0,599,.LM309-.LFBB12
.LM309:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,599,.LM310-.LFBB12
.LM310:
	movw r20,r24
	movw r22,r26
	ori r23,128
	ldi r24,lo8(48)
	call send_cmd
	.stabn	68,0,599,.LM311-.LFBB12
.LM311:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,600,.LM312-.LFBB12
.LM312:
	ldi r24,lo8(100)
	sts Timer1,r24
.L180:
	.stabn	68,0,600,.LM313-.LFBB12
.LM313:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,600,.LM314-.LFBB12
.LM314:
	cpi r24,lo8(-1)
	brne .L179
	.stabn	68,0,600,.LM315-.LFBB12
.LM315:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L180
	rjmp .L202
.L179:
	.stabn	68,0,601,.LM316-.LFBB12
.LM316:
	cpi r24,lo8(-2)
	breq .+2
	rjmp .L202
	.stabn	68,0,602,.LM317-.LFBB12
.LM317:
	movw r30,r16
	ldd r14,Z+7
	ldd r15,Z+8
	ldd r12,Z+1
	ldd r13,Z+2
	add r12,r14
	adc r13,r15
.L182:
	.stabn	68,0,602,.LM318-.LFBB12
.LM318:
	cp r14,r12
	cpc r15,r13
	brne .L183
	.stabn	68,0,603,.LM319-.LFBB12
.LM319:
	movw r30,r16
	ldd r24,Z+1
	ldd r25,Z+2
	ldi r16,lo8(2)
	ldi r17,lo8(2)
	sub r16,r24
	sbc r17,r25
.L184:
	.stabn	68,0,603,.LM320-.LFBB12
.LM320:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L192
	.stabn	68,0,603,.LM321-.LFBB12
.LM321:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,603,.LM322-.LFBB12
.LM322:
	subi r16,1
	sbc r17,__zero_reg__
	rjmp .L184
.L183:
	.stabn	68,0,602,.LM323-.LFBB12
.LM323:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,602,.LM324-.LFBB12
.LM324:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	rjmp .L182
.L151:
	.stabn	68,0,612,.LM325-.LFBB12
.LM325:
	movw r30,r22
	ldd r20,Z+3
	ldd r21,Z+4
	ldd r22,Z+5
	ldd r23,Z+6
	ldi r19,9
	1:
	lsl r20
	rol r21
	rol r22
	rol r23
	dec r19
	brne 1b
	.stabn	68,0,612,.LM326-.LFBB12
.LM326:
	ldd r24,Z+1
	ldd r25,Z+2
	sbiw r24,1
	.stabn	68,0,612,.LM327-.LFBB12
.LM327:
	andi r25,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,612,.LM328-.LFBB12
.LM328:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,612,.LM329-.LFBB12
.LM329:
	ld r24,Z
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,612,.LM330-.LFBB12
.LM330:
	ldi r30,28
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r30
	brne 1b
	.stabn	68,0,612,.LM331-.LFBB12
.LM331:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,612,.LM332-.LFBB12
.LM332:
	movw r20,r24
	movw r22,r26
	ori r23,128
	ldi r24,lo8(49)
	call send_cmd
	.stabn	68,0,612,.LM333-.LFBB12
.LM333:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,613,.LM334-.LFBB12
.LM334:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,613,.LM335-.LFBB12
.LM335:
	ldi r24,lo8(-2)
	call spi_xchg
	.stabn	68,0,614,.LM336-.LFBB12
.LM336:
	movw r30,r16
	ldd r14,Z+7
	ldd r15,Z+8
	ldd r12,Z+1
	ldd r13,Z+2
	add r12,r14
	adc r13,r15
.L187:
	.stabn	68,0,614,.LM337-.LFBB12
.LM337:
	cp r14,r12
	cpc r15,r13
	brne .L188
	.stabn	68,0,615,.LM338-.LFBB12
.LM338:
	movw r30,r16
	ldd r24,Z+1
	ldd r25,Z+2
	ldi r16,lo8(2)
	ldi r17,lo8(2)
	sub r16,r24
	sbc r17,r25
.L189:
	.stabn	68,0,615,.LM339-.LFBB12
.LM339:
	ldi r24,lo8(-1)
	.stabn	68,0,615,.LM340-.LFBB12
.LM340:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L190
.L233:
	.stabn	68,0,627,.LM341-.LFBB12
.LM341:
	call spi_xchg
	.stabn	68,0,627,.LM342-.LFBB12
.LM342:
	andi r24,lo8(31)
	ldi r25,lo8(1)
	cpi r24,lo8(5)
	brne .+2
	rjmp .L232
.L194:
	.stabn	68,0,496,.LM343-.LFBB12
.LM343:
	mov r16,r25
	ldi r17,0
	rjmp .L192
.L188:
	.stabn	68,0,614,.LM344-.LFBB12
.LM344:
	movw r30,r14
	ld r24,Z+
	movw r14,r30
	call spi_xchg
	rjmp .L187
.L190:
	.stabn	68,0,615,.LM345-.LFBB12
.LM345:
	call spi_xchg
	.stabn	68,0,615,.LM346-.LFBB12
.LM346:
	subi r16,1
	sbc r17,__zero_reg__
	rjmp .L189
.L149:
	.stabn	68,0,623,.LM347-.LFBB12
.LM347:
	movw r30,r22
	ld r20,Z
	ldi r21,0
	ldi r23,0
	ldi r22,0
	.stabn	68,0,623,.LM348-.LFBB12
.LM348:
	ldi r24,28
	1:
	lsl r20
	rol r21
	rol r22
	rol r23
	dec r24
	brne 1b
	.stabn	68,0,623,.LM349-.LFBB12
.LM349:
	ldd r24,Z+2
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,623,.LM350-.LFBB12
.LM350:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,623,.LM351-.LFBB12
.LM351:
	ldd r24,Z+3
	ldd r25,Z+4
	ldd r26,Z+5
	ldd r27,Z+6
	ldi r18,9
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r18
	brne 1b
	.stabn	68,0,623,.LM352-.LFBB12
.LM352:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,623,.LM353-.LFBB12
.LM353:
	movw r20,r24
	movw r22,r26
	ori r23,132
	ldi r24,lo8(49)
	call send_cmd
	.stabn	68,0,623,.LM354-.LFBB12
.LM354:
	cpse r24,__zero_reg__
	rjmp .L202
	.stabn	68,0,624,.LM355-.LFBB12
.LM355:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,624,.LM356-.LFBB12
.LM356:
	ldi r24,lo8(-2)
	call spi_xchg
	.stabn	68,0,625,.LM357-.LFBB12
.LM357:
	movw r30,r16
	ldd r24,Z+1
	call spi_xchg
	ldi r16,lo8(1)
	ldi r17,lo8(2)
.L193:
	.stabn	68,0,626,.LM358-.LFBB12
.LM358:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,626,.LM359-.LFBB12
.LM359:
	subi r16,1
	sbc r17,__zero_reg__
	brne .L193
	.stabn	68,0,627,.LM360-.LFBB12
.LM360:
	ldi r24,lo8(-1)
	rjmp .L233
.L195:
	.stabn	68,0,494,.LM361-.LFBB12
.LM361:
	ldi r16,lo8(3)
	ldi r17,0
	rjmp .L141
	.size	mmc_disk_ioctl, .-mmc_disk_ioctl
	.stabs	"csd:(0,23)=ar(0,11);0;15;(0,7)",128,0,0,1
	.stabs	"rc:r(0,7)",64,0,0,24
	.stabn	192,0,0,.LFBB12-.LFBB12
	.stabn	224,0,0,.Lscope12-.LFBB12
.Lscope12:
	.stabs	"mmc_disk_timerproc:F(0,1)",36,0,0,mmc_disk_timerproc
.global	mmc_disk_timerproc
	.type	mmc_disk_timerproc, @function
mmc_disk_timerproc:
	.stabn	68,0,647,.LM362-.LFBB13
.LM362:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,652,.LM363-.LFBB13
.LM363:
	lds r24,Timer1
	.stabn	68,0,653,.LM364-.LFBB13
.LM364:
	tst r24
	breq .L241
	.stabn	68,0,653,.LM365-.LFBB13
.LM365:
	subi r24,lo8(-(-1))
	sts Timer1,r24
.L241:
	.stabn	68,0,654,.LM366-.LFBB13
.LM366:
	lds r24,Timer2
	lds r25,Timer2+1
	.stabn	68,0,655,.LM367-.LFBB13
.LM367:
	sbiw r24,0
	breq .L242
	.stabn	68,0,655,.LM368-.LFBB13
.LM368:
	sbiw r24,1
	sts Timer2+1,r25
	sts Timer2,r24
.L242:
	.stabn	68,0,657,.LM369-.LFBB13
.LM369:
	lds r24,Stat
	.stabn	68,0,664,.LM370-.LFBB13
.LM370:
	andi r24,lo8(-7)
	.stabn	68,0,668,.LM371-.LFBB13
.LM371:
	sts Stat,r24
/* epilogue start */
	.stabn	68,0,669,.LM372-.LFBB13
.LM372:
	ret
	.size	mmc_disk_timerproc, .-mmc_disk_timerproc
.Lscope13:
	.local	CardType
	.comm	CardType,1,1
	.stabs	"CardType:S(0,7)",40,0,0,CardType
	.local	Timer2
	.comm	Timer2,2,1
	.stabs	"Timer2:S(0,5)",40,0,0,Timer2
	.local	Timer1
	.comm	Timer1,1,1
	.stabs	"Timer1:S(0,7)",40,0,0,Timer1
	.data
	.type	Stat, @object
	.size	Stat, 1
Stat:
	.byte	1
	.stabs	"Stat:S(0,8)",38,0,0,Stat
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
