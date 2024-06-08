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
	.stabs	"void:t(0,1)",128,0,0,0
	.type	deselect, @function
deselect:
	.stabn	68,0,120,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,121,.LM1-.LFBB1
.LM1:
	call sd_card_cs_hi
	.stabn	68,0,122,.LM2-.LFBB1
.LM2:
	ldi r24,lo8(-1)
	jmp spi_xchg
	.size	deselect, .-deselect
.Lscope1:
	.stabs	"rcvr_datablock:f(0,2)=r(0,2);-32768;32767;",36,0,0,rcvr_datablock
	.stabs	"int:t(0,2)",128,0,0,0
	.stabs	"btr:P(0,3)=(0,4)=r(0,4);0;65535;",64,0,0,28
	.stabs	"UINT:t(0,3)",128,0,0,0
	.stabs	"unsigned int:t(0,4)",128,0,0,0
	.type	rcvr_datablock, @function
rcvr_datablock:
	.stabn	68,0,155,.LM3-.LFBB2
.LM3:
.LFBB2:
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
	.stabn	68,0,159,.LM4-.LFBB2
.LM4:
	ldi r24,lo8(20)
	sts Timer1,r24
.L4:
	.stabn	68,0,161,.LM5-.LFBB2
.LM5:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,162,.LM6-.LFBB2
.LM6:
	cpi r24,lo8(-1)
	brne .L3
	.stabn	68,0,162,.LM7-.LFBB2
.LM7:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L4
.L6:
	.stabn	68,0,163,.LM8-.LFBB2
.LM8:
	ldi r25,0
	ldi r24,0
	rjmp .L2
.L3:
	.stabn	68,0,163,.LM9-.LFBB2
.LM9:
	cpi r24,lo8(-2)
	brne .L6
.LBB12:
.LBB13:
	.stabn	68,0,165,.LM10-.LFBB2
.LM10:
	movw r20,r28
	ldi r23,0
	ldi r22,0
	movw r24,r16
	call spi_rcvr_multi
	.stabn	68,0,166,.LM11-.LFBB2
.LM11:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,167,.LM12-.LFBB2
.LM12:
	ldi r24,lo8(-1)
	call spi_xchg
	ldi r24,lo8(1)
	ldi r25,0
.L2:
/* epilogue start */
.LBE13:
.LBE12:
	.stabn	68,0,170,.LM13-.LFBB2
.LM13:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	rcvr_datablock, .-rcvr_datablock
	.stabs	"token:r(0,5)=(0,6)=r(0,6);0;255;",64,0,0,24
	.stabs	"BYTE:t(0,5)",128,0,0,0
	.stabs	"unsigned char:t(0,6)",128,0,0,0
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"wait_ready.constprop.0:f(0,2)",36,0,0,wait_ready.constprop.0
	.type	wait_ready.constprop.0, @function
wait_ready.constprop.0:
	.stabn	68,0,95,.LM14-.LFBB3
.LM14:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,103,.LM15-.LFBB3
.LM15:
/* #APP */
 ;  103 "src/fatfs/mmc_avr_spi.c" 1
	cli
 ;  0 "" 2
	.stabn	68,0,103,.LM16-.LFBB3
.LM16:
/* #NOAPP */
	ldi r24,lo8(50)
	ldi r25,0
	sts Timer2+1,r25
	sts Timer2,r24
	.stabn	68,0,103,.LM17-.LFBB3
.LM17:
/* #APP */
 ;  103 "src/fatfs/mmc_avr_spi.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L10:
	.stabn	68,0,105,.LM18-.LFBB3
.LM18:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,106,.LM19-.LFBB3
.LM19:
/* #APP */
 ;  106 "src/fatfs/mmc_avr_spi.c" 1
	cli
 ;  0 "" 2
	.stabn	68,0,106,.LM20-.LFBB3
.LM20:
/* #NOAPP */
	lds r18,Timer2
	lds r19,Timer2+1
	.stabn	68,0,106,.LM21-.LFBB3
.LM21:
/* #APP */
 ;  106 "src/fatfs/mmc_avr_spi.c" 1
	sei
 ;  0 "" 2
	.stabn	68,0,107,.LM22-.LFBB3
.LM22:
/* #NOAPP */
	cpi r24,lo8(-1)
	breq .L9
	or r18,r19
	brne .L10
.L9:
	.stabn	68,0,109,.LM23-.LFBB3
.LM23:
	ldi r18,lo8(1)
	ldi r19,0
	cpi r24,lo8(-1)
	breq .L11
	ldi r19,0
	ldi r18,0
.L11:
	.stabn	68,0,110,.LM24-.LFBB3
.LM24:
	movw r24,r18
/* epilogue start */
	ret
	.size	wait_ready.constprop.0, .-wait_ready.constprop.0
	.stabs	"d:r(0,5)",64,0,0,24
	.stabs	"wt:r(0,3)",64,0,0,18
	.stabn	192,0,0,.LFBB3-.LFBB3
	.stabn	224,0,0,.Lscope3-.LFBB3
.Lscope3:
	.stabs	"xmit_datablock:f(0,2)",36,0,0,xmit_datablock
	.stabs	"token:P(0,5)",64,0,0,28
	.type	xmit_datablock, @function
xmit_datablock:
	.stabn	68,0,184,.LM25-.LFBB4
.LM25:
.LFBB4:
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
	.stabn	68,0,188,.LM26-.LFBB4
.LM26:
	call wait_ready.constprop.0
	movw r18,r24
	.stabn	68,0,188,.LM27-.LFBB4
.LM27:
	or r24,r25
	breq .L19
	.stabn	68,0,191,.LM28-.LFBB4
.LM28:
	mov r24,r28
	call spi_xchg
	.stabn	68,0,192,.LM29-.LFBB4
.LM29:
	ldi r18,lo8(1)
	ldi r19,0
	.stabn	68,0,192,.LM30-.LFBB4
.LM30:
	cpi r28,lo8(-3)
	breq .L19
.LBB16:
.LBB17:
	.stabn	68,0,194,.LM31-.LFBB4
.LM31:
	ldi r20,0
	ldi r21,lo8(2)
	ldi r22,0
	ldi r23,0
	mov r24,r17
	mov r25,r29
	call spi_xmit_multi
	.stabn	68,0,195,.LM32-.LFBB4
.LM32:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,195,.LM33-.LFBB4
.LM33:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,197,.LM34-.LFBB4
.LM34:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,199,.LM35-.LFBB4
.LM35:
	andi r24,lo8(31)
	ldi r25,lo8(1)
	cpi r24,lo8(5)
	breq .L21
	ldi r25,0
.L21:
	mov r18,r25
	ldi r19,0
.L19:
.LBE17:
.LBE16:
	.stabn	68,0,202,.LM36-.LFBB4
.LM36:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	xmit_datablock, .-xmit_datablock
.Lscope4:
	.stabs	"select:f(0,2)",36,0,0,select
	.type	select, @function
select:
	.stabn	68,0,133,.LM37-.LFBB5
.LM37:
.LFBB5:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,134,.LM38-.LFBB5
.LM38:
	call sd_card_cs_lo
	.stabn	68,0,135,.LM39-.LFBB5
.LM39:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,137,.LM40-.LFBB5
.LM40:
	call wait_ready.constprop.0
	movw r28,r24
	.stabn	68,0,137,.LM41-.LFBB5
.LM41:
	or r24,r25
	brne .L31
	.stabn	68,0,140,.LM42-.LFBB5
.LM42:
	call deselect
.L29:
	.stabn	68,0,142,.LM43-.LFBB5
.LM43:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	ret
.L31:
	.stabn	68,0,138,.LM44-.LFBB5
.LM44:
	ldi r28,lo8(1)
	ldi r29,0
	rjmp .L29
	.size	select, .-select
.Lscope5:
	.stabs	"send_cmd:f(0,5)",36,0,0,send_cmd
	.stabs	"cmd:P(0,5)",64,0,0,28
	.type	send_cmd, @function
send_cmd:
	.stabn	68,0,216,.LM45-.LFBB6
.LM45:
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
	.stabn	68,0,220,.LM46-.LFBB6
.LM46:
	sbrs r24,7
	rjmp .L33
	.stabn	68,0,222,.LM47-.LFBB6
.LM47:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(55)
	call send_cmd
	.stabn	68,0,223,.LM48-.LFBB6
.LM48:
	cpi r24,lo8(2)
	brsh .L32
	.stabn	68,0,221,.LM49-.LFBB6
.LM49:
	andi r28,lo8(127)
.L33:
	.stabn	68,0,228,.LM50-.LFBB6
.LM50:
	cpi r28,lo8(12)
	brne .L35
.L38:
	.stabn	68,0,234,.LM51-.LFBB6
.LM51:
	mov r24,r28
	ori r24,lo8(64)
	call spi_xchg
	.stabn	68,0,235,.LM52-.LFBB6
.LM52:
	mov r24,r15
	call spi_xchg
	.stabn	68,0,236,.LM53-.LFBB6
.LM53:
	mov r24,r16
	call spi_xchg
	.stabn	68,0,237,.LM54-.LFBB6
.LM54:
	mov r24,r17
	call spi_xchg
	.stabn	68,0,238,.LM55-.LFBB6
.LM55:
	mov r24,r29
	call spi_xchg
	.stabn	68,0,240,.LM56-.LFBB6
.LM56:
	ldi r24,lo8(-107)
	.stabn	68,0,240,.LM57-.LFBB6
.LM57:
	tst r28
	breq .L36
	.stabn	68,0,241,.LM58-.LFBB6
.LM58:
	ldi r24,lo8(-121)
	.stabn	68,0,241,.LM59-.LFBB6
.LM59:
	cpi r28,lo8(8)
	breq .L36
	.stabn	68,0,239,.LM60-.LFBB6
.LM60:
	ldi r24,lo8(1)
.L36:
	.stabn	68,0,242,.LM61-.LFBB6
.LM61:
	call spi_xchg
	.stabn	68,0,245,.LM62-.LFBB6
.LM62:
	cpi r28,lo8(12)
	brne .L39
	.stabn	68,0,245,.LM63-.LFBB6
.LM63:
	ldi r24,lo8(-1)
	call spi_xchg
.L39:
	.stabn	68,0,239,.LM64-.LFBB6
.LM64:
	ldi r28,lo8(10)
.L40:
	.stabn	68,0,248,.LM65-.LFBB6
.LM65:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,249,.LM66-.LFBB6
.LM66:
	sbrs r24,7
	rjmp .L32
	.stabn	68,0,249,.LM67-.LFBB6
.LM67:
	subi r28,lo8(-(-1))
	brne .L40
.L32:
/* epilogue start */
	.stabn	68,0,252,.LM68-.LFBB6
.LM68:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
.L35:
	.stabn	68,0,229,.LM69-.LFBB6
.LM69:
	call deselect
	.stabn	68,0,230,.LM70-.LFBB6
.LM70:
	call select
	.stabn	68,0,230,.LM71-.LFBB6
.LM71:
	or r24,r25
	brne .L38
	.stabn	68,0,230,.LM72-.LFBB6
.LM72:
	ldi r24,lo8(-1)
	rjmp .L32
	.size	send_cmd, .-send_cmd
	.stabs	"n:r(0,5)",64,0,0,24
	.stabs	"res:r(0,5)",64,0,0,24
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"mmc_disk_initialize:F(0,7)=(0,5)",36,0,0,mmc_disk_initialize
	.stabs	" :T(0,8)=eclock_div_1:1,clock_div_2:2,clock_div_4:4,clock_div_8:8,clock_div_16:16,clock_div_32:32,clock_div_64:64,clock_div_128:128,;",128,0,0,0
	.stabs	"DSTATUS:t(0,7)",128,0,0,0
.global	mmc_disk_initialize
	.type	mmc_disk_initialize, @function
mmc_disk_initialize:
	.stabn	68,0,268,.LM73-.LFBB7
.LM73:
.LFBB7:
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
/* frame size = 4 */
/* stack size = 12 */
.L__stack_usage = 12
	.stabn	68,0,273,.LM74-.LFBB7
.LM74:
	ldi r24,lo8(10)
	sts Timer1,r24
.L47:
	.stabn	68,0,273,.LM75-.LFBB7
.LM75:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L47
	.stabn	68,0,274,.LM76-.LFBB7
.LM76:
	lds r24,Stat
	.stabn	68,0,274,.LM77-.LFBB7
.LM77:
	sbrs r24,1
	rjmp .L48
.L61:
	.stabn	68,0,313,.LM78-.LFBB7
.LM78:
	lds r24,Stat
/* epilogue start */
	.stabn	68,0,314,.LM79-.LFBB7
.LM79:
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
.L48:
.LBB18:
.LBB19:
	.stabn	68,0,79,.LM80-.LFBB7
.LM80:
	call spi_enable
.LBE19:
.LBE18:
	.stabn	68,0,277,.LM81-.LFBB7
.LM81:
	ldi r24,lo8(-128)
	ldi r25,0
	call spi_set_clk
	ldi r17,lo8(10)
.L50:
	.stabn	68,0,278,.LM82-.LFBB7
.LM82:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,278,.LM83-.LFBB7
.LM83:
	subi r17,lo8(-(-1))
	brne .L50
	.stabn	68,0,281,.LM84-.LFBB7
.LM84:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,0
	call send_cmd
	mov r16,r24
	.stabn	68,0,281,.LM85-.LFBB7
.LM85:
	cpi r24,lo8(1)
	breq .+2
	rjmp .L51
	.stabn	68,0,282,.LM86-.LFBB7
.LM86:
	ldi r24,lo8(100)
	sts Timer1,r24
	.stabn	68,0,283,.LM87-.LFBB7
.LM87:
	ldi r20,lo8(-86)
	ldi r21,lo8(1)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(8)
	call send_cmd
	.stabn	68,0,283,.LM88-.LFBB7
.LM88:
	cpi r24,lo8(1)
	breq .+2
	rjmp .L52
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r12,r28
	ldi r24,5
	add r12,r24
	adc r13,__zero_reg__
	movw r14,r16
.L53:
	.stabn	68,0,284,.LM89-.LFBB7
.LM89:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,284,.LM90-.LFBB7
.LM90:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	.stabn	68,0,284,.LM91-.LFBB7
.LM91:
	cp r30,r12
	cpc r31,r13
	brne .L53
	.stabn	68,0,285,.LM92-.LFBB7
.LM92:
	ldd r24,Y+3
	cpi r24,lo8(1)
	breq .+2
	rjmp .L51
	.stabn	68,0,285,.LM93-.LFBB7
.LM93:
	ldd r24,Y+4
	cpi r24,lo8(-86)
	breq .+2
	rjmp .L51
.L55:
	.stabn	68,0,286,.LM94-.LFBB7
.LM94:
	lds r24,Timer1
	.stabn	68,0,286,.LM95-.LFBB7
.LM95:
	tst r24
	breq .L54
	.stabn	68,0,286,.LM96-.LFBB7
.LM96:
	ldi r20,0
	ldi r21,0
	ldi r22,0
	ldi r23,lo8(64)
	ldi r24,lo8(-87)
	call send_cmd
	.stabn	68,0,286,.LM97-.LFBB7
.LM97:
	cpse r24,__zero_reg__
	rjmp .L55
.L54:
	.stabn	68,0,287,.LM98-.LFBB7
.LM98:
	lds r24,Timer1
	.stabn	68,0,287,.LM99-.LFBB7
.LM99:
	tst r24
	breq .L51
	.stabn	68,0,287,.LM100-.LFBB7
.LM100:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(58)
	call send_cmd
	.stabn	68,0,287,.LM101-.LFBB7
.LM101:
	cpse r24,__zero_reg__
	rjmp .L51
.L56:
	.stabn	68,0,288,.LM102-.LFBB7
.LM102:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,288,.LM103-.LFBB7
.LM103:
	movw r30,r16
	st Z+,r24
	movw r16,r30
	.stabn	68,0,288,.LM104-.LFBB7
.LM104:
	cp r30,r12
	cpc r31,r13
	brne .L56
	.stabn	68,0,289,.LM105-.LFBB7
.LM105:
	ldd r24,Y+1
	ldi r17,lo8(8)
	sbrs r24,6
	rjmp .L57
	ldi r17,lo8(24)
	rjmp .L57
.L52:
	.stabn	68,0,293,.LM106-.LFBB7
.LM106:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(-87)
	call send_cmd
	.stabn	68,0,296,.LM107-.LFBB7
.LM107:
	ldi r17,lo8(1)
	.stabn	68,0,293,.LM108-.LFBB7
.LM108:
	cpi r24,lo8(2)
	brsh .L60
	.stabn	68,0,294,.LM109-.LFBB7
.LM109:
	ldi r17,lo8(4)
	.stabn	68,0,294,.LM110-.LFBB7
.LM110:
	ldi r16,lo8(-87)
.L60:
	.stabn	68,0,298,.LM111-.LFBB7
.LM111:
	lds r24,Timer1
	.stabn	68,0,298,.LM112-.LFBB7
.LM112:
	tst r24
	breq .L59
	.stabn	68,0,298,.LM113-.LFBB7
.LM113:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	mov r24,r16
	call send_cmd
	.stabn	68,0,298,.LM114-.LFBB7
.LM114:
	cpse r24,__zero_reg__
	rjmp .L60
.L59:
	.stabn	68,0,299,.LM115-.LFBB7
.LM115:
	lds r24,Timer1
	.stabn	68,0,299,.LM116-.LFBB7
.LM116:
	tst r24
	breq .L51
	.stabn	68,0,299,.LM117-.LFBB7
.LM117:
	ldi r20,0
	ldi r21,lo8(2)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(16)
	call send_cmd
	.stabn	68,0,299,.LM118-.LFBB7
.LM118:
	cpse r24,__zero_reg__
.L51:
	.stabn	68,0,300,.LM119-.LFBB7
.LM119:
	ldi r17,0
.L57:
	.stabn	68,0,303,.LM120-.LFBB7
.LM120:
	sts CardType,r17
	.stabn	68,0,304,.LM121-.LFBB7
.LM121:
	call deselect
	.stabn	68,0,306,.LM122-.LFBB7
.LM122:
	tst r17
	brne .+2
	rjmp .L61
	.stabn	68,0,307,.LM123-.LFBB7
.LM123:
	lds r24,Stat
	andi r24,lo8(-2)
	sts Stat,r24
	.stabn	68,0,308,.LM124-.LFBB7
.LM124:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	rjmp .L61
	.size	mmc_disk_initialize, .-mmc_disk_initialize
	.stabs	"cmd:r(0,5)",64,0,0,16
	.stabs	"ty:r(0,5)",64,0,0,17
	.stabs	"ocr:(0,9)=ar(0,10)=r(0,10);0;65535;;0;3;(0,5)",128,0,0,1
	.stabn	192,0,0,.LFBB7-.LFBB7
	.stabn	224,0,0,.Lscope7-.LFBB7
.Lscope7:
	.stabs	"mmc_disk_status:F(0,7)",36,0,0,mmc_disk_status
.global	mmc_disk_status
	.type	mmc_disk_status, @function
mmc_disk_status:
	.stabn	68,0,323,.LM125-.LFBB8
.LM125:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,324,.LM126-.LFBB8
.LM126:
	lds r24,Stat
/* epilogue start */
	.stabn	68,0,325,.LM127-.LFBB8
.LM127:
	ret
	.size	mmc_disk_status, .-mmc_disk_status
.Lscope8:
	.stabs	"mmc_disk_read:F(0,11)=(0,12)=eRES_OK:0,RES_ERROR:1,RES_WRPRT:2,RES_NOTRDY:3,RES_PARERR:4,;",36,0,0,mmc_disk_read
	.stabs	"DWORD:t(0,13)=(0,14)=(0,15)=r(0,15);0;4294967295;",128,0,0,0
	.stabs	" :T(0,12)",128,0,0,0
	.stabs	"uint32_t:t(0,14)",128,0,0,0
	.stabs	"long unsigned int:t(0,15)",128,0,0,0
	.stabs	"buff:P(0,16)=*(0,5)",64,0,0,16
	.stabs	"sector:P(0,17)=(0,13)",64,0,0,12
	.stabs	"count:p(0,3)",160,0,0,2
	.stabs	"LBA_t:t(0,17)",128,0,0,0
.global	mmc_disk_read
	.type	mmc_disk_read, @function
mmc_disk_read:
	.stabn	68,0,338,.LM128-.LFBB9
.LM128:
.LFBB9:
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
/* frame size = 3 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r16,r24
	movw r12,r20
	movw r14,r22
	std Y+2,r18
	std Y+3,r19
	.stabn	68,0,342,.LM129-.LFBB9
.LM129:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,344,.LM130-.LFBB9
.LM130:
	ldd r18,Y+2
	ldd r19,Y+3
	.stabn	68,0,344,.LM131-.LFBB9
.LM131:
	ldi r24,lo8(4)
	.stabn	68,0,344,.LM132-.LFBB9
.LM132:
	or r18,r19
	breq .L104
	.stabn	68,0,345,.LM133-.LFBB9
.LM133:
	lds r24,Stat
	.stabn	68,0,345,.LM134-.LFBB9
.LM134:
	sbrc r24,0
	rjmp .L98
	.stabn	68,0,347,.LM135-.LFBB9
.LM135:
	lds r24,CardType
	sbrc r24,4
	rjmp .L91
	.stabn	68,0,347,.LM136-.LFBB9
.LM136:
	ldi r24,9
	1:
	lsl r12
	rol r13
	rol r14
	rol r15
	dec r24
	brne 1b
.L91:
	.stabn	68,0,349,.LM137-.LFBB9
.LM137:
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,1
	brne .L99
	ldi r25,lo8(17)
	std Y+1,r25
.L92:
	.stabn	68,0,350,.LM138-.LFBB9
.LM138:
	movw r22,r14
	movw r20,r12
	ldd r24,Y+1
	call send_cmd
	.stabn	68,0,350,.LM139-.LFBB9
.LM139:
	cpse r24,__zero_reg__
	rjmp .L93
.L95:
	.stabn	68,0,352,.LM140-.LFBB9
.LM140:
	ldi r22,0
	ldi r23,lo8(2)
	movw r24,r16
	call rcvr_datablock
	.stabn	68,0,352,.LM141-.LFBB9
.LM141:
	or r24,r25
	breq .L94
	.stabn	68,0,353,.LM142-.LFBB9
.LM142:
	subi r17,-2
	.stabn	68,0,354,.LM143-.LFBB9
.LM143:
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,1
	std Y+3,r25
	std Y+2,r24
	or r24,r25
	brne .L95
.L94:
	.stabn	68,0,355,.LM144-.LFBB9
.LM144:
	ldd r25,Y+1
	cpi r25,lo8(18)
	brne .L93
	.stabn	68,0,355,.LM145-.LFBB9
.LM145:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(12)
	call send_cmd
.L93:
	.stabn	68,0,357,.LM146-.LFBB9
.LM146:
	call deselect
	.stabn	68,0,359,.LM147-.LFBB9
.LM147:
	ldi r24,lo8(1)
	ldd r18,Y+2
	ldd r19,Y+3
	or r18,r19
	brne .L104
	ldi r24,0
.L104:
	.stabn	68,0,345,.LM148-.LFBB9
.LM148:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,360,.LM149-.LFBB9
.LM149:
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
.L99:
	.stabn	68,0,349,.LM150-.LFBB9
.LM150:
	ldi r18,lo8(18)
	std Y+1,r18
	rjmp .L92
.L98:
	.stabn	68,0,345,.LM151-.LFBB9
.LM151:
	ldi r24,lo8(3)
	rjmp .L104
	.size	mmc_disk_read, .-mmc_disk_read
	.stabs	"sect:r(0,13)",64,0,0,12
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.stabs	"mmc_disk_write:F(0,11)",36,0,0,mmc_disk_write
	.stabs	"buff:P(0,18)=*(0,5)",64,0,0,16
	.stabs	"sector:P(0,17)",64,0,0,12
	.stabs	"count:P(0,3)",64,0,0,28
.global	mmc_disk_write
	.type	mmc_disk_write, @function
mmc_disk_write:
	.stabn	68,0,374,.LM152-.LFBB10
.LM152:
.LFBB10:
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
	.stabn	68,0,377,.LM153-.LFBB10
.LM153:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,379,.LM154-.LFBB10
.LM154:
	ldi r24,lo8(4)
	.stabn	68,0,379,.LM155-.LFBB10
.LM155:
	sbiw r28,0
	breq .L129
	.stabn	68,0,380,.LM156-.LFBB10
.LM156:
	lds r24,Stat
	.stabn	68,0,380,.LM157-.LFBB10
.LM157:
	sbrc r24,0
	rjmp .L117
	.stabn	68,0,381,.LM158-.LFBB10
.LM158:
	lds r24,Stat
	.stabn	68,0,381,.LM159-.LFBB10
.LM159:
	sbrc r24,2
	rjmp .L118
	.stabn	68,0,383,.LM160-.LFBB10
.LM160:
	lds r24,CardType
	.stabn	68,0,383,.LM161-.LFBB10
.LM161:
	sbrc r24,4
	rjmp .L107
	.stabn	68,0,383,.LM162-.LFBB10
.LM162:
	ldi r25,9
	1:
	lsl r12
	rol r13
	rol r14
	rol r15
	dec r25
	brne 1b
.L107:
	.stabn	68,0,385,.LM163-.LFBB10
.LM163:
	cpi r28,1
	cpc r29,__zero_reg__
	brne .L108
	.stabn	68,0,386,.LM164-.LFBB10
.LM164:
	movw r22,r14
	movw r20,r12
	ldi r24,lo8(24)
	call send_cmd
	.stabn	68,0,386,.LM165-.LFBB10
.LM165:
	cpse r24,__zero_reg__
	rjmp .L109
	.stabn	68,0,387,.LM166-.LFBB10
.LM166:
	ldi r22,lo8(-2)
	movw r24,r16
	call xmit_datablock
	movw r18,r24
	.stabn	68,0,387,.LM167-.LFBB10
.LM167:
	ldi r25,lo8(1)
	or r18,r19
	breq .L110
	ldi r25,0
.L110:
	mov r28,r25
	ldi r24,0
	mov r29,r24
.L111:
	.stabn	68,0,401,.LM168-.LFBB10
.LM168:
	call deselect
	.stabn	68,0,403,.LM169-.LFBB10
.LM169:
	ldi r24,lo8(1)
	or r28,r29
	brne .L129
	ldi r24,0
.L129:
	.stabn	68,0,381,.LM170-.LFBB10
.LM170:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,404,.LM171-.LFBB10
.LM171:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L108:
	.stabn	68,0,392,.LM172-.LFBB10
.LM172:
	andi r24,lo8(12)
	breq .L112
	.stabn	68,0,392,.LM173-.LFBB10
.LM173:
	movw r20,r28
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(-105)
	call send_cmd
.L112:
	.stabn	68,0,393,.LM174-.LFBB10
.LM174:
	movw r22,r14
	movw r20,r12
	ldi r24,lo8(25)
	call send_cmd
	.stabn	68,0,393,.LM175-.LFBB10
.LM175:
	cpse r24,__zero_reg__
	rjmp .L111
.L114:
	.stabn	68,0,395,.LM176-.LFBB10
.LM176:
	ldi r22,lo8(-4)
	movw r24,r16
	call xmit_datablock
	.stabn	68,0,395,.LM177-.LFBB10
.LM177:
	or r24,r25
	breq .L113
	.stabn	68,0,396,.LM178-.LFBB10
.LM178:
	subi r17,-2
	.stabn	68,0,397,.LM179-.LFBB10
.LM179:
	sbiw r28,1
	brne .L114
.L113:
	.stabn	68,0,398,.LM180-.LFBB10
.LM180:
	ldi r22,lo8(-3)
	ldi r25,0
	ldi r24,0
	call xmit_datablock
	.stabn	68,0,398,.LM181-.LFBB10
.LM181:
	or r24,r25
	brne .L111
.L109:
	.stabn	68,0,398,.LM182-.LFBB10
.LM182:
	ldi r28,lo8(1)
	ldi r29,0
	rjmp .L111
.L117:
	.stabn	68,0,380,.LM183-.LFBB10
.LM183:
	ldi r24,lo8(3)
	rjmp .L129
.L118:
	.stabn	68,0,381,.LM184-.LFBB10
.LM184:
	ldi r24,lo8(2)
	rjmp .L129
	.size	mmc_disk_write, .-mmc_disk_write
	.stabs	"sect:r(0,13)",64,0,0,12
	.stabn	192,0,0,.LFBB10-.LFBB10
	.stabn	224,0,0,.Lscope10-.LFBB10
.Lscope10:
	.stabs	"mmc_disk_ioctl:F(0,11)",36,0,0,mmc_disk_ioctl
	.stabs	"WORD:t(0,19)=(0,20)=(0,4)",128,0,0,0
	.stabs	"uint16_t:t(0,20)",128,0,0,0
	.stabs	"cmd:P(0,5)",64,0,0,15
	.stabs	"buff:P(0,21)=*(0,1)",64,0,0,16
.global	mmc_disk_ioctl
	.type	mmc_disk_ioctl, @function
mmc_disk_ioctl:
	.stabn	68,0,417,.LM185-.LFBB11
.LM185:
.LFBB11:
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
	mov r15,r24
	movw r16,r22
	.stabn	68,0,431,.LM186-.LFBB11
.LM186:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,433,.LM187-.LFBB11
.LM187:
	lds r24,Stat
	.stabn	68,0,433,.LM188-.LFBB11
.LM188:
	sbrc r24,0
	rjmp .L184
	.stabn	68,0,436,.LM189-.LFBB11
.LM189:
	ldi r19,lo8(57)
	cp r19,r15
	brlo .L185
	ldi r24,lo8(49)
	cp r24,r15
	brlo .L132
	ldi r30,lo8(3)
	cp r15,r30
	brne .+2
	rjmp .L133
	cp r30,r15
	brlo .L134
	tst r15
	breq .L135
	ldi r31,lo8(1)
	cp r15,r31
	breq .L136
.L185:
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L130
.L132:
	ldi r30,lo8(-51)
	add r30,r15
	cpi r30,lo8(7)
	brlo .+2
	rjmp .L137
	ldi r31,0
	subi r30,lo8(-(gs(.L139)))
	sbci r31,hi8(-(gs(.L139)))
	jmp __tablejump2__
	.section	.jumptables.gcc.mmc_disk_ioctl,"a",@progbits
	.p2align	1
.L139:
	.word gs(.L145)
	.word gs(.L144)
	.word gs(.L143)
	.word gs(.L142)
	.word gs(.L141)
	.word gs(.L140)
	.word gs(.L138)
	.text
.L134:
	ldi r19,lo8(7)
	cpse r15,r19
	rjmp .L185
	.stabn	68,0,532,.LM190-.LFBB11
.LM190:
	lds r24,Stat
	ori r24,lo8(1)
	sts Stat,r24
	rjmp .L219
.L135:
	.stabn	68,0,438,.LM191-.LFBB11
.LM191:
	call select
.L224:
	.stabn	68,0,525,.LM192-.LFBB11
.LM192:
	movw r18,r24
	.stabn	68,0,525,.LM193-.LFBB11
.LM193:
	ldi r25,lo8(1)
	or r18,r19
	brne .+2
	rjmp .L183
.L221:
	.stabn	68,0,566,.LM194-.LFBB11
.LM194:
	ldi r25,0
	rjmp .L183
.L136:
	.stabn	68,0,443,.LM195-.LFBB11
.LM195:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(9)
	call send_cmd
	.stabn	68,0,443,.LM196-.LFBB11
.LM196:
	tst r24
	breq .L148
.L191:
	.stabn	68,0,435,.LM197-.LFBB11
.LM197:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L181
.L148:
	.stabn	68,0,443,.LM198-.LFBB11
.LM198:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,443,.LM199-.LFBB11
.LM199:
	or r24,r25
	breq .L191
	.stabn	68,0,444,.LM200-.LFBB11
.LM200:
	ldd r25,Y+1
	swap r25
	lsr r25
	lsr r25
	andi r25,lo8(3)
	ldd r18,Y+9
	ldd r20,Y+10
	ldd r24,Y+8
	.stabn	68,0,444,.LM201-.LFBB11
.LM201:
	cpi r25,lo8(1)
	brne .L151
	.stabn	68,0,445,.LM202-.LFBB11
.LM202:
	ldi r19,0
	.stabn	68,0,445,.LM203-.LFBB11
.LM203:
	mov r19,r18
	clr r18
	.stabn	68,0,445,.LM204-.LFBB11
.LM204:
	add r18,r20
	adc r19,__zero_reg__
	.stabn	68,0,445,.LM205-.LFBB11
.LM205:
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,445,.LM206-.LFBB11
.LM206:
	movw r26,r24
	clr r25
	clr r24
	clr r24
	clr r25
	andi r26,63
	clr r27
	.stabn	68,0,445,.LM207-.LFBB11
.LM207:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	add r24,r18
	adc r25,r19
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	.stabn	68,0,446,.LM208-.LFBB11
.LM208:
	ldi r18,10
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r18
	brne 1b
.L220:
	.stabn	68,0,470,.LM209-.LFBB11
.LM209:
	movw r30,r16
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.L218:
	.stabn	68,0,474,.LM210-.LFBB11
.LM210:
	ldi r17,0
	ldi r16,0
.L181:
	.stabn	68,0,568,.LM211-.LFBB11
.LM211:
	call deselect
	.stabn	68,0,569,.LM212-.LFBB11
.LM212:
	rjmp .L130
.L151:
	.stabn	68,0,449,.LM213-.LFBB11
.LM213:
	swap r18
	lsr r18
	lsr r18
	andi r18,lo8(3)
	.stabn	68,0,449,.LM214-.LFBB11
.LM214:
	ldi r31,lo8(4)
	mul r24,r31
	movw r24,r0
	clr __zero_reg__
	.stabn	68,0,449,.LM215-.LFBB11
.LM215:
	add r24,r18
	adc r25,__zero_reg__
	.stabn	68,0,449,.LM216-.LFBB11
.LM216:
	adiw r24,1
	.stabn	68,0,449,.LM217-.LFBB11
.LM217:
	ldd r18,Y+7
	ldi r19,0
	.stabn	68,0,449,.LM218-.LFBB11
.LM218:
	mov r19,r18
	clr r18
	lsl r19
	lsl r19
	clr r18
	andi r19,12
	.stabn	68,0,449,.LM219-.LFBB11
.LM219:
	add r24,r18
	adc r25,r19
	.stabn	68,0,449,.LM220-.LFBB11
.LM220:
	ldi r27,0
	ldi r26,0
	.stabn	68,0,448,.LM221-.LFBB11
.LM221:
	ldd r18,Y+6
	andi r18,lo8(15)
	.stabn	68,0,448,.LM222-.LFBB11
.LM222:
	ldd r19,Y+11
	rol r19
	clr r19
	rol r19
	.stabn	68,0,448,.LM223-.LFBB11
.LM223:
	add r18,r19
	.stabn	68,0,448,.LM224-.LFBB11
.LM224:
	subi r18,lo8(-(2))
	.stabn	68,0,448,.LM225-.LFBB11
.LM225:
	lsl r20
	andi r20,lo8(6)
	.stabn	68,0,448,.LM226-.LFBB11
.LM226:
	add r18,r20
	.stabn	68,0,450,.LM227-.LFBB11
.LM227:
	subi r18,9
	sbc r19,r19
.L225:
	.stabn	68,0,463,.LM228-.LFBB11
.LM228:
	rjmp 2f
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	2:
	dec r18
	brpl 1b
	rjmp .L220
.L133:
	.stabn	68,0,458,.LM229-.LFBB11
.LM229:
	lds r24,CardType
	.stabn	68,0,459,.LM230-.LFBB11
.LM230:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	.stabn	68,0,458,.LM231-.LFBB11
.LM231:
	sbrs r24,3
	rjmp .L152
	.stabn	68,0,459,.LM232-.LFBB11
.LM232:
	ldi r24,lo8(-115)
	call send_cmd
	.stabn	68,0,459,.LM233-.LFBB11
.LM233:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,460,.LM234-.LFBB11
.LM234:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,461,.LM235-.LFBB11
.LM235:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,461,.LM236-.LFBB11
.LM236:
	or r24,r25
	brne .+2
	rjmp .L191
	ldi r22,lo8(48)
	mov r15,r22
.L156:
	.stabn	68,0,462,.LM237-.LFBB11
.LM237:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,462,.LM238-.LFBB11
.LM238:
	dec r15
	cpse r15,__zero_reg__
	rjmp .L156
	.stabn	68,0,463,.LM239-.LFBB11
.LM239:
	ldd r18,Y+11
	swap r18
	andi r18,lo8(15)
	.stabn	68,0,463,.LM240-.LFBB11
.LM240:
	ldi r24,lo8(16)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	rjmp .L225
.L152:
	.stabn	68,0,468,.LM241-.LFBB11
.LM241:
	ldi r24,lo8(9)
	call send_cmd
	.stabn	68,0,468,.LM242-.LFBB11
.LM242:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,468,.LM243-.LFBB11
.LM243:
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call rcvr_datablock
	.stabn	68,0,468,.LM244-.LFBB11
.LM244:
	or r24,r25
	brne .+2
	rjmp .L191
	.stabn	68,0,470,.LM245-.LFBB11
.LM245:
	ldd r24,Y+11
	ldi r25,0
	.stabn	68,0,470,.LM246-.LFBB11
.LM246:
	ldd r18,Y+12
	.stabn	68,0,469,.LM247-.LFBB11
.LM247:
	lds r19,CardType
	sbrs r19,2
	rjmp .L157
	.stabn	68,0,470,.LM248-.LFBB11
.LM248:
	lsl r24
	rol r25
	andi r24,126
	clr r25
	.stabn	68,0,470,.LM249-.LFBB11
.LM249:
	rol r18
	clr r18
	rol r18
	.stabn	68,0,470,.LM250-.LFBB11
.LM250:
	subi r18,lo8(-(1))
	add r24,r18
	adc r25,__zero_reg__
	.stabn	68,0,470,.LM251-.LFBB11
.LM251:
	ldd r18,Y+14
	swap r18
	lsr r18
	lsr r18
	andi r18,lo8(3)
	.stabn	68,0,470,.LM252-.LFBB11
.LM252:
	subi r18,1
	sbc r19,r19
	.stabn	68,0,470,.LM253-.LFBB11
.LM253:
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r18
	brpl 1b
	ldi r27,0
	ldi r26,0
	rjmp .L220
.L157:
	.stabn	68,0,472,.LM254-.LFBB11
.LM254:
	ldi r31,lo8(8)
	mul r18,r31
	movw r20,r0
	clr __zero_reg__
	andi r20,24
	clr r21
	.stabn	68,0,472,.LM255-.LFBB11
.LM255:
	swap r18
	lsr r18
	andi r18,lo8(7)
	.stabn	68,0,472,.LM256-.LFBB11
.LM256:
	add r18,r20
	mov r19,r21
	adc r19,__zero_reg__
	.stabn	68,0,472,.LM257-.LFBB11
.LM257:
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,472,.LM258-.LFBB11
.LM258:
	asr r25
	ror r24
	asr r25
	ror r24
	.stabn	68,0,472,.LM259-.LFBB11
.LM259:
	andi r24,31
	clr r25
	.stabn	68,0,472,.LM260-.LFBB11
.LM260:
	adiw r24,1
	.stabn	68,0,472,.LM261-.LFBB11
.LM261:
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
	rjmp .L218
.L137:
	.stabn	68,0,496,.LM262-.LFBB11
.LM262:
	lds r24,CardType
	movw r30,r16
	st Z,r24
.L219:
	.stabn	68,0,533,.LM263-.LFBB11
.LM263:
	ldi r17,0
	ldi r16,0
.L130:
	.stabn	68,0,576,.LM264-.LFBB11
.LM264:
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
.L145:
	.stabn	68,0,501,.LM265-.LFBB11
.LM265:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(9)
.L228:
	.stabn	68,0,508,.LM266-.LFBB11
.LM266:
	call send_cmd
	.stabn	68,0,508,.LM267-.LFBB11
.LM267:
	ldi r22,lo8(16)
	ldi r23,0
	.stabn	68,0,508,.LM268-.LFBB11
.LM268:
	cpse r24,__zero_reg__
	rjmp .L191
.L223:
	.stabn	68,0,525,.LM269-.LFBB11
.LM269:
	movw r24,r16
	call rcvr_datablock
	rjmp .L224
.L144:
	.stabn	68,0,508,.LM270-.LFBB11
.LM270:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(10)
	rjmp .L228
.L143:
	.stabn	68,0,515,.LM271-.LFBB11
.LM271:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(58)
	call send_cmd
	.stabn	68,0,515,.LM272-.LFBB11
.LM272:
	cpse r24,__zero_reg__
	rjmp .L191
	movw r14,r16
	ldi r31,4
	add r14,r31
	adc r15,__zero_reg__
.L163:
	movw r12,r16
	.stabn	68,0,516,.LM273-.LFBB11
.LM273:
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,516,.LM274-.LFBB11
.LM274:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,516,.LM275-.LFBB11
.LM275:
	movw r30,r12
	st Z,r24
	.stabn	68,0,516,.LM276-.LFBB11
.LM276:
	cp r14,r16
	cpc r15,r17
	brne .L163
	rjmp .L218
.L142:
	.stabn	68,0,523,.LM277-.LFBB11
.LM277:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ldi r24,lo8(-115)
	call send_cmd
	.stabn	68,0,523,.LM278-.LFBB11
.LM278:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,524,.LM279-.LFBB11
.LM279:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,525,.LM280-.LFBB11
.LM280:
	ldi r22,lo8(64)
	ldi r23,0
	rjmp .L223
.L141:
	.stabn	68,0,538,.LM281-.LFBB11
.LM281:
	movw r30,r16
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
	.stabn	68,0,538,.LM282-.LFBB11
.LM282:
	ldd r24,Z+1
	ldd r25,Z+2
	sbiw r24,1
	.stabn	68,0,538,.LM283-.LFBB11
.LM283:
	andi r25,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,538,.LM284-.LFBB11
.LM284:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,538,.LM285-.LFBB11
.LM285:
	ld r24,Z
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,538,.LM286-.LFBB11
.LM286:
	ldi r18,28
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r18
	brne 1b
	.stabn	68,0,538,.LM287-.LFBB11
.LM287:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,538,.LM288-.LFBB11
.LM288:
	movw r20,r24
	movw r22,r26
	ori r23,128
	ldi r24,lo8(48)
	call send_cmd
	.stabn	68,0,538,.LM289-.LFBB11
.LM289:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,539,.LM290-.LFBB11
.LM290:
	ldi r24,lo8(100)
	sts Timer1,r24
.L169:
	.stabn	68,0,539,.LM291-.LFBB11
.LM291:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,539,.LM292-.LFBB11
.LM292:
	cpi r24,lo8(-1)
	brne .L168
	.stabn	68,0,539,.LM293-.LFBB11
.LM293:
	lds r24,Timer1
	cpse r24,__zero_reg__
	rjmp .L169
	rjmp .L191
.L168:
	.stabn	68,0,540,.LM294-.LFBB11
.LM294:
	cpi r24,lo8(-2)
	breq .+2
	rjmp .L191
	.stabn	68,0,541,.LM295-.LFBB11
.LM295:
	movw r30,r16
	ldd r14,Z+7
	ldd r15,Z+8
	ldd r12,Z+1
	ldd r13,Z+2
	add r12,r14
	adc r13,r15
.L171:
	.stabn	68,0,541,.LM296-.LFBB11
.LM296:
	cp r14,r12
	cpc r15,r13
	brne .L172
	.stabn	68,0,542,.LM297-.LFBB11
.LM297:
	movw r30,r16
	ldd r24,Z+1
	ldd r25,Z+2
	ldi r16,lo8(2)
	ldi r17,lo8(2)
	sub r16,r24
	sbc r17,r25
.L173:
	.stabn	68,0,542,.LM298-.LFBB11
.LM298:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L181
	.stabn	68,0,542,.LM299-.LFBB11
.LM299:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,542,.LM300-.LFBB11
.LM300:
	subi r16,1
	sbc r17,__zero_reg__
	rjmp .L173
.L172:
	.stabn	68,0,541,.LM301-.LFBB11
.LM301:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,541,.LM302-.LFBB11
.LM302:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	rjmp .L171
.L140:
	.stabn	68,0,551,.LM303-.LFBB11
.LM303:
	movw r30,r16
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
	.stabn	68,0,551,.LM304-.LFBB11
.LM304:
	ldd r24,Z+1
	ldd r25,Z+2
	sbiw r24,1
	.stabn	68,0,551,.LM305-.LFBB11
.LM305:
	andi r25,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,551,.LM306-.LFBB11
.LM306:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,551,.LM307-.LFBB11
.LM307:
	ld r24,Z
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,551,.LM308-.LFBB11
.LM308:
	ldi r30,28
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r30
	brne 1b
	.stabn	68,0,551,.LM309-.LFBB11
.LM309:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,551,.LM310-.LFBB11
.LM310:
	movw r20,r24
	movw r22,r26
	ori r23,128
	ldi r24,lo8(49)
	call send_cmd
	.stabn	68,0,551,.LM311-.LFBB11
.LM311:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,552,.LM312-.LFBB11
.LM312:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,552,.LM313-.LFBB11
.LM313:
	ldi r24,lo8(-2)
	call spi_xchg
	.stabn	68,0,553,.LM314-.LFBB11
.LM314:
	movw r30,r16
	ldd r14,Z+7
	ldd r15,Z+8
	ldd r12,Z+1
	ldd r13,Z+2
	add r12,r14
	adc r13,r15
.L176:
	.stabn	68,0,553,.LM315-.LFBB11
.LM315:
	cp r14,r12
	cpc r15,r13
	brne .L177
	.stabn	68,0,554,.LM316-.LFBB11
.LM316:
	movw r30,r16
	ldd r24,Z+1
	ldd r25,Z+2
	ldi r16,lo8(2)
	ldi r17,lo8(2)
	sub r16,r24
	sbc r17,r25
.L178:
	.stabn	68,0,554,.LM317-.LFBB11
.LM317:
	ldi r24,lo8(-1)
	.stabn	68,0,554,.LM318-.LFBB11
.LM318:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L179
.L222:
	.stabn	68,0,566,.LM319-.LFBB11
.LM319:
	call spi_xchg
	.stabn	68,0,566,.LM320-.LFBB11
.LM320:
	andi r24,lo8(31)
	ldi r25,lo8(1)
	cpi r24,lo8(5)
	brne .+2
	rjmp .L221
.L183:
	.stabn	68,0,435,.LM321-.LFBB11
.LM321:
	mov r16,r25
	ldi r17,0
	rjmp .L181
.L177:
	.stabn	68,0,553,.LM322-.LFBB11
.LM322:
	movw r30,r14
	ld r24,Z+
	movw r14,r30
	call spi_xchg
	rjmp .L176
.L179:
	.stabn	68,0,554,.LM323-.LFBB11
.LM323:
	call spi_xchg
	.stabn	68,0,554,.LM324-.LFBB11
.LM324:
	subi r16,1
	sbc r17,__zero_reg__
	rjmp .L178
.L138:
	.stabn	68,0,562,.LM325-.LFBB11
.LM325:
	movw r30,r16
	ld r20,Z
	ldi r21,0
	ldi r23,0
	ldi r22,0
	.stabn	68,0,562,.LM326-.LFBB11
.LM326:
	ldi r24,28
	1:
	lsl r20
	rol r21
	rol r22
	rol r23
	dec r24
	brne 1b
	.stabn	68,0,562,.LM327-.LFBB11
.LM327:
	ldd r24,Z+2
	ldi r25,0
	ldi r27,0
	ldi r26,0
	.stabn	68,0,562,.LM328-.LFBB11
.LM328:
	or r20,r24
	or r21,r25
	or r22,r26
	or r23,r27
	.stabn	68,0,562,.LM329-.LFBB11
.LM329:
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
	.stabn	68,0,562,.LM330-.LFBB11
.LM330:
	or r24,r20
	or r25,r21
	or r26,r22
	or r27,r23
	.stabn	68,0,562,.LM331-.LFBB11
.LM331:
	movw r20,r24
	movw r22,r26
	ori r23,132
	ldi r24,lo8(49)
	call send_cmd
	.stabn	68,0,562,.LM332-.LFBB11
.LM332:
	cpse r24,__zero_reg__
	rjmp .L191
	.stabn	68,0,563,.LM333-.LFBB11
.LM333:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,563,.LM334-.LFBB11
.LM334:
	ldi r24,lo8(-2)
	call spi_xchg
	.stabn	68,0,564,.LM335-.LFBB11
.LM335:
	movw r30,r16
	ldd r24,Z+1
	call spi_xchg
	ldi r16,lo8(1)
	ldi r17,lo8(2)
.L182:
	.stabn	68,0,565,.LM336-.LFBB11
.LM336:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,565,.LM337-.LFBB11
.LM337:
	subi r16,1
	sbc r17,__zero_reg__
	brne .L182
	.stabn	68,0,566,.LM338-.LFBB11
.LM338:
	ldi r24,lo8(-1)
	rjmp .L222
.L184:
	.stabn	68,0,433,.LM339-.LFBB11
.LM339:
	ldi r16,lo8(3)
	ldi r17,0
	rjmp .L130
	.size	mmc_disk_ioctl, .-mmc_disk_ioctl
	.stabs	"csd:(0,22)=ar(0,10);0;15;(0,5)",128,0,0,1
	.stabs	"rc:r(0,5)",64,0,0,24
	.stabn	192,0,0,.LFBB11-.LFBB11
	.stabn	224,0,0,.Lscope11-.LFBB11
.Lscope11:
	.stabs	"mmc_disk_timerproc:F(0,1)",36,0,0,mmc_disk_timerproc
.global	mmc_disk_timerproc
	.type	mmc_disk_timerproc, @function
mmc_disk_timerproc:
	.stabn	68,0,586,.LM340-.LFBB12
.LM340:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,591,.LM341-.LFBB12
.LM341:
	lds r24,Timer1
	.stabn	68,0,592,.LM342-.LFBB12
.LM342:
	tst r24
	breq .L230
	.stabn	68,0,592,.LM343-.LFBB12
.LM343:
	subi r24,lo8(-(-1))
	sts Timer1,r24
.L230:
	.stabn	68,0,593,.LM344-.LFBB12
.LM344:
	lds r24,Timer2
	lds r25,Timer2+1
	.stabn	68,0,594,.LM345-.LFBB12
.LM345:
	sbiw r24,0
	breq .L231
	.stabn	68,0,594,.LM346-.LFBB12
.LM346:
	sbiw r24,1
	sts Timer2+1,r25
	sts Timer2,r24
.L231:
	.stabn	68,0,596,.LM347-.LFBB12
.LM347:
	lds r24,Stat
	.stabn	68,0,603,.LM348-.LFBB12
.LM348:
	andi r24,lo8(-7)
	.stabn	68,0,607,.LM349-.LFBB12
.LM349:
	sts Stat,r24
/* epilogue start */
	.stabn	68,0,608,.LM350-.LFBB12
.LM350:
	ret
	.size	mmc_disk_timerproc, .-mmc_disk_timerproc
.Lscope12:
	.local	CardType
	.comm	CardType,1,1
	.stabs	"CardType:S(0,5)",40,0,0,CardType
	.local	Timer2
	.comm	Timer2,2,1
	.stabs	"Timer2:S(0,3)",40,0,0,Timer2
	.local	Timer1
	.comm	Timer1,1,1
	.stabs	"Timer1:S(0,5)",40,0,0,Timer1
	.data
	.type	Stat, @object
	.size	Stat, 1
Stat:
	.byte	1
	.stabs	"Stat:S(0,7)",38,0,0,Stat
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
