	.file	"ff.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/fatfs/ff.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"ld_dword:f(0,1)=(0,2)=(0,3)=r(0,3);0;4294967295;",36,0,0,ld_dword
	.stabs	"DWORD:t(0,1)",128,0,0,0
	.stabs	"uint32_t:t(0,2)",128,0,0,0
	.stabs	"long unsigned int:t(0,3)",128,0,0,0
	.stabs	"ptr:P(0,4)=*(0,5)=(0,6)=r(0,6);0;255;",64,0,0,24
	.stabs	"BYTE:t(0,5)",128,0,0,0
	.stabs	"unsigned char:t(0,6)",128,0,0,0
	.type	ld_dword, @function
ld_dword:
	.stabn	68,0,624,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r28
	push r29
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	.stabn	68,0,631,.LM1-.LFBB1
.LM1:
	movw r30,r24
	ld r18,Z
	ldd r19,Z+1
	ldd r20,Z+2
	ldd r21,Z+3
	.stabn	68,0,632,.LM2-.LFBB1
.LM2:
	movw r24,r20
	movw r22,r18
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	ld_dword, .-ld_dword
.Lscope1:
	.stabs	"clst2sect:f(0,7)=(0,1)",36,0,0,clst2sect
	.stabs	"LBA_t:t(0,7)",128,0,0,0
	.stabs	"fs:P(0,8)=*(0,9)=(0,10)=s559fs_type:(0,5),0,8;pdrv:(0,5),8,8;n_fats:(0,5),16,8;wflag:(0,5),24,8;fsi_flag:(0,5),32,8;id:(0,11)=(0,12)=(0,13)=r(0,13);0;65535;,40,16;n_rootdir:(0,11),56,16;csize:(0,11),72,16;last_clst:(0,1),88,32;free_clst:(0,1),120,32;n_fatent:(0,1),152,32;fsize:(0,1),184,32;volbase:(0,7),216,32;fatbase:(0,7),248,32;dirbase:(0,7),280,32;database:(0,7),312,32;winsect:(0,7),344,32;win:(0,14)=ar(0,15)=r(0,15);0;65535;;0;511;(0,5),376,4096;;",64,0,0,30
	.stabs	"clst:P(0,1)",64,0,0,20
	.stabs	"WORD:t(0,11)",128,0,0,0
	.stabs	"uint16_t:t(0,12)",128,0,0,0
	.stabs	"unsigned int:t(0,13)",128,0,0,0
	.type	clst2sect, @function
clst2sect:
	.stabn	68,0,1118,.LM3-.LFBB2
.LM3:
.LFBB2:
	push r28
	push r29
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r30,r24
	.stabn	68,0,1119,.LM4-.LFBB2
.LM4:
	movw r18,r20
	movw r20,r22
	subi r18,2
	sbc r19,__zero_reg__
	sbc r20,__zero_reg__
	sbc r21,__zero_reg__
	.stabn	68,0,1120,.LM5-.LFBB2
.LM5:
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	sbiw r24,2
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,1120,.LM6-.LFBB2
.LM6:
	cp r18,r24
	cpc r19,r25
	cpc r20,r26
	cpc r21,r27
	brsh .L4
	.stabn	68,0,1121,.LM7-.LFBB2
.LM7:
	ldd r26,Z+9
	ldd r27,Z+10
	.stabn	68,0,1121,.LM8-.LFBB2
.LM8:
	call __muluhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,1121,.LM9-.LFBB2
.LM9:
	ldd r24,Z+39
	ldd r25,Z+40
	ldd r26,Z+41
	ldd r27,Z+42
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	add r18,r24
	adc r19,r25
	adc r20,r26
	adc r21,r27
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
.L2:
	.stabn	68,0,1122,.LM10-.LFBB2
.LM10:
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L4:
	.stabn	68,0,1120,.LM11-.LFBB2
.LM11:
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	rjmp .L2
	.size	clst2sect, .-clst2sect
.Lscope2:
	.stabs	"st_clust:f(0,16)=(0,16)",36,0,0,st_clust
	.stabs	"void:t(0,16)",128,0,0,0
	.stabs	"fs:P(0,8)",64,0,0,24
	.stabs	"dir:P(0,17)=*(0,5)",64,0,0,30
	.stabs	"cl:P(0,1)",64,0,0,16
	.type	st_clust, @function
st_clust:
	.stabn	68,0,1839,.LM12-.LFBB3
.LM12:
.LFBB3:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r22
	mov r16,r18
	mov r17,r19
	movw r18,r20
.LBB80:
.LBB81:
	.stabn	68,0,654,.LM13-.LFBB3
.LM13:
	std Z+27,r17
	std Z+26,r16
.LBE81:
.LBE80:
	.stabn	68,0,1841,.LM14-.LFBB3
.LM14:
	movw r26,r24
	ld r24,X
	cpi r24,lo8(3)
	brne .L5
	.stabn	68,0,1842,.LM15-.LFBB3
.LM15:
	movw r16,r18
	clr r18
	clr r19
.LBB82:
.LBB83:
	.stabn	68,0,654,.LM16-.LFBB3
.LM16:
	std Z+20,r16
	.stabn	68,0,655,.LM17-.LFBB3
.LM17:
	std Z+21,r17
.L5:
/* epilogue start */
.LBE83:
.LBE82:
	.stabn	68,0,1844,.LM18-.LFBB3
.LM18:
	pop r17
	pop r16
	ret
	.size	st_clust, .-st_clust
.Lscope3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"SD"
	.text
	.stabs	"get_ldnumber:f(0,18)=r(0,18);-32768;32767;",36,0,0,get_ldnumber
	.stabs	"int:t(0,18)",128,0,0,0
	.stabs	"UINT:t(0,19)=(0,13)",128,0,0,0
	.stabs	"TCHAR:t(0,20)=(0,21)=r(0,21);0;255;",128,0,0,0
	.stabs	"char:t(0,21)",128,0,0,0
	.stabs	"path:P(0,22)=*(0,23)=*(0,20)",64,0,0,26
	.type	get_ldnumber, @function
get_ldnumber:
	.stabn	68,0,3093,.LM19-.LFBB4
.LM19:
.LFBB4:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	.stabn	68,0,3103,.LM20-.LFBB4
.LM20:
	ld r30,X+
	ld r31,X
	sbiw r26,1
	.stabn	68,0,3104,.LM21-.LFBB4
.LM21:
	sbiw r30,0
	breq .L20
	movw r24,r30
.L9:
	movw r28,r24
	.stabn	68,0,3105,.LM22-.LFBB4
.LM22:
	ld r18,Y
	adiw r24,1
	.stabn	68,0,3105,.LM23-.LFBB4
.LM23:
	cpi r18,lo8(33)
	brlo .L18
	.stabn	68,0,3105,.LM24-.LFBB4
.LM24:
	cpi r18,lo8(58)
	brne .L9
	.stabn	68,0,3109,.LM25-.LFBB4
.LM25:
	ld r18,Z
	ldi r19,lo8(-48)
	add r19,r18
	.stabn	68,0,3109,.LM26-.LFBB4
.LM26:
	cpi r19,lo8(10)
	brlo .L16
.L19:
	ldi r20,lo8(.LC0)
	ldi r21,hi8(.LC0)
.L23:
	movw r28,r20
	.stabn	68,0,3118,.LM27-.LFBB4
.LM27:
	ld r18,Y
	subi r20,-1
	sbci r21,-1
	.stabn	68,0,3118,.LM28-.LFBB4
.LM28:
	ld r19,Z
	adiw r30,1
	.stabn	68,0,3119,.LM29-.LFBB4
.LM29:
	ldi r22,lo8(-97)
	add r22,r18
	.stabn	68,0,3119,.LM30-.LFBB4
.LM30:
	cpi r22,lo8(26)
	brsh .L13
	.stabn	68,0,3119,.LM31-.LFBB4
.LM31:
	subi r18,lo8(-(-32))
.L13:
	.stabn	68,0,3120,.LM32-.LFBB4
.LM32:
	ldi r22,lo8(-97)
	add r22,r19
	.stabn	68,0,3120,.LM33-.LFBB4
.LM33:
	cpi r22,lo8(26)
	brsh .L14
	.stabn	68,0,3120,.LM34-.LFBB4
.LM34:
	subi r19,lo8(-(-32))
.L14:
	.stabn	68,0,3121,.LM35-.LFBB4
.LM35:
	tst r18
	breq .L15
	.stabn	68,0,3121,.LM36-.LFBB4
.LM36:
	cp r19,r18
	breq .L23
	rjmp .L20
.L16:
	.stabn	68,0,3109,.LM37-.LFBB4
.LM37:
	movw r20,r30
	subi r20,-2
	sbci r21,-1
	.stabn	68,0,3109,.LM38-.LFBB4
.LM38:
	cp r24,r20
	cpc r25,r21
	brne .L19
	.stabn	68,0,3125,.LM39-.LFBB4
.LM39:
	cpi r18,lo8(48)
	breq .L12
.L20:
	.stabn	68,0,3104,.LM40-.LFBB4
.LM40:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	rjmp .L7
.L15:
	.stabn	68,0,3122,.LM41-.LFBB4
.LM41:
	cp r24,r30
	cpc r25,r31
	brne .L20
.L12:
	.stabn	68,0,3127,.LM42-.LFBB4
.LM42:
	st X+,r24
	st X,r25
.L18:
	.stabn	68,0,3156,.LM43-.LFBB4
.LM43:
	ldi r25,0
	ldi r24,0
.L7:
/* epilogue start */
	.stabn	68,0,3157,.LM44-.LFBB4
.LM44:
	pop r29
	pop r28
	ret
	.size	get_ldnumber, .-get_ldnumber
	.stabs	"c:r(0,21)",64,0,0,18
	.stabn	192,0,0,.LFBB4-.LFBB4
	.stabn	224,0,0,.Lscope4-.LFBB4
.Lscope4:
	.stabs	"validate:f(0,24)=(0,25)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",36,0,0,validate
	.stabs	" :T(0,25)",128,0,0,0
	.stabs	"obj:P(0,26)=*(0,27)=(0,28)=s14fs:(0,8),0,16;id:(0,11),16,16;attr:(0,5),32,8;stat:(0,5),40,8;sclust:(0,1),48,32;objsize:(0,29)=(0,1),80,32;;",64,0,0,28
	.stabs	"rfs:P(0,30)=*(0,8)",64,0,0,16
	.stabs	"FSIZE_t:t(0,29)",128,0,0,0
	.type	validate, @function
validate:
	.stabn	68,0,3565,.LM45-.LFBB5
.LM45:
.LFBB5:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	.stabn	68,0,3569,.LM46-.LFBB5
.LM46:
	or r24,r25
	brne .L29
.L31:
	.stabn	68,0,3566,.LM47-.LFBB5
.LM47:
	ldi r24,lo8(9)
	ldi r25,0
	.stabn	68,0,3586,.LM48-.LFBB5
.LM48:
	ldi r19,0
	ldi r18,0
.L30:
	.stabn	68,0,3586,.LM49-.LFBB5
.LM49:
	movw r30,r16
	std Z+1,r19
	st Z,r18
/* epilogue start */
	.stabn	68,0,3588,.LM50-.LFBB5
.LM50:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L29:
	.stabn	68,0,3569,.LM51-.LFBB5
.LM51:
	ld r30,Y
	ldd r31,Y+1
	.stabn	68,0,3569,.LM52-.LFBB5
.LM52:
	sbiw r30,0
	breq .L31
	.stabn	68,0,3569,.LM53-.LFBB5
.LM53:
	ld r24,Z
	tst r24
	breq .L31
	.stabn	68,0,3569,.LM54-.LFBB5
.LM54:
	ldd r18,Y+2
	ldd r19,Y+3
	ldd r24,Z+5
	ldd r25,Z+6
	cp r18,r24
	cpc r19,r25
	brne .L31
	.stabn	68,0,3581,.LM55-.LFBB5
.LM55:
	ldd r24,Z+1
	call disk_status
	.stabn	68,0,3581,.LM56-.LFBB5
.LM56:
	sbrc r24,0
	rjmp .L31
	.stabn	68,0,3586,.LM57-.LFBB5
.LM57:
	ld r18,Y
	ldd r19,Y+1
	.stabn	68,0,3582,.LM58-.LFBB5
.LM58:
	ldi r25,0
	ldi r24,0
	rjmp .L30
	.size	validate, .-validate
	.stabs	"res:r(0,24)",64,0,0,24
	.stabs	"FRESULT:t(0,24)",128,0,0,0
	.stabn	192,0,0,.LFBB5-.LFBB5
	.stabn	224,0,0,.Lscope5-.LFBB5
.Lscope5:
	.stabs	"sync_window:f(0,24)",36,0,0,sync_window
	.stabs	" :T(0,31)=eRES_OK:0,RES_ERROR:1,RES_WRPRT:2,RES_NOTRDY:3,RES_PARERR:4,;",128,0,0,0
	.stabs	"fs:P(0,8)",64,0,0,28
	.type	sync_window, @function
sync_window:
	.stabn	68,0,1028,.LM59-.LFBB6
.LM59:
.LFBB6:
	push r8
	push r9
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r28,r24
	.stabn	68,0,1032,.LM60-.LFBB6
.LM60:
	ldd r24,Y+3
	cpse r24,__zero_reg__
	rjmp .L39
.L41:
	.stabn	68,0,1029,.LM61-.LFBB6
.LM61:
	mov r15,__zero_reg__
	mov r14,__zero_reg__
.L38:
	.stabn	68,0,1043,.LM62-.LFBB6
.LM62:
	movw r24,r14
/* epilogue start */
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
	pop r9
	pop r8
	ret
.L39:
.LBB86:
.LBB87:
	.stabn	68,0,1033,.LM63-.LFBB6
.LM63:
	movw r12,r28
	ldi r20,47
	add r12,r20
	adc r13,__zero_reg__
	.stabn	68,0,1033,.LM64-.LFBB6
.LM64:
	ldd r18,Y+43
	ldd r19,Y+44
	ldd r20,Y+45
	ldd r21,Y+46
	ldi r16,lo8(1)
	ldi r17,0
	movw r22,r12
	ldd r24,Y+1
	call disk_write
	movw r14,r24
	.stabn	68,0,1033,.LM65-.LFBB6
.LM65:
	or r24,r25
	brne .L42
	.stabn	68,0,1034,.LM66-.LFBB6
.LM66:
	std Y+3,__zero_reg__
	.stabn	68,0,1035,.LM67-.LFBB6
.LM67:
	ldd r16,Y+43
	ldd r17,Y+44
	ldd r18,Y+45
	ldd r19,Y+46
	.stabn	68,0,1035,.LM68-.LFBB6
.LM68:
	ldd r24,Y+23
	ldd r25,Y+24
	ldd r26,Y+25
	ldd r27,Y+26
	.stabn	68,0,1035,.LM69-.LFBB6
.LM69:
	ldd r8,Y+31
	ldd r9,Y+32
	ldd r10,Y+33
	ldd r11,Y+34
	movw r22,r18
	movw r20,r16
	sub r20,r8
	sbc r21,r9
	sbc r22,r10
	sbc r23,r11
	movw r8,r20
	movw r10,r22
	.stabn	68,0,1035,.LM70-.LFBB6
.LM70:
	cp r8,r24
	cpc r9,r25
	cpc r10,r26
	cpc r11,r27
	brsh .L41
	.stabn	68,0,1036,.LM71-.LFBB6
.LM71:
	ldd r22,Y+2
	cpi r22,lo8(2)
	brne .L41
	.stabn	68,0,1036,.LM72-.LFBB6
.LM72:
	movw r20,r18
	movw r18,r16
	add r18,r24
	adc r19,r25
	adc r20,r26
	adc r21,r27
	ldi r16,lo8(1)
	ldi r17,0
	movw r22,r12
	ldd r24,Y+1
	call disk_write
	rjmp .L38
.L42:
	.stabn	68,0,1039,.LM73-.LFBB6
.LM73:
	clr r14
	inc r14
	mov r15,__zero_reg__
.LBE87:
.LBE86:
	.stabn	68,0,1042,.LM74-.LFBB6
.LM74:
	rjmp .L38
	.size	sync_window, .-sync_window
	.stabs	"res:r(0,24)",64,0,0,14
	.stabn	192,0,0,.LFBB6-.LFBB6
	.stabn	224,0,0,.Lscope6-.LFBB6
.Lscope6:
	.stabs	"move_window:f(0,24)",36,0,0,move_window
	.stabs	"fs:P(0,8)",64,0,0,28
	.stabs	"sect:P(0,7)",64,0,0,12
	.type	move_window, @function
move_window:
	.stabn	68,0,1051,.LM75-.LFBB7
.LM75:
.LFBB7:
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
	movw r28,r24
	movw r12,r20
	movw r14,r22
	.stabn	68,0,1055,.LM76-.LFBB7
.LM76:
	ldd r24,Y+43
	ldd r25,Y+44
	ldd r26,Y+45
	ldd r27,Y+46
	.stabn	68,0,1052,.LM77-.LFBB7
.LM77:
	ldi r19,0
	ldi r18,0
	.stabn	68,0,1055,.LM78-.LFBB7
.LM78:
	cp r24,r12
	cpc r25,r13
	cpc r26,r14
	cpc r27,r15
	breq .L43
	.stabn	68,0,1057,.LM79-.LFBB7
.LM79:
	movw r24,r28
	call sync_window
	movw r18,r24
	.stabn	68,0,1059,.LM80-.LFBB7
.LM80:
	or r24,r25
	brne .L43
.LBB90:
.LBB91:
	.stabn	68,0,1060,.LM81-.LFBB7
.LM81:
	ldi r16,lo8(1)
	ldi r17,0
	movw r20,r14
	movw r18,r12
	movw r22,r28
	subi r22,-47
	sbci r23,-1
	ldd r24,Y+1
	call disk_read
	movw r18,r24
	.stabn	68,0,1060,.LM82-.LFBB7
.LM82:
	or r24,r25
	breq .L45
	.stabn	68,0,1062,.LM83-.LFBB7
.LM83:
	ldi r18,lo8(1)
	ldi r19,0
	.stabn	68,0,1061,.LM84-.LFBB7
.LM84:
	clr r12
	dec r12
	mov r13,r12
	movw r14,r12
.L45:
	.stabn	68,0,1064,.LM85-.LFBB7
.LM85:
	std Y+43,r12
	std Y+44,r13
	std Y+45,r14
	std Y+46,r15
.L43:
.LBE91:
.LBE90:
	.stabn	68,0,1068,.LM86-.LFBB7
.LM86:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	move_window, .-move_window
	.stabs	"res:r(0,24)",64,0,0,18
	.stabn	192,0,0,.LFBB7-.LFBB7
	.stabs	"sect:r(0,7)",64,0,0,12
	.stabn	192,0,0,.LBB90-.LFBB7
	.stabn	224,0,0,.LBE90-.LFBB7
	.stabn	224,0,0,.Lscope7-.LFBB7
.Lscope7:
	.section	.rodata.str1.1
.LC1:
	.string	"FAT32   "
	.text
	.stabs	"check_fs:f(0,19)",36,0,0,check_fs
	.stabs	"fs:p(0,8)",160,0,0,5
	.type	check_fs, @function
check_fs:
	.stabn	68,0,3242,.LM87-.LFBB8
.LM87:
.LFBB8:
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
/* stack size = 12 */
.L__stack_usage = 12
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,3247,.LM88-.LFBB8
.LM88:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,3
	st X,__zero_reg__
	.stabn	68,0,3247,.LM89-.LFBB8
.LM89:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	movw r26,r24
	ldd r30,Y+5
	ldd r31,Y+6
	std Z+43,r24
	std Z+44,r25
	std Z+45,r26
	std Z+46,r27
	.stabn	68,0,3248,.LM90-.LFBB8
.LM90:
	movw r24,r30
	call move_window
	movw r16,r24
	.stabn	68,0,3248,.LM91-.LFBB8
.LM91:
	or r24,r25
	breq .+2
	rjmp .L56
.LBB92:
.LBB93:
	.stabn	68,0,619,.LM92-.LFBB8
.LM92:
	ldd r30,Y+5
	ldd r31,Y+6
	subi r30,-45
	sbci r31,-3
	ld r14,Z
	ldd r15,Z+1
.LBE93:
.LBE92:
	.stabn	68,0,3253,.LM93-.LFBB8
.LM93:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,47
	ld r24,X
	.stabn	68,0,3254,.LM94-.LFBB8
.LM94:
	cpi r24,lo8(-21)
	breq .L52
	.stabn	68,0,3254,.LM95-.LFBB8
.LM95:
	subi r24,lo8(-(24))
	cpi r24,lo8(2)
	brlo .+2
	rjmp .L53
.L52:
	.stabn	68,0,3255,.LM96-.LFBB8
.LM96:
	ldi r27,85
	cp r14,r27
	ldi r27,-86
	cpc r15,r27
	brne .L54
	.stabn	68,0,3255,.LM97-.LFBB8
.LM97:
	ldi r20,lo8(8)
	ldi r21,0
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldd r24,Y+5
	ldd r25,Y+6
	subi r24,127
	sbci r25,-1
	call memcmp
	.stabn	68,0,3255,.LM98-.LFBB8
.LM98:
	or r24,r25
	brne .+2
	rjmp .L50
.L54:
	.stabn	68,0,3261,.LM99-.LFBB8
.LM99:
	ldd r30,Y+5
	ldd r31,Y+6
	ldd r24,Z+58
	ldd r25,Z+59
	cp r24,__zero_reg__
	sbci r25,2
	breq .+2
	rjmp .L53
	.stabn	68,0,3260,.LM100-.LFBB8
.LM100:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,60
	ld r24,X
	sbiw r26,60
	.stabn	68,0,3262,.LM101-.LFBB8
.LM101:
	tst r24
	breq .L53
	.stabn	68,0,3262,.LM102-.LFBB8
.LM102:
	ldi r25,0
	.stabn	68,0,3262,.LM103-.LFBB8
.LM103:
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3262,.LM104-.LFBB8
.LM104:
	and r24,r18
	and r25,r19
	.stabn	68,0,3262,.LM105-.LFBB8
.LM105:
	or r24,r25
	brne .L53
	.stabn	68,0,3263,.LM106-.LFBB8
.LM106:
	adiw r26,61
	ld r24,X+
	ld r25,X
	sbiw r26,61+1
	or r24,r25
	breq .L53
	.stabn	68,0,3264,.LM107-.LFBB8
.LM107:
	adiw r26,63
	ld r24,X
	sbiw r26,63
	.stabn	68,0,3264,.LM108-.LFBB8
.LM108:
	subi r24,1
	sbc r25,r25
	.stabn	68,0,3264,.LM109-.LFBB8
.LM109:
	sbiw r24,2
	brsh .L53
.LBB94:
.LBB95:
	.stabn	68,0,619,.LM110-.LFBB8
.LM110:
	movw r30,r26
	subi r30,-64
	sbci r31,-1
.LBE95:
.LBE94:
	.stabn	68,0,3265,.LM111-.LFBB8
.LM111:
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	breq .L53
.LBB96:
.LBB97:
	.stabn	68,0,619,.LM112-.LFBB8
.LM112:
	adiw r30,2
.LBE97:
.LBE96:
	.stabn	68,0,3266,.LM113-.LFBB8
.LM113:
	ld r24,Z
	ldd r25,Z+1
	cpi r24,-128
	cpc r25,__zero_reg__
	brsh .L55
	.stabn	68,0,3266,.LM114-.LFBB8
.LM114:
	movw r24,r26
	subi r24,-79
	sbci r25,-1
	call ld_dword
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,3266,.LM115-.LFBB8
.LM115:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	sbci r24,1
	cpc r25,__zero_reg__
	brlo .L53
.L55:
.LBB98:
.LBB99:
	.stabn	68,0,619,.LM116-.LFBB8
.LM116:
	ldd r30,Y+5
	ldd r31,Y+6
	subi r30,-69
	sbci r31,-1
.LBE99:
.LBE98:
	.stabn	68,0,3267,.LM117-.LFBB8
.LM117:
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	brne .L50
.L53:
	.stabn	68,0,3271,.LM118-.LFBB8
.LM118:
	ldi r16,lo8(3)
	ldi r17,0
	ldi r31,85
	cp r14,r31
	ldi r31,-86
	cpc r15,r31
	brne .L50
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L50
.L56:
	.stabn	68,0,3248,.LM119-.LFBB8
.LM119:
	ldi r16,lo8(4)
	ldi r17,0
.L50:
	.stabn	68,0,3272,.LM120-.LFBB8
.LM120:
	movw r24,r16
/* epilogue start */
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
	ret
	.size	check_fs, .-check_fs
	.stabs	"rv:r(0,11)",64,0,0,14
	.stabn	192,0,0,.LBB93-.LFBB8
	.stabn	224,0,0,.LBE93-.LFBB8
.Lscope8:
	.stabs	"put_fat:f(0,24)",36,0,0,put_fat
	.stabs	"fs:P(0,8)",64,0,0,10
	.stabs	"clst:P(0,1)",64,0,0,12
	.stabs	"val:P(0,1)",64,0,0,4
	.type	put_fat, @function
put_fat:
	.stabn	68,0,1214,.LM121-.LFBB9
.LM121:
.LFBB9:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r10,r24
	movw r12,r20
	movw r14,r22
	movw r4,r16
	movw r6,r18
	.stabn	68,0,1220,.LM122-.LFBB9
.LM122:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L80
	.stabn	68,0,1220,.LM123-.LFBB9
.LM123:
	movw r30,r24
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L81
.LBB106:
.LBB107:
	.stabn	68,0,1221,.LM124-.LFBB9
.LM124:
	ld r24,Z
	.stabn	68,0,1221,.LM125-.LFBB9
.LM125:
	cpi r24,lo8(2)
	brne .+2
	rjmp .L75
	cpi r24,lo8(3)
	brne .+2
	rjmp .L76
	cpi r24,lo8(1)
	breq .+2
	rjmp .L82
	.stabn	68,0,1223,.LM126-.LFBB9
.LM126:
	movw r16,r20
	lsr r17
	ror r16
	.stabn	68,0,1223,.LM127-.LFBB9
.LM127:
	add r16,r20
	adc r17,r21
	.stabn	68,0,1224,.LM128-.LFBB9
.LM128:
	movw r24,r16
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1224,.LM129-.LFBB9
.LM129:
	ldd r20,Z+31
	ldd r21,Z+32
	ldd r22,Z+33
	ldd r23,Z+34
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1225,.LM130-.LFBB9
.LM130:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	breq .+2
	rjmp .L73
	.stabn	68,0,1226,.LM131-.LFBB9
.LM131:
	movw r2,r10
	ldi r19,47
	add r2,r19
	adc r3,__zero_reg__
	.stabn	68,0,1226,.LM132-.LFBB9
.LM132:
	movw r8,r16
	ldi r20,-1
	sub r8,r20
	sbc r9,r20
	andi r17,1
	.stabn	68,0,1226,.LM133-.LFBB9
.LM133:
	movw r30,r2
	add r30,r16
	adc r31,r17
	.stabn	68,0,1227,.LM134-.LFBB9
.LM134:
	mov r24,r4
	.stabn	68,0,1227,.LM135-.LFBB9
.LM135:
	movw r20,r14
	movw r18,r12
	andi r18,1
	clr r19
	clr r20
	clr r21
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
	sbrs r12,0
	rjmp .L77
	.stabn	68,0,1227,.LM136-.LFBB9
.LM136:
	ld r24,Z
	andi r24,lo8(15)
	.stabn	68,0,1227,.LM137-.LFBB9
.LM137:
	ldi r20,lo8(16)
	mul r4,r20
	movw r18,r0
	clr __zero_reg__
	.stabn	68,0,1227,.LM138-.LFBB9
.LM138:
	or r24,r18
.L77:
	.stabn	68,0,1227,.LM139-.LFBB9
.LM139:
	st Z,r24
	.stabn	68,0,1228,.LM140-.LFBB9
.LM140:
	ldi r24,lo8(1)
	movw r26,r10
	adiw r26,3
	st X,r24
	sbiw r26,3
	.stabn	68,0,1229,.LM141-.LFBB9
.LM141:
	adiw r26,31
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X
	sbiw r26,31+3
	movw r24,r8
	mov r24,r25
	clr r25
	lsr r24
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1230,.LM142-.LFBB9
.LM142:
	ldd r30,Y+5
	ldd r31,Y+6
	or r30,r31
	brne .L73
	.stabn	68,0,1231,.LM143-.LFBB9
.LM143:
	ldi r31,1
	and r9,r31
	.stabn	68,0,1231,.LM144-.LFBB9
.LM144:
	movw r30,r2
	add r30,r8
	adc r31,r9
	.stabn	68,0,1232,.LM145-.LFBB9
.LM145:
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	or r18,r19
	or r18,r20
	or r18,r21
	breq .L78
	.stabn	68,0,1232,.LM146-.LFBB9
.LM146:
	movw r26,r6
	movw r24,r4
	ldi r21,4
	1:
	lsr r27
	ror r26
	ror r25
	ror r24
	dec r21
	brne 1b
.L79:
	.stabn	68,0,1232,.LM147-.LFBB9
.LM147:
	st Z,r24
.L86:
	.stabn	68,0,1240,.LM148-.LFBB9
.LM148:
	ldi r24,lo8(1)
	movw r26,r10
	adiw r26,3
	st X,r24
.L73:
.LBE107:
.LBE106:
	.stabn	68,0,1258,.LM149-.LFBB9
.LM149:
	ldd r24,Y+5
	ldd r25,Y+6
/* epilogue start */
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L78:
.LBB114:
.LBB112:
	.stabn	68,0,1232,.LM150-.LFBB9
.LM150:
	ld r24,Z
	andi r24,lo8(-16)
	.stabn	68,0,1232,.LM151-.LFBB9
.LM151:
	mov r25,r5
	andi r25,lo8(15)
	.stabn	68,0,1232,.LM152-.LFBB9
.LM152:
	or r24,r25
	rjmp .L79
.L75:
	.stabn	68,0,1237,.LM153-.LFBB9
.LM153:
	clr r23
	mov r22,r15
	mov r21,r14
	mov r20,r13
	.stabn	68,0,1237,.LM154-.LFBB9
.LM154:
	ldd r24,Z+31
	ldd r25,Z+32
	ldd r26,Z+33
	ldd r27,Z+34
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1238,.LM155-.LFBB9
.LM155:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	brne .L73
	.stabn	68,0,1239,.LM156-.LFBB9
.LM156:
	movw r30,r12
	lsl r30
	rol r31
	andi r30,254
	andi r31,1
.LBB108:
.LBB109:
	.stabn	68,0,654,.LM157-.LFBB9
.LM157:
	add r30,r10
	adc r31,r11
	std Z+48,r17
	std Z+47,r16
	rjmp .L86
.L76:
.LBE109:
.LBE108:
	.stabn	68,0,1247,.LM158-.LFBB9
.LM158:
	ldd r24,Z+31
	ldd r25,Z+32
	ldd r26,Z+33
	ldd r27,Z+34
	ldi r18,7
	1:
	lsr r23
	ror r22
	ror r21
	ror r20
	dec r18
	brne 1b
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1248,.LM159-.LFBB9
.LM159:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	breq .+2
	rjmp .L73
	.stabn	68,0,1250,.LM160-.LFBB9
.LM160:
	movw r16,r10
	subi r16,-47
	sbci r17,-1
	.stabn	68,0,1250,.LM161-.LFBB9
.LM161:
	lsl r12
	rol r13
	lsl r12
	rol r13
	ldi r19,252
	and r12,r19
	ldi r19,1
	and r13,r19
	add r16,r12
	adc r17,r13
	movw r24,r16
	call ld_dword
	.stabn	68,0,1250,.LM162-.LFBB9
.LM162:
	ldi r20,15
	and r7,r20
	.stabn	68,0,1250,.LM163-.LFBB9
.LM163:
	movw r26,r24
	movw r24,r22
	clr r24
	clr r25
	clr r26
	andi r27,240
	.stabn	68,0,1250,.LM164-.LFBB9
.LM164:
	or r24,r4
	or r25,r5
	or r26,r6
	or r27,r7
.LBB110:
.LBB111:
	.stabn	68,0,660,.LM165-.LFBB9
.LM165:
	movw r30,r16
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	rjmp .L86
.L80:
.LBE111:
.LBE110:
.LBE112:
.LBE114:
	.stabn	68,0,1217,.LM166-.LFBB9
.LM166:
	ldi r30,lo8(2)
	ldi r31,0
	std Y+6,r31
	std Y+5,r30
	rjmp .L73
.L81:
	ldi r18,lo8(2)
	ldi r19,0
	std Y+6,r19
	std Y+5,r18
	rjmp .L73
.L82:
.LBB115:
.LBB113:
	.stabn	68,0,1221,.LM167-.LFBB9
.LM167:
	ldi r20,lo8(2)
	ldi r21,0
	std Y+6,r21
	std Y+5,r20
.LBE113:
.LBE115:
	.stabn	68,0,1257,.LM168-.LFBB9
.LM168:
	rjmp .L73
	.size	put_fat, .-put_fat
	.stabs	"res:(0,24)",128,0,0,5
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabs	"res:(0,24)",128,0,0,5
	.stabn	192,0,0,.LBB107-.LFBB9
	.stabn	224,0,0,.LBE107-.LFBB9
	.stabs	"res:(0,24)",128,0,0,5
	.stabn	192,0,0,.LBB112-.LFBB9
	.stabn	224,0,0,.LBE112-.LFBB9
	.stabs	"res:(0,24)",128,0,0,5
	.stabn	192,0,0,.LBB113-.LFBB9
	.stabn	224,0,0,.LBE113-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.stabs	"dir_clear:f(0,24)",36,0,0,dir_clear
	.stabs	"fs:P(0,8)",64,0,0,28
	.type	dir_clear, @function
dir_clear:
	.stabn	68,0,1631,.LM169-.LFBB10
.LM169:
.LFBB10:
	push r8
	push r9
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r28,r24
	movw r10,r20
	movw r12,r22
	.stabn	68,0,1637,.LM170-.LFBB10
.LM170:
	call sync_window
	movw r14,r24
	.stabn	68,0,1637,.LM171-.LFBB10
.LM171:
	ldi r24,lo8(1)
	.stabn	68,0,1637,.LM172-.LFBB10
.LM172:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L95
.LBB118:
.LBB119:
	.stabn	68,0,1638,.LM173-.LFBB10
.LM173:
	movw r20,r10
	movw r22,r12
	movw r24,r28
	call clst2sect
	movw r8,r22
	movw r10,r24
	.stabn	68,0,1639,.LM174-.LFBB10
.LM174:
	std Y+43,r8
	std Y+44,r9
	std Y+45,r10
	std Y+46,r11
	.stabn	68,0,1640,.LM175-.LFBB10
.LM175:
	movw r12,r28
	ldi r18,47
	add r12,r18
	adc r13,__zero_reg__
	.stabn	68,0,1640,.LM176-.LFBB10
.LM176:
	ldi r24,0
	ldi r25,lo8(2)
	movw r30,r12
	movw r18,r24
	0:
	st Z+,__zero_reg__
	subi r18,1
	sbci r19,0
	brne 0b
.L89:
	.stabn	68,0,1653,.LM177-.LFBB10
.LM177:
	ldd r24,Y+9
	ldd r25,Y+10
	cp r14,r24
	cpc r15,r25
	brlo .L90
.L93:
	.stabn	68,0,1655,.LM178-.LFBB10
.LM178:
	ldi r24,lo8(1)
	ldd r18,Y+9
	ldd r19,Y+10
	cp r18,r14
	cpc r19,r15
	brne .L95
	ldi r24,0
.L95:
.LBE119:
.LBE118:
	.stabn	68,0,1637,.LM179-.LFBB10
.LM179:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,1656,.LM180-.LFBB10
.LM180:
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
	pop r9
	pop r8
	ret
.L90:
.LBB121:
.LBB120:
	.stabn	68,0,1653,.LM181-.LFBB10
.LM181:
	ldi r16,lo8(1)
	ldi r17,0
	movw r20,r10
	movw r18,r8
	add r18,r14
	adc r19,r15
	adc r20,__zero_reg__
	adc r21,__zero_reg__
	movw r22,r12
	ldd r24,Y+1
	call disk_write
	.stabn	68,0,1653,.LM182-.LFBB10
.LM182:
	or r24,r25
	brne .L93
	.stabn	68,0,1653,.LM183-.LFBB10
.LM183:
	ldi r19,-1
	sub r14,r19
	sbc r15,r19
	rjmp .L89
.LBE120:
.LBE121:
	.size	dir_clear, .-dir_clear
	.stabs	"sect:r(0,7)",64,0,0,8
	.stabs	"n:r(0,19)",64,0,0,14
	.stabn	192,0,0,.LBB119-.LFBB10
	.stabn	224,0,0,.LBE119-.LFBB10
	.stabs	"sect:r(0,7)",64,0,0,8
	.stabs	"n:r(0,19)",64,0,0,14
	.stabn	192,0,0,.LBB120-.LFBB10
	.stabn	224,0,0,.LBE120-.LFBB10
.Lscope10:
	.stabs	"mount_volume:f(0,24)",36,0,0,mount_volume
	.stabs	"path:P(0,22)",64,0,0,24
	.stabs	"rfs:P(0,30)",64,0,0,10
	.stabs	"mode:P(0,5)",64,0,0,15
	.type	mount_volume, @function
mount_volume:
	.stabn	68,0,3337,.LM184-.LFBB11
.LM184:
.LFBB11:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,40
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 40 */
/* stack size = 58 */
.L__stack_usage = 58
	movw r10,r22
	mov r15,r20
	.stabn	68,0,3348,.LM185-.LFBB11
.LM185:
	movw r26,r22
	st X+,__zero_reg__
	st X,__zero_reg__
	.stabn	68,0,3349,.LM186-.LFBB11
.LM186:
	call get_ldnumber
	movw r12,r24
	.stabn	68,0,3350,.LM187-.LFBB11
.LM187:
	sbrc r25,7
	rjmp .L119
	.stabn	68,0,3353,.LM188-.LFBB11
.LM188:
	movw r30,r24
	lsl r30
	rol r31
	subi r30,lo8(-(FatFs))
	sbci r31,hi8(-(FatFs))
	ld r16,Z
	ldd r17,Z+1
	.stabn	68,0,3354,.LM189-.LFBB11
.LM189:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L120
	.stabn	68,0,3358,.LM190-.LFBB11
.LM190:
	movw r30,r10
	std Z+1,r17
	st Z,r16
	.stabn	68,0,3360,.LM191-.LFBB11
.LM191:
	clt
	bld r15,0
	.stabn	68,0,3361,.LM192-.LFBB11
.LM192:
	movw r26,r16
	ld r24,X
	tst r24
	breq .L98
	.stabn	68,0,3362,.LM193-.LFBB11
.LM193:
	adiw r26,1
	ld r24,X
	call disk_status
	.stabn	68,0,3363,.LM194-.LFBB11
.LM194:
	sbrc r24,0
	rjmp .L98
	.stabn	68,0,3364,.LM195-.LFBB11
.LM195:
	tst r15
	brne .+2
	rjmp .L122
	.stabn	68,0,3364,.LM196-.LFBB11
.LM196:
	sbrs r24,2
	rjmp .L122
.L100:
	.stabn	68,0,3365,.LM197-.LFBB11
.LM197:
	ldi r16,lo8(10)
	mov r10,r16
	mov r11,__zero_reg__
.L96:
	.stabn	68,0,3552,.LM198-.LFBB11
.LM198:
	movw r24,r10
/* epilogue start */
	adiw r28,40
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L98:
	.stabn	68,0,3374,.LM199-.LFBB11
.LM199:
	movw r30,r16
	st Z,__zero_reg__
	.stabn	68,0,3375,.LM200-.LFBB11
.LM200:
	std Z+1,r12
	.stabn	68,0,3376,.LM201-.LFBB11
.LM201:
	mov r24,r12
	call disk_initialize
	.stabn	68,0,3378,.LM202-.LFBB11
.LM202:
	ldi r18,lo8(3)
	mov r10,r18
	mov r11,__zero_reg__
	.stabn	68,0,3377,.LM203-.LFBB11
.LM203:
	sbrc r24,0
	rjmp .L96
	.stabn	68,0,3380,.LM204-.LFBB11
.LM204:
	tst r15
	breq .L99
	.stabn	68,0,3380,.LM205-.LFBB11
.LM205:
	sbrc r24,2
	rjmp .L100
.L99:
.LBB140:
.LBB141:
	.stabn	68,0,3287,.LM206-.LFBB11
.LM206:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	movw r24,r16
	call check_fs
	.stabn	68,0,3288,.LM207-.LFBB11
.LM207:
	cpi r24,2
	cpc r25,__zero_reg__
	breq .+2
	rjmp .L101
	movw r12,r16
	ldi r31,11
	sub r12,r31
	ldi r31,-2
	sbc r13,r31
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r14,r18
	movw r8,r16
	ldi r19,-53
	sub r8,r19
	ldi r19,-3
	sbc r9,r19
	movw r10,r14
.L102:
	.stabn	68,0,3316,.LM208-.LFBB11
.LM208:
	movw r24,r12
	call ld_dword
	std Y+17,r22
	std Y+18,r23
	std Y+19,r24
	std Y+20,r25
	.stabn	68,0,3316,.LM209-.LFBB11
.LM209:
	movw r26,r10
	st X+,r22
	st X+,r23
	st X+,r24
	st X+,r25
	movw r10,r26
	.stabn	68,0,3315,.LM210-.LFBB11
.LM210:
	ldi r27,16
	add r12,r27
	adc r13,__zero_reg__
	cp r12,r8
	cpc r13,r9
	brne .L102
	movw r12,r14
	ldi r30,16
	add r12,r30
	adc r13,__zero_reg__
.L105:
	.stabn	68,0,3320,.LM211-.LFBB11
.LM211:
	movw r26,r14
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X+
	movw r14,r26
	.stabn	68,0,3320,.LM212-.LFBB11
.LM212:
	ldi r18,lo8(3)
	ldi r19,0
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L103
	.stabn	68,0,3320,.LM213-.LFBB11
.LM213:
	movw r24,r16
	call check_fs
	movw r18,r24
	.stabn	68,0,3321,.LM214-.LFBB11
.LM214:
	sbiw r24,2
	brlo .+2
	rjmp .L103
.L107:
.LBE141:
.LBE140:
	.stabn	68,0,3392,.LM215-.LFBB11
.LM215:
	movw r26,r16
	adiw r26,43
	ld r18,X+
	ld r19,X+
	ld r20,X+
	ld r21,X
	sbiw r26,43+3
	std Y+25,r18
	std Y+26,r19
	std Y+27,r20
	std Y+28,r21
	.stabn	68,0,3460,.LM216-.LFBB11
.LM216:
	adiw r26,58
	ld r24,X+
	ld r25,X
	cp r24,__zero_reg__
	sbci r25,2
	breq .+2
	rjmp .L108
.LBB143:
.LBB144:
	.stabn	68,0,619,.LM217-.LFBB11
.LM217:
	movw r30,r16
	subi r30,-69
	sbci r31,-1
.LBE144:
.LBE143:
	.stabn	68,0,3462,.LM218-.LFBB11
.LM218:
	ld r24,Z
	ldd r25,Z+1
	movw r18,r24
	ldi r21,0
	ldi r20,0
	std Y+17,r18
	std Y+18,r19
	std Y+19,r20
	std Y+20,r21
	.stabn	68,0,3463,.LM219-.LFBB11
.LM219:
	or r24,r25
	brne .L109
	.stabn	68,0,3463,.LM220-.LFBB11
.LM220:
	movw r24,r16
	subi r24,-83
	sbci r25,-1
	call ld_dword
	std Y+17,r22
	std Y+18,r23
	std Y+19,r24
	std Y+20,r25
.L109:
	.stabn	68,0,3464,.LM221-.LFBB11
.LM221:
	ldd r24,Y+17
	ldd r25,Y+18
	ldd r26,Y+19
	ldd r27,Y+20
	movw r30,r16
	std Z+23,r24
	std Z+24,r25
	std Z+25,r26
	std Z+26,r27
	.stabn	68,0,3466,.LM222-.LFBB11
.LM222:
	ldd r8,Z+63
	.stabn	68,0,3466,.LM223-.LFBB11
.LM223:
	std Z+2,r8
	.stabn	68,0,3467,.LM224-.LFBB11
.LM224:
	ldi r24,lo8(-1)
	add r24,r8
	.stabn	68,0,3467,.LM225-.LFBB11
.LM225:
	cpi r24,lo8(2)
	brlo .+2
	rjmp .L108
	.stabn	68,0,3470,.LM226-.LFBB11
.LM226:
	ldd r4,Z+60
	mov r24,r4
	ldi r25,0
	.stabn	68,0,3470,.LM227-.LFBB11
.LM227:
	std Z+10,r25
	std Z+9,r24
	.stabn	68,0,3471,.LM228-.LFBB11
.LM228:
	sbiw r24,0
	brne .+2
	rjmp .L108
	.stabn	68,0,3471,.LM229-.LFBB11
.LM229:
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3471,.LM230-.LFBB11
.LM230:
	and r24,r18
	and r25,r19
	.stabn	68,0,3471,.LM231-.LFBB11
.LM231:
	or r24,r25
	breq .+2
	rjmp .L108
.LBB145:
.LBB146:
	.stabn	68,0,619,.LM232-.LFBB11
.LM232:
	subi r30,-64
	sbci r31,-1
	ld r2,Z
	ldd r3,Z+1
.LBE146:
.LBE145:
	.stabn	68,0,3473,.LM233-.LFBB11
.LM233:
	movw r26,r16
	adiw r26,7+1
	st X,r3
	st -X,r2
	sbiw r26,7
	.stabn	68,0,3474,.LM234-.LFBB11
.LM234:
	movw r10,r2
	ldi r27,15
	and r10,r27
	clr r11
	.stabn	68,0,3474,.LM235-.LFBB11
.LM235:
	cp r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .+2
	rjmp .L108
.LBB147:
.LBB148:
	.stabn	68,0,619,.LM236-.LFBB11
.LM236:
	adiw r30,2
.LBE148:
.LBE147:
	.stabn	68,0,3476,.LM237-.LFBB11
.LM237:
	ld r24,Z
	ldd r25,Z+1
	movw r12,r24
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	.stabn	68,0,3477,.LM238-.LFBB11
.LM238:
	or r24,r25
	brne .L110
	.stabn	68,0,3477,.LM239-.LFBB11
.LM239:
	movw r24,r16
	subi r24,-79
	sbci r25,-1
	call ld_dword
	movw r12,r22
	movw r14,r24
.L110:
.LBB149:
.LBB150:
	.stabn	68,0,619,.LM240-.LFBB11
.LM240:
	movw r26,r16
	adiw r26,61
	ld r30,X+
	ld r31,X
.LBE150:
.LBE149:
	.stabn	68,0,3480,.LM241-.LFBB11
.LM241:
	sbiw r30,0
	brne .+2
	rjmp .L108
	.stabn	68,0,3468,.LM242-.LFBB11
.LM242:
	mov r26,r8
	ldi r27,0
	ldd r18,Y+17
	ldd r19,Y+18
	ldd r20,Y+19
	ldd r21,Y+20
	call __muluhisi3
	std Y+37,r22
	std Y+38,r23
	std Y+39,r24
	std Y+40,r25
	.stabn	68,0,3483,.LM243-.LFBB11
.LM243:
	movw r18,r30
	ldi r21,0
	ldi r20,0
	std Y+29,r18
	std Y+30,r19
	std Y+31,r20
	std Y+32,r21
	.stabn	68,0,3483,.LM244-.LFBB11
.LM244:
	movw r24,r2
	ldi r27,4
	1:
	lsr r25
	ror r24
	dec r27
	brne 1b
	.stabn	68,0,3483,.LM245-.LFBB11
.LM245:
	add r18,r24
	adc r19,r25
	adc r20,__zero_reg__
	adc r21,__zero_reg__
	movw r26,r20
	movw r24,r18
	ldd r18,Y+37
	ldd r19,Y+38
	ldd r20,Y+39
	ldd r21,Y+40
	add r18,r24
	adc r19,r25
	adc r20,r26
	adc r21,r27
	std Y+21,r18
	std Y+22,r19
	std Y+23,r20
	std Y+24,r21
	.stabn	68,0,3484,.LM246-.LFBB11
.LM246:
	cp r12,r18
	cpc r13,r19
	cpc r14,r20
	cpc r15,r21
	brsh .+2
	rjmp .L108
	.stabn	68,0,3485,.LM247-.LFBB11
.LM247:
	movw r26,r14
	movw r24,r12
	sub r24,r18
	sbc r25,r19
	sbc r26,r20
	sbc r27,r21
	std Y+33,r24
	std Y+34,r25
	std Y+35,r26
	std Y+36,r27
	.stabn	68,0,3485,.LM248-.LFBB11
.LM248:
	mov r5,__zero_reg__
	mov r7,__zero_reg__
	mov r6,__zero_reg__
	.stabn	68,0,3485,.LM249-.LFBB11
.LM249:
	movw r22,r24
	movw r24,r26
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	.stabn	68,0,3486,.LM250-.LFBB11
.LM250:
	ldd r24,Y+33
	ldd r25,Y+34
	ldd r26,Y+35
	ldd r27,Y+36
	cp r24,r4
	cpc r25,r5
	cpc r26,r6
	cpc r27,r7
	brsh .+2
	rjmp .L108
	.stabn	68,0,3488,.LM251-.LFBB11
.LM251:
	cpi r18,-10
	ldi r25,-1
	cpc r19,r25
	cpc r20,r25
	ldi r25,15
	cpc r21,r25
	brlo .+2
	rjmp .L108
	.stabn	68,0,3488,.LM252-.LFBB11
.LM252:
	ldi r26,lo8(3)
	mov r8,r26
	mov r9,__zero_reg__
	.stabn	68,0,3489,.LM253-.LFBB11
.LM253:
	cpi r18,-10
	ldi r26,-1
	cpc r19,r26
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	brsh .L118
	.stabn	68,0,3490,.LM254-.LFBB11
.LM254:
	clr r8
	inc r8
	mov r9,__zero_reg__
	.stabn	68,0,3490,.LM255-.LFBB11
.LM255:
	cpi r18,-10
	ldi r27,15
	cpc r19,r27
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	brlo .L118
	.stabn	68,0,3489,.LM256-.LFBB11
.LM256:
	ldi r31,lo8(2)
	mov r8,r31
	mov r9,__zero_reg__
.L118:
	.stabn	68,0,3494,.LM257-.LFBB11
.LM257:
	movw r12,r18
	movw r14,r20
	ldi r27,2
	add r12,r27
	adc r13,__zero_reg__
	adc r14,__zero_reg__
	adc r15,__zero_reg__
	.stabn	68,0,3494,.LM258-.LFBB11
.LM258:
	movw r30,r16
	std Z+19,r12
	std Z+20,r13
	std Z+21,r14
	std Z+22,r15
	.stabn	68,0,3495,.LM259-.LFBB11
.LM259:
	ldd r18,Y+25
	ldd r19,Y+26
	ldd r20,Y+27
	ldd r21,Y+28
	std Z+27,r18
	std Z+28,r19
	std Z+29,r20
	std Z+30,r21
	.stabn	68,0,3496,.LM260-.LFBB11
.LM260:
	ldd r4,Y+29
	ldd r5,Y+30
	ldd r6,Y+31
	ldd r7,Y+32
	add r4,r18
	adc r5,r19
	adc r6,r20
	adc r7,r21
	.stabn	68,0,3496,.LM261-.LFBB11
.LM261:
	std Z+31,r4
	std Z+32,r5
	std Z+33,r6
	std Z+34,r7
	.stabn	68,0,3497,.LM262-.LFBB11
.LM262:
	movw r26,r20
	movw r24,r18
	ldd r18,Y+21
	ldd r19,Y+22
	ldd r20,Y+23
	ldd r21,Y+24
	add r24,r18
	adc r25,r19
	adc r26,r20
	adc r27,r21
	.stabn	68,0,3497,.LM263-.LFBB11
.LM263:
	std Z+39,r24
	std Z+40,r25
	std Z+41,r26
	std Z+42,r27
	.stabn	68,0,3498,.LM264-.LFBB11
.LM264:
	ldi r31,3
	cp r8,r31
	cpc r9,__zero_reg__
	breq .+2
	rjmp .L112
.LBB151:
.LBB152:
	.stabn	68,0,619,.LM265-.LFBB11
.LM265:
	movw r30,r16
	subi r30,-89
	sbci r31,-1
.LBE152:
.LBE151:
	.stabn	68,0,3499,.LM266-.LFBB11
.LM266:
	ld r24,Z
	ldd r25,Z+1
	or r24,r2
	or r25,r3
	or r24,r25
	breq .+2
	rjmp .L108
	.stabn	68,0,3501,.LM267-.LFBB11
.LM267:
	movw r24,r16
	subi r24,-91
	sbci r25,-1
	call ld_dword
	movw r4,r22
	movw r6,r24
	.stabn	68,0,3502,.LM268-.LFBB11
.LM268:
	movw r26,r14
	movw r24,r12
	ldi r30,2
	1:
	lsl r24
	rol r25
	rol r26
	rol r27
	dec r30
	brne 1b
.L113:
	.stabn	68,0,3501,.LM269-.LFBB11
.LM269:
	movw r30,r16
	std Z+35,r4
	std Z+36,r5
	std Z+37,r6
	std Z+38,r7
	.stabn	68,0,3509,.LM270-.LFBB11
.LM270:
	movw r12,r24
	movw r14,r26
	ldi r31,-1
	add r12,r31
	ldi r31,1
	adc r13,r31
	adc r14,__zero_reg__
	adc r15,__zero_reg__
	.stabn	68,0,3509,.LM271-.LFBB11
.LM271:
	ldi r21,9
	1:
	lsr r15
	ror r14
	ror r13
	ror r12
	dec r21
	brne 1b
	.stabn	68,0,3509,.LM272-.LFBB11
.LM272:
	ldd r18,Y+17
	ldd r19,Y+18
	ldd r20,Y+19
	ldd r21,Y+20
	cp r18,r12
	cpc r19,r13
	cpc r20,r14
	cpc r21,r15
	brsh .+2
	rjmp .L108
	.stabn	68,0,3513,.LM273-.LFBB11
.LM273:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	movw r26,r24
	movw r30,r16
	std Z+15,r24
	std Z+16,r25
	std Z+17,r26
	std Z+18,r27
	.stabn	68,0,3513,.LM274-.LFBB11
.LM274:
	std Z+11,r24
	std Z+12,r25
	std Z+13,r26
	std Z+14,r27
	.stabn	68,0,3514,.LM275-.LFBB11
.LM275:
	ldi r24,lo8(-128)
	std Z+4,r24
	.stabn	68,0,3516,.LM276-.LFBB11
.LM276:
	ldi r31,3
	cp r8,r31
	cpc r9,__zero_reg__
	breq .+2
	rjmp .L116
.LBB153:
.LBB154:
	.stabn	68,0,619,.LM277-.LFBB11
.LM277:
	movw r30,r16
	subi r30,-95
	sbci r31,-1
.LBE154:
.LBE153:
	.stabn	68,0,3517,.LM278-.LFBB11
.LM278:
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,1
	breq .+2
	rjmp .L116
	.stabn	68,0,3518,.LM279-.LFBB11
.LM279:
	ldd r20,Y+25
	ldd r21,Y+26
	ldd r22,Y+27
	ldd r23,Y+28
	subi r20,-1
	sbci r21,-1
	sbci r22,-1
	sbci r23,-1
	movw r24,r16
	call move_window
	.stabn	68,0,3518,.LM280-.LFBB11
.LM280:
	or r24,r25
	brne .L116
	.stabn	68,0,3520,.LM281-.LFBB11
.LM281:
	movw r26,r16
	adiw r26,4
	st X,__zero_reg__
.LBB155:
.LBB156:
	.stabn	68,0,619,.LM282-.LFBB11
.LM282:
	movw r30,r16
	subi r30,-45
	sbci r31,-3
.LBE156:
.LBE155:
	.stabn	68,0,3521,.LM283-.LFBB11
.LM283:
	ld r24,Z
	ldd r25,Z+1
	cpi r24,85
	sbci r25,-86
	brne .L116
	.stabn	68,0,3522,.LM284-.LFBB11
.LM284:
	movw r24,r16
	adiw r24,47
	call ld_dword
	.stabn	68,0,3522,.LM285-.LFBB11
.LM285:
	cpi r22,82
	sbci r23,82
	sbci r24,97
	sbci r25,65
	brne .L116
	.stabn	68,0,3523,.LM286-.LFBB11
.LM286:
	movw r24,r16
	subi r24,-19
	sbci r25,-3
	call ld_dword
	.stabn	68,0,3523,.LM287-.LFBB11
.LM287:
	cpi r22,114
	sbci r23,114
	sbci r24,65
	sbci r25,97
	brne .L116
	.stabn	68,0,3526,.LM288-.LFBB11
.LM288:
	movw r24,r16
	subi r24,-23
	sbci r25,-3
	call ld_dword
	movw r26,r16
	adiw r26,15
	st X+,r22
	st X+,r23
	st X+,r24
	st X,r25
	sbiw r26,15+3
	.stabn	68,0,3529,.LM289-.LFBB11
.LM289:
	movw r24,r16
	subi r24,-27
	sbci r25,-3
	call ld_dword
	movw r30,r16
	std Z+11,r22
	std Z+12,r23
	std Z+13,r24
	std Z+14,r25
.L116:
	.stabn	68,0,3537,.LM290-.LFBB11
.LM290:
	movw r26,r16
	st X,r8
	.stabn	68,0,3538,.LM291-.LFBB11
.LM291:
	lds r24,Fsid
	lds r25,Fsid+1
	adiw r24,1
	.stabn	68,0,3538,.LM292-.LFBB11
.LM292:
	sts Fsid+1,r25
	sts Fsid,r24
	adiw r26,5+1
	st X,r25
	st -X,r24
	sbiw r26,5
	.stabn	68,0,3551,.LM293-.LFBB11
.LM293:
	rjmp .L96
.L103:
.LBB157:
.LBB142:
	.stabn	68,0,3321,.LM294-.LFBB11
.LM294:
	cp r12,r14
	cpc r13,r15
	breq .+2
	rjmp .L105
.LBE142:
.LBE157:
	.stabn	68,0,3390,.LM295-.LFBB11
.LM295:
	cpi r18,4
	cpc r19,__zero_reg__
	brne .L108
.L127:
	.stabn	68,0,3390,.LM296-.LFBB11
.LM296:
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L96
.L101:
	.stabn	68,0,3390,.LM297-.LFBB11
.LM297:
	cpi r24,4
	cpc r25,__zero_reg__
	breq .L127
	.stabn	68,0,3391,.LM298-.LFBB11
.LM298:
	sbiw r24,2
	brsh .+2
	rjmp .L107
.L108:
	.stabn	68,0,3391,.LM299-.LFBB11
.LM299:
	ldi r17,lo8(13)
	mov r10,r17
	mov r11,__zero_reg__
	rjmp .L96
.L112:
	.stabn	68,0,3504,.LM300-.LFBB11
.LM300:
	or r2,r3
	breq .L108
	.stabn	68,0,3505,.LM301-.LFBB11
.LM301:
	ldd r18,Y+37
	ldd r19,Y+38
	ldd r20,Y+39
	ldd r21,Y+40
	add r4,r18
	adc r5,r19
	adc r6,r20
	adc r7,r21
	.stabn	68,0,3507,.LM302-.LFBB11
.LM302:
	ldi r19,2
	cp r8,r19
	cpc r9,__zero_reg__
	brne .L114
	.stabn	68,0,3507,.LM303-.LFBB11
.LM303:
	movw r26,r14
	movw r24,r12
	lsl r24
	rol r25
	rol r26
	rol r27
	rjmp .L113
.L114:
	.stabn	68,0,3507,.LM304-.LFBB11
.LM304:
	ldi r26,lo8(3)
	ldi r27,0
	movw r20,r14
	movw r18,r12
	call __muluhisi3
	std Y+21,r22
	std Y+22,r23
	std Y+23,r24
	std Y+24,r25
	.stabn	68,0,3507,.LM305-.LFBB11
.LM305:
	movw r26,r24
	movw r24,r22
	lsr r27
	ror r26
	ror r25
	ror r24
	.stabn	68,0,3507,.LM306-.LFBB11
.LM306:
	ldi r20,1
	and r12,r20
	clr r13
	clr r14
	clr r15
	.stabn	68,0,3507,.LM307-.LFBB11
.LM307:
	add r24,r12
	adc r25,r13
	adc r26,r14
	adc r27,r15
	rjmp .L113
.L119:
	.stabn	68,0,3350,.LM308-.LFBB11
.LM308:
	ldi r20,lo8(11)
	mov r10,r20
	mov r11,__zero_reg__
	rjmp .L96
.L120:
	.stabn	68,0,3354,.LM309-.LFBB11
.LM309:
	ldi r19,lo8(12)
	mov r10,r19
	mov r11,__zero_reg__
	rjmp .L96
.L122:
	.stabn	68,0,3367,.LM310-.LFBB11
.LM310:
	mov r11,__zero_reg__
	mov r10,__zero_reg__
	rjmp .L96
	.size	mount_volume, .-mount_volume
	.stabs	"vol:r(0,18)",64,0,0,12
	.stabs	"bsect:(0,7)",128,0,0,25
	.stabs	"DSTATUS:t(0,32)=(0,5)",128,0,0,0
	.stabs	"tsect:r(0,1)",64,0,0,12
	.stabs	"sysect:(0,1)",128,0,0,21
	.stabs	"szbfat:r(0,1)",64,0,0,24
	.stabs	"fs:r(0,8)",64,0,0,16
	.stabs	"FATFS:t(0,9)",128,0,0,0
	.stabs	"fmt:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LFBB11-.LFBB11
	.stabs	"fmt:r(0,19)",64,0,0,18
	.stabs	"mbr_pt:(0,33)=ar(0,15);0;3;(0,1)",128,0,0,1
	.stabn	192,0,0,.LBB141-.LFBB11
	.stabn	224,0,0,.LBE141-.LFBB11
	.stabs	"fmt:r(0,19)",64,0,0,18
	.stabs	"mbr_pt:(0,33)",128,0,0,1
	.stabn	192,0,0,.LBB142-.LFBB11
	.stabn	224,0,0,.LBE142-.LFBB11
	.stabs	"rv:r(0,11)",64,0,0,2
	.stabn	192,0,0,.LBB146-.LFBB11
	.stabn	224,0,0,.LBE146-.LFBB11
	.stabs	"rv:r(0,11)",64,0,0,30
	.stabn	192,0,0,.LBB150-.LFBB11
	.stabn	224,0,0,.LBE150-.LFBB11
	.stabn	224,0,0,.Lscope11-.LFBB11
.Lscope11:
	.stabs	"get_fileinfo.part.0.constprop.0.isra.0:f(0,16)",36,0,0,get_fileinfo.part.0.constprop.0.isra.0
	.stabs	"ISRA.298:P(0,17)",64,0,0,16
	.stabs	"fno:P(0,34)=*(0,35)=(0,36)=s22fsize:(0,29),0,32;fdate:(0,11),32,16;ftime:(0,11),48,16;fattrib:(0,5),64,8;fname:(0,37)=ar(0,15);0;12;(0,20),72,104;;",64,0,0,28
	.type	get_fileinfo.part.0.constprop.0.isra.0, @function
get_fileinfo.part.0.constprop.0.isra.0:
	.stabn	68,0,2586,.LM311-.LFBB12
.LM311:
.LFBB12:
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
	movw r30,r24
	.stabn	68,0,2692,.LM312-.LFBB12
.LM312:
	ldi r25,0
	ldi r24,0
	.stabn	68,0,2692,.LM313-.LFBB12
.LM313:
	ldi r19,0
	ldi r18,0
	.stabn	68,0,2697,.LM314-.LFBB12
.LM314:
	ldi r21,lo8(46)
.L150:
	.stabn	68,0,2694,.LM315-.LFBB12
.LM315:
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,2694,.LM316-.LFBB12
.LM316:
	ld r20,Z+
	.stabn	68,0,2695,.LM317-.LFBB12
.LM317:
	cpi r20,lo8(32)
	breq .L147
	.stabn	68,0,2696,.LM318-.LFBB12
.LM318:
	cpi r20,lo8(5)
	brne .L148
	.stabn	68,0,2696,.LM319-.LFBB12
.LM319:
	ldi r20,lo8(-27)
.L148:
	.stabn	68,0,2697,.LM320-.LFBB12
.LM320:
	cpi r18,9
	cpc r19,__zero_reg__
	brne .L149
	.stabn	68,0,2697,.LM321-.LFBB12
.LM321:
	movw r26,r28
	add r26,r24
	adc r27,r25
	adiw r26,9
	st X,r21
	.stabn	68,0,2697,.LM322-.LFBB12
.LM322:
	adiw r24,1
.L149:
	.stabn	68,0,2698,.LM323-.LFBB12
.LM323:
	movw r26,r28
	add r26,r24
	adc r27,r25
	adiw r26,9
	st X,r20
	.stabn	68,0,2698,.LM324-.LFBB12
.LM324:
	adiw r24,1
.L147:
	.stabn	68,0,2693,.LM325-.LFBB12
.LM325:
	cpi r18,11
	cpc r19,__zero_reg__
	brne .L150
	.stabn	68,0,2700,.LM326-.LFBB12
.LM326:
	add r24,r28
	adc r25,r29
	movw r26,r24
	adiw r26,9
	st X,__zero_reg__
	.stabn	68,0,2703,.LM327-.LFBB12
.LM327:
	movw r30,r16
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2703,.LM328-.LFBB12
.LM328:
	std Y+8,r24
	.stabn	68,0,2704,.LM329-.LFBB12
.LM329:
	movw r24,r16
	adiw r24,28
	call ld_dword
	st Y,r22
	std Y+1,r23
	std Y+2,r24
	std Y+3,r25
.LBB166:
.LBB167:
	.stabn	68,0,619,.LM330-.LFBB12
.LM330:
	movw r26,r16
	adiw r26,22
	ld r24,X+
	ld r25,X
	sbiw r26,22+1
.LBE167:
.LBE166:
	.stabn	68,0,2705,.LM331-.LFBB12
.LM331:
	std Y+7,r25
	std Y+6,r24
.LBB168:
.LBB169:
	.stabn	68,0,619,.LM332-.LFBB12
.LM332:
	adiw r26,24
	ld r24,X+
	ld r25,X
.LBE169:
.LBE168:
	.stabn	68,0,2706,.LM333-.LFBB12
.LM333:
	std Y+5,r25
	std Y+4,r24
/* epilogue start */
	.stabn	68,0,2707,.LM334-.LFBB12
.LM334:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	get_fileinfo.part.0.constprop.0.isra.0, .-get_fileinfo.part.0.constprop.0.isra.0
	.stabs	"si:r(0,19)",64,0,0,18
	.stabs	"c:r(0,20)",64,0,0,20
	.stabn	192,0,0,.LFBB12-.LFBB12
	.stabs	"rv:r(0,11)",64,0,0,24
	.stabn	192,0,0,.LBB167-.LFBB12
	.stabn	224,0,0,.LBE167-.LFBB12
	.stabs	"rv:r(0,11)",64,0,0,24
	.stabn	192,0,0,.LBB169-.LFBB12
	.stabn	224,0,0,.LBE169-.LFBB12
	.stabn	224,0,0,.Lscope12-.LFBB12
.Lscope12:
	.stabs	"ld_clust.isra.0:f(0,1)",36,0,0,ld_clust.isra.0
	.stabs	"ISRA.309:P(0,5)",64,0,0,24
	.stabs	"dir:P(0,4)",64,0,0,30
	.type	ld_clust.isra.0, @function
ld_clust.isra.0:
	.stabn	68,0,1817,.LM335-.LFBB13
.LM335:
.LFBB13:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r18,r24
	movw r30,r22
	.stabn	68,0,1824,.LM336-.LFBB13
.LM336:
	ldd r22,Z+26
	ldd r23,Z+27
	ldi r25,0
	ldi r24,0
	.stabn	68,0,1825,.LM337-.LFBB13
.LM337:
	cpi r18,lo8(3)
	brne .L155
	.stabn	68,0,1826,.LM338-.LFBB13
.LM338:
	ldd r16,Z+20
	ldd r17,Z+21
	ldi r19,0
	ldi r18,0
	.stabn	68,0,1826,.LM339-.LFBB13
.LM339:
	movw r18,r16
	clr r17
	clr r16
	.stabn	68,0,1826,.LM340-.LFBB13
.LM340:
	or r22,r16
	or r23,r17
	or r24,r18
	or r25,r19
.L155:
/* epilogue start */
	.stabn	68,0,1830,.LM341-.LFBB13
.LM341:
	pop r17
	pop r16
	ret
	.size	ld_clust.isra.0, .-ld_clust.isra.0
	.stabs	"cl:r(0,1)",64,0,0,22
	.stabn	192,0,0,.LFBB13-.LFBB13
	.stabn	224,0,0,.Lscope13-.LFBB13
.Lscope13:
	.stabs	"get_fat.isra.0:f(0,1)",36,0,0,get_fat.isra.0
	.stabs	"ISRA.313:P(0,8)",64,0,0,16
	.stabs	"clst:P(0,1)",64,0,0,12
	.type	get_fat.isra.0, @function
get_fat.isra.0:
	.stabn	68,0,1131,.LM342-.LFBB14
.LM342:
.LFBB14:
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 14 */
.L__stack_usage = 14
	movw r16,r24
	movw r12,r20
	movw r14,r22
	.stabn	68,0,1141,.LM343-.LFBB14
.LM343:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L166
	.stabn	68,0,1141,.LM344-.LFBB14
.LM344:
	movw r30,r16
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L166
	.stabn	68,0,1147,.LM345-.LFBB14
.LM345:
	ld r24,Z
	.stabn	68,0,1147,.LM346-.LFBB14
.LM346:
	cpi r24,lo8(2)
	brne .+2
	rjmp .L159
	cpi r24,lo8(3)
	brne .+2
	rjmp .L160
	cpi r24,lo8(1)
	breq .+2
	rjmp .L166
	.stabn	68,0,1149,.LM347-.LFBB14
.LM347:
	movw r24,r20
	lsr r25
	ror r24
	.stabn	68,0,1149,.LM348-.LFBB14
.LM348:
	add r24,r20
	adc r25,r21
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,1150,.LM349-.LFBB14
.LM349:
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1150,.LM350-.LFBB14
.LM350:
	ldd r20,Z+31
	ldd r21,Z+32
	ldd r22,Z+33
	ldd r23,Z+34
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r16
	call move_window
	.stabn	68,0,1150,.LM351-.LFBB14
.LM351:
	or r24,r25
	breq .L161
.L162:
	.stabn	68,0,1145,.LM352-.LFBB14
.LM352:
	ldi r22,lo8(-1)
	ldi r23,lo8(-1)
	movw r24,r22
.L157:
/* epilogue start */
	.stabn	68,0,1199,.LM353-.LFBB14
.LM353:
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
	pop r11
	pop r10
	ret
.L161:
	.stabn	68,0,1151,.LM354-.LFBB14
.LM354:
	ldd r10,Y+1
	ldd r11,Y+2
	ldi r25,-1
	sub r10,r25
	sbc r11,r25
	.stabn	68,0,1151,.LM355-.LFBB14
.LM355:
	ldd r30,Y+1
	ldd r31,Y+2
	andi r31,1
	.stabn	68,0,1151,.LM356-.LFBB14
.LM356:
	add r30,r16
	adc r31,r17
	ldd r31,Z+47
	std Y+1,r31
	.stabn	68,0,1152,.LM357-.LFBB14
.LM357:
	movw r24,r10
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1152,.LM358-.LFBB14
.LM358:
	movw r30,r16
	ldd r20,Z+31
	ldd r21,Z+32
	ldd r22,Z+33
	ldd r23,Z+34
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r16
	call move_window
	.stabn	68,0,1152,.LM359-.LFBB14
.LM359:
	or r24,r25
	brne .L162
	.stabn	68,0,1153,.LM360-.LFBB14
.LM360:
	ldi r31,1
	and r11,r31
	.stabn	68,0,1153,.LM361-.LFBB14
.LM361:
	movw r30,r16
	add r30,r10
	adc r31,r11
	ldd r24,Z+47
	.stabn	68,0,1153,.LM362-.LFBB14
.LM362:
	ldd r25,Y+1
	mov r23,r24
	mov r22,r25
	.stabn	68,0,1154,.LM363-.LFBB14
.LM363:
	sbrs r12,0
	rjmp .L163
	.stabn	68,0,1154,.LM364-.LFBB14
.LM364:
	ldi r30,4
	1:
	lsr r23
	ror r22
	dec r30
	brne 1b
.L167:
	.stabn	68,0,1154,.LM365-.LFBB14
.LM365:
	ldi r25,0
	ldi r24,0
	rjmp .L157
.L163:
	andi r23,15
	rjmp .L167
.L159:
	.stabn	68,0,1158,.LM366-.LFBB14
.LM366:
	clr r23
	mov r22,r15
	mov r21,r14
	mov r20,r13
	.stabn	68,0,1158,.LM367-.LFBB14
.LM367:
	ldd r24,Z+31
	ldd r25,Z+32
	ldd r26,Z+33
	ldd r27,Z+34
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r16
	call move_window
	.stabn	68,0,1158,.LM368-.LFBB14
.LM368:
	or r24,r25
	breq .+2
	rjmp .L162
	.stabn	68,0,1159,.LM369-.LFBB14
.LM369:
	movw r30,r12
	lsl r30
	rol r31
	andi r30,254
	andi r31,1
.LBB176:
.LBB177:
	.stabn	68,0,619,.LM370-.LFBB14
.LM370:
	add r30,r16
	adc r31,r17
.LBE177:
.LBE176:
	.stabn	68,0,1159,.LM371-.LFBB14
.LM371:
	ldd r22,Z+47
	ldd r23,Z+48
	rjmp .L167
.L160:
	.stabn	68,0,1163,.LM372-.LFBB14
.LM372:
	ldd r24,Z+31
	ldd r25,Z+32
	ldd r26,Z+33
	ldd r27,Z+34
	ldi r19,7
	1:
	lsr r23
	ror r22
	ror r21
	ror r20
	dec r19
	brne 1b
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r16
	call move_window
	.stabn	68,0,1163,.LM373-.LFBB14
.LM373:
	or r24,r25
	breq .+2
	rjmp .L162
	.stabn	68,0,1164,.LM374-.LFBB14
.LM374:
	subi r16,-47
	sbci r17,-1
	.stabn	68,0,1164,.LM375-.LFBB14
.LM375:
	movw r24,r12
	lsl r24
	rol r25
	lsl r24
	rol r25
	andi r24,252
	andi r25,1
	add r24,r16
	adc r25,r17
	call ld_dword
	.stabn	68,0,1164,.LM376-.LFBB14
.LM376:
	andi r25,15
	.stabn	68,0,1165,.LM377-.LFBB14
.LM377:
	rjmp .L157
.L166:
	.stabn	68,0,1147,.LM378-.LFBB14
.LM378:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,0
	ldi r25,0
	.stabn	68,0,1198,.LM379-.LFBB14
.LM379:
	rjmp .L157
	.size	get_fat.isra.0, .-get_fat.isra.0
	.stabs	"val:r(0,1)",64,0,0,22
	.stabn	192,0,0,.LFBB14-.LFBB14
	.stabn	224,0,0,.Lscope14-.LFBB14
.Lscope14:
	.stabs	"remove_chain.isra.0:f(0,24)",36,0,0,remove_chain.isra.0
	.stabs	"ISRA.317:P(0,8)",64,0,0,28
	.stabs	"clst:P(0,1)",64,0,0,12
	.stabs	"pclst:P(0,1)",64,0,0,20
	.type	remove_chain.isra.0, @function
remove_chain.isra.0:
	.stabn	68,0,1399,.LM380-.LFBB15
.LM380:
.LFBB15:
	push r8
	push r9
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r28,r24
	movw r12,r20
	movw r14,r22
	movw r20,r16
	movw r22,r18
	.stabn	68,0,1415,.LM381-.LFBB15
.LM381:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L169
	.stabn	68,0,1415,.LM382-.LFBB15
.LM382:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L169
	.stabn	68,0,1418,.LM383-.LFBB15
.LM383:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L171
	.stabn	68,0,1419,.LM384-.LFBB15
.LM384:
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
	movw r18,r16
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1420,.LM385-.LFBB15
.LM385:
	or r24,r25
	brne .L168
.L171:
	movw r8,r12
	movw r10,r14
	.stabn	68,0,1425,.LM386-.LFBB15
.LM386:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1426,.LM387-.LFBB15
.LM387:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L174
.L176:
	.stabn	68,0,1484,.LM388-.LFBB15
.LM388:
	ldi r19,0
	ldi r18,0
.L168:
	.stabn	68,0,1485,.LM389-.LFBB15
.LM389:
	movw r24,r18
/* epilogue start */
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
	pop r9
	pop r8
	ret
.L174:
	.stabn	68,0,1427,.LM390-.LFBB15
.LM390:
	ldi r24,1
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L169
	.stabn	68,0,1428,.LM391-.LFBB15
.LM391:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	breq .L177
	.stabn	68,0,1430,.LM392-.LFBB15
.LM392:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r20,r8
	movw r22,r10
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1431,.LM393-.LFBB15
.LM393:
	or r24,r25
	brne .L168
	.stabn	68,0,1433,.LM394-.LFBB15
.LM394:
	ldd r24,Y+15
	ldd r25,Y+16
	ldd r26,Y+17
	ldd r27,Y+18
	.stabn	68,0,1433,.LM395-.LFBB15
.LM395:
	ldd r20,Y+19
	ldd r21,Y+20
	ldd r22,Y+21
	ldd r23,Y+22
	.stabn	68,0,1433,.LM396-.LFBB15
.LM396:
	movw r16,r20
	movw r18,r22
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,1433,.LM397-.LFBB15
.LM397:
	cp r24,r16
	cpc r25,r17
	cpc r26,r18
	cpc r27,r19
	brsh .L175
	.stabn	68,0,1434,.LM398-.LFBB15
.LM398:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+15,r24
	std Y+16,r25
	std Y+17,r26
	std Y+18,r27
	.stabn	68,0,1435,.LM399-.LFBB15
.LM399:
	ldd r24,Y+4
	ori r24,lo8(1)
	std Y+4,r24
.L175:
	.stabn	68,0,1456,.LM400-.LFBB15
.LM400:
	cp r12,r20
	cpc r13,r21
	cpc r14,r22
	cpc r15,r23
	brsh .+2
	rjmp .L171
	rjmp .L176
.L169:
	.stabn	68,0,1415,.LM401-.LFBB15
.LM401:
	ldi r18,lo8(2)
	ldi r19,0
	rjmp .L168
.L177:
	.stabn	68,0,1428,.LM402-.LFBB15
.LM402:
	ldi r18,lo8(1)
	ldi r19,0
	rjmp .L168
	.size	remove_chain.isra.0, .-remove_chain.isra.0
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"nxt:r(0,1)",64,0,0,12
	.stabn	192,0,0,.LFBB15-.LFBB15
	.stabn	224,0,0,.Lscope15-.LFBB15
.Lscope15:
	.stabs	"create_chain.isra.0:f(0,1)",36,0,0,create_chain.isra.0
	.stabs	"ISRA.321:P(0,8)",64,0,0,28
	.stabs	"clst:P(0,1)",64,0,0,8
	.type	create_chain.isra.0, @function
create_chain.isra.0:
	.stabn	68,0,1494,.LM403-.LFBB16
.LM403:
.LFBB16:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r28,r24
	movw r8,r20
	movw r10,r22
	.stabn	68,0,1504,.LM404-.LFBB16
.LM404:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L183
	.stabn	68,0,1505,.LM405-.LFBB16
.LM405:
	ldd r4,Y+11
	ldd r5,Y+12
	ldd r6,Y+13
	ldd r7,Y+14
	.stabn	68,0,1506,.LM406-.LFBB16
.LM406:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	breq .L202
	.stabn	68,0,1506,.LM407-.LFBB16
.LM407:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	cp r4,r24
	cpc r5,r25
	cpc r6,r26
	cpc r7,r27
	brlo .L184
.L202:
	.stabn	68,0,1506,.LM408-.LFBB16
.LM408:
	mov r4,__zero_reg__
	mov r5,__zero_reg__
	movw r6,r4
	inc r4
	rjmp .L184
.L183:
	.stabn	68,0,1509,.LM409-.LFBB16
.LM409:
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1510,.LM410-.LFBB16
.LM410:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .L185
.L191:
	.stabn	68,0,1510,.LM411-.LFBB16
.LM411:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	inc r12
.L182:
	.stabn	68,0,1585,.LM412-.LFBB16
.LM412:
	movw r24,r14
	movw r22,r12
/* epilogue start */
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L185:
	.stabn	68,0,1511,.LM413-.LFBB16
.LM413:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	brne .+2
	rjmp .L187
	.stabn	68,0,1512,.LM414-.LFBB16
.LM414:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	movw r4,r8
	movw r6,r10
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L182
.L184:
	.stabn	68,0,1515,.LM415-.LFBB16
.LM415:
	ldd r24,Y+15
	ldd r25,Y+16
	ldd r26,Y+17
	ldd r27,Y+18
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L188
.L195:
	.stabn	68,0,1515,.LM416-.LFBB16
.LM416:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	rjmp .L182
.L188:
	.stabn	68,0,1547,.LM417-.LFBB16
.LM417:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	.stabn	68,0,1545,.LM418-.LFBB16
.LM418:
	cp r8,r4
	cpc r9,r5
	cpc r10,r6
	cpc r11,r7
	breq .+2
	rjmp .L189
	.stabn	68,0,1546,.LM419-.LFBB16
.LM419:
	movw r14,r10
	movw r12,r8
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	sbc r14,r18
	sbc r15,r18
	.stabn	68,0,1547,.LM420-.LFBB16
.LM420:
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L190
	.stabn	68,0,1547,.LM421-.LFBB16
.LM421:
	ldi r18,lo8(2)
	mov r12,r18
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L190:
	.stabn	68,0,1548,.LM422-.LFBB16
.LM422:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,1549,.LM423-.LFBB16
.LM423:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L191
	.stabn	68,0,1549,.LM424-.LFBB16
.LM424:
	cpi r20,-1
	ldi r24,-1
	cpc r21,r24
	cpc r22,r24
	cpc r23,r24
	brne .+2
	rjmp .L187
	.stabn	68,0,1550,.LM425-.LFBB16
.LM425:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .+2
	rjmp .L192
	.stabn	68,0,1551,.LM426-.LFBB16
.LM426:
	ldd r24,Y+11
	ldd r25,Y+12
	ldd r26,Y+13
	ldd r27,Y+14
	.stabn	68,0,1552,.LM427-.LFBB16
.LM427:
	cpi r24,2
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brlo .L189
	.stabn	68,0,1552,.LM428-.LFBB16
.LM428:
	ldd r20,Y+19
	ldd r21,Y+20
	ldd r22,Y+21
	ldd r23,Y+22
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L189
	movw r4,r24
	movw r6,r26
.L189:
	movw r14,r6
	movw r12,r4
.L196:
	.stabn	68,0,1559,.LM429-.LFBB16
.LM429:
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	sbc r14,r18
	sbc r15,r18
	.stabn	68,0,1560,.LM430-.LFBB16
.LM430:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L194
	.stabn	68,0,1562,.LM431-.LFBB16
.LM431:
	ldi r24,1
	cp r4,r24
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brne .+2
	rjmp .L195
	.stabn	68,0,1561,.LM432-.LFBB16
.LM432:
	ldi r25,lo8(2)
	mov r12,r25
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L194:
	.stabn	68,0,1564,.LM433-.LFBB16
.LM433:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,1565,.LM434-.LFBB16
.LM434:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L193
	.stabn	68,0,1566,.LM435-.LFBB16
.LM435:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L191
	.stabn	68,0,1566,.LM436-.LFBB16
.LM436:
	cpi r20,-1
	sbci r21,-1
	sbci r22,-1
	sbci r23,-1
	brne .+2
	rjmp .L187
	.stabn	68,0,1567,.LM437-.LFBB16
.LM437:
	cp r4,r12
	cpc r5,r13
	cpc r6,r14
	cpc r7,r15
	brne .L196
	rjmp .L195
.L192:
	.stabn	68,0,1556,.LM438-.LFBB16
.LM438:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .+2
	rjmp .L189
.L193:
	.stabn	68,0,1570,.LM439-.LFBB16
.LM439:
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
	movw r18,r16
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1571,.LM440-.LFBB16
.LM440:
	or r24,r25
	brne .L197
	.stabn	68,0,1571,.LM441-.LFBB16
.LM441:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L198
.L201:
	.stabn	68,0,1577,.LM442-.LFBB16
.LM442:
	std Y+11,r12
	std Y+12,r13
	std Y+13,r14
	std Y+14,r15
	.stabn	68,0,1578,.LM443-.LFBB16
.LM443:
	ldd r24,Y+15
	ldd r25,Y+16
	ldd r26,Y+17
	ldd r27,Y+18
	.stabn	68,0,1578,.LM444-.LFBB16
.LM444:
	ldd r20,Y+19
	ldd r21,Y+20
	ldd r22,Y+21
	ldd r23,Y+22
	subi r20,2
	sbc r21,__zero_reg__
	sbc r22,__zero_reg__
	sbc r23,__zero_reg__
	.stabn	68,0,1578,.LM445-.LFBB16
.LM445:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L199
.L200:
	.stabn	68,0,1579,.LM446-.LFBB16
.LM446:
	ldd r24,Y+4
	ori r24,lo8(1)
	std Y+4,r24
	rjmp .L182
.L198:
	.stabn	68,0,1572,.LM447-.LFBB16
.LM447:
	movw r18,r14
	movw r16,r12
	movw r22,r10
	movw r20,r8
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1576,.LM448-.LFBB16
.LM448:
	or r24,r25
	breq .L201
.L197:
	.stabn	68,0,1581,.LM449-.LFBB16
.LM449:
	cpi r18,1
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L191
.L187:
	clr r12
	dec r12
	mov r13,r12
	movw r14,r12
	rjmp .L182
.L199:
	.stabn	68,0,1578,.LM450-.LFBB16
.LM450:
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	std Y+15,r24
	std Y+16,r25
	std Y+17,r26
	std Y+18,r27
	rjmp .L200
	.size	create_chain.isra.0, .-create_chain.isra.0
	.stabs	"scl:r(0,1)",64,0,0,4
	.stabs	"res:r(0,24)",64,0,0,18
	.stabn	192,0,0,.LFBB16-.LFBB16
	.stabn	224,0,0,.Lscope16-.LFBB16
.Lscope16:
	.stabs	"dir_sdi.constprop.0:f(0,24)",36,0,0,dir_sdi.constprop.0
	.stabs	"dp:P(0,38)=*(0,39)=(0,40)=s40obj:(0,27),0,112;dptr:(0,1),112,32;clust:(0,1),144,32;sect:(0,7),176,32;dir:(0,17),208,16;fn:(0,41)=ar(0,15);0;11;(0,5),224,96;;",64,0,0,16
	.type	dir_sdi.constprop.0, @function
dir_sdi.constprop.0:
	.stabn	68,0,1666,.LM451-.LFBB17
.LM451:
.LFBB17:
	push r8
	push r9
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r16,r24
	.stabn	68,0,1672,.LM452-.LFBB17
.LM452:
	movw r30,r24
	ld r28,Z
	ldd r29,Z+1
	.stabn	68,0,1678,.LM453-.LFBB17
.LM453:
	std Z+14,__zero_reg__
	std Z+15,__zero_reg__
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	.stabn	68,0,1679,.LM454-.LFBB17
.LM454:
	ldd r12,Z+6
	ldd r13,Z+7
	ldd r14,Z+8
	ldd r15,Z+9
	.stabn	68,0,1680,.LM455-.LFBB17
.LM455:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L236
	.stabn	68,0,1680,.LM456-.LFBB17
.LM456:
	ld r24,Y
	cpi r24,lo8(3)
	brlo .L229
	.stabn	68,0,1681,.LM457-.LFBB17
.LM457:
	ldd r24,Y+35
	ldd r25,Y+36
	ldd r26,Y+37
	ldd r27,Y+38
	.stabn	68,0,1685,.LM458-.LFBB17
.LM458:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L228
.L229:
	.stabn	68,0,1686,.LM459-.LFBB17
.LM459:
	ldd r24,Y+7
	ldd r25,Y+8
	or r24,r25
	brne .L230
.L234:
	.stabn	68,0,1686,.LM460-.LFBB17
.LM460:
	ldi r24,lo8(2)
	ldi r25,0
.L227:
/* epilogue start */
	.stabn	68,0,1705,.LM461-.LFBB17
.LM461:
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
	pop r9
	pop r8
	ret
.L230:
	.stabn	68,0,1687,.LM462-.LFBB17
.LM462:
	ldd r20,Y+35
	ldd r21,Y+36
	ldd r22,Y+37
	ldd r23,Y+38
.L232:
	.stabn	68,0,1687,.LM463-.LFBB17
.LM463:
	movw r30,r16
	std Z+22,r20
	std Z+23,r21
	std Z+24,r22
	std Z+25,r23
	.stabn	68,0,1699,.LM464-.LFBB17
.LM464:
	std Z+18,r12
	std Z+19,r13
	std Z+20,r14
	std Z+21,r15
	.stabn	68,0,1700,.LM465-.LFBB17
.LM465:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .L234
	.stabn	68,0,1702,.LM466-.LFBB17
.LM466:
	adiw r28,47
	.stabn	68,0,1702,.LM467-.LFBB17
.LM467:
	std Z+27,r29
	std Z+26,r28
	.stabn	68,0,1704,.LM468-.LFBB17
.LM468:
	ldi r25,0
	ldi r24,0
	rjmp .L227
.L236:
	movw r26,r14
	movw r24,r12
.L228:
	.stabn	68,0,1690,.LM469-.LFBB17
.LM469:
	ldd r8,Y+9
	ldd r9,Y+10
	mov r11,__zero_reg__
	mov r10,__zero_reg__
	ldi r18,9
	1:
	lsl r8
	rol r9
	rol r10
	rol r11
	dec r18
	brne 1b
	.stabn	68,0,1691,.LM470-.LFBB17
.LM470:
	movw r12,r24
	movw r14,r26
.L233:
	.stabn	68,0,1692,.LM471-.LFBB17
.LM471:
	movw r22,r14
	movw r20,r12
	.stabn	68,0,1691,.LM472-.LFBB17
.LM472:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .L235
	.stabn	68,0,1697,.LM473-.LFBB17
.LM473:
	movw r24,r28
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	rjmp .L232
.L235:
	.stabn	68,0,1692,.LM474-.LFBB17
.LM474:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1693,.LM475-.LFBB17
.LM475:
	ldi r31,-1
	cp r12,r31
	cpc r13,r31
	cpc r14,r31
	cpc r15,r31
	breq .L237
	.stabn	68,0,1694,.LM476-.LFBB17
.LM476:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L234
	.stabn	68,0,1694,.LM477-.LFBB17
.LM477:
	ldd r24,Y+19
	ldd r25,Y+20
	ldd r26,Y+21
	ldd r27,Y+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L233
	rjmp .L234
.L237:
	.stabn	68,0,1693,.LM478-.LFBB17
.LM478:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L227
	.size	dir_sdi.constprop.0, .-dir_sdi.constprop.0
	.stabs	"csz:r(0,1)",64,0,0,8
	.stabs	"fs:r(0,8)",64,0,0,28
	.stabn	192,0,0,.LFBB17-.LFBB17
	.stabn	224,0,0,.Lscope17-.LFBB17
.Lscope17:
	.stabs	"dir_next:f(0,24)",36,0,0,dir_next
	.stabs	"dp:P(0,38)",64,0,0,28
	.stabs	"stretch:P(0,18)",64,0,0,10
	.type	dir_next, @function
dir_next:
	.stabn	68,0,1718,.LM479-.LFBB18
.LM479:
.LFBB18:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 14 */
.L__stack_usage = 14
	movw r28,r24
	movw r10,r22
	.stabn	68,0,1720,.LM480-.LFBB18
.LM480:
	ld r16,Y
	ldd r17,Y+1
	.stabn	68,0,1723,.LM481-.LFBB18
.LM481:
	ldd r4,Y+14
	ldd r5,Y+15
	ldd r6,Y+16
	ldd r7,Y+17
	ldi r24,32
	add r4,r24
	adc r5,__zero_reg__
	adc r6,__zero_reg__
	adc r7,__zero_reg__
	.stabn	68,0,1724,.LM482-.LFBB18
.LM482:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	ldi r25,32
	cpc r6,r25
	cpc r7,__zero_reg__
	brlo .L242
	.stabn	68,0,1724,.LM483-.LFBB18
.LM483:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
.L242:
	.stabn	68,0,1725,.LM484-.LFBB18
.LM484:
	ldd r24,Y+22
	ldd r25,Y+23
	ldd r26,Y+24
	ldd r27,Y+25
	.stabn	68,0,1725,.LM485-.LFBB18
.LM485:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L254
	.stabn	68,0,1727,.LM486-.LFBB18
.LM486:
	movw r22,r6
	movw r20,r4
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,1727,.LM487-.LFBB18
.LM487:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L245
	.stabn	68,0,1728,.LM488-.LFBB18
.LM488:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+22,r24
	std Y+23,r25
	std Y+24,r26
	std Y+25,r27
	.stabn	68,0,1730,.LM489-.LFBB18
.LM489:
	ldd r20,Y+18
	ldd r21,Y+19
	ldd r22,Y+20
	ldd r23,Y+21
	.stabn	68,0,1730,.LM490-.LFBB18
.LM490:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L246
	.stabn	68,0,1731,.LM491-.LFBB18
.LM491:
	movw r26,r16
	adiw r26,7
	ld r24,X+
	ld r25,X
	ldi r27,0
	ldi r26,0
	.stabn	68,0,1731,.LM492-.LFBB18
.LM492:
	movw r22,r6
	movw r20,r4
	ldi r19,5
	1:
	lsr r23
	ror r22
	ror r21
	ror r20
	dec r19
	brne 1b
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .+2
	rjmp .L245
.L251:
	.stabn	68,0,1732,.LM493-.LFBB18
.LM493:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
.L254:
	.stabn	68,0,1725,.LM494-.LFBB18
.LM494:
	ldi r24,lo8(4)
	ldi r25,0
	rjmp .L241
.L246:
	.stabn	68,0,1736,.LM495-.LFBB18
.LM495:
	movw r30,r16
	ldd r24,Z+9
	ldd r25,Z+10
	sbiw r24,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,1736,.LM496-.LFBB18
.LM496:
	movw r14,r6
	movw r12,r4
	ldi r18,9
	1:
	lsr r15
	ror r14
	ror r13
	ror r12
	dec r18
	brne 1b
	.stabn	68,0,1736,.LM497-.LFBB18
.LM497:
	and r24,r12
	and r25,r13
	and r26,r14
	and r27,r15
	.stabn	68,0,1736,.LM498-.LFBB18
.LM498:
	or r24,r25
	or r24,r26
	or r24,r27
	breq .+2
	rjmp .L245
	.stabn	68,0,1737,.LM499-.LFBB18
.LM499:
	movw r24,r16
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1738,.LM500-.LFBB18
.LM500:
	ldi r31,2
	cp r12,r31
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .L248
.L252:
	.stabn	68,0,1738,.LM501-.LFBB18
.LM501:
	ldi r24,lo8(2)
	ldi r25,0
.L241:
/* epilogue start */
	.stabn	68,0,1765,.LM502-.LFBB18
.LM502:
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
.L248:
	.stabn	68,0,1739,.LM503-.LFBB18
.LM503:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	brne .L249
.L253:
	.stabn	68,0,1739,.LM504-.LFBB18
.LM504:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L241
.L249:
	.stabn	68,0,1740,.LM505-.LFBB18
.LM505:
	movw r30,r16
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L250
	.stabn	68,0,1742,.LM506-.LFBB18
.LM506:
	or r10,r11
	brne .+2
	rjmp .L251
	.stabn	68,0,1745,.LM507-.LFBB18
.LM507:
	ldd r20,Y+18
	ldd r21,Y+19
	ldd r22,Y+20
	ldd r23,Y+21
	ld r24,Y
	ldd r25,Y+1
	call create_chain.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1746,.LM508-.LFBB18
.LM508:
	ldi r24,lo8(7)
	ldi r25,0
	.stabn	68,0,1746,.LM509-.LFBB18
.LM509:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L241
	.stabn	68,0,1747,.LM510-.LFBB18
.LM510:
	ldi r31,1
	cp r12,r31
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L252
	.stabn	68,0,1748,.LM511-.LFBB18
.LM511:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	breq .L253
	.stabn	68,0,1749,.LM512-.LFBB18
.LM512:
	movw r22,r14
	movw r20,r12
	movw r24,r16
	call dir_clear
	.stabn	68,0,1749,.LM513-.LFBB18
.LM513:
	or r24,r25
	brne .L253
.L250:
	.stabn	68,0,1756,.LM514-.LFBB18
.LM514:
	std Y+18,r12
	std Y+19,r13
	std Y+20,r14
	std Y+21,r15
	.stabn	68,0,1757,.LM515-.LFBB18
.LM515:
	movw r22,r14
	movw r20,r12
	movw r24,r16
	call clst2sect
	std Y+22,r22
	std Y+23,r23
	std Y+24,r24
	std Y+25,r25
.L245:
	.stabn	68,0,1761,.LM516-.LFBB18
.LM516:
	std Y+14,r4
	std Y+15,r5
	std Y+16,r6
	std Y+17,r7
	.stabn	68,0,1762,.LM517-.LFBB18
.LM517:
	subi r16,-47
	sbci r17,-1
	.stabn	68,0,1762,.LM518-.LFBB18
.LM518:
	ldi r25,1
	and r5,r25
	add r16,r4
	adc r17,r5
	.stabn	68,0,1762,.LM519-.LFBB18
.LM519:
	std Y+27,r17
	std Y+26,r16
	.stabn	68,0,1764,.LM520-.LFBB18
.LM520:
	ldi r25,0
	ldi r24,0
	rjmp .L241
	.size	dir_next, .-dir_next
	.stabs	"ofs:r(0,1)",64,0,0,4
	.stabs	"clst:r(0,1)",64,0,0,12
	.stabs	"fs:r(0,8)",64,0,0,16
	.stabn	192,0,0,.LFBB18-.LFBB18
	.stabn	224,0,0,.Lscope18-.LFBB18
.Lscope18:
	.section	.rodata.str1.1
.LC2:
	.string	"*+,:;<=>[]|\"?\177"
	.text
	.stabs	"follow_path:f(0,24)",36,0,0,follow_path
	.stabs	"dp:p(0,38)",160,0,0,3
	.type	follow_path, @function
follow_path:
	.stabn	68,0,3007,.LM521-.LFBB19
.LM521:
.LFBB19:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 8 */
/* stack size = 26 */
.L__stack_usage = 26
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,3010,.LM522-.LFBB19
.LM522:
	ldd r26,Y+3
	ldd r27,Y+4
	ld r4,X+
	ld r5,X
	movw r30,r22
.L308:
	movw r12,r30
	.stabn	68,0,3019,.LM523-.LFBB19
.LM523:
	ld r24,Z+
	cpi r24,lo8(47)
	breq .L308
	.stabn	68,0,3019,.LM524-.LFBB19
.LM524:
	cpi r24,lo8(92)
	breq .L308
	.stabn	68,0,3020,.LM525-.LFBB19
.LM525:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+6,__zero_reg__
	std Z+7,__zero_reg__
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
	.stabn	68,0,3039,.LM526-.LFBB19
.LM526:
	movw r26,r12
	ld r24,X
	cpi r24,lo8(32)
	brsh .+2
	rjmp .L317
.LBB182:
.LBB183:
	.stabn	68,0,2938,.LM527-.LFBB19
.LM527:
	movw r10,r30
	ldi r27,28
	add r10,r27
	adc r11,__zero_reg__
	.stabn	68,0,2989,.LM528-.LFBB19
.LM528:
	ldi r18,lo8(5)
	mov r2,r18
.LBE183:
.LBE182:
	.stabn	68,0,3075,.LM529-.LFBB19
.LM529:
	movw r30,r4
	adiw r30,47
	std Y+2,r31
	std Y+1,r30
.L267:
.LBB188:
.LBB184:
	.stabn	68,0,2939,.LM530-.LFBB19
.LM530:
	ldi r20,lo8(11)
	ldi r21,0
	ldi r22,lo8(32)
	ldi r23,0
	movw r24,r10
	call memset
	movw r6,r12
	.stabn	68,0,2940,.LM531-.LFBB19
.LM531:
	ldi r16,0
	ldi r17,0
	.stabn	68,0,2940,.LM532-.LFBB19
.LM532:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
	.stabn	68,0,2940,.LM533-.LFBB19
.LM533:
	ldi r25,lo8(8)
	mov r14,r25
.L319:
	mov r15,__zero_reg__
.L268:
	.stabn	68,0,2955,.LM534-.LFBB19
.LM534:
	ldi r27,-1
	sub r8,r27
	sbc r9,r27
	.stabn	68,0,2955,.LM535-.LFBB19
.LM535:
	movw r30,r6
	ld r3,Z+
	movw r6,r30
	.stabn	68,0,2956,.LM536-.LFBB19
.LM536:
	ldi r31,lo8(32)
	cp r31,r3
	brsh .L269
	.stabn	68,0,2957,.LM537-.LFBB19
.LM537:
	ldi r24,lo8(47)
	cp r3,r24
	breq .L272
	.stabn	68,0,2957,.LM538-.LFBB19
.LM538:
	ldi r25,lo8(92)
	cpse r3,r25
	rjmp .L318
.L272:
	.stabn	68,0,2958,.LM539-.LFBB19
.LM539:
	movw r30,r12
	add r30,r8
	adc r31,r9
	ld r24,Z
	cpi r24,lo8(47)
	brne .+2
	rjmp .L273
	cpi r24,lo8(92)
	brne .+2
	rjmp .L273
.L269:
	.stabn	68,0,2986,.LM540-.LFBB19
.LM540:
	add r12,r8
	adc r13,r9
	.stabn	68,0,2987,.LM541-.LFBB19
.LM541:
	or r16,r17
	brne .+2
	rjmp .L293
	.stabn	68,0,2989,.LM542-.LFBB19
.LM542:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,28
	ld r24,X
	sbiw r26,28
	cpi r24,lo8(-27)
	brne .L279
	.stabn	68,0,2989,.LM543-.LFBB19
.LM543:
	adiw r26,28
	st X,r2
.L279:
	.stabn	68,0,2990,.LM544-.LFBB19
.LM544:
	ldi r27,lo8(32)
	ldi r24,lo8(4)
	cp r27,r3
	brsh .L280
	.stabn	68,0,2990,.LM545-.LFBB19
.LM545:
	ldi r24,lo8(1)
	movw r30,r12
	ld r25,Z
	cpi r25,lo8(33)
	brlo .L281
	ldi r24,0
.L281:
	lsl r24
	lsl r24
.L280:
	.stabn	68,0,2990,.LM546-.LFBB19
.LM546:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,39
	st X,r24
	sbiw r26,39
.LBE184:
.LBE188:
.LBB189:
.LBB190:
	.stabn	68,0,2358,.LM547-.LFBB19
.LM547:
	ld r14,X+
	ld r15,X
	sbiw r26,1
	.stabn	68,0,2364,.LM548-.LFBB19
.LM548:
	movw r24,r26
	call dir_sdi.constprop.0
.L320:
	movw r16,r24
	.stabn	68,0,2365,.LM549-.LFBB19
.LM549:
	or r24,r25
	breq .+2
	rjmp .L282
	.stabn	68,0,2391,.LM550-.LFBB19
.LM550:
	ldd r30,Y+3
	ldd r31,Y+4
	ldd r20,Z+22
	ldd r21,Z+23
	ldd r22,Z+24
	ldd r23,Z+25
	movw r24,r14
	call move_window
	movw r16,r24
	.stabn	68,0,2392,.LM551-.LFBB19
.LM551:
	or r24,r25
	breq .+2
	rjmp .L282
	.stabn	68,0,2393,.LM552-.LFBB19
.LM552:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,26
	ld r30,X+
	ld r31,X
	sbiw r26,26+1
	.stabn	68,0,2394,.LM553-.LFBB19
.LM553:
	ld r24,Z
	tst r24
	brne .+2
	rjmp .L290
	.stabn	68,0,2417,.LM554-.LFBB19
.LM554:
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2417,.LM555-.LFBB19
.LM555:
	adiw r26,4
	st X,r24
	.stabn	68,0,2418,.LM556-.LFBB19
.LM556:
	ldd r24,Z+11
	sbrc r24,3
	rjmp .L283
	.stabn	68,0,2418,.LM557-.LFBB19
.LM557:
	ldi r20,lo8(11)
	ldi r21,0
	movw r22,r10
	movw r24,r30
	call memcmp
	.stabn	68,0,2418,.LM558-.LFBB19
.LM558:
	or r24,r25
	brne .+2
	rjmp .L282
.L283:
	.stabn	68,0,2420,.LM559-.LFBB19
.LM559:
	ldi r22,0
	ldi r23,0
	ldd r24,Y+3
	ldd r25,Y+4
	call dir_next
	rjmp .L320
.L317:
.LBE190:
.LBE189:
	.stabn	68,0,3040,.LM560-.LFBB19
.LM560:
	ldi r24,lo8(-128)
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,39
	st X,r24
	sbiw r26,39
	.stabn	68,0,3041,.LM561-.LFBB19
.LM561:
	movw r24,r26
/* epilogue start */
	.stabn	68,0,3081,.LM562-.LFBB19
.LM562:
	adiw r28,8
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	.stabn	68,0,3041,.LM563-.LFBB19
.LM563:
	jmp dir_sdi.constprop.0
.L273:
.LBB192:
.LBB185:
	.stabn	68,0,2958,.LM564-.LFBB19
.LM564:
	ldi r26,-1
	sub r8,r26
	sbc r9,r26
	rjmp .L272
.L318:
	.stabn	68,0,2961,.LM565-.LFBB19
.LM565:
	ldi r27,lo8(46)
	cp r3,r27
	brne .+2
	rjmp .L274
	.stabn	68,0,2961,.LM566-.LFBB19
.LM566:
	cp r16,r14
	cpc r17,r15
	brlo .+2
	rjmp .L293
	.stabn	68,0,2971,.LM567-.LFBB19
.LM567:
	sbrs r3,7
	rjmp .L276
	.stabn	68,0,2972,.LM568-.LFBB19
.LM568:
	mov r30,r3
	andi r30,lo8(127)
	ldi r31,0
	.stabn	68,0,2972,.LM569-.LFBB19
.LM569:
	subi r30,lo8(-(ExCvt))
	sbci r31,hi8(-(ExCvt))
	ld r3,Z
.L276:
	.stabn	68,0,2981,.LM570-.LFBB19
.LM570:
	mov r22,r3
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call strchr
	.stabn	68,0,2981,.LM571-.LFBB19
.LM571:
	or r24,r25
	breq .+2
	rjmp .L293
	.stabn	68,0,2982,.LM572-.LFBB19
.LM572:
	ldi r24,lo8(-97)
	add r24,r3
	.stabn	68,0,2982,.LM573-.LFBB19
.LM573:
	cpi r24,lo8(26)
	brsh .L277
	.stabn	68,0,2982,.LM574-.LFBB19
.LM574:
	ldi r30,lo8(-32)
	add r3,r30
.L277:
	.stabn	68,0,2983,.LM575-.LFBB19
.LM575:
	movw r30,r10
	add r30,r16
	adc r31,r17
	st Z,r3
	.stabn	68,0,2983,.LM576-.LFBB19
.LM576:
	subi r16,-1
	sbci r17,-1
	rjmp .L268
.L290:
.LBE185:
.LBE192:
.LBB193:
.LBB191:
	.stabn	68,0,2394,.LM577-.LFBB19
.LM577:
	ldi r16,lo8(4)
	ldi r17,0
.L282:
.LBE191:
.LBE193:
	.stabn	68,0,3048,.LM578-.LFBB19
.LM578:
	ldd r30,Y+3
	ldd r31,Y+4
	ldd r24,Z+39
	.stabn	68,0,3049,.LM579-.LFBB19
.LM579:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L285
	.stabn	68,0,3050,.LM580-.LFBB19
.LM580:
	cpi r16,4
	cpc r17,__zero_reg__
	brne .L265
	.stabn	68,0,3056,.LM581-.LFBB19
.LM581:
	sbrs r24,2
	rjmp .L292
.L265:
	.stabn	68,0,3081,.LM582-.LFBB19
.LM582:
	movw r24,r16
/* epilogue start */
	adiw r28,8
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L285:
	.stabn	68,0,3061,.LM583-.LFBB19
.LM583:
	sbrc r24,2
	rjmp .L265
	.stabn	68,0,3063,.LM584-.LFBB19
.LM584:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,4
	ld r24,X
	sbiw r26,4
	sbrs r24,4
	rjmp .L292
	.stabn	68,0,3075,.LM585-.LFBB19
.LM585:
	adiw r26,14
	ld r22,X+
	ld r23,X
	andi r23,1
	ldd r30,Y+1
	ldd r31,Y+2
	add r22,r30
	adc r23,r31
	movw r26,r4
	ld r24,X
	call ld_clust.isra.0
	std Y+5,r22
	std Y+6,r23
	std Y+7,r24
	std Y+8,r25
	.stabn	68,0,3075,.LM586-.LFBB19
.LM586:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+6,r22
	std Z+7,r23
	std Z+8,r24
	std Z+9,r25
	.stabn	68,0,3045,.LM587-.LFBB19
.LM587:
	rjmp .L267
.L292:
	.stabn	68,0,3056,.LM588-.LFBB19
.LM588:
	ldi r16,lo8(5)
	ldi r17,0
	rjmp .L265
.L293:
.LBB194:
.LBB186:
	.stabn	68,0,2962,.LM589-.LFBB19
.LM589:
	ldi r16,lo8(6)
	ldi r17,0
.LBE186:
.LBE194:
	.stabn	68,0,3080,.LM590-.LFBB19
.LM590:
	rjmp .L265
.L274:
.LBB195:
.LBB187:
	.stabn	68,0,2962,.LM591-.LFBB19
.LM591:
	ldi r31,11
	cp r14,r31
	cpc r15,__zero_reg__
	breq .L293
	.stabn	68,0,2963,.LM592-.LFBB19
.LM592:
	ldi r16,lo8(8)
	ldi r17,0
	.stabn	68,0,2963,.LM593-.LFBB19
.LM593:
	ldi r24,lo8(11)
	mov r14,r24
	rjmp .L319
.LBE187:
.LBE195:
	.size	follow_path, .-follow_path
	.stabs	"res:r(0,24)",64,0,0,16
	.stabs	"ns:r(0,5)",64,0,0,24
	.stabs	"fs:r(0,8)",64,0,0,4
	.stabn	192,0,0,.LFBB19-.LFBB19
	.stabs	"c:r(0,5)",64,0,0,3
	.stabs	"sfn:r(0,17)",64,0,0,10
	.stabs	"ni:r(0,19)",64,0,0,14
	.stabs	"si:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LBB183-.LFBB19
	.stabn	224,0,0,.LBE183-.LFBB19
	.stabs	"c:r(0,5)",64,0,0,3
	.stabs	"sfn:r(0,17)",64,0,0,10
	.stabs	"ni:r(0,19)",64,0,0,14
	.stabs	"si:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LBB184-.LFBB19
	.stabn	224,0,0,.LBE184-.LFBB19
	.stabs	"c:r(0,5)",64,0,0,3
	.stabs	"sfn:r(0,17)",64,0,0,10
	.stabs	"ni:r(0,19)",64,0,0,14
	.stabs	"si:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LBB185-.LFBB19
	.stabn	224,0,0,.LBE185-.LFBB19
	.stabs	"c:r(0,5)",64,0,0,3
	.stabs	"sfn:r(0,17)",64,0,0,10
	.stabs	"ni:r(0,19)",64,0,0,14
	.stabs	"si:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LBB186-.LFBB19
	.stabn	224,0,0,.LBE186-.LFBB19
	.stabs	"c:r(0,5)",64,0,0,3
	.stabs	"sfn:r(0,17)",64,0,0,10
	.stabs	"ni:r(0,19)",64,0,0,14
	.stabs	"si:r(0,19)",64,0,0,8
	.stabn	192,0,0,.LBB187-.LFBB19
	.stabn	224,0,0,.LBE187-.LFBB19
	.stabs	"res:r(0,24)",64,0,0,16
	.stabs	"fs:r(0,8)",64,0,0,14
	.stabn	192,0,0,.LBB190-.LFBB19
	.stabn	224,0,0,.LBE190-.LFBB19
	.stabs	"res:r(0,24)",64,0,0,16
	.stabs	"fs:r(0,8)",64,0,0,14
	.stabn	192,0,0,.LBB191-.LFBB19
	.stabn	224,0,0,.LBE191-.LFBB19
	.stabn	224,0,0,.Lscope19-.LFBB19
.Lscope19:
	.stabs	"dir_read.constprop.0:f(0,24)",36,0,0,dir_read.constprop.0
	.stabs	"dp:P(0,38)",64,0,0,28
	.type	dir_read.constprop.0, @function
dir_read.constprop.0:
	.stabn	68,0,2275,.LM594-.LFBB20
.LM594:
.LFBB20:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	.stabn	68,0,2281,.LM595-.LFBB20
.LM595:
	ld r16,Y
	ldd r17,Y+1
	.stabn	68,0,2280,.LM596-.LFBB20
.LM596:
	ldi r18,lo8(4)
	ldi r19,0
.L322:
	.stabn	68,0,2287,.LM597-.LFBB20
.LM597:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	.stabn	68,0,2287,.LM598-.LFBB20
.LM598:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L326
	.stabn	68,0,2341,.LM599-.LFBB20
.LM599:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L327
	rjmp .L323
.L326:
	.stabn	68,0,2288,.LM600-.LFBB20
.LM600:
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,2289,.LM601-.LFBB20
.LM601:
	or r24,r25
	brne .L323
	.stabn	68,0,2290,.LM602-.LFBB20
.LM602:
	ldd r30,Y+26
	ldd r31,Y+27
	.stabn	68,0,2290,.LM603-.LFBB20
.LM603:
	ld r25,Z
	.stabn	68,0,2291,.LM604-.LFBB20
.LM604:
	tst r25
	breq .L328
	.stabn	68,0,2311,.LM605-.LFBB20
.LM605:
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2311,.LM606-.LFBB20
.LM606:
	std Y+4,r24
	.stabn	68,0,2332,.LM607-.LFBB20
.LM607:
	cpi r25,lo8(-27)
	breq .L324
	.stabn	68,0,2332,.LM608-.LFBB20
.LM608:
	cpi r25,lo8(46)
	breq .L324
	.stabn	68,0,2332,.LM609-.LFBB20
.LM609:
	cpi r24,lo8(15)
	breq .L324
	.stabn	68,0,2332,.LM610-.LFBB20
.LM610:
	andi r24,lo8(31)
	.stabn	68,0,2332,.LM611-.LFBB20
.LM611:
	cpi r24,lo8(8)
	breq .L324
.L327:
	.stabn	68,0,2288,.LM612-.LFBB20
.LM612:
	ldi r19,0
	ldi r18,0
.L321:
	.stabn	68,0,2343,.LM613-.LFBB20
.LM613:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L324:
	.stabn	68,0,2337,.LM614-.LFBB20
.LM614:
	ldi r23,0
	ldi r22,0
	movw r24,r28
	call dir_next
	movw r18,r24
	.stabn	68,0,2338,.LM615-.LFBB20
.LM615:
	or r24,r25
	breq .L322
.L323:
	.stabn	68,0,2341,.LM616-.LFBB20
.LM616:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
	.stabn	68,0,2342,.LM617-.LFBB20
.LM617:
	rjmp .L321
.L328:
	.stabn	68,0,2292,.LM618-.LFBB20
.LM618:
	ldi r18,lo8(4)
	ldi r19,0
	rjmp .L323
	.size	dir_read.constprop.0, .-dir_read.constprop.0
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:r(0,8)",64,0,0,16
	.stabs	"attr:r(0,5)",64,0,0,24
	.stabs	"b:r(0,5)",64,0,0,25
	.stabn	192,0,0,.LFBB20-.LFBB20
	.stabn	224,0,0,.Lscope20-.LFBB20
.Lscope20:
	.stabs	"dir_register:f(0,24)",36,0,0,dir_register
	.stabs	"dp:P(0,38)",64,0,0,28
	.type	dir_register, @function
dir_register:
	.stabn	68,0,2437,.LM619-.LFBB21
.LM619:
.LFBB21:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	.stabn	68,0,2439,.LM620-.LFBB21
.LM620:
	ld r16,Y
	ldd r17,Y+1
.LBB198:
.LBB199:
	.stabn	68,0,1785,.LM621-.LFBB21
.LM621:
	call dir_sdi.constprop.0
.L356:
	movw r18,r24
	.stabn	68,0,1786,.LM622-.LFBB21
.LM622:
	or r24,r25
	brne .L345
	.stabn	68,0,1789,.LM623-.LFBB21
.LM623:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,1790,.LM624-.LFBB21
.LM624:
	or r24,r25
	brne .L345
	.stabn	68,0,1794,.LM625-.LFBB21
.LM625:
	ldd r30,Y+26
	ldd r31,Y+27
	ld r24,Z
	.stabn	68,0,1794,.LM626-.LFBB21
.LM626:
	cpi r24,lo8(-27)
	brne .L346
.L349:
.LBE199:
.LBE198:
	.stabn	68,0,2517,.LM627-.LFBB21
.LM627:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,2518,.LM628-.LFBB21
.LM628:
	or r24,r25
	brne .L344
	.stabn	68,0,2519,.LM629-.LFBB21
.LM629:
	ldd r30,Y+26
	ldd r31,Y+27
	ldi r24,lo8(32)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,2520,.LM630-.LFBB21
.LM630:
	ldd r26,Y+26
	ldd r27,Y+27
	movw r30,r28
	adiw r30,28
	ldi r24,lo8(11)
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,2524,.LM631-.LFBB21
.LM631:
	ldi r24,lo8(1)
	movw r30,r16
	std Z+3,r24
.L344:
	.stabn	68,0,2529,.LM632-.LFBB21
.LM632:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L346:
.LBB201:
.LBB200:
	.stabn	68,0,1794,.LM633-.LFBB21
.LM633:
	tst r24
	breq .L349
	.stabn	68,0,1800,.LM634-.LFBB21
.LM634:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	call dir_next
	rjmp .L356
.L345:
	.stabn	68,0,1804,.LM635-.LFBB21
.LM635:
	cpi r18,4
	cpc r19,__zero_reg__
	brne .L344
	.stabn	68,0,1804,.LM636-.LFBB21
.LM636:
	ldi r18,lo8(7)
	ldi r19,0
	rjmp .L344
.LBE200:
.LBE201:
	.size	dir_register, .-dir_register
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:r(0,8)",64,0,0,16
	.stabn	192,0,0,.LFBB21-.LFBB21
	.stabs	"res:r(0,24)",64,0,0,18
	.stabn	192,0,0,.LBB199-.LFBB21
	.stabn	224,0,0,.LBE199-.LFBB21
	.stabs	"res:r(0,24)",64,0,0,18
	.stabn	192,0,0,.LBB200-.LFBB21
	.stabn	224,0,0,.LBE200-.LFBB21
	.stabn	224,0,0,.Lscope21-.LFBB21
.Lscope21:
	.stabs	"sync_fs:f(0,24)",36,0,0,sync_fs
	.stabs	"fs:P(0,8)",64,0,0,28
	.type	sync_fs, @function
sync_fs:
	.stabn	68,0,1081,.LM637-.LFBB22
.LM637:
.LFBB22:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	.stabn	68,0,1085,.LM638-.LFBB22
.LM638:
	call sync_window
	.stabn	68,0,1086,.LM639-.LFBB22
.LM639:
	sbiw r24,0
	breq .+2
	rjmp .L357
.LBB214:
.LBB215:
	.stabn	68,0,1087,.LM640-.LFBB22
.LM640:
	ld r24,Y
	cpi r24,lo8(3)
	breq .+2
	rjmp .L359
	.stabn	68,0,1087,.LM641-.LFBB22
.LM641:
	ldd r24,Y+4
	cpi r24,lo8(1)
	breq .+2
	rjmp .L359
	.stabn	68,0,1089,.LM642-.LFBB22
.LM642:
	ldi r24,0
	ldi r25,lo8(2)
	movw r22,r28
	subi r22,-47
	sbci r23,-1
	movw r30,r22
	movw r18,r24
	0:
	st Z+,__zero_reg__
	subi r18,1
	sbci r19,0
	brne 0b
.LBB216:
.LBB217:
	.stabn	68,0,654,.LM643-.LFBB22
.LM643:
	ldi r24,lo8(85)
	movw r30,r28
	subi r30,-45
	sbci r31,-3
	st Z,r24
	.stabn	68,0,655,.LM644-.LFBB22
.LM644:
	ldi r24,lo8(-86)
	adiw r30,1
	st Z,r24
.LBE217:
.LBE216:
.LBB218:
.LBB219:
	.stabn	68,0,660,.LM645-.LFBB22
.LM645:
	ldi r24,lo8(82)
	std Y+47,r24
	.stabn	68,0,661,.LM646-.LFBB22
.LM646:
	std Y+48,r24
	.stabn	68,0,662,.LM647-.LFBB22
.LM647:
	ldi r24,lo8(97)
	std Y+49,r24
	.stabn	68,0,663,.LM648-.LFBB22
.LM648:
	ldi r25,lo8(65)
	std Y+50,r25
.LBE219:
.LBE218:
.LBB220:
.LBB221:
	.stabn	68,0,660,.LM649-.LFBB22
.LM649:
	ldi r18,lo8(114)
	sbiw r30,27
	st Z,r18
	.stabn	68,0,661,.LM650-.LFBB22
.LM650:
	adiw r30,1
	st Z,r18
	.stabn	68,0,662,.LM651-.LFBB22
.LM651:
	adiw r30,1
	st Z,r25
	.stabn	68,0,663,.LM652-.LFBB22
.LM652:
	adiw r30,1
	st Z,r24
.LBE221:
.LBE220:
.LBB222:
.LBB223:
	.stabn	68,0,660,.LM653-.LFBB22
.LM653:
	ldd r24,Y+15
	ldd r25,Y+16
	ldd r26,Y+17
	ldd r27,Y+18
	adiw r30,1
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.LBE223:
.LBE222:
.LBB224:
.LBB225:
	ldd r24,Y+11
	ldd r25,Y+12
	ldd r26,Y+13
	ldd r27,Y+14
	adiw r30,4
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.LBE225:
.LBE224:
	.stabn	68,0,1095,.LM654-.LFBB22
.LM654:
	ldd r18,Y+27
	ldd r19,Y+28
	ldd r20,Y+29
	ldd r21,Y+30
	subi r18,-1
	sbci r19,-1
	sbci r20,-1
	sbci r21,-1
	.stabn	68,0,1095,.LM655-.LFBB22
.LM655:
	std Y+43,r18
	std Y+44,r19
	std Y+45,r20
	std Y+46,r21
	.stabn	68,0,1096,.LM656-.LFBB22
.LM656:
	ldi r16,lo8(1)
	ldi r17,0
	ldd r24,Y+1
	call disk_write
	.stabn	68,0,1097,.LM657-.LFBB22
.LM657:
	std Y+4,__zero_reg__
.L359:
	.stabn	68,0,1100,.LM658-.LFBB22
.LM658:
	ldi r21,0
	ldi r20,0
	ldi r22,0
	ldd r24,Y+1
	call disk_ioctl
	.stabn	68,0,1100,.LM659-.LFBB22
.LM659:
	ldi r18,lo8(1)
	or r24,r25
	brne .L360
	ldi r18,0
.L360:
	.stabn	68,0,1100,.LM660-.LFBB22
.LM660:
	mov r24,r18
	ldi r25,0
.L357:
/* epilogue start */
.LBE215:
.LBE214:
	.stabn	68,0,1104,.LM661-.LFBB22
.LM661:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	sync_fs, .-sync_fs
	.stabs	"res:r(0,24)",64,0,0,24
	.stabn	192,0,0,.LFBB22-.LFBB22
	.stabn	224,0,0,.Lscope22-.LFBB22
.Lscope22:
	.stabs	"f_mount:F(0,24)",36,0,0,f_mount
	.stabs	"fs:p(0,8)",160,0,0,3
	.stabs	"path:p(0,23)",160,0,0,5
	.stabs	"opt:P(0,5)",64,0,0,17
.global	f_mount
	.type	f_mount, @function
f_mount:
	.stabn	68,0,3610,.LM662-.LFBB23
.LM662:
.LFBB23:
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 9 */
.L__stack_usage = 9
	std Y+4,r25
	std Y+3,r24
	std Y+6,r23
	std Y+5,r22
	mov r17,r20
	.stabn	68,0,3614,.LM663-.LFBB23
.LM663:
	std Y+2,r23
	std Y+1,r22
	.stabn	68,0,3618,.LM664-.LFBB23
.LM664:
	movw r24,r28
	adiw r24,1
	call get_ldnumber
	movw r18,r24
	.stabn	68,0,3619,.LM665-.LFBB23
.LM665:
	sbrc r25,7
	rjmp .L365
	.stabn	68,0,3620,.LM666-.LFBB23
.LM666:
	lsl r18
	rol r19
	movw r30,r18
	subi r30,lo8(-(FatFs))
	sbci r31,hi8(-(FatFs))
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	.stabn	68,0,3622,.LM667-.LFBB23
.LM667:
	sbiw r30,0
	breq .L363
	.stabn	68,0,3629,.LM668-.LFBB23
.LM668:
	st Z,__zero_reg__
.L363:
	.stabn	68,0,3632,.LM669-.LFBB23
.LM669:
	ldd r30,Y+3
	ldd r31,Y+4
	.stabn	68,0,3632,.LM670-.LFBB23
.LM670:
	sbiw r30,0
	breq .L364
	.stabn	68,0,3633,.LM671-.LFBB23
.LM671:
	st Z,__zero_reg__
.L364:
	.stabn	68,0,3638,.LM672-.LFBB23
.LM672:
	subi r18,lo8(-(FatFs))
	sbci r19,hi8(-(FatFs))
	movw r26,r18
	st X+,r30
	st X,r31
	.stabn	68,0,3640,.LM673-.LFBB23
.LM673:
	ldi r24,0
	.stabn	68,0,3640,.LM674-.LFBB23
.LM674:
	tst r17
	breq .L373
	.stabn	68,0,3642,.LM675-.LFBB23
.LM675:
	ldi r20,0
	movw r22,r28
	subi r22,-3
	sbci r23,-1
	movw r24,r28
	adiw r24,5
	call mount_volume
.L361:
/* epilogue start */
	.stabn	68,0,3644,.LM676-.LFBB23
.LM676:
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	ret
.L365:
	.stabn	68,0,3619,.LM677-.LFBB23
.LM677:
	ldi r24,lo8(11)
.L373:
	.stabn	68,0,3640,.LM678-.LFBB23
.LM678:
	ldi r25,0
	rjmp .L361
	.size	f_mount, .-f_mount
	.stabs	"cfs:r(0,8)",64,0,0,30
	.stabs	"vol:r(0,18)",64,0,0,18
	.stabs	"rp:(0,23)",128,0,0,1
	.stabn	192,0,0,.LFBB23-.LFBB23
	.stabn	224,0,0,.Lscope23-.LFBB23
.Lscope23:
	.stabs	"f_open:F(0,24)",36,0,0,f_open
	.stabs	"fp:P(0,42)=*(0,43)=(0,44)=s34obj:(0,27),0,112;flag:(0,5),112,8;err:(0,5),120,8;fptr:(0,29),128,32;clust:(0,1),160,32;sect:(0,7),192,32;dir_sect:(0,7),224,32;dir_ptr:(0,17),256,16;;",64,0,0,14
	.stabs	"path:p(0,23)",160,0,0,43
	.stabs	"mode:P(0,5)",64,0,0,11
.global	f_open
	.type	f_open, @function
f_open:
	.stabn	68,0,3658,.LM679-.LFBB24
.LM679:
.LFBB24:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,48
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 48 */
/* stack size = 66 */
.L__stack_usage = 66
	movw r14,r24
	std Y+44,r23
	std Y+43,r22
	mov r11,r20
	.stabn	68,0,3670,.LM680-.LFBB24
.LM680:
	ldi r16,lo8(9)
	ldi r17,0
	.stabn	68,0,3670,.LM681-.LFBB24
.LM681:
	or r24,r25
	brne .+2
	rjmp .L374
	.stabn	68,0,3673,.LM682-.LFBB24
.LM682:
	mov r18,r20
	andi r18,lo8(63)
	mov r3,r18
	.stabn	68,0,3674,.LM683-.LFBB24
.LM683:
	mov r20,r18
	movw r22,r28
	subi r22,-41
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call mount_volume
	movw r16,r24
	.stabn	68,0,3675,.LM684-.LFBB24
.LM684:
	or r24,r25
	brne .L376
	.stabn	68,0,3676,.LM685-.LFBB24
.LM685:
	ldd r12,Y+41
	ldd r13,Y+42
	std Y+2,r13
	std Y+1,r12
	.stabn	68,0,3678,.LM686-.LFBB24
.LM686:
	ldd r22,Y+43
	ldd r23,Y+44
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r8,r20
	movw r24,r20
	call follow_path
	movw r16,r24
	movw r24,r8
	.stabn	68,0,3680,.LM687-.LFBB24
.LM687:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L377
	.stabn	68,0,3681,.LM688-.LFBB24
.LM688:
	ldd r18,Y+40
	sbrs r18,7
	rjmp .L377
	.stabn	68,0,3682,.LM689-.LFBB24
.LM689:
	ldi r16,lo8(6)
	ldi r17,0
.L377:
	.stabn	68,0,3691,.LM690-.LFBB24
.LM690:
	mov r18,r11
	andi r18,lo8(28)
	brne .+2
	rjmp .L378
	.stabn	68,0,3692,.LM691-.LFBB24
.LM691:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L379
	.stabn	68,0,3693,.LM692-.LFBB24
.LM692:
	cpi r16,4
	cpc r17,__zero_reg__
	brne .L376
	.stabn	68,0,3697,.LM693-.LFBB24
.LM693:
	call dir_register
	movw r16,r24
	.stabn	68,0,3700,.LM694-.LFBB24
.LM694:
	set
	bld r3,3
	.stabn	68,0,3709,.LM695-.LFBB24
.LM695:
	or r24,r25
	breq .L380
.L376:
	.stabn	68,0,3838,.LM696-.LFBB24
.LM696:
	movw r26,r14
	st X+,__zero_reg__
	st X,__zero_reg__
	rjmp .L374
.L379:
	.stabn	68,0,3703,.LM697-.LFBB24
.LM697:
	ldd r24,Y+5
	andi r24,lo8(17)
	breq .+2
	rjmp .L394
	.stabn	68,0,3706,.LM698-.LFBB24
.LM698:
	sbrc r11,2
	rjmp .L392
	.stabn	68,0,3709,.LM699-.LFBB24
.LM699:
	sbrs r11,3
	rjmp .L381
.L380:
	.stabn	68,0,3731,.LM700-.LFBB24
.LM700:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB238:
.LBB239:
	.stabn	68,0,660,.LM701-.LFBB24
.LM701:
	std Z+14,__zero_reg__
	.stabn	68,0,661,.LM702-.LFBB24
.LM702:
	std Z+15,__zero_reg__
	.stabn	68,0,662,.LM703-.LFBB24
.LM703:
	ldi r25,lo8(33)
	std Z+16,r25
	.stabn	68,0,663,.LM704-.LFBB24
.LM704:
	ldi r24,lo8(84)
	std Z+17,r24
.LBE239:
.LBE238:
	.stabn	68,0,3732,.LM705-.LFBB24
.LM705:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB240:
.LBB241:
	.stabn	68,0,660,.LM706-.LFBB24
.LM706:
	std Z+22,__zero_reg__
	.stabn	68,0,661,.LM707-.LFBB24
.LM707:
	std Z+23,__zero_reg__
	.stabn	68,0,662,.LM708-.LFBB24
.LM708:
	std Z+24,r25
	.stabn	68,0,663,.LM709-.LFBB24
.LM709:
	std Z+25,r24
.LBE241:
.LBE240:
	.stabn	68,0,3733,.LM710-.LFBB24
.LM710:
	ldd r16,Y+27
	ldd r17,Y+28
	.stabn	68,0,3733,.LM711-.LFBB24
.LM711:
	movw r22,r16
	movw r26,r12
	ld r24,X
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3734,.LM712-.LFBB24
.LM712:
	ldi r24,lo8(32)
	movw r30,r16
	std Z+11,r24
	.stabn	68,0,3735,.LM713-.LFBB24
.LM713:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB242:
.LBB243:
.LBB244:
.LBB245:
	.stabn	68,0,654,.LM714-.LFBB24
.LM714:
	std Z+26,__zero_reg__
	.stabn	68,0,655,.LM715-.LFBB24
.LM715:
	std Z+27,__zero_reg__
.LBE245:
.LBE244:
	.stabn	68,0,1841,.LM716-.LFBB24
.LM716:
	movw r26,r12
	ld r24,X
	cpi r24,lo8(3)
	brne .L382
.LBB246:
.LBB247:
	.stabn	68,0,654,.LM717-.LFBB24
.LM717:
	std Z+20,__zero_reg__
	.stabn	68,0,655,.LM718-.LFBB24
.LM718:
	std Z+21,__zero_reg__
.L382:
.LBE247:
.LBE246:
.LBE243:
.LBE242:
	.stabn	68,0,3736,.LM719-.LFBB24
.LM719:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB248:
.LBB249:
	.stabn	68,0,660,.LM720-.LFBB24
.LM720:
	std Z+28,__zero_reg__
	.stabn	68,0,661,.LM721-.LFBB24
.LM721:
	std Z+29,__zero_reg__
	.stabn	68,0,662,.LM722-.LFBB24
.LM722:
	std Z+30,__zero_reg__
	.stabn	68,0,663,.LM723-.LFBB24
.LM723:
	std Z+31,__zero_reg__
.LBE249:
.LBE248:
	.stabn	68,0,3737,.LM724-.LFBB24
.LM724:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+3,r24
	.stabn	68,0,3738,.LM725-.LFBB24
.LM725:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .L381
	.stabn	68,0,3739,.LM726-.LFBB24
.LM726:
	ldd r4,Z+43
	ldd r5,Z+44
	ldd r6,Z+45
	ldd r7,Z+46
	.stabn	68,0,3740,.LM727-.LFBB24
.LM727:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	ldd r24,Y+1
	ldd r25,Y+2
	call remove_chain.isra.0
	movw r16,r24
	.stabn	68,0,3741,.LM728-.LFBB24
.LM728:
	or r24,r25
	breq .+2
	rjmp .L376
	.stabn	68,0,3742,.LM729-.LFBB24
.LM729:
	movw r22,r6
	movw r20,r4
	movw r24,r12
	call move_window
	movw r16,r24
	.stabn	68,0,3743,.LM730-.LFBB24
.LM730:
	ldi r31,1
	sub r8,r31
	sbc r9,__zero_reg__
	sbc r10,__zero_reg__
	sbc r11,__zero_reg__
	.stabn	68,0,3743,.LM731-.LFBB24
.LM731:
	movw r26,r12
	adiw r26,11
	st X+,r8
	st X+,r9
	st X+,r10
	st X,r11
	sbiw r26,11+3
	.stabn	68,0,3760,.LM732-.LFBB24
.LM732:
	or r24,r25
	breq .+2
	rjmp .L376
.L381:
	.stabn	68,0,3761,.LM733-.LFBB24
.LM733:
	sbrs r3,3
	rjmp .L383
	.stabn	68,0,3761,.LM734-.LFBB24
.LM734:
	set
	bld r3,6
.L383:
	.stabn	68,0,3762,.LM735-.LFBB24
.LM735:
	movw r30,r12
	ldd r24,Z+43
	ldd r25,Z+44
	ldd r26,Z+45
	ldd r27,Z+46
	movw r30,r14
	std Z+28,r24
	std Z+29,r25
	std Z+30,r26
	std Z+31,r27
	.stabn	68,0,3763,.LM736-.LFBB24
.LM736:
	ldd r16,Y+27
	ldd r17,Y+28
	.stabn	68,0,3763,.LM737-.LFBB24
.LM737:
	std Z+33,r17
	std Z+32,r16
	.stabn	68,0,3791,.LM738-.LFBB24
.LM738:
	movw r22,r16
	movw r26,r12
	ld r24,X
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3791,.LM739-.LFBB24
.LM739:
	movw r30,r14
	std Z+6,r8
	std Z+7,r9
	std Z+8,r10
	std Z+9,r11
	.stabn	68,0,3792,.LM740-.LFBB24
.LM740:
	movw r24,r16
	adiw r24,28
	call ld_dword
	movw r4,r22
	movw r6,r24
	.stabn	68,0,3792,.LM741-.LFBB24
.LM741:
	movw r26,r14
	adiw r26,10
	st X+,r4
	st X+,r5
	st X+,r6
	st X,r7
	sbiw r26,10+3
	.stabn	68,0,3797,.LM742-.LFBB24
.LM742:
	adiw r26,1
	st X,r13
	st -X,r12
	.stabn	68,0,3798,.LM743-.LFBB24
.LM743:
	movw r30,r12
	ldd r24,Z+5
	ldd r25,Z+6
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	.stabn	68,0,3799,.LM744-.LFBB24
.LM744:
	adiw r26,14
	st X,r3
	sbiw r26,14
	.stabn	68,0,3800,.LM745-.LFBB24
.LM745:
	adiw r26,15
	st X,__zero_reg__
	sbiw r26,15
	.stabn	68,0,3801,.LM746-.LFBB24
.LM746:
	adiw r26,24
	st X+,__zero_reg__
	st X+,__zero_reg__
	st X+,__zero_reg__
	st X,__zero_reg__
	sbiw r26,24+3
	.stabn	68,0,3802,.LM747-.LFBB24
.LM747:
	movw r30,r14
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	std Z+18,__zero_reg__
	std Z+19,__zero_reg__
	.stabn	68,0,3807,.LM748-.LFBB24
.LM748:
	sbrc r3,5
	rjmp .L384
.L385:
	.stabn	68,0,3670,.LM749-.LFBB24
.LM749:
	ldi r17,0
	ldi r16,0
.L374:
	.stabn	68,0,3841,.LM750-.LFBB24
.LM750:
	movw r24,r16
/* epilogue start */
	adiw r28,48
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L378:
	.stabn	68,0,3750,.LM751-.LFBB24
.LM751:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L376
	.stabn	68,0,3751,.LM752-.LFBB24
.LM752:
	ldd r24,Y+5
	.stabn	68,0,3751,.LM753-.LFBB24
.LM753:
	sbrc r24,4
	rjmp .L393
	.stabn	68,0,3754,.LM754-.LFBB24
.LM754:
	sbrs r11,1
	rjmp .L381
	.stabn	68,0,3754,.LM755-.LFBB24
.LM755:
	sbrs r24,0
	rjmp .L381
.L394:
	.stabn	68,0,3704,.LM756-.LFBB24
.LM756:
	ldi r16,lo8(7)
	ldi r17,0
	rjmp .L376
.L384:
	.stabn	68,0,3807,.LM757-.LFBB24
.LM757:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	breq .L385
	.stabn	68,0,3808,.LM758-.LFBB24
.LM758:
	adiw r26,16
	st X+,r4
	st X+,r5
	st X+,r6
	st X,r7
	sbiw r26,16+3
	.stabn	68,0,3809,.LM759-.LFBB24
.LM759:
	movw r30,r12
	ldd r24,Z+9
	ldd r25,Z+10
	ldi r27,0
	ldi r26,0
	movw r18,r24
	movw r20,r26
	ldi r25,9
	1:
	lsl r18
	rol r19
	rol r20
	rol r21
	dec r25
	brne 1b
	std Y+45,r18
	std Y+46,r19
	std Y+47,r20
	std Y+48,r21
.L386:
	.stabn	68,0,3811,.LM760-.LFBB24
.LM760:
	ldd r24,Y+45
	ldd r25,Y+46
	ldd r26,Y+47
	ldd r27,Y+48
	cp r24,r4
	cpc r25,r5
	cpc r26,r6
	cpc r27,r7
	brlo .L388
	ldi r17,0
	ldi r16,0
.L387:
	.stabn	68,0,3816,.LM761-.LFBB24
.LM761:
	movw r26,r14
	adiw r26,20
	st X+,r8
	st X+,r9
	st X+,r10
	st X,r11
	sbiw r26,20+3
	.stabn	68,0,3817,.LM762-.LFBB24
.LM762:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L376
	.stabn	68,0,3817,.LM763-.LFBB24
.LM763:
	movw r26,r6
	movw r24,r4
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,3817,.LM764-.LFBB24
.LM764:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L385
	.stabn	68,0,3818,.LM765-.LFBB24
.LM765:
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,3819,.LM766-.LFBB24
.LM766:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L397
	.stabn	68,0,3822,.LM767-.LFBB24
.LM767:
	movw r2,r4
	movw r4,r6
	ldi r24,9
	1:
	lsr r5
	ror r4
	ror r3
	ror r2
	dec r24
	brne 1b
	.stabn	68,0,3822,.LM768-.LFBB24
.LM768:
	add r20,r2
	adc r21,r3
	adc r22,r4
	adc r23,r5
	.stabn	68,0,3822,.LM769-.LFBB24
.LM769:
	movw r30,r14
	std Z+24,r20
	std Z+25,r21
	std Z+26,r22
	std Z+27,r23
	rjmp .L374
.L388:
	.stabn	68,0,3812,.LM770-.LFBB24
.LM770:
	movw r22,r10
	movw r20,r8
	movw r26,r14
	ld r24,X+
	ld r25,X
	call get_fat.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3811,.LM771-.LFBB24
.LM771:
	ldd r18,Y+45
	ldd r19,Y+46
	ldd r20,Y+47
	ldd r21,Y+48
	sub r4,r18
	sbc r5,r19
	sbc r6,r20
	sbc r7,r21
	.stabn	68,0,3813,.LM772-.LFBB24
.LM772:
	ldi r19,2
	cp r8,r19
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brlo .L395
	.stabn	68,0,3811,.LM773-.LFBB24
.LM773:
	ldi r20,-1
	cp r8,r20
	cpc r9,r20
	cpc r10,r20
	cpc r11,r20
	breq .+2
	rjmp .L386
	.stabn	68,0,3814,.LM774-.LFBB24
.LM774:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L387
.L395:
	.stabn	68,0,3813,.LM775-.LFBB24
.LM775:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L387
.L392:
	.stabn	68,0,3706,.LM776-.LFBB24
.LM776:
	ldi r16,lo8(8)
	ldi r17,0
	rjmp .L376
.L393:
	.stabn	68,0,3752,.LM777-.LFBB24
.LM777:
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L376
.L397:
	.stabn	68,0,3820,.LM778-.LFBB24
.LM778:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L376
	.size	f_open, .-f_open
	.stabs	"dj:(0,39)",128,0,0,1
	.stabs	"DIR:t(0,39)",128,0,0,0
	.stabs	"fs:(0,8)",128,0,0,41
	.stabs	"cl:r(0,1)",64,0,0,8
	.stabs	"bcs:(0,1)",128,0,0,45
	.stabs	"clst:r(0,1)",64,0,0,8
	.stabs	"ofs:r(0,29)",64,0,0,4
	.stabn	192,0,0,.LFBB24-.LFBB24
	.stabn	224,0,0,.Lscope24-.LFBB24
.Lscope24:
	.stabs	"f_read:F(0,24)",36,0,0,f_read
	.stabs	"fp:P(0,42)",64,0,0,14
	.stabs	"buff:P(0,45)=*(0,16)",64,0,0,6
	.stabs	"btr:P(0,19)",64,0,0,16
	.stabs	"br:p(0,46)=*(0,19)",160,0,0,3
.global	f_read
	.type	f_read, @function
f_read:
	.stabn	68,0,3856,.LM779-.LFBB25
.LM779:
.LFBB25:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 22 */
.L__stack_usage = 22
	movw r14,r24
	movw r6,r22
	movw r16,r20
	std Y+3,r18
	std Y+4,r19
	.stabn	68,0,3866,.LM780-.LFBB25
.LM780:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,3867,.LM781-.LFBB25
.LM781:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r12,r24
	.stabn	68,0,3868,.LM782-.LFBB25
.LM782:
	or r24,r25
	breq .+2
	rjmp .L419
	.stabn	68,0,3868,.LM783-.LFBB25
.LM783:
	movw r30,r14
	ldd r24,Z+15
	mov r12,r24
	mov r13,__zero_reg__
	.stabn	68,0,3868,.LM784-.LFBB25
.LM784:
	cpse r24,__zero_reg__
	rjmp .L419
	.stabn	68,0,3869,.LM785-.LFBB25
.LM785:
	ldd r24,Z+14
	sbrs r24,0
	rjmp .L437
	.stabn	68,0,3870,.LM786-.LFBB25
.LM786:
	ldd r24,Z+10
	ldd r25,Z+11
	ldd r26,Z+12
	ldd r27,Z+13
	ldd r20,Z+16
	ldd r21,Z+17
	ldd r22,Z+18
	ldd r23,Z+19
	sub r24,r20
	sbc r25,r21
	sbc r26,r22
	sbc r27,r23
	.stabn	68,0,3871,.LM787-.LFBB25
.LM787:
	movw r20,r16
	ldi r23,0
	ldi r22,0
	.stabn	68,0,3871,.LM788-.LFBB25
.LM788:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L421
	.stabn	68,0,3871,.LM789-.LFBB25
.LM789:
	movw r16,r24
.L421:
	.stabn	68,0,3856,.LM790-.LFBB25
.LM790:
	movw r12,r16
.L422:
	.stabn	68,0,3873,.LM791-.LFBB25
.LM791:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	breq .L419
	.stabn	68,0,3874,.LM792-.LFBB25
.LM792:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,3874,.LM793-.LFBB25
.LM793:
	movw r20,r24
	movw r22,r26
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,3874,.LM794-.LFBB25
.LM794:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L423
	.stabn	68,0,3875,.LM795-.LFBB25
.LM795:
	ldd r8,Y+1
	ldd r9,Y+2
	.stabn	68,0,3875,.LM796-.LFBB25
.LM796:
	movw r30,r8
	ldd r18,Z+9
	ldd r19,Z+10
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3875,.LM797-.LFBB25
.LM797:
	movw r20,r24
	movw r22,r26
	ldi r30,9
	1:
	lsr r23
	ror r22
	ror r21
	ror r20
	dec r30
	brne 1b
	.stabn	68,0,3875,.LM798-.LFBB25
.LM798:
	movw r16,r18
	and r16,r20
	and r17,r21
	.stabn	68,0,3876,.LM799-.LFBB25
.LM799:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L424
	.stabn	68,0,3878,.LM800-.LFBB25
.LM800:
	movw r30,r14
	.stabn	68,0,3877,.LM801-.LFBB25
.LM801:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L425
	.stabn	68,0,3878,.LM802-.LFBB25
.LM802:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
.L426:
	.stabn	68,0,3889,.LM803-.LFBB25
.LM803:
	cpi r20,2
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brsh .L427
.L429:
	.stabn	68,0,3889,.LM804-.LFBB25
.LM804:
	ldi r24,lo8(2)
	movw r30,r14
	std Z+15,r24
	ldi r23,lo8(2)
	mov r12,r23
	mov r13,__zero_reg__
.L419:
	.stabn	68,0,3940,.LM805-.LFBB25
.LM805:
	movw r24,r12
/* epilogue start */
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
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L425:
	.stabn	68,0,3886,.LM806-.LFBB25
.LM806:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	ld r24,Z
	ldd r25,Z+1
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	rjmp .L426
.L427:
	.stabn	68,0,3890,.LM807-.LFBB25
.LM807:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	brne .L428
.L432:
	.stabn	68,0,3890,.LM808-.LFBB25
.LM808:
	ldi r24,lo8(1)
	movw r30,r14
	std Z+15,r24
	clr r12
	inc r12
	mov r13,__zero_reg__
	rjmp .L419
.L428:
	.stabn	68,0,3891,.LM809-.LFBB25
.LM809:
	movw r30,r14
	std Z+20,r20
	std Z+21,r21
	std Z+22,r22
	std Z+23,r23
.L424:
	.stabn	68,0,3893,.LM810-.LFBB25
.LM810:
	movw r30,r14
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	movw r24,r8
	call clst2sect
	movw r2,r22
	movw r4,r24
	.stabn	68,0,3894,.LM811-.LFBB25
.LM811:
	cp r2,__zero_reg__
	cpc r3,__zero_reg__
	cpc r4,__zero_reg__
	cpc r5,__zero_reg__
	brne .+2
	rjmp .L429
	.stabn	68,0,3895,.LM812-.LFBB25
.LM812:
	add r2,r16
	adc r3,r17
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,3897,.LM813-.LFBB25
.LM813:
	cp r12,__zero_reg__
	ldi r31,2
	cpc r13,r31
	brsh .+2
	rjmp .L430
	.stabn	68,0,3896,.LM814-.LFBB25
.LM814:
	movw r10,r12
	mov r10,r11
	clr r11
	lsr r10
	.stabn	68,0,3898,.LM815-.LFBB25
.LM815:
	movw r30,r8
	ldd r24,Z+9
	ldd r25,Z+10
	.stabn	68,0,3898,.LM816-.LFBB25
.LM816:
	movw r18,r16
	add r18,r10
	adc r19,r11
	.stabn	68,0,3898,.LM817-.LFBB25
.LM817:
	cp r24,r18
	cpc r25,r19
	brsh .L431
	.stabn	68,0,3899,.LM818-.LFBB25
.LM818:
	movw r10,r24
	sub r10,r16
	sbc r11,r17
.L431:
	.stabn	68,0,3901,.LM819-.LFBB25
.LM819:
	movw r16,r10
	movw r20,r4
	movw r18,r2
	movw r22,r6
	movw r30,r8
	ldd r24,Z+1
	call disk_read
	.stabn	68,0,3901,.LM820-.LFBB25
.LM820:
	or r24,r25
	brne .L432
	.stabn	68,0,3904,.LM821-.LFBB25
.LM821:
	movw r30,r8
	ldd r24,Z+3
	tst r24
	breq .L433
	.stabn	68,0,3904,.LM822-.LFBB25
.LM822:
	ldd r24,Z+43
	ldd r25,Z+44
	ldd r26,Z+45
	ldd r27,Z+46
	sub r24,r2
	sbc r25,r3
	sbc r26,r4
	sbc r27,r5
	.stabn	68,0,3904,.LM823-.LFBB25
.LM823:
	movw r20,r10
	ldi r23,0
	ldi r22,0
	.stabn	68,0,3904,.LM824-.LFBB25
.LM824:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L433
	.stabn	68,0,3905,.LM825-.LFBB25
.LM825:
	movw r26,r24
	mov r27,r26
	clr r26
	lsl r27
	.stabn	68,0,3905,.LM826-.LFBB25
.LM826:
	add r26,r6
	adc r27,r7
	.stabn	68,0,3905,.LM827-.LFBB25
.LM827:
	adiw r30,47
	ldi r24,0
	ldi r25,lo8(2)
	0:
	ld r0,Z+
	st X+,r0
	sbiw r24,1
	brne 0b
.L433:
	.stabn	68,0,3913,.LM828-.LFBB25
.LM828:
	mov r11,r10
	clr r10
	lsl r11
.L434:
	.stabn	68,0,3873,.LM829-.LFBB25
.LM829:
	sub r12,r10
	sbc r13,r11
	.stabn	68,0,3873,.LM830-.LFBB25
.LM830:
	ldd r30,Y+3
	ldd r31,Y+4
	ld r24,Z
	ldd r25,Z+1
	add r24,r10
	adc r25,r11
	std Z+1,r25
	st Z,r24
	.stabn	68,0,3873,.LM831-.LFBB25
.LM831:
	add r6,r10
	adc r7,r11
	.stabn	68,0,3873,.LM832-.LFBB25
.LM832:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	add r24,r10
	adc r25,r11
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	rjmp .L422
.L430:
	.stabn	68,0,3927,.LM833-.LFBB25
.LM833:
	movw r30,r14
	std Z+24,r2
	std Z+25,r3
	std Z+26,r4
	std Z+27,r5
.L423:
	.stabn	68,0,3929,.LM834-.LFBB25
.LM834:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	mov r10,__zero_reg__
	ldi r18,lo8(2)
	mov r11,r18
	sub r10,r24
	sbc r11,r25
	cp r12,r10
	cpc r13,r11
	brsh .L435
	movw r10,r12
.L435:
	.stabn	68,0,3932,.LM835-.LFBB25
.LM835:
	ldd r16,Y+1
	ldd r17,Y+2
	movw r30,r14
	ldd r20,Z+24
	ldd r21,Z+25
	ldd r22,Z+26
	ldd r23,Z+27
	movw r24,r16
	call move_window
	.stabn	68,0,3932,.LM836-.LFBB25
.LM836:
	or r24,r25
	breq .+2
	rjmp .L432
	.stabn	68,0,3933,.LM837-.LFBB25
.LM837:
	movw r22,r16
	subi r22,-47
	sbci r23,-1
	.stabn	68,0,3933,.LM838-.LFBB25
.LM838:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	add r22,r24
	adc r23,r25
	movw r20,r10
	movw r24,r6
	call memcpy
	rjmp .L434
.L437:
	.stabn	68,0,3869,.LM839-.LFBB25
.LM839:
	ldi r24,lo8(7)
	mov r12,r24
	mov r13,__zero_reg__
	rjmp .L419
	.size	f_read, .-f_read
	.stabs	"res:r(0,24)",64,0,0,12
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"clst:r(0,1)",64,0,0,20
	.stabs	"remain:r(0,29)",64,0,0,24
	.stabs	"cc:r(0,19)",64,0,0,10
	.stabs	"csect:r(0,19)",64,0,0,16
	.stabs	"rbuff:r(0,17)",64,0,0,6
	.stabn	192,0,0,.LFBB25-.LFBB25
	.stabn	224,0,0,.Lscope25-.LFBB25
.Lscope25:
	.stabs	"f_write:F(0,24)",36,0,0,f_write
	.stabs	"fp:P(0,42)",64,0,0,14
	.stabs	"buff:P(0,47)=*(0,16)",64,0,0,6
	.stabs	"btw:P(0,19)",64,0,0,12
	.stabs	"bw:p(0,46)",160,0,0,5
.global	f_write
	.type	f_write, @function
f_write:
	.stabn	68,0,3956,.LM840-.LFBB26
.LM840:
.LFBB26:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r14,r24
	movw r6,r22
	movw r12,r20
	std Y+5,r18
	std Y+6,r19
	.stabn	68,0,3965,.LM841-.LFBB26
.LM841:
	ldd r30,Y+5
	ldd r31,Y+6
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,3966,.LM842-.LFBB26
.LM842:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,3967,.LM843-.LFBB26
.LM843:
	ldd r18,Y+3
	ldd r19,Y+4
	or r18,r19
	breq .+2
	rjmp .L444
	.stabn	68,0,3967,.LM844-.LFBB26
.LM844:
	movw r30,r14
	ldd r24,Z+15
	mov r18,r24
	ldi r19,0
	std Y+4,r19
	std Y+3,r18
	.stabn	68,0,3967,.LM845-.LFBB26
.LM845:
	cpse r24,__zero_reg__
	rjmp .L444
	.stabn	68,0,3968,.LM846-.LFBB26
.LM846:
	ldd r24,Z+14
	sbrs r24,1
	rjmp .L469
	.stabn	68,0,3971,.LM847-.LFBB26
.LM847:
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,3971,.LM848-.LFBB26
.LM848:
	movw r20,r24
	movw r22,r26
	add r20,r12
	adc r21,r13
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	.stabn	68,0,3971,.LM849-.LFBB26
.LM849:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L447
	.stabn	68,0,3972,.LM850-.LFBB26
.LM850:
	movw r12,r24
	com r12
	com r13
.L447:
	.stabn	68,0,3975,.LM851-.LFBB26
.LM851:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	brne .+2
	rjmp .L468
	.stabn	68,0,3976,.LM852-.LFBB26
.LM852:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,3976,.LM853-.LFBB26
.LM853:
	movw r20,r24
	movw r22,r26
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,3976,.LM854-.LFBB26
.LM854:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L448
	.stabn	68,0,3977,.LM855-.LFBB26
.LM855:
	ldd r10,Y+1
	ldd r11,Y+2
	.stabn	68,0,3977,.LM856-.LFBB26
.LM856:
	movw r30,r10
	ldd r18,Z+9
	ldd r19,Z+10
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3977,.LM857-.LFBB26
.LM857:
	movw r20,r24
	movw r22,r26
	ldi r30,9
	1:
	lsr r23
	ror r22
	ror r21
	ror r20
	dec r30
	brne 1b
	.stabn	68,0,3977,.LM858-.LFBB26
.LM858:
	movw r16,r18
	and r16,r20
	and r17,r21
	.stabn	68,0,3978,.LM859-.LFBB26
.LM859:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L450
	.stabn	68,0,3980,.LM860-.LFBB26
.LM860:
	movw r30,r14
	.stabn	68,0,3979,.LM861-.LFBB26
.LM861:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L451
	.stabn	68,0,3980,.LM862-.LFBB26
.LM862:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
	.stabn	68,0,3981,.LM863-.LFBB26
.LM863:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L452
	.stabn	68,0,3982,.LM864-.LFBB26
.LM864:
	ldi r20,0
	ldi r21,0
	movw r22,r20
.L473:
	.stabn	68,0,3991,.LM865-.LFBB26
.LM865:
	ld r24,Z
	ldd r25,Z+1
	call create_chain.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,3994,.LM866-.LFBB26
.LM866:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L452
.L468:
	.stabn	68,0,4059,.LM867-.LFBB26
.LM867:
	movw r30,r14
	ldd r24,Z+14
	ori r24,lo8(64)
	std Z+14,r24
.L444:
	.stabn	68,0,4062,.LM868-.LFBB26
.LM868:
	ldd r24,Y+3
	ldd r25,Y+4
/* epilogue start */
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L451:
	.stabn	68,0,3991,.LM869-.LFBB26
.LM869:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	rjmp .L473
.L452:
	.stabn	68,0,3995,.LM870-.LFBB26
.LM870:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L454
.L459:
	.stabn	68,0,3995,.LM871-.LFBB26
.LM871:
	ldi r24,lo8(2)
	movw r30,r14
	std Z+15,r24
	ldi r18,lo8(2)
	ldi r19,0
.L474:
	.stabn	68,0,3968,.LM872-.LFBB26
.LM872:
	std Y+4,r19
	std Y+3,r18
	rjmp .L444
.L454:
	.stabn	68,0,3996,.LM873-.LFBB26
.LM873:
	cpi r20,-1
	ldi r19,-1
	cpc r21,r19
	cpc r22,r19
	cpc r23,r19
	brne .L455
.L458:
	.stabn	68,0,3996,.LM874-.LFBB26
.LM874:
	ldi r24,lo8(1)
	movw r30,r14
	std Z+15,r24
	ldi r18,lo8(1)
	ldi r19,0
	rjmp .L474
.L455:
	.stabn	68,0,3997,.LM875-.LFBB26
.LM875:
	movw r30,r14
	std Z+20,r20
	std Z+21,r21
	std Z+22,r22
	std Z+23,r23
	.stabn	68,0,3998,.LM876-.LFBB26
.LM876:
	ldd r24,Z+6
	ldd r25,Z+7
	ldd r26,Z+8
	ldd r27,Z+9
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L450
	.stabn	68,0,3998,.LM877-.LFBB26
.LM877:
	std Z+6,r20
	std Z+7,r21
	std Z+8,r22
	std Z+9,r23
.L450:
	.stabn	68,0,4001,.LM878-.LFBB26
.LM878:
	movw r30,r10
	ldd r20,Z+43
	ldd r21,Z+44
	ldd r22,Z+45
	ldd r23,Z+46
	movw r30,r14
	ldd r24,Z+24
	ldd r25,Z+25
	ldd r26,Z+26
	ldd r27,Z+27
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brne .L457
	.stabn	68,0,4001,.LM879-.LFBB26
.LM879:
	movw r24,r10
	call sync_window
	.stabn	68,0,4001,.LM880-.LFBB26
.LM880:
	or r24,r25
	brne .L458
.L457:
	.stabn	68,0,4008,.LM881-.LFBB26
.LM881:
	movw r30,r14
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	movw r24,r10
	call clst2sect
	movw r2,r22
	movw r4,r24
	.stabn	68,0,4009,.LM882-.LFBB26
.LM882:
	cp r2,__zero_reg__
	cpc r3,__zero_reg__
	cpc r4,__zero_reg__
	cpc r5,__zero_reg__
	brne .+2
	rjmp .L459
	.stabn	68,0,4010,.LM883-.LFBB26
.LM883:
	add r2,r16
	adc r3,r17
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,4012,.LM884-.LFBB26
.LM884:
	cp r12,__zero_reg__
	ldi r31,2
	cpc r13,r31
	brsh .+2
	rjmp .L460
	.stabn	68,0,4011,.LM885-.LFBB26
.LM885:
	movw r8,r12
	mov r8,r9
	clr r9
	lsr r8
	.stabn	68,0,4013,.LM886-.LFBB26
.LM886:
	movw r30,r10
	ldd r24,Z+9
	ldd r25,Z+10
	.stabn	68,0,4013,.LM887-.LFBB26
.LM887:
	movw r18,r16
	add r18,r8
	adc r19,r9
	.stabn	68,0,4013,.LM888-.LFBB26
.LM888:
	cp r24,r18
	cpc r25,r19
	brsh .L461
	.stabn	68,0,4014,.LM889-.LFBB26
.LM889:
	movw r8,r24
	sub r8,r16
	sbc r9,r17
.L461:
	.stabn	68,0,4016,.LM890-.LFBB26
.LM890:
	movw r16,r8
	movw r20,r4
	movw r18,r2
	movw r22,r6
	movw r30,r10
	ldd r24,Z+1
	call disk_write
	.stabn	68,0,4016,.LM891-.LFBB26
.LM891:
	or r24,r25
	breq .+2
	rjmp .L458
	.stabn	68,0,4019,.LM892-.LFBB26
.LM892:
	movw r30,r10
	ldd r24,Z+43
	ldd r25,Z+44
	ldd r26,Z+45
	ldd r27,Z+46
	sub r24,r2
	sbc r25,r3
	sbc r26,r4
	sbc r27,r5
	.stabn	68,0,4019,.LM893-.LFBB26
.LM893:
	movw r20,r8
	ldi r23,0
	ldi r22,0
	.stabn	68,0,4019,.LM894-.LFBB26
.LM894:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L462
	.stabn	68,0,4020,.LM895-.LFBB26
.LM895:
	movw r18,r10
	subi r18,-47
	sbci r19,-1
	movw r30,r24
	mov r31,r30
	clr r30
	lsl r31
	.stabn	68,0,4020,.LM896-.LFBB26
.LM896:
	add r30,r6
	adc r31,r7
	.stabn	68,0,4020,.LM897-.LFBB26
.LM897:
	ldi r24,0
	ldi r25,lo8(2)
	movw r26,r18
	0:
	ld r0,Z+
	st X+,r0
	sbiw r24,1
	brne 0b
	.stabn	68,0,4021,.LM898-.LFBB26
.LM898:
	movw r30,r10
	std Z+3,__zero_reg__
.L462:
	.stabn	68,0,4030,.LM899-.LFBB26
.LM899:
	movw r16,r8
	mov r17,r16
	clr r16
	lsl r17
.L463:
	.stabn	68,0,3975,.LM900-.LFBB26
.LM900:
	sub r12,r16
	sbc r13,r17
	.stabn	68,0,3975,.LM901-.LFBB26
.LM901:
	ldd r30,Y+5
	ldd r31,Y+6
	ld r24,Z
	ldd r25,Z+1
	add r24,r16
	adc r25,r17
	std Z+1,r25
	st Z,r24
	.stabn	68,0,3975,.LM902-.LFBB26
.LM902:
	add r6,r16
	adc r7,r17
	.stabn	68,0,3975,.LM903-.LFBB26
.LM903:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	add r24,r16
	adc r25,r17
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	.stabn	68,0,3975,.LM904-.LFBB26
.LM904:
	ldd r20,Z+10
	ldd r21,Z+11
	ldd r22,Z+12
	ldd r23,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L466
	movw r20,r24
	movw r22,r26
.L466:
	.stabn	68,0,3975,.LM905-.LFBB26
.LM905:
	movw r30,r14
	std Z+10,r20
	std Z+11,r21
	std Z+12,r22
	std Z+13,r23
	rjmp .L447
.L460:
	.stabn	68,0,4034,.LM906-.LFBB26
.LM906:
	movw r30,r14
	ldd r20,Z+16
	ldd r21,Z+17
	ldd r22,Z+18
	ldd r23,Z+19
	ldd r24,Z+10
	ldd r25,Z+11
	ldd r26,Z+12
	ldd r27,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brlo .L464
	.stabn	68,0,4035,.LM907-.LFBB26
.LM907:
	movw r24,r10
	call sync_window
	.stabn	68,0,4035,.LM908-.LFBB26
.LM908:
	or r24,r25
	breq .+2
	rjmp .L458
	.stabn	68,0,4036,.LM909-.LFBB26
.LM909:
	movw r30,r10
	std Z+43,r2
	std Z+44,r3
	std Z+45,r4
	std Z+46,r5
.L464:
	.stabn	68,0,4045,.LM910-.LFBB26
.LM910:
	movw r30,r14
	std Z+24,r2
	std Z+25,r3
	std Z+26,r4
	std Z+27,r5
.L448:
	.stabn	68,0,4047,.LM911-.LFBB26
.LM911:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	ldi r16,0
	ldi r17,lo8(2)
	sub r16,r24
	sbc r17,r25
	cp r12,r16
	cpc r13,r17
	brsh .L465
	movw r16,r12
.L465:
	.stabn	68,0,4050,.LM912-.LFBB26
.LM912:
	ldd r10,Y+1
	ldd r11,Y+2
	movw r30,r14
	ldd r20,Z+24
	ldd r21,Z+25
	ldd r22,Z+26
	ldd r23,Z+27
	movw r24,r10
	call move_window
	.stabn	68,0,4050,.LM913-.LFBB26
.LM913:
	or r24,r25
	breq .+2
	rjmp .L458
	.stabn	68,0,4051,.LM914-.LFBB26
.LM914:
	movw r18,r10
	subi r18,-47
	sbci r19,-1
	.stabn	68,0,4051,.LM915-.LFBB26
.LM915:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	movw r20,r16
	movw r22,r6
	add r24,r18
	adc r25,r19
	call memcpy
	.stabn	68,0,4052,.LM916-.LFBB26
.LM916:
	ldi r18,lo8(1)
	movw r30,r10
	std Z+3,r18
	rjmp .L463
.L469:
	.stabn	68,0,3968,.LM917-.LFBB26
.LM917:
	ldi r18,lo8(7)
	ldi r19,0
	rjmp .L474
	.size	f_write, .-f_write
	.stabs	"res:(0,24)",128,0,0,3
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"clst:r(0,1)",64,0,0,20
	.stabs	"cc:r(0,19)",64,0,0,8
	.stabs	"csect:r(0,19)",64,0,0,16
	.stabs	"wbuff:r(0,4)",64,0,0,6
	.stabn	192,0,0,.LFBB26-.LFBB26
	.stabn	224,0,0,.Lscope26-.LFBB26
.Lscope26:
	.stabs	"putc_bfd:f(0,16)",36,0,0,putc_bfd
	.stabs	"pb:P(0,48)=*(0,49)=(0,50)=s70fp:(0,42),0,16;idx:(0,18),16,16;nchr:(0,18),32,16;buf:(0,51)=ar(0,15);0;63;(0,5),48,512;;",64,0,0,16
	.stabs	"c:P(0,20)",64,0,0,22
	.type	putc_bfd, @function
putc_bfd:
	.stabn	68,0,6489,.LM918-.LFBB27
.LM918:
.LFBB27:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	.stabn	68,0,6504,.LM919-.LFBB27
.LM919:
	movw r30,r24
	ldd r24,Z+2
	ldd r25,Z+3
	.stabn	68,0,6505,.LM920-.LFBB27
.LM920:
	sbrc r25,7
	rjmp .L475
	.stabn	68,0,6506,.LM921-.LFBB27
.LM921:
	ldd r12,Z+4
	ldd r13,Z+5
	.stabn	68,0,6605,.LM922-.LFBB27
.LM922:
	movw r14,r24
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	.stabn	68,0,6605,.LM923-.LFBB27
.LM923:
	add r24,r16
	adc r25,r17
	movw r30,r24
	std Z+6,r22
	.stabn	68,0,6608,.LM924-.LFBB27
.LM924:
	ldi r31,60
	cp r14,r31
	cpc r15,__zero_reg__
	brlt .L477
	.stabn	68,0,6609,.LM925-.LFBB27
.LM925:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r20,r14
	movw r22,r16
	subi r22,-6
	sbci r23,-1
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call f_write
	.stabn	68,0,6610,.LM926-.LFBB27
.LM926:
	ldi r24,lo8(1)
	ldi r25,0
	ldd r18,Y+1
	ldd r19,Y+2
	cp r18,r14
	cpc r19,r15
	brne .L478
	ldi r25,0
	ldi r24,0
.L478:
	clr r14
	clr r15
	sub r14,r24
	sbc r15,r25
.L477:
	.stabn	68,0,6612,.LM927-.LFBB27
.LM927:
	movw r30,r16
	std Z+3,r15
	std Z+2,r14
	.stabn	68,0,6613,.LM928-.LFBB27
.LM928:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	.stabn	68,0,6613,.LM929-.LFBB27
.LM929:
	movw r30,r16
	std Z+5,r13
	std Z+4,r12
.L475:
/* epilogue start */
	.stabn	68,0,6614,.LM930-.LFBB27
.LM930:
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
	.size	putc_bfd, .-putc_bfd
	.stabs	"n:(0,19)",128,0,0,1
	.stabs	"nc:r(0,18)",64,0,0,12
	.stabn	192,0,0,.LFBB27-.LFBB27
	.stabn	224,0,0,.Lscope27-.LFBB27
.Lscope27:
	.stabs	"putc_flush:f(0,18)",36,0,0,putc_flush
	.stabs	"pb:P(0,48)",64,0,0,16
	.type	putc_flush, @function
putc_flush:
	.stabn	68,0,6620,.LM931-.LFBB28
.LM931:
.LFBB28:
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,6623,.LM932-.LFBB28
.LM932:
	movw r30,r24
	ldd r20,Z+2
	ldd r21,Z+3
	.stabn	68,0,6623,.LM933-.LFBB28
.LM933:
	sbrs r21,7
	rjmp .L480
.L482:
	.stabn	68,0,6626,.LM934-.LFBB28
.LM934:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L479:
/* epilogue start */
	.stabn	68,0,6627,.LM935-.LFBB28
.LM935:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L480:
	.stabn	68,0,6624,.LM936-.LFBB28
.LM936:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r22,r24
	subi r22,-6
	sbci r23,-1
	ld r24,Z
	ldd r25,Z+1
	call f_write
	.stabn	68,0,6624,.LM937-.LFBB28
.LM937:
	or r24,r25
	brne .L482
	.stabn	68,0,6625,.LM938-.LFBB28
.LM938:
	movw r30,r16
	ldd r18,Z+2
	ldd r19,Z+3
	ldd r24,Y+1
	ldd r25,Y+2
	cp r18,r24
	cpc r19,r25
	brne .L482
	.stabn	68,0,6625,.LM939-.LFBB28
.LM939:
	ldd r24,Z+4
	ldd r25,Z+5
	rjmp .L479
	.size	putc_flush, .-putc_flush
	.stabs	"nw:(0,19)",128,0,0,1
	.stabn	192,0,0,.LFBB28-.LFBB28
	.stabn	224,0,0,.Lscope28-.LFBB28
.Lscope28:
	.stabs	"f_sync:F(0,24)",36,0,0,f_sync
	.stabs	"fp:P(0,42)",64,0,0,16
.global	f_sync
	.type	f_sync, @function
f_sync:
	.stabn	68,0,4074,.LM940-.LFBB29
.LM940:
.LFBB29:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	.stabn	68,0,4081,.LM941-.LFBB29
.LM941:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r18,r24
	.stabn	68,0,4082,.LM942-.LFBB29
.LM942:
	or r24,r25
	brne .L483
	.stabn	68,0,4083,.LM943-.LFBB29
.LM943:
	movw r30,r16
	ldd r24,Z+14
	sbrs r24,6
	rjmp .L483
	.stabn	68,0,4124,.LM944-.LFBB29
.LM944:
	ldd r12,Y+1
	ldd r13,Y+2
	ldd r20,Z+28
	ldd r21,Z+29
	ldd r22,Z+30
	ldd r23,Z+31
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,4125,.LM945-.LFBB29
.LM945:
	or r24,r25
	brne .L483
	.stabn	68,0,4126,.LM946-.LFBB29
.LM946:
	movw r30,r16
	ldd r14,Z+32
	ldd r15,Z+33
	.stabn	68,0,4127,.LM947-.LFBB29
.LM947:
	movw r30,r14
	ldd r24,Z+11
	ori r24,lo8(32)
	std Z+11,r24
	.stabn	68,0,4128,.LM948-.LFBB29
.LM948:
	movw r30,r16
	ldd r18,Z+6
	ldd r19,Z+7
	ldd r20,Z+8
	ldd r21,Z+9
	movw r22,r14
	ld r24,Z
	ldd r25,Z+1
	call st_clust
	movw r30,r16
	ldd r24,Z+10
	ldd r25,Z+11
	ldd r26,Z+12
	ldd r27,Z+13
.LBB256:
.LBB257:
	.stabn	68,0,660,.LM949-.LFBB29
.LM949:
	movw r30,r14
	std Z+28,r24
	std Z+29,r25
	std Z+30,r26
	std Z+31,r27
.LBE257:
.LBE256:
.LBB258:
.LBB259:
	std Z+22,__zero_reg__
	.stabn	68,0,661,.LM950-.LFBB29
.LM950:
	std Z+23,__zero_reg__
	.stabn	68,0,662,.LM951-.LFBB29
.LM951:
	ldi r24,lo8(33)
	std Z+24,r24
	.stabn	68,0,663,.LM952-.LFBB29
.LM952:
	ldi r24,lo8(84)
	std Z+25,r24
.LBE259:
.LBE258:
.LBB260:
.LBB261:
	.stabn	68,0,654,.LM953-.LFBB29
.LM953:
	std Z+18,__zero_reg__
	.stabn	68,0,655,.LM954-.LFBB29
.LM954:
	std Z+19,__zero_reg__
.LBE261:
.LBE260:
	.stabn	68,0,4132,.LM955-.LFBB29
.LM955:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+3,r24
	.stabn	68,0,4133,.LM956-.LFBB29
.LM956:
	movw r24,r12
	call sync_fs
	movw r18,r24
	.stabn	68,0,4134,.LM957-.LFBB29
.LM957:
	movw r30,r16
	ldd r24,Z+14
	andi r24,lo8(-65)
	std Z+14,r24
.L483:
	.stabn	68,0,4141,.LM958-.LFBB29
.LM958:
	movw r24,r18
/* epilogue start */
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
	.size	f_sync, .-f_sync
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"dir:r(0,17)",64,0,0,14
	.stabn	192,0,0,.LFBB29-.LFBB29
	.stabn	224,0,0,.Lscope29-.LFBB29
.Lscope29:
	.stabs	"f_close:F(0,24)",36,0,0,f_close
	.stabs	"fp:P(0,42)",64,0,0,16
.global	f_close
	.type	f_close, @function
f_close:
	.stabn	68,0,4155,.LM959-.LFBB30
.LM959:
.LFBB30:
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,4160,.LM960-.LFBB30
.LM960:
	call f_sync
	movw r18,r24
	.stabn	68,0,4161,.LM961-.LFBB30
.LM961:
	or r24,r25
	brne .L488
	.stabn	68,0,4164,.LM962-.LFBB30
.LM962:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call validate
	movw r18,r24
	.stabn	68,0,4165,.LM963-.LFBB30
.LM963:
	or r24,r25
	brne .L488
	.stabn	68,0,4170,.LM964-.LFBB30
.LM964:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.L488:
	.stabn	68,0,4178,.LM965-.LFBB30
.LM965:
	movw r24,r18
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	f_close, .-f_close
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,1
	.stabn	192,0,0,.LFBB30-.LFBB30
	.stabn	224,0,0,.Lscope30-.LFBB30
.Lscope30:
	.stabs	"f_lseek:F(0,24)",36,0,0,f_lseek
	.stabs	"fp:P(0,42)",64,0,0,16
	.stabs	"ofs:P(0,29)",64,0,0,12
.global	f_lseek
	.type	f_lseek, @function
f_lseek:
	.stabn	68,0,4371,.LM966-.LFBB31
.LM966:
.LFBB31:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 10 */
/* stack size = 26 */
.L__stack_usage = 26
	movw r16,r24
	movw r12,r20
	movw r14,r22
	.stabn	68,0,4383,.LM967-.LFBB31
.LM967:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r10,r24
	.stabn	68,0,4384,.LM968-.LFBB31
.LM968:
	or r24,r25
	breq .+2
	rjmp .L490
	.stabn	68,0,4384,.LM969-.LFBB31
.LM969:
	movw r26,r16
	adiw r26,15
	ld r24,X
	sbiw r26,15
	mov r10,r24
	mov r11,__zero_reg__
	.stabn	68,0,4390,.LM970-.LFBB31
.LM970:
	cpse r24,__zero_reg__
	rjmp .L490
	.stabn	68,0,4449,.LM971-.LFBB31
.LM971:
	adiw r26,10
	ld r24,X+
	ld r25,X+
	ld __tmp_reg__,X+
	ld r27,X
	mov r26,__tmp_reg__
	.stabn	68,0,4449,.LM972-.LFBB31
.LM972:
	cp r24,r12
	cpc r25,r13
	cpc r26,r14
	cpc r27,r15
	brsh .L492
	.stabn	68,0,4449,.LM973-.LFBB31
.LM973:
	movw r30,r16
	ldd r18,Z+14
	sbrc r18,1
	rjmp .L492
	.stabn	68,0,4449,.LM974-.LFBB31
.LM974:
	movw r12,r24
	movw r14,r26
.L492:
	.stabn	68,0,4452,.LM975-.LFBB31
.LM975:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4453,.LM976-.LFBB31
.LM976:
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	std Z+18,__zero_reg__
	std Z+19,__zero_reg__
	.stabn	68,0,4454,.LM977-.LFBB31
.LM977:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L493
.L501:
	.stabn	68,0,4453,.LM978-.LFBB31
.LM978:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
.L494:
	.stabn	68,0,4503,.LM979-.LFBB31
.LM979:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4503,.LM980-.LFBB31
.LM980:
	ldd r20,Z+10
	ldd r21,Z+11
	ldd r22,Z+12
	ldd r23,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L508
	.stabn	68,0,4504,.LM981-.LFBB31
.LM981:
	std Z+10,r24
	std Z+11,r25
	std Z+12,r26
	std Z+13,r27
	.stabn	68,0,4505,.LM982-.LFBB31
.LM982:
	ldd r18,Z+14
	ori r18,lo8(64)
	std Z+14,r18
.L508:
	.stabn	68,0,4507,.LM983-.LFBB31
.LM983:
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,4507,.LM984-.LFBB31
.LM984:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L490
	.stabn	68,0,4507,.LM985-.LFBB31
.LM985:
	movw r30,r16
	ldd r24,Z+24
	ldd r25,Z+25
	ldd r26,Z+26
	ldd r27,Z+27
	cp r24,r12
	cpc r25,r13
	cpc r26,r14
	cpc r27,r15
	brne .+2
	rjmp .L490
	.stabn	68,0,4517,.LM986-.LFBB31
.LM986:
	std Z+24,r12
	std Z+25,r13
	std Z+26,r14
	std Z+27,r15
	rjmp .L490
.L493:
	.stabn	68,0,4455,.LM987-.LFBB31
.LM987:
	ldd r8,Y+1
	ldd r9,Y+2
	.stabn	68,0,4455,.LM988-.LFBB31
.LM988:
	movw r30,r8
	ldd r4,Z+9
	ldd r5,Z+10
	mov r7,__zero_reg__
	mov r6,__zero_reg__
	ldi r19,9
	1:
	lsl r4
	rol r5
	rol r6
	rol r7
	dec r19
	brne 1b
	.stabn	68,0,4456,.LM989-.LFBB31
.LM989:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .+2
	rjmp .L495
	.stabn	68,0,4457,.LM990-.LFBB31
.LM990:
	movw r18,r24
	movw r20,r26
	subi r18,1
	sbc r19,__zero_reg__
	sbc r20,__zero_reg__
	sbc r21,__zero_reg__
	std Y+3,r18
	std Y+4,r19
	std Y+5,r20
	std Y+6,r21
	.stabn	68,0,4457,.LM991-.LFBB31
.LM991:
	movw r26,r14
	movw r24,r12
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,4457,.LM992-.LFBB31
.LM992:
	movw r22,r24
	movw r24,r26
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	std Y+7,r18
	std Y+8,r19
	std Y+9,r20
	std Y+10,r21
	.stabn	68,0,4457,.LM993-.LFBB31
.LM993:
	ldd r22,Y+3
	ldd r23,Y+4
	ldd r24,Y+5
	ldd r25,Y+6
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	.stabn	68,0,4456,.LM994-.LFBB31
.LM994:
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	cp r24,r18
	cpc r25,r19
	cpc r26,r20
	cpc r27,r21
	brsh .+2
	rjmp .L495
	.stabn	68,0,4458,.LM995-.LFBB31
.LM995:
	clr r24
	clr r25
	movw r26,r24
	sub r24,r4
	sbc r25,r5
	sbc r26,r6
	sbc r27,r7
	.stabn	68,0,4458,.LM996-.LFBB31
.LM996:
	ldd r18,Y+3
	ldd r19,Y+4
	ldd r20,Y+5
	ldd r21,Y+6
	and r24,r18
	and r25,r19
	and r26,r20
	and r27,r21
	.stabn	68,0,4458,.LM997-.LFBB31
.LM997:
	movw r30,r16
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	.stabn	68,0,4459,.LM998-.LFBB31
.LM998:
	sub r12,r24
	sbc r13,r25
	sbc r14,r26
	sbc r15,r27
	.stabn	68,0,4460,.LM999-.LFBB31
.LM999:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
.L496:
	.stabn	68,0,4473,.LM1000-.LFBB31
.LM1000:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L501
.L500:
	.stabn	68,0,4475,.LM1001-.LFBB31
.LM1001:
	movw r26,r16
	adiw r26,16
	ld r24,X+
	ld r25,X+
	ld __tmp_reg__,X+
	ld r27,X
	mov r26,__tmp_reg__
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	.stabn	68,0,4474,.LM1002-.LFBB31
.LM1002:
	cp r4,r12
	cpc r5,r13
	cpc r6,r14
	cpc r7,r15
	brsh .+2
	rjmp .L507
.L503:
	.stabn	68,0,4495,.LM1003-.LFBB31
.LM1003:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	add r24,r12
	adc r25,r13
	adc r26,r14
	adc r27,r15
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	.stabn	68,0,4496,.LM1004-.LFBB31
.LM1004:
	movw r26,r14
	movw r24,r12
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,4496,.LM1005-.LFBB31
.LM1005:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L501
	.stabn	68,0,4497,.LM1006-.LFBB31
.LM1006:
	movw r24,r8
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4498,.LM1007-.LFBB31
.LM1007:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L506
	.stabn	68,0,4499,.LM1008-.LFBB31
.LM1008:
	ldi r24,9
	1:
	lsr r15
	ror r14
	ror r13
	ror r12
	dec r24
	brne 1b
	.stabn	68,0,4499,.LM1009-.LFBB31
.LM1009:
	add r12,r20
	adc r13,r21
	adc r14,r22
	adc r15,r23
	rjmp .L494
.L495:
	.stabn	68,0,4462,.LM1010-.LFBB31
.LM1010:
	movw r26,r16
	adiw r26,6
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X
	sbiw r26,6+3
	.stabn	68,0,4464,.LM1011-.LFBB31
.LM1011:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .+2
	rjmp .L497
	.stabn	68,0,4465,.LM1012-.LFBB31
.LM1012:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ld r24,X+
	ld r25,X
	call create_chain.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4466,.LM1013-.LFBB31
.LM1013:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L498
.L506:
	.stabn	68,0,4466,.LM1014-.LFBB31
.LM1014:
	ldi r24,lo8(2)
	movw r30,r16
	std Z+15,r24
	ldi r18,lo8(2)
	mov r10,r18
	mov r11,__zero_reg__
.L490:
	.stabn	68,0,4522,.LM1015-.LFBB31
.LM1015:
	movw r24,r10
/* epilogue start */
	adiw r28,10
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L498:
	.stabn	68,0,4467,.LM1016-.LFBB31
.LM1016:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	brne .L499
.L505:
	.stabn	68,0,4467,.LM1017-.LFBB31
.LM1017:
	ldi r24,lo8(1)
	movw r26,r16
	adiw r26,15
	st X,r24
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L490
.L499:
	.stabn	68,0,4468,.LM1018-.LFBB31
.LM1018:
	movw r30,r16
	std Z+6,r20
	std Z+7,r21
	std Z+8,r22
	std Z+9,r23
.L497:
	.stabn	68,0,4471,.LM1019-.LFBB31
.LM1019:
	movw r26,r16
	adiw r26,20
	st X+,r20
	st X+,r21
	st X+,r22
	st X,r23
	sbiw r26,20+3
	rjmp .L496
.L507:
	.stabn	68,0,4475,.LM1020-.LFBB31
.LM1020:
	movw r26,r14
	movw r24,r12
	sub r24,r4
	sbc r25,r5
	sbc r26,r6
	sbc r27,r7
	std Y+3,r24
	std Y+4,r25
	std Y+5,r26
	std Y+6,r27
	.stabn	68,0,4475,.LM1021-.LFBB31
.LM1021:
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	add r24,r4
	adc r25,r5
	adc r26,r6
	adc r27,r7
	movw r30,r16
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,4477,.LM1022-.LFBB31
.LM1022:
	ldd r18,Z+14
	sbrs r18,1
	rjmp .L502
	.stabn	68,0,4482,.LM1023-.LFBB31
.LM1023:
	call create_chain.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,4483,.LM1024-.LFBB31
.LM1024:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L504
	.stabn	68,0,4482,.LM1025-.LFBB31
.LM1025:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	rjmp .L503
.L502:
	.stabn	68,0,4489,.LM1026-.LFBB31
.LM1026:
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
.L504:
	.stabn	68,0,4491,.LM1027-.LFBB31
.LM1027:
	ldi r31,-1
	cp r12,r31
	cpc r13,r31
	cpc r14,r31
	cpc r15,r31
	brne .+2
	rjmp .L505
	.stabn	68,0,4492,.LM1028-.LFBB31
.LM1028:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L506
	.stabn	68,0,4492,.LM1029-.LFBB31
.LM1029:
	movw r30,r8
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L506
	.stabn	68,0,4493,.LM1030-.LFBB31
.LM1030:
	movw r26,r16
	adiw r26,20
	st X+,r12
	st X+,r13
	st X+,r14
	st X,r15
	sbiw r26,20+3
	movw r22,r14
	movw r20,r12
	.stabn	68,0,4475,.LM1031-.LFBB31
.LM1031:
	ldd r12,Y+3
	ldd r13,Y+4
	ldd r14,Y+5
	ldd r15,Y+6
	rjmp .L500
	.size	f_lseek, .-f_lseek
	.stabs	"res:r(0,24)",64,0,0,10
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"bcs:r(0,1)",64,0,0,4
	.stabs	"ifptr:r(0,29)",64,0,0,24
	.stabn	192,0,0,.LFBB31-.LFBB31
	.stabn	224,0,0,.Lscope31-.LFBB31
.Lscope31:
	.stabs	"f_opendir:F(0,24)",36,0,0,f_opendir
	.stabs	"dp:P(0,38)",64,0,0,16
	.stabs	"path:p(0,23)",160,0,0,3
.global	f_opendir
	.type	f_opendir, @function
f_opendir:
	.stabn	68,0,4535,.LM1032-.LFBB32
.LM1032:
.LFBB32:
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
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	std Y+4,r23
	std Y+3,r22
	.stabn	68,0,4541,.LM1033-.LFBB32
.LM1033:
	ldi r18,lo8(9)
	ldi r19,0
	.stabn	68,0,4541,.LM1034-.LFBB32
.LM1034:
	or r24,r25
	brne .+2
	rjmp .L526
	.stabn	68,0,4544,.LM1035-.LFBB32
.LM1035:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,3
	call mount_volume
	movw r18,r24
	.stabn	68,0,4545,.LM1036-.LFBB32
.LM1036:
	or r24,r25
	brne .L528
	.stabn	68,0,4546,.LM1037-.LFBB32
.LM1037:
	ldd r14,Y+1
	ldd r15,Y+2
	movw r26,r16
	st X+,r14
	st X,r15
	.stabn	68,0,4548,.LM1038-.LFBB32
.LM1038:
	ldd r22,Y+3
	ldd r23,Y+4
	movw r24,r16
	call follow_path
	movw r18,r24
	.stabn	68,0,4549,.LM1039-.LFBB32
.LM1039:
	sbiw r24,0
	brne .L529
	.stabn	68,0,4550,.LM1040-.LFBB32
.LM1040:
	movw r30,r16
	ldd r24,Z+39
	sbrc r24,7
	rjmp .L530
	.stabn	68,0,4551,.LM1041-.LFBB32
.LM1041:
	ldd r24,Z+4
	sbrc r24,4
	rjmp .L531
.L532:
	.stabn	68,0,4564,.LM1042-.LFBB32
.LM1042:
	ldi r18,lo8(5)
	ldi r19,0
.L528:
	.stabn	68,0,4585,.LM1043-.LFBB32
.LM1043:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	rjmp .L526
.L531:
	.stabn	68,0,4561,.LM1044-.LFBB32
.LM1044:
	ldd r22,Z+26
	ldd r23,Z+27
	movw r30,r14
	ld r24,Z
	call ld_clust.isra.0
	movw r26,r16
	adiw r26,6
	st X+,r22
	st X+,r23
	st X+,r24
	st X,r25
	sbiw r26,6+3
.L530:
	.stabn	68,0,4568,.LM1045-.LFBB32
.LM1045:
	movw r30,r14
	ldd r24,Z+5
	ldd r25,Z+6
	movw r26,r16
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	.stabn	68,0,4569,.LM1046-.LFBB32
.LM1046:
	movw r24,r16
	call dir_sdi.constprop.0
	movw r18,r24
	.stabn	68,0,4583,.LM1047-.LFBB32
.LM1047:
	cpi r24,4
	cpc r25,__zero_reg__
	breq .L532
	.stabn	68,0,4585,.LM1048-.LFBB32
.LM1048:
	or r24,r25
	brne .L528
.L526:
	.stabn	68,0,4588,.LM1049-.LFBB32
.LM1049:
	movw r24,r18
/* epilogue start */
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
	ret
.L529:
	.stabn	68,0,4583,.LM1050-.LFBB32
.LM1050:
	sbiw r24,4
	breq .L532
	rjmp .L528
	.size	f_opendir, .-f_opendir
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,1
	.stabn	192,0,0,.LFBB32-.LFBB32
	.stabn	224,0,0,.Lscope32-.LFBB32
.Lscope32:
	.stabs	"f_closedir:F(0,24)",36,0,0,f_closedir
	.stabs	"dp:P(0,38)",64,0,0,16
.global	f_closedir
	.type	f_closedir, @function
f_closedir:
	.stabn	68,0,4600,.LM1051-.LFBB33
.LM1051:
.LFBB33:
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,4605,.LM1052-.LFBB33
.LM1052:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	.stabn	68,0,4606,.LM1053-.LFBB33
.LM1053:
	sbiw r24,0
	brne .L543
	.stabn	68,0,4611,.LM1054-.LFBB33
.LM1054:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.L543:
/* epilogue start */
	.stabn	68,0,4618,.LM1055-.LFBB33
.LM1055:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	f_closedir, .-f_closedir
	.stabs	"res:r(0,24)",64,0,0,24
	.stabs	"fs:(0,8)",128,0,0,1
	.stabn	192,0,0,.LFBB33-.LFBB33
	.stabn	224,0,0,.Lscope33-.LFBB33
.Lscope33:
	.stabs	"f_readdir:F(0,24)",36,0,0,f_readdir
	.stabs	"dp:P(0,38)",64,0,0,16
	.stabs	"fno:P(0,34)",64,0,0,14
.global	f_readdir
	.type	f_readdir, @function
f_readdir:
	.stabn	68,0,4631,.LM1056-.LFBB34
.LM1056:
.LFBB34:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r16,r24
	movw r14,r22
	.stabn	68,0,4637,.LM1057-.LFBB34
.LM1057:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r18,r24
	.stabn	68,0,4638,.LM1058-.LFBB34
.LM1058:
	or r24,r25
	brne .L545
	.stabn	68,0,4640,.LM1059-.LFBB34
.LM1059:
	movw r24,r16
	.stabn	68,0,4639,.LM1060-.LFBB34
.LM1060:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L547
/* epilogue start */
	.stabn	68,0,4654,.LM1061-.LFBB34
.LM1061:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	.stabn	68,0,4640,.LM1062-.LFBB34
.LM1062:
	jmp dir_sdi.constprop.0
.L547:
	.stabn	68,0,4643,.LM1063-.LFBB34
.LM1063:
	call dir_read.constprop.0
	movw r18,r24
	.stabn	68,0,4645,.LM1064-.LFBB34
.LM1064:
	andi r24,251
	or r24,r25
	brne .L545
.LBB264:
.LBB265:
	.stabn	68,0,2602,.LM1065-.LFBB34
.LM1065:
	movw r30,r14
	std Z+9,__zero_reg__
	.stabn	68,0,2603,.LM1066-.LFBB34
.LM1066:
	movw r30,r16
	ldd r24,Z+22
	ldd r25,Z+23
	ldd r26,Z+24
	ldd r27,Z+25
	or r24,r25
	or r24,r26
	or r24,r27
	breq .L548
	movw r22,r14
	ldd r24,Z+26
	ldd r25,Z+27
	call get_fileinfo.part.0.constprop.0.isra.0
.L548:
.LBE265:
.LBE264:
	.stabn	68,0,4647,.LM1067-.LFBB34
.LM1067:
	ldi r23,0
	ldi r22,0
	movw r24,r16
	call dir_next
	movw r18,r24
	.stabn	68,0,4648,.LM1068-.LFBB34
.LM1068:
	sbiw r24,4
	brne .L545
	.stabn	68,0,4648,.LM1069-.LFBB34
.LM1069:
	ldi r19,0
	ldi r18,0
.L545:
	.stabn	68,0,4654,.LM1070-.LFBB34
.LM1070:
	movw r24,r18
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	f_readdir, .-f_readdir
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,1
	.stabn	192,0,0,.LFBB34-.LFBB34
	.stabn	224,0,0,.Lscope34-.LFBB34
.Lscope34:
	.stabs	"f_stat:F(0,24)",36,0,0,f_stat
	.stabs	"path:p(0,23)",160,0,0,41
	.stabs	"fno:P(0,34)",64,0,0,14
.global	f_stat
	.type	f_stat, @function
f_stat:
	.stabn	68,0,4719,.LM1071-.LFBB35
.LM1071:
.LFBB35:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,42
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 42 */
/* stack size = 48 */
.L__stack_usage = 48
	std Y+42,r25
	std Y+41,r24
	movw r14,r22
	.stabn	68,0,4726,.LM1072-.LFBB35
.LM1072:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,41
	call mount_volume
	movw r16,r24
	.stabn	68,0,4727,.LM1073-.LFBB35
.LM1073:
	or r24,r25
	brne .L552
	.stabn	68,0,4729,.LM1074-.LFBB35
.LM1074:
	ldd r22,Y+41
	ldd r23,Y+42
	movw r24,r28
	adiw r24,1
	call follow_path
	movw r16,r24
	.stabn	68,0,4730,.LM1075-.LFBB35
.LM1075:
	or r24,r25
	brne .L552
	.stabn	68,0,4731,.LM1076-.LFBB35
.LM1076:
	ldd r24,Y+40
	sbrc r24,7
	rjmp .L556
	.stabn	68,0,4734,.LM1077-.LFBB35
.LM1077:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L552
.LBB268:
.LBB269:
	.stabn	68,0,2602,.LM1078-.LFBB35
.LM1078:
	movw r30,r14
	std Z+9,__zero_reg__
	.stabn	68,0,2603,.LM1079-.LFBB35
.LM1079:
	ldd r24,Y+23
	ldd r25,Y+24
	ldd r26,Y+25
	ldd r27,Y+26
	or r24,r25
	or r24,r26
	or r24,r27
	breq .L552
	movw r22,r14
	ldd r24,Y+27
	ldd r25,Y+28
	call get_fileinfo.part.0.constprop.0.isra.0
.L552:
.LBE269:
.LBE268:
	.stabn	68,0,4741,.LM1080-.LFBB35
.LM1080:
	movw r24,r16
/* epilogue start */
	adiw r28,42
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
	ret
.L556:
	.stabn	68,0,4732,.LM1081-.LFBB35
.LM1081:
	ldi r16,lo8(6)
	ldi r17,0
	.stabn	68,0,4740,.LM1082-.LFBB35
.LM1082:
	rjmp .L552
	.size	f_stat, .-f_stat
	.stabs	"res:r(0,24)",64,0,0,16
	.stabs	"dj:(0,39)",128,0,0,1
	.stabn	192,0,0,.LFBB35-.LFBB35
	.stabn	224,0,0,.Lscope35-.LFBB35
.Lscope35:
	.stabs	"f_getfree:F(0,24)",36,0,0,f_getfree
	.stabs	"path:p(0,23)",160,0,0,3
	.stabs	"nclst:p(0,52)=*(0,1)",160,0,0,5
	.stabs	"fatfs:P(0,30)",64,0,0,14
.global	f_getfree
	.type	f_getfree, @function
f_getfree:
	.stabn	68,0,4755,.LM1083-.LFBB36
.LM1083:
.LFBB36:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
/* stack size = 32 */
.L__stack_usage = 32
	std Y+4,r25
	std Y+3,r24
	std Y+5,r22
	std Y+6,r23
	movw r14,r20
	.stabn	68,0,4765,.LM1084-.LFBB36
.LM1084:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,3
	call mount_volume
	movw r10,r24
	.stabn	68,0,4766,.LM1085-.LFBB36
.LM1085:
	or r24,r25
	brne .L560
	.stabn	68,0,4767,.LM1086-.LFBB36
.LM1086:
	ldd r16,Y+1
	ldd r17,Y+2
	movw r26,r14
	st X+,r16
	st X,r17
	.stabn	68,0,4769,.LM1087-.LFBB36
.LM1087:
	movw r30,r16
	ldd r24,Z+15
	ldd r25,Z+16
	ldd r26,Z+17
	ldd r27,Z+18
	.stabn	68,0,4769,.LM1088-.LFBB36
.LM1088:
	ldd r4,Z+19
	ldd r5,Z+20
	ldd r6,Z+21
	ldd r7,Z+22
	.stabn	68,0,4769,.LM1089-.LFBB36
.LM1089:
	movw r22,r6
	movw r20,r4
	subi r20,2
	sbc r21,__zero_reg__
	sbc r22,__zero_reg__
	sbc r23,__zero_reg__
	.stabn	68,0,4769,.LM1090-.LFBB36
.LM1090:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brlo .L562
	.stabn	68,0,4770,.LM1091-.LFBB36
.LM1091:
	ldd r30,Y+5
	ldd r31,Y+6
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.L560:
	.stabn	68,0,4833,.LM1092-.LFBB36
.LM1092:
	movw r24,r10
/* epilogue start */
	adiw r28,14
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.L562:
	.stabn	68,0,4774,.LM1093-.LFBB36
.LM1093:
	ld r24,Z
	cpi r24,lo8(1)
	breq .+2
	rjmp .L563
	.stabn	68,0,4775,.LM1094-.LFBB36
.LM1094:
	ldi r18,lo8(2)
	mov r4,r18
	mov r5,__zero_reg__
	mov r6,__zero_reg__
	mov r7,__zero_reg__
	.stabn	68,0,4773,.LM1095-.LFBB36
.LM1095:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
.L565:
	.stabn	68,0,4777,.LM1096-.LFBB36
.LM1096:
	movw r22,r6
	movw r20,r4
	movw r24,r16
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4778,.LM1097-.LFBB36
.LM1097:
	cpi r20,-1
	ldi r27,-1
	cpc r21,r27
	cpc r22,r27
	cpc r23,r27
	brne .+2
	rjmp .L573
	.stabn	68,0,4779,.LM1098-.LFBB36
.LM1098:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L574
	.stabn	68,0,4780,.LM1099-.LFBB36
.LM1099:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .L564
	.stabn	68,0,4780,.LM1100-.LFBB36
.LM1100:
	ldi r30,-1
	sub r12,r30
	sbc r13,r30
	sbc r14,r30
	sbc r15,r30
.L564:
	.stabn	68,0,4781,.LM1101-.LFBB36
.LM1101:
	ldi r31,-1
	sub r4,r31
	sbc r5,r31
	sbc r6,r31
	sbc r7,r31
	movw r30,r16
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r4,r24
	cpc r5,r25
	cpc r6,r26
	cpc r7,r27
	brlo .L565
.L566:
	.stabn	68,0,4825,.LM1102-.LFBB36
.LM1102:
	ldd r26,Y+5
	ldd r27,Y+6
	st X+,r12
	st X+,r13
	st X+,r14
	st X,r15
	sbiw r26,3
	.stabn	68,0,4826,.LM1103-.LFBB36
.LM1103:
	movw r30,r16
	std Z+15,r12
	std Z+16,r13
	std Z+17,r14
	std Z+18,r15
	.stabn	68,0,4827,.LM1104-.LFBB36
.LM1104:
	ldd r24,Z+4
	ori r24,lo8(1)
	std Z+4,r24
	rjmp .L560
.L563:
	.stabn	68,0,4806,.LM1105-.LFBB36
.LM1105:
	ldd r24,Z+31
	ldd r25,Z+32
	ldd r26,Z+33
	ldd r27,Z+34
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	.stabn	68,0,4807,.LM1106-.LFBB36
.LM1106:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
	.stabn	68,0,4773,.LM1107-.LFBB36
.LM1107:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	.stabn	68,0,4814,.LM1108-.LFBB36
.LM1108:
	movw r2,r16
	ldi r27,47
	add r2,r27
	adc r3,__zero_reg__
.L572:
	.stabn	68,0,4809,.LM1109-.LFBB36
.LM1109:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L567
	.stabn	68,0,4810,.LM1110-.LFBB36
.LM1110:
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+11,r24
	std Y+12,r25
	std Y+13,r26
	std Y+14,r27
	ldd r20,Y+7
	ldd r21,Y+8
	ldd r22,Y+9
	ldd r23,Y+10
	movw r24,r16
	call move_window
	.stabn	68,0,4811,.LM1111-.LFBB36
.LM1111:
	sbiw r24,0
	breq .+2
	rjmp .L575
	.stabn	68,0,4810,.LM1112-.LFBB36
.LM1112:
	ldd r24,Y+11
	ldd r25,Y+12
	ldd r26,Y+13
	ldd r27,Y+14
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
.L567:
	.stabn	68,0,4814,.LM1113-.LFBB36
.LM1113:
	movw r24,r2
	add r24,r8
	adc r25,r9
	.stabn	68,0,4813,.LM1114-.LFBB36
.LM1114:
	movw r26,r16
	ld r18,X
	cpi r18,lo8(2)
	brne .L568
	.stabn	68,0,4814,.LM1115-.LFBB36
.LM1115:
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	brne .L569
	.stabn	68,0,4814,.LM1116-.LFBB36
.LM1116:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	sbc r14,r31
	sbc r15,r31
.L569:
	.stabn	68,0,4815,.LM1117-.LFBB36
.LM1117:
	ldi r24,2
	add r8,r24
	adc r9,__zero_reg__
.L570:
	.stabn	68,0,4820,.LM1118-.LFBB36
.LM1118:
	ldi r27,1
	and r9,r27
	.stabn	68,0,4821,.LM1119-.LFBB36
.LM1119:
	ldi r30,1
	sub r4,r30
	sbc r5,__zero_reg__
	sbc r6,__zero_reg__
	sbc r7,__zero_reg__
	breq .+2
	rjmp .L572
	rjmp .L566
.L568:
	.stabn	68,0,4817,.LM1120-.LFBB36
.LM1120:
	call ld_dword
	std Y+11,r22
	std Y+12,r23
	std Y+13,r24
	std Y+14,r25
	.stabn	68,0,4817,.LM1121-.LFBB36
.LM1121:
	movw r26,r24
	movw r24,r22
	andi r27,15
	.stabn	68,0,4817,.LM1122-.LFBB36
.LM1122:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L571
	.stabn	68,0,4817,.LM1123-.LFBB36
.LM1123:
	ldi r25,-1
	sub r12,r25
	sbc r13,r25
	sbc r14,r25
	sbc r15,r25
.L571:
	.stabn	68,0,4818,.LM1124-.LFBB36
.LM1124:
	ldi r26,4
	add r8,r26
	adc r9,__zero_reg__
	rjmp .L570
.L573:
	.stabn	68,0,4778,.LM1125-.LFBB36
.LM1125:
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L560
.L574:
	.stabn	68,0,4779,.LM1126-.LFBB36
.LM1126:
	ldi r24,lo8(2)
	mov r10,r24
	mov r11,__zero_reg__
	rjmp .L560
.L575:
	movw r10,r24
	.stabn	68,0,4832,.LM1127-.LFBB36
.LM1127:
	rjmp .L560
	.size	f_getfree, .-f_getfree
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"nfree:r(0,1)",64,0,0,12
	.stabs	"stat:r(0,1)",64,0,0,20
	.stabn	192,0,0,.LFBB36-.LFBB36
	.stabn	224,0,0,.Lscope36-.LFBB36
.Lscope36:
	.stabs	"f_truncate:F(0,24)",36,0,0,f_truncate
	.stabs	"fp:P(0,42)",64,0,0,14
.global	f_truncate
	.type	f_truncate, @function
f_truncate:
	.stabn	68,0,4845,.LM1128-.LFBB37
.LM1128:
.LFBB37:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __tmp_reg__
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r14,r24
	.stabn	68,0,4851,.LM1129-.LFBB37
.LM1129:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r16,r24
	.stabn	68,0,4852,.LM1130-.LFBB37
.LM1130:
	or r24,r25
	brne .L578
	.stabn	68,0,4852,.LM1131-.LFBB37
.LM1131:
	movw r30,r14
	ldd r24,Z+15
	mov r16,r24
	ldi r17,0
	.stabn	68,0,4852,.LM1132-.LFBB37
.LM1132:
	cpse r24,__zero_reg__
	rjmp .L578
	.stabn	68,0,4853,.LM1133-.LFBB37
.LM1133:
	ldd r24,Z+14
	sbrs r24,1
	rjmp .L582
	.stabn	68,0,4855,.LM1134-.LFBB37
.LM1134:
	ldd r20,Z+16
	ldd r21,Z+17
	ldd r22,Z+18
	ldd r23,Z+19
	.stabn	68,0,4855,.LM1135-.LFBB37
.LM1135:
	ldd r24,Z+10
	ldd r25,Z+11
	ldd r26,Z+12
	ldd r27,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L578
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,4856,.LM1136-.LFBB37
.LM1136:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .L580
	.stabn	68,0,4857,.LM1137-.LFBB37
.LM1137:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
	ldi r16,0
	ldi r17,0
	movw r18,r16
	call remove_chain.isra.0
	movw r16,r24
	.stabn	68,0,4858,.LM1138-.LFBB37
.LM1138:
	movw r30,r14
	std Z+6,__zero_reg__
	std Z+7,__zero_reg__
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
.L581:
	.stabn	68,0,4868,.LM1139-.LFBB37
.LM1139:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	std Z+10,r24
	std Z+11,r25
	std Z+12,r26
	std Z+13,r27
	.stabn	68,0,4869,.LM1140-.LFBB37
.LM1140:
	ldd r24,Z+14
	ori r24,lo8(64)
	std Z+14,r24
	.stabn	68,0,4879,.LM1141-.LFBB37
.LM1141:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L578
	.stabn	68,0,4879,.LM1142-.LFBB37
.LM1142:
	std Z+15,r16
.L578:
	.stabn	68,0,4883,.LM1143-.LFBB37
.LM1143:
	movw r24,r16
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L580:
	.stabn	68,0,4860,.LM1144-.LFBB37
.LM1144:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4862,.LM1145-.LFBB37
.LM1145:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	breq .L583
	.stabn	68,0,4863,.LM1146-.LFBB37
.LM1146:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L584
	.stabn	68,0,4864,.LM1147-.LFBB37
.LM1147:
	ldd r30,Y+1
	ldd r31,Y+2
	.stabn	68,0,4864,.LM1148-.LFBB37
.LM1148:
	ldd r24,Z+19
	ldd r25,Z+20
	ldd r26,Z+21
	ldd r27,Z+22
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L581
	.stabn	68,0,4865,.LM1149-.LFBB37
.LM1149:
	movw r30,r14
	ldd r16,Z+20
	ldd r17,Z+21
	ldd r18,Z+22
	ldd r19,Z+23
	ld r24,Z
	ldd r25,Z+1
	call remove_chain.isra.0
	movw r16,r24
	rjmp .L581
.L583:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L581
.L584:
	.stabn	68,0,4863,.LM1150-.LFBB37
.LM1150:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L581
.L582:
	.stabn	68,0,4853,.LM1151-.LFBB37
.LM1151:
	ldi r16,lo8(7)
	ldi r17,0
	rjmp .L578
	.size	f_truncate, .-f_truncate
	.stabs	"res:r(0,24)",64,0,0,16
	.stabs	"fs:(0,8)",128,0,0,1
	.stabs	"ncl:r(0,1)",64,0,0,20
	.stabn	192,0,0,.LFBB37-.LFBB37
	.stabn	224,0,0,.Lscope37-.LFBB37
.Lscope37:
	.stabs	"f_unlink:F(0,24)",36,0,0,f_unlink
	.stabs	"path:p(0,23)",160,0,0,83
.global	f_unlink
	.type	f_unlink, @function
f_unlink:
	.stabn	68,0,4895,.LM1152-.LFBB38
.LM1152:
.LFBB38:
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,84
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 84 */
/* stack size = 96 */
.L__stack_usage = 96
	adiw r28,83-62
	std Y+63,r25
	std Y+62,r24
	sbiw r28,83-62
	.stabn	68,0,4907,.LM1153-.LFBB38
.LM1153:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-81
	sbci r23,-1
	movw r24,r28
	subi r24,-83
	sbci r25,-1
	call mount_volume
	movw r18,r24
	.stabn	68,0,4908,.LM1154-.LFBB38
.LM1154:
	or r24,r25
	brne .L588
	.stabn	68,0,4909,.LM1155-.LFBB38
.LM1155:
	adiw r28,81-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,81-62
	std Y+42,r15
	std Y+41,r14
	.stabn	68,0,4911,.LM1156-.LFBB38
.LM1156:
	adiw r28,83-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,83-62
	movw r24,r28
	adiw r24,41
	call follow_path
	movw r18,r24
	.stabn	68,0,4918,.LM1157-.LFBB38
.LM1157:
	or r24,r25
	brne .L588
	.stabn	68,0,4919,.LM1158-.LFBB38
.LM1158:
	adiw r28,80-63
	ldd r24,Y+63
	sbiw r28,80-63
	.stabn	68,0,4920,.LM1159-.LFBB38
.LM1159:
	ldi r18,lo8(6)
	ldi r19,0
	.stabn	68,0,4919,.LM1160-.LFBB38
.LM1160:
	sbrc r24,7
	rjmp .L588
	.stabn	68,0,4922,.LM1161-.LFBB38
.LM1161:
	ldd r13,Y+45
	.stabn	68,0,4922,.LM1162-.LFBB38
.LM1162:
	sbrs r13,0
	rjmp .L590
.L593:
	.stabn	68,0,4923,.LM1163-.LFBB38
.LM1163:
	ldi r18,lo8(7)
	ldi r19,0
.L588:
	.stabn	68,0,4977,.LM1164-.LFBB38
.LM1164:
	movw r24,r18
/* epilogue start */
	subi r28,-84
	sbci r29,-1
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
	pop r9
	pop r8
	ret
.L590:
	.stabn	68,0,4935,.LM1165-.LFBB38
.LM1165:
	adiw r28,67-62
	ldd r16,Y+62
	ldd r17,Y+63
	sbiw r28,67-62
	.stabn	68,0,4935,.LM1166-.LFBB38
.LM1166:
	movw r22,r16
	movw r30,r14
	ld r24,Z
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,4937,.LM1167-.LFBB38
.LM1167:
	sbrc r13,4
	rjmp .L591
.L594:
.LBB272:
.LBB273:
	.stabn	68,0,2545,.LM1168-.LFBB38
.LM1168:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,2567,.LM1169-.LFBB38
.LM1169:
	adiw r28,63-60
	ldd r20,Y+60
	ldd r21,Y+61
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,63-60
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,2568,.LM1170-.LFBB38
.LM1170:
	or r24,r25
	brne .L588
	.stabn	68,0,2569,.LM1171-.LFBB38
.LM1171:
	ldi r24,lo8(-27)
	movw r30,r16
	st Z,r24
	.stabn	68,0,2570,.LM1172-.LFBB38
.LM1172:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+3,r24
.LBE273:
.LBE272:
	.stabn	68,0,4963,.LM1173-.LFBB38
.LM1173:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L595
.L596:
	.stabn	68,0,4970,.LM1174-.LFBB38
.LM1174:
	movw r24,r14
	call sync_fs
	movw r18,r24
	rjmp .L588
.L591:
	.stabn	68,0,4944,.LM1175-.LFBB38
.LM1175:
	std Y+2,r15
	std Y+1,r14
	.stabn	68,0,4945,.LM1176-.LFBB38
.LM1176:
	std Y+7,r8
	std Y+8,r9
	std Y+9,r10
	std Y+10,r11
	.stabn	68,0,4952,.LM1177-.LFBB38
.LM1177:
	movw r24,r28
	adiw r24,1
	call dir_sdi.constprop.0
	movw r18,r24
	.stabn	68,0,4953,.LM1178-.LFBB38
.LM1178:
	or r24,r25
	breq .+2
	rjmp .L588
	.stabn	68,0,4954,.LM1179-.LFBB38
.LM1179:
	movw r24,r28
	adiw r24,1
	call dir_read.constprop.0
	movw r18,r24
	.stabn	68,0,4955,.LM1180-.LFBB38
.LM1180:
	sbiw r24,0
	brne .+2
	rjmp .L593
	.stabn	68,0,4956,.LM1181-.LFBB38
.LM1181:
	sbiw r24,4
	breq .+2
	rjmp .L588
	rjmp .L594
.L595:
	.stabn	68,0,4967,.LM1182-.LFBB38
.LM1182:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call remove_chain.isra.0
	movw r18,r24
	.stabn	68,0,4970,.LM1183-.LFBB38
.LM1183:
	or r24,r25
	breq .+2
	rjmp .L588
	rjmp .L596
	.size	f_unlink, .-f_unlink
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"dj:(0,39)",128,0,0,41
	.stabs	"sdj:(0,39)",128,0,0,1
	.stabs	"dclst:r(0,1)",64,0,0,8
	.stabs	"fs:(0,8)",128,0,0,81
	.stabn	192,0,0,.LFBB38-.LFBB38
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:r(0,8)",64,0,0,12
	.stabn	192,0,0,.LBB273-.LFBB38
	.stabn	224,0,0,.LBE273-.LFBB38
	.stabn	224,0,0,.Lscope38-.LFBB38
.Lscope38:
	.stabs	"f_mkdir:F(0,24)",36,0,0,f_mkdir
	.stabs	"path:p(0,23)",160,0,0,43
.global	f_mkdir
	.type	f_mkdir, @function
f_mkdir:
	.stabn	68,0,4989,.LM1184-.LFBB39
.LM1184:
.LFBB39:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,44
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 44 */
/* stack size = 60 */
.L__stack_usage = 60
	std Y+44,r25
	std Y+43,r24
	.stabn	68,0,4998,.LM1185-.LFBB39
.LM1185:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-41
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call mount_volume
	movw r14,r24
	.stabn	68,0,4999,.LM1186-.LFBB39
.LM1186:
	or r24,r25
	breq .+2
	rjmp .L607
	.stabn	68,0,5000,.LM1187-.LFBB39
.LM1187:
	ldd r24,Y+41
	ldd r25,Y+42
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,5002,.LM1188-.LFBB39
.LM1188:
	ldd r22,Y+43
	ldd r23,Y+44
	movw r24,r28
	adiw r24,1
	call follow_path
	movw r14,r24
	.stabn	68,0,5003,.LM1189-.LFBB39
.LM1189:
	or r24,r25
	brne .+2
	rjmp .L612
	.stabn	68,0,5007,.LM1190-.LFBB39
.LM1190:
	ldi r24,4
	cp r14,r24
	cpc r15,__zero_reg__
	breq .+2
	rjmp .L607
	.stabn	68,0,5008,.LM1191-.LFBB39
.LM1191:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,5009,.LM1192-.LFBB39
.LM1192:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	movw r24,r12
	call create_chain.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,5011,.LM1193-.LFBB39
.LM1193:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .+2
	rjmp .L613
	.stabn	68,0,5012,.LM1194-.LFBB39
.LM1194:
	ldi r18,lo8(2)
	mov r14,r18
	mov r15,__zero_reg__
	.stabn	68,0,5012,.LM1195-.LFBB39
.LM1195:
	ldi r30,1
	cp r8,r30
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .+2
	rjmp .L609
	.stabn	68,0,5013,.LM1196-.LFBB39
.LM1196:
	clr r14
	inc r14
	mov r15,__zero_reg__
	.stabn	68,0,5013,.LM1197-.LFBB39
.LM1197:
	ldi r31,-1
	cp r8,r31
	cpc r9,r31
	cpc r10,r31
	cpc r11,r31
	brne .+2
	rjmp .L609
	.stabn	68,0,5016,.LM1198-.LFBB39
.LM1198:
	movw r22,r10
	movw r20,r8
	ldd r24,Y+41
	ldd r25,Y+42
	call dir_clear
	movw r14,r24
	.stabn	68,0,5017,.LM1199-.LFBB39
.LM1199:
	or r24,r25
	breq .+2
	rjmp .L609
	.stabn	68,0,5019,.LM1200-.LFBB39
.LM1200:
	ldd r16,Y+41
	ldd r17,Y+42
	.stabn	68,0,5019,.LM1201-.LFBB39
.LM1201:
	movw r14,r16
	ldi r31,47
	add r14,r31
	adc r15,__zero_reg__
	.stabn	68,0,5019,.LM1202-.LFBB39
.LM1202:
	ldi r20,lo8(10)
	ldi r21,0
	ldi r22,lo8(32)
	ldi r23,0
	movw r24,r16
	adiw r24,48
	call memset
	.stabn	68,0,5020,.LM1203-.LFBB39
.LM1203:
	ldi r20,lo8(46)
	mov r4,r20
	movw r30,r16
	std Z+47,r4
	.stabn	68,0,5021,.LM1204-.LFBB39
.LM1204:
	ldi r21,lo8(16)
	mov r7,r21
	std Z+58,r7
.LBB278:
.LBB279:
	.stabn	68,0,660,.LM1205-.LFBB39
.LM1205:
	subi r30,-69
	sbci r31,-1
	st Z,__zero_reg__
	.stabn	68,0,661,.LM1206-.LFBB39
.LM1206:
	adiw r30,1
	st Z,__zero_reg__
	.stabn	68,0,662,.LM1207-.LFBB39
.LM1207:
	adiw r30,1
	ldi r22,lo8(33)
	mov r5,r22
	st Z,r5
	.stabn	68,0,663,.LM1208-.LFBB39
.LM1208:
	adiw r30,1
	ldi r23,lo8(84)
	mov r6,r23
	st Z,r6
.LBE279:
.LBE278:
	.stabn	68,0,5023,.LM1209-.LFBB39
.LM1209:
	movw r20,r10
	movw r18,r8
	movw r22,r14
	movw r24,r16
	call st_clust
	.stabn	68,0,5024,.LM1210-.LFBB39
.LM1210:
	movw r22,r16
	subi r22,-79
	sbci r23,-1
	ldi r24,lo8(32)
	movw r30,r14
	movw r26,r22
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,5025,.LM1211-.LFBB39
.LM1211:
	movw r30,r16
	subi r30,-80
	sbci r31,-1
	st Z,r4
	.stabn	68,0,5026,.LM1212-.LFBB39
.LM1212:
	ldd r18,Y+7
	ldd r19,Y+8
	ldd r20,Y+9
	ldd r21,Y+10
	movw r24,r16
	call st_clust
	.stabn	68,0,5027,.LM1213-.LFBB39
.LM1213:
	clr r4
	inc r4
	movw r30,r16
	std Z+3,r4
	.stabn	68,0,5029,.LM1214-.LFBB39
.LM1214:
	movw r24,r28
	adiw r24,1
	call dir_register
	movw r14,r24
	.stabn	68,0,5032,.LM1215-.LFBB39
.LM1215:
	or r24,r25
	brne .L609
	.stabn	68,0,5045,.LM1216-.LFBB39
.LM1216:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB280:
.LBB281:
	.stabn	68,0,660,.LM1217-.LFBB39
.LM1217:
	std Z+22,__zero_reg__
	.stabn	68,0,661,.LM1218-.LFBB39
.LM1218:
	std Z+23,__zero_reg__
	.stabn	68,0,662,.LM1219-.LFBB39
.LM1219:
	std Z+24,r5
	.stabn	68,0,663,.LM1220-.LFBB39
.LM1220:
	std Z+25,r6
.LBE281:
.LBE280:
	.stabn	68,0,5046,.LM1221-.LFBB39
.LM1221:
	ldd r16,Y+41
	ldd r17,Y+42
	ldd r22,Y+27
	ldd r23,Y+28
	movw r20,r10
	movw r18,r8
	movw r24,r16
	call st_clust
	.stabn	68,0,5047,.LM1222-.LFBB39
.LM1222:
	ldd r30,Y+27
	ldd r31,Y+28
	.stabn	68,0,5047,.LM1223-.LFBB39
.LM1223:
	std Z+11,r7
	.stabn	68,0,5048,.LM1224-.LFBB39
.LM1224:
	movw r30,r16
	std Z+3,r4
	.stabn	68,0,5051,.LM1225-.LFBB39
.LM1225:
	movw r24,r16
	call sync_fs
	movw r14,r24
.L607:
	.stabn	68,0,5061,.LM1226-.LFBB39
.LM1226:
	movw r24,r14
/* epilogue start */
	adiw r28,44
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L613:
	.stabn	68,0,5011,.LM1227-.LFBB39
.LM1227:
	ldi r19,lo8(7)
	mov r14,r19
	mov r15,__zero_reg__
.L609:
	.stabn	68,0,5054,.LM1228-.LFBB39
.LM1228:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call remove_chain.isra.0
	rjmp .L607
.L612:
	.stabn	68,0,5003,.LM1229-.LFBB39
.LM1229:
	ldi r24,lo8(8)
	mov r14,r24
	mov r15,__zero_reg__
	.stabn	68,0,5060,.LM1230-.LFBB39
.LM1230:
	rjmp .L607
	.size	f_mkdir, .-f_mkdir
	.stabs	"res:r(0,24)",64,0,0,14
	.stabs	"dj:(0,39)",128,0,0,1
	.stabs	"fs:(0,8)",128,0,0,41
	.stabs	"dcl:r(0,1)",64,0,0,8
	.stabn	192,0,0,.LFBB39-.LFBB39
	.stabn	224,0,0,.Lscope39-.LFBB39
.Lscope39:
	.stabs	"f_rename:F(0,24)",36,0,0,f_rename
	.stabs	"path_old:p(0,23)",160,0,0,115
	.stabs	"path_new:p(0,23)",160,0,0,117
.global	f_rename
	.type	f_rename, @function
f_rename:
	.stabn	68,0,5074,.LM1231-.LFBB40
.LM1231:
.LFBB40:
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,118
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 118 */
/* stack size = 130 */
.L__stack_usage = 130
	adiw r28,115-62
	std Y+63,r25
	std Y+62,r24
	sbiw r28,115-62
	adiw r28,117-62
	std Y+63,r23
	std Y+62,r22
	sbiw r28,117-62
	.stabn	68,0,5083,.LM1232-.LFBB40
.LM1232:
	movw r24,r28
	subi r24,-117
	sbci r25,-1
	call get_ldnumber
	.stabn	68,0,5084,.LM1233-.LFBB40
.LM1233:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-113
	sbci r23,-1
	movw r24,r28
	subi r24,-115
	sbci r25,-1
	call mount_volume
	movw r18,r24
	.stabn	68,0,5085,.LM1234-.LFBB40
.LM1234:
	or r24,r25
	breq .+2
	rjmp .L618
	.stabn	68,0,5086,.LM1235-.LFBB40
.LM1235:
	adiw r28,113-62
	ldd r16,Y+62
	ldd r17,Y+63
	sbiw r28,113-62
	std Y+42,r17
	std Y+41,r16
	.stabn	68,0,5088,.LM1236-.LFBB40
.LM1236:
	adiw r28,115-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,115-62
	movw r24,r28
	adiw r24,41
	call follow_path
	movw r18,r24
	.stabn	68,0,5089,.LM1237-.LFBB40
.LM1237:
	or r24,r25
	breq .+2
	rjmp .L618
	.stabn	68,0,5089,.LM1238-.LFBB40
.LM1238:
	adiw r28,80-63
	ldd r24,Y+63
	sbiw r28,80-63
	andi r24,lo8(-96)
	.stabn	68,0,5089,.LM1239-.LFBB40
.LM1239:
	ldi r18,lo8(6)
	ldi r19,0
	.stabn	68,0,5089,.LM1240-.LFBB40
.LM1240:
	breq .+2
	rjmp .L618
	.stabn	68,0,5123,.LM1241-.LFBB40
.LM1241:
	adiw r28,67-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,67-62
	.stabn	68,0,5123,.LM1242-.LFBB40
.LM1242:
	ldi r24,lo8(32)
	movw r30,r14
	movw r26,r28
	subi r26,-81
	sbci r27,-1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,5124,.LM1243-.LFBB40
.LM1243:
	ldi r24,lo8(40)
	movw r30,r28
	adiw r30,41
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r12,r18
	movw r26,r18
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,5125,.LM1244-.LFBB40
.LM1244:
	adiw r28,117-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,117-62
	movw r24,r18
	call follow_path
	movw r18,r24
	movw r24,r12
	.stabn	68,0,5126,.LM1245-.LFBB40
.LM1245:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L620
	.stabn	68,0,5127,.LM1246-.LFBB40
.LM1246:
	ldd r8,Y+7
	ldd r9,Y+8
	ldd r10,Y+9
	ldd r11,Y+10
	ldd r20,Y+47
	ldd r21,Y+48
	ldd r22,Y+49
	ldd r23,Y+50
	cp r8,r20
	cpc r9,r21
	cpc r10,r22
	cpc r11,r23
	brne .L628
	.stabn	68,0,5127,.LM1247-.LFBB40
.LM1247:
	ldd r8,Y+15
	ldd r9,Y+16
	ldd r10,Y+17
	ldd r11,Y+18
	ldd r20,Y+55
	ldd r21,Y+56
	ldd r22,Y+57
	ldd r23,Y+58
	cp r8,r20
	cpc r9,r21
	cpc r10,r22
	cpc r11,r23
	breq .L621
.L628:
	.stabn	68,0,5127,.LM1248-.LFBB40
.LM1248:
	ldi r18,lo8(8)
	ldi r19,0
	rjmp .L618
.L620:
	.stabn	68,0,5129,.LM1249-.LFBB40
.LM1249:
	cpi r18,4
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L618
.L621:
	.stabn	68,0,5130,.LM1250-.LFBB40
.LM1250:
	call dir_register
	movw r18,r24
	.stabn	68,0,5131,.LM1251-.LFBB40
.LM1251:
	or r24,r25
	breq .+2
	rjmp .L618
	.stabn	68,0,5132,.LM1252-.LFBB40
.LM1252:
	ldd r22,Y+27
	ldd r23,Y+28
	.stabn	68,0,5133,.LM1253-.LFBB40
.LM1253:
	movw r26,r22
	adiw r26,13
	.stabn	68,0,5133,.LM1254-.LFBB40
.LM1254:
	ldi r30,lo8(81)
	ldi r31,0
	add r30,r28
	adc r31,r29
	adiw r30,13
	ldi r24,lo8(19)
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,5134,.LM1255-.LFBB40
.LM1255:
	adiw r28,92-63
	ldd r24,Y+63
	sbiw r28,92-63
	.stabn	68,0,5135,.LM1256-.LFBB40
.LM1256:
	sbrs r24,4
	rjmp .L622
.L630:
	.stabn	68,0,5135,.LM1257-.LFBB40
.LM1257:
	movw r30,r22
	std Z+11,r24
	.stabn	68,0,5136,.LM1258-.LFBB40
.LM1258:
	clr r13
	inc r13
	movw r30,r16
	std Z+3,r13
	.stabn	68,0,5137,.LM1259-.LFBB40
.LM1259:
	movw r30,r22
	ldd r24,Z+11
	sbrs r24,4
	rjmp .L625
	.stabn	68,0,5137,.LM1260-.LFBB40
.LM1260:
	ldd r8,Y+47
	ldd r9,Y+48
	ldd r10,Y+49
	ldd r11,Y+50
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	cp r8,r24
	cpc r9,r25
	cpc r10,r26
	cpc r11,r27
	breq .L625
	.stabn	68,0,5138,.LM1261-.LFBB40
.LM1261:
	movw r30,r16
	ld r24,Z
	call ld_clust.isra.0
	movw r20,r22
	movw r22,r24
	movw r24,r16
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,5140,.LM1262-.LFBB40
.LM1262:
	ldi r18,lo8(2)
	ldi r19,0
	.stabn	68,0,5139,.LM1263-.LFBB40
.LM1263:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L618
	.stabn	68,0,5143,.LM1264-.LFBB40
.LM1264:
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,5145,.LM1265-.LFBB40
.LM1265:
	or r24,r25
	brne .L618
	.stabn	68,0,5145,.LM1266-.LFBB40
.LM1266:
	movw r30,r16
	subi r30,-80
	sbci r31,-1
	.stabn	68,0,5145,.LM1267-.LFBB40
.LM1267:
	ld r24,Z
	cpi r24,lo8(46)
	brne .L625
	.stabn	68,0,5146,.LM1268-.LFBB40
.LM1268:
	ldd r18,Y+7
	ldd r19,Y+8
	ldd r20,Y+9
	ldd r21,Y+10
	movw r22,r16
	subi r22,-79
	sbci r23,-1
	movw r24,r16
	call st_clust
	.stabn	68,0,5147,.LM1269-.LFBB40
.LM1269:
	movw r30,r16
	std Z+3,r13
.L625:
.LBB284:
.LBB285:
	.stabn	68,0,2545,.LM1270-.LFBB40
.LM1270:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,2567,.LM1271-.LFBB40
.LM1271:
	adiw r28,63-60
	ldd r20,Y+60
	ldd r21,Y+61
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,63-60
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,2568,.LM1272-.LFBB40
.LM1272:
	or r24,r25
	brne .L618
	.stabn	68,0,2569,.LM1273-.LFBB40
.LM1273:
	ldi r24,lo8(-27)
	movw r30,r14
	st Z,r24
	.stabn	68,0,2570,.LM1274-.LFBB40
.LM1274:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+3,r24
.LBE285:
.LBE284:
	.stabn	68,0,5157,.LM1275-.LFBB40
.LM1275:
	movw r24,r16
	call sync_fs
	movw r18,r24
.L618:
	.stabn	68,0,5166,.LM1276-.LFBB40
.LM1276:
	movw r24,r18
/* epilogue start */
	subi r28,-118
	sbci r29,-1
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
	pop r9
	pop r8
	ret
.L622:
	.stabn	68,0,5135,.LM1277-.LFBB40
.LM1277:
	ori r24,lo8(32)
	rjmp .L630
	.size	f_rename, .-f_rename
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"djo:(0,39)",128,0,0,41
	.stabs	"djn:(0,39)",128,0,0,1
	.stabs	"fs:(0,8)",128,0,0,113
	.stabs	"buf:(0,53)=ar(0,15);0;31;(0,5)",128,0,0,81
	.stabs	"sect:r(0,7)",64,0,0,20
	.stabn	192,0,0,.LFBB40-.LFBB40
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:r(0,8)",64,0,0,12
	.stabn	192,0,0,.LBB285-.LFBB40
	.stabn	224,0,0,.LBE285-.LFBB40
	.stabn	224,0,0,.Lscope40-.LFBB40
.Lscope40:
	.stabs	"f_gets:F(0,54)=*(0,20)",36,0,0,f_gets
	.stabs	"len:P(0,18)",64,0,0,22
.global	f_gets
	.type	f_gets, @function
f_gets:
	.stabn	68,0,6343,.LM1278-.LFBB41
.LM1278:
.LFBB41:
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r14,r24
	mov r9,r20
	mov r8,r21
	.stabn	68,0,6444,.LM1279-.LFBB41
.LM1279:
	movw r10,r22
	ldi r24,1
	sub r10,r24
	sbc r11,__zero_reg__
	.stabn	68,0,6345,.LM1280-.LFBB41
.LM1280:
	movw r16,r14
	.stabn	68,0,6344,.LM1281-.LFBB41
.LM1281:
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L632:
	.stabn	68,0,6445,.LM1282-.LFBB41
.LM1282:
	cp r12,r10
	cpc r13,r11
	brge .L633
	.stabn	68,0,6446,.LM1283-.LFBB41
.LM1283:
	movw r18,r28
	subi r18,-5
	sbci r19,-1
	ldi r20,lo8(1)
	ldi r21,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	mov r24,r9
	mov r25,r8
	call f_read
	.stabn	68,0,6447,.LM1284-.LFBB41
.LM1284:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,1
	brne .L633
	.stabn	68,0,6448,.LM1285-.LFBB41
.LM1285:
	ldd r24,Y+1
	.stabn	68,0,6450,.LM1286-.LFBB41
.LM1286:
	movw r30,r16
	st Z+,r24
	movw r16,r30
	.stabn	68,0,6450,.LM1287-.LFBB41
.LM1287:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	.stabn	68,0,6451,.LM1288-.LFBB41
.LM1288:
	cpi r24,lo8(10)
	brne .L632
.L633:
	.stabn	68,0,6455,.LM1289-.LFBB41
.LM1289:
	movw r30,r16
	st Z,__zero_reg__
	.stabn	68,0,6456,.LM1290-.LFBB41
.LM1290:
	or r12,r13
	brne .L635
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L635:
	.stabn	68,0,6457,.LM1291-.LFBB41
.LM1291:
	movw r24,r14
/* epilogue start */
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
	pop r9
	pop r8
	ret
	.size	f_gets, .-f_gets
	.stabs	"nc:r(0,18)",64,0,0,12
	.stabs	"s:(0,55)=ar(0,15);0;3;(0,5)",128,0,0,1
	.stabs	"rc:(0,19)",128,0,0,5
	.stabn	192,0,0,.LFBB41-.LFBB41
	.stabn	224,0,0,.Lscope41-.LFBB41
.Lscope41:
	.stabs	"f_putc:F(0,18)",36,0,0,f_putc
	.stabs	"c:P(0,20)",64,0,0,24
	.stabs	"fp:P(0,42)",64,0,0,22
.global	f_putc
	.type	f_putc, @function
f_putc:
	.stabn	68,0,6644,.LM1292-.LFBB42
.LM1292:
.LFBB42:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,70
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 70 */
/* stack size = 72 */
.L__stack_usage = 72
.LBB288:
.LBB289:
	.stabn	68,0,6634,.LM1293-.LFBB42
.LM1293:
	movw r30,r28
	adiw r30,3
	ldi r25,lo8(68)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r25
	brne 0b
	.stabn	68,0,6635,.LM1294-.LFBB42
.LM1294:
	std Y+2,r23
	std Y+1,r22
.LBE289:
.LBE288:
	.stabn	68,0,6649,.LM1295-.LFBB42
.LM1295:
	mov r22,r24
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6650,.LM1296-.LFBB42
.LM1296:
	movw r24,r28
	adiw r24,1
	call putc_flush
/* epilogue start */
	.stabn	68,0,6651,.LM1297-.LFBB42
.LM1297:
	subi r28,-70
	sbci r29,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	f_putc, .-f_putc
	.stabs	"pb:(0,49)",128,0,0,1
	.stabs	"putbuff:t(0,49)",128,0,0,0
	.stabn	192,0,0,.LFBB42-.LFBB42
	.stabn	224,0,0,.Lscope42-.LFBB42
.Lscope42:
	.stabs	"f_puts:F(0,18)",36,0,0,f_puts
	.stabs	"fp:P(0,42)",64,0,0,22
.global	f_puts
	.type	f_puts, @function
f_puts:
	.stabn	68,0,6664,.LM1298-.LFBB43
.LM1298:
.LFBB43:
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,70
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 70 */
/* stack size = 74 */
.L__stack_usage = 74
.LBB292:
.LBB293:
	.stabn	68,0,6634,.LM1299-.LFBB43
.LM1299:
	movw r30,r28
	adiw r30,3
	ldi r18,lo8(68)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r18
	brne 0b
	.stabn	68,0,6635,.LM1300-.LFBB43
.LM1300:
	std Y+2,r23
	std Y+1,r22
	movw r16,r24
.L639:
.LBE293:
.LBE292:
	.stabn	68,0,6669,.LM1301-.LFBB43
.LM1301:
	movw r30,r16
	ld r22,Z+
	movw r16,r30
	.stabn	68,0,6669,.LM1302-.LFBB43
.LM1302:
	movw r24,r28
	adiw r24,1
	.stabn	68,0,6669,.LM1303-.LFBB43
.LM1303:
	cpse r22,__zero_reg__
	rjmp .L640
	.stabn	68,0,6670,.LM1304-.LFBB43
.LM1304:
	call putc_flush
/* epilogue start */
	.stabn	68,0,6671,.LM1305-.LFBB43
.LM1305:
	subi r28,-70
	sbci r29,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L640:
	.stabn	68,0,6669,.LM1306-.LFBB43
.LM1306:
	call putc_bfd
	rjmp .L639
	.size	f_puts, .-f_puts
	.stabs	"pb:(0,49)",128,0,0,1
	.stabn	192,0,0,.LFBB43-.LFBB43
	.stabn	224,0,0,.Lscope43-.LFBB43
.Lscope43:
	.stabs	"f_printf:F(0,18)",36,0,0,f_printf
	.stabs	"long int:t(0,56)=r(0,56);-2147483648;2147483647;",128,0,0,0
	.stabs	"fp:p(0,42)",160,0,0,135
	.stabs	"fmt:p(0,23)",160,0,0,137
.global	f_printf
	.type	f_printf, @function
f_printf:
	.stabn	68,0,6806,.LM1307-.LFBB44
.LM1307:
.LFBB44:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,113
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 113 */
/* stack size = 131 */
.L__stack_usage = 131
	subi r28,lo8(-137)
	sbci r29,hi8(-137)
	ld r30,Y
	ldd r31,Y+1
	subi r28,lo8(137)
	sbci r29,hi8(137)
	.stabn	68,0,6817,.LM1308-.LFBB44
.LM1308:
	adiw r28,103-63
	std Y+63,__zero_reg__
	sbiw r28,103-63
.LBB296:
.LBB297:
	.stabn	68,0,6634,.LM1309-.LFBB44
.LM1309:
	movw r18,r28
	subi r18,-3
	sbci r19,-1
	ldi r24,lo8(68)
	movw r26,r18
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,6635,.LM1310-.LFBB44
.LM1310:
	subi r28,lo8(-135)
	sbci r29,hi8(-135)
	ld r24,Y
	ldd r25,Y+1
	subi r28,lo8(135)
	sbci r29,hi8(135)
	std Y+2,r25
	std Y+1,r24
.LBE297:
.LBE296:
	.stabn	68,0,6823,.LM1311-.LFBB44
.LM1311:
	movw r6,r28
	ldi r27,-117
	add r6,r27
	adc r7,__zero_reg__
	subi r18,-68
	sbci r19,-1
	adiw r28,104-62
	std Y+63,r19
	std Y+62,r18
	sbiw r28,104-62
.L642:
	.stabn	68,0,6826,.LM1312-.LFBB44
.LM1312:
	ld r22,Z
	.stabn	68,0,6827,.LM1313-.LFBB44
.LM1313:
	tst r22
	brne .+2
	rjmp .L643
	.stabn	68,0,6826,.LM1314-.LFBB44
.LM1314:
	movw r16,r30
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,6828,.LM1315-.LFBB44
.LM1315:
	cpi r22,lo8(37)
	breq .+2
	rjmp .L661
	.stabn	68,0,6833,.LM1316-.LFBB44
.LM1316:
	ldd r22,Z+1
	.stabn	68,0,6835,.LM1317-.LFBB44
.LM1317:
	movw r16,r30
	.stabn	68,0,6834,.LM1318-.LFBB44
.LM1318:
	cpi r22,lo8(48)
	brne .L646
	.stabn	68,0,6835,.LM1319-.LFBB44
.LM1319:
	subi r16,-3
	sbci r17,-1
	.stabn	68,0,6835,.LM1320-.LFBB44
.LM1320:
	ldi r19,lo8(48)
	adiw r28,110-63
	std Y+63,r19
	sbiw r28,110-63
	.stabn	68,0,6835,.LM1321-.LFBB44
.LM1321:
	ldd r22,Z+2
.L718:
	.stabn	68,0,6832,.LM1322-.LFBB44
.LM1322:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
.L647:
	.stabn	68,0,6839,.LM1323-.LFBB44
.LM1323:
	cpi r22,lo8(42)
	breq .+2
	rjmp .L693
	.stabn	68,0,6840,.LM1324-.LFBB44
.LM1324:
	movw r26,r6
	.stabn	68,0,6840,.LM1325-.LFBB44
.LM1325:
	ld r30,X+
	ld r31,X+
	adiw r28,106-62
	std Y+63,r31
	std Y+62,r30
	sbiw r28,106-62
	.stabn	68,0,6841,.LM1326-.LFBB44
.LM1326:
	movw r30,r16
	.stabn	68,0,6841,.LM1327-.LFBB44
.LM1327:
	ld r22,Z+
	.stabn	68,0,6840,.LM1328-.LFBB44
.LM1328:
	movw r6,r26
	.stabn	68,0,6841,.LM1329-.LFBB44
.LM1329:
	movw r16,r30
.L650:
	.stabn	68,0,6832,.LM1330-.LFBB44
.LM1330:
	clr r14
	dec r14
	clr r15
	dec r15
	.stabn	68,0,6848,.LM1331-.LFBB44
.LM1331:
	cpi r22,lo8(46)
	breq .+2
	rjmp .L652
	.stabn	68,0,6849,.LM1332-.LFBB44
.LM1332:
	movw r30,r16
	ld r22,Z
	.stabn	68,0,6850,.LM1333-.LFBB44
.LM1333:
	cpi r22,lo8(42)
	brne .+2
	rjmp .L653
	.stabn	68,0,6849,.LM1334-.LFBB44
.LM1334:
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,6854,.LM1335-.LFBB44
.LM1335:
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L654:
	.stabn	68,0,6855,.LM1336-.LFBB44
.LM1336:
	ldi r24,lo8(-48)
	add r24,r22
	cpi r24,lo8(10)
	brlo .+2
	rjmp .L652
	.stabn	68,0,6856,.LM1337-.LFBB44
.LM1337:
	ldi r27,lo8(10)
	mul r27,r14
	movw r24,r0
	mul r27,r15
	add r25,r0
	clr __zero_reg__
	.stabn	68,0,6856,.LM1338-.LFBB44
.LM1338:
	add r24,r22
	adc r25,__zero_reg__
	.stabn	68,0,6856,.LM1339-.LFBB44
.LM1339:
	movw r14,r24
	ldi r30,48
	sub r14,r30
	sbc r15,__zero_reg__
	.stabn	68,0,6857,.LM1340-.LFBB44
.LM1340:
	movw r30,r16
	.stabn	68,0,6857,.LM1341-.LFBB44
.LM1341:
	ld r22,Z+
	.stabn	68,0,6857,.LM1342-.LFBB44
.LM1342:
	movw r16,r30
	rjmp .L654
.L646:
	.stabn	68,0,6836,.LM1343-.LFBB44
.LM1343:
	cpi r22,lo8(45)
	breq .L648
	.stabn	68,0,6833,.LM1344-.LFBB44
.LM1344:
	subi r16,-2
	sbci r17,-1
	.stabn	68,0,6832,.LM1345-.LFBB44
.LM1345:
	ldi r20,lo8(32)
	adiw r28,110-63
	std Y+63,r20
	sbiw r28,110-63
	rjmp .L718
.L648:
	.stabn	68,0,6837,.LM1346-.LFBB44
.LM1346:
	subi r16,-3
	sbci r17,-1
	.stabn	68,0,6837,.LM1347-.LFBB44
.LM1347:
	ldd r22,Z+2
	.stabn	68,0,6832,.LM1348-.LFBB44
.LM1348:
	ldi r24,lo8(32)
	adiw r28,110-63
	std Y+63,r24
	sbiw r28,110-63
	.stabn	68,0,6837,.LM1349-.LFBB44
.LM1349:
	ldi r24,lo8(2)
	mov r8,r24
	mov r9,__zero_reg__
	rjmp .L647
.L651:
	.stabn	68,0,6844,.LM1350-.LFBB44
.LM1350:
	ldi r20,lo8(10)
	adiw r28,106-62
	ldd r18,Y+62
	ldd r19,Y+63
	sbiw r28,106-62
	mul r20,r18
	movw r24,r0
	mul r20,r19
	add r25,r0
	clr __zero_reg__
	.stabn	68,0,6844,.LM1351-.LFBB44
.LM1351:
	add r24,r22
	adc r25,__zero_reg__
	.stabn	68,0,6844,.LM1352-.LFBB44
.LM1352:
	movw r26,r24
	sbiw r26,48
	adiw r28,106-62
	std Y+63,r27
	std Y+62,r26
	sbiw r28,106-62
	.stabn	68,0,6845,.LM1353-.LFBB44
.LM1353:
	movw r30,r16
	.stabn	68,0,6845,.LM1354-.LFBB44
.LM1354:
	ld r22,Z+
	.stabn	68,0,6845,.LM1355-.LFBB44
.LM1355:
	movw r16,r30
.L649:
	.stabn	68,0,6843,.LM1356-.LFBB44
.LM1356:
	ldi r24,lo8(-48)
	add r24,r22
	cpi r24,lo8(10)
	brlo .L651
	rjmp .L650
.L693:
	.stabn	68,0,6832,.LM1357-.LFBB44
.LM1357:
	adiw r28,106-63
	std Y+63,__zero_reg__
	sbiw r28,106-63
	adiw r28,107-63
	std Y+63,__zero_reg__
	sbiw r28,107-63
	rjmp .L649
.L653:
	.stabn	68,0,6851,.LM1358-.LFBB44
.LM1358:
	movw r30,r6
	ld r14,Z+
	ld r15,Z+
	.stabn	68,0,6852,.LM1359-.LFBB44
.LM1359:
	movw r26,r16
	adiw r26,1
	ld r22,X
	.stabn	68,0,6851,.LM1360-.LFBB44
.LM1360:
	movw r6,r30
	.stabn	68,0,6852,.LM1361-.LFBB44
.LM1361:
	subi r16,-2
	sbci r17,-1
.L652:
	.stabn	68,0,6861,.LM1362-.LFBB44
.LM1362:
	cpi r22,lo8(108)
	brne .L656
	.stabn	68,0,6862,.LM1363-.LFBB44
.LM1363:
	set
	bld r8,2
	.stabn	68,0,6862,.LM1364-.LFBB44
.LM1364:
	movw r30,r16
	.stabn	68,0,6862,.LM1365-.LFBB44
.LM1365:
	ld r22,Z+
	.stabn	68,0,6862,.LM1366-.LFBB44
.LM1366:
	movw r16,r30
.L656:
	.stabn	68,0,6869,.LM1367-.LFBB44
.LM1367:
	tst r22
	brne .+2
	rjmp .L643
	.stabn	68,0,6870,.LM1368-.LFBB44
.LM1368:
	cpi r22,lo8(111)
	brne .+2
	rjmp .L695
	brsh .L658
	cpi r22,lo8(99)
	brne .+2
	rjmp .L659
	brsh .L660
	cpi r22,lo8(88)
	brne .+2
	rjmp .L700
	.stabn	68,0,6872,.LM1369-.LFBB44
.LM1369:
	ldi r24,lo8(2)
	.stabn	68,0,6870,.LM1370-.LFBB44
.LM1370:
	cpi r22,lo8(98)
	brne .+2
	rjmp .L719
.L661:
	.stabn	68,0,6904,.LM1371-.LFBB44
.LM1371:
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6904,.LM1372-.LFBB44
.LM1372:
	rjmp .L645
.L660:
	.stabn	68,0,6870,.LM1373-.LFBB44
.LM1373:
	cpi r22,lo8(100)
	brne .L661
.L699:
	ldi r24,lo8(10)
	rjmp .L719
.L658:
	cpi r22,lo8(117)
	breq .L699
	cpi r22,lo8(120)
	brne .+2
	rjmp .L700
	cpi r22,lo8(115)
	brne .L661
	.stabn	68,0,6885,.LM1374-.LFBB44
.LM1374:
	movw r30,r6
	ld r10,Z
	ldd r11,Z+1
	ldi r27,2
	add r6,r27
	adc r7,__zero_reg__
	.stabn	68,0,6886,.LM1375-.LFBB44
.LM1375:
	cp r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L663
	.stabn	68,0,6886,.LM1376-.LFBB44
.LM1376:
	movw r10,r28
	ldi r30,103
	add r10,r30
	adc r11,__zero_reg__
.L663:
	movw r30,r10
	.stabn	68,0,6887,.LM1377-.LFBB44
.LM1377:
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L664:
	.stabn	68,0,6887,.LM1378-.LFBB44
.LM1378:
	ld r24,Z+
	.stabn	68,0,6887,.LM1379-.LFBB44
.LM1379:
	cpse r24,__zero_reg__
	rjmp .L665
	.stabn	68,0,6888,.LM1380-.LFBB44
.LM1380:
	sbrc r15,7
	rjmp .L666
	cp r14,r12
	cpc r15,r13
	brsh .L666
	movw r12,r14
.L666:
	.stabn	68,0,6889,.LM1381-.LFBB44
.LM1381:
	ldi r19,2
	and r8,r19
	clr r9
.L668:
	.stabn	68,0,6889,.LM1382-.LFBB44
.LM1382:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	breq .L669
.L672:
	add r14,r10
	adc r15,r11
.L670:
	.stabn	68,0,6890,.LM1383-.LFBB44
.LM1383:
	movw r26,r10
	ld r22,X
	.stabn	68,0,6890,.LM1384-.LFBB44
.LM1384:
	tst r22
	breq .L675
	.stabn	68,0,6890,.LM1385-.LFBB44
.LM1385:
	cp r10,r14
	cpc r11,r15
	brne .L674
.L675:
	.stabn	68,0,6891,.LM1386-.LFBB44
.LM1386:
	adiw r28,106-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,106-62
	cp r12,r30
	cpc r13,r31
	brsh .L645
	.stabn	68,0,6891,.LM1387-.LFBB44
.LM1387:
	ldi r22,lo8(32)
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r27,-1
	sub r12,r27
	sbc r13,r27
	rjmp .L675
.L659:
	.stabn	68,0,6882,.LM1388-.LFBB44
.LM1388:
	movw r14,r6
	ldi r31,2
	add r14,r31
	adc r15,__zero_reg__
	.stabn	68,0,6882,.LM1389-.LFBB44
.LM1389:
	movw r26,r6
	ld r22,X
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6882,.LM1390-.LFBB44
.LM1390:
	movw r6,r14
.L645:
	movw r30,r16
	rjmp .L642
.L665:
	.stabn	68,0,6887,.LM1391-.LFBB44
.LM1391:
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	rjmp .L664
.L669:
	.stabn	68,0,6889,.LM1392-.LFBB44
.LM1392:
	adiw r28,106-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,106-62
	cp r12,r24
	cpc r13,r25
	brsh .L672
	.stabn	68,0,6889,.LM1393-.LFBB44
.LM1393:
	adiw r28,110-63
	ldd r22,Y+63
	sbiw r28,110-63
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r20,-1
	sub r12,r20
	sbc r13,r20
	rjmp .L668
.L674:
	.stabn	68,0,6890,.LM1394-.LFBB44
.LM1394:
	ldi r25,-1
	sub r10,r25
	sbc r11,r25
	.stabn	68,0,6890,.LM1395-.LFBB44
.LM1395:
	movw r24,r28
	adiw r24,1
	call putc_bfd
	rjmp .L670
.L695:
	.stabn	68,0,6874,.LM1396-.LFBB44
.LM1396:
	ldi r24,lo8(8)
.L719:
	.stabn	68,0,6880,.LM1397-.LFBB44
.LM1397:
	ldi r25,0
	.stabn	68,0,6882,.LM1398-.LFBB44
.LM1398:
	movw r30,r6
	.stabn	68,0,6922,.LM1399-.LFBB44
.LM1399:
	sbrs r8,2
	rjmp .L677
	.stabn	68,0,6923,.LM1400-.LFBB44
.LM1400:
	ldi r18,4
	add r6,r18
	adc r7,__zero_reg__
	.stabn	68,0,6923,.LM1401-.LFBB44
.LM1401:
	ld r2,Z
	ldd r3,Z+1
	ldd r4,Z+2
	ldd r5,Z+3
	.stabn	68,0,6927,.LM1402-.LFBB44
.LM1402:
	cpi r22,lo8(100)
	brne .L679
.L678:
	.stabn	68,0,6927,.LM1403-.LFBB44
.LM1403:
	sbrs r5,7
	rjmp .L681
	.stabn	68,0,6928,.LM1404-.LFBB44
.LM1404:
	com r5
	com r4
	com r3
	com r2
	adc r2,__zero_reg__
	adc r3,__zero_reg__
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,6928,.LM1405-.LFBB44
.LM1405:
	set
	bld r8,0
.L681:
	ldi r26,lo8(7)
	adiw r28,113-63
	std Y+63,r26
	sbiw r28,113-63
	rjmp .L682
.L700:
	.stabn	68,0,6880,.LM1406-.LFBB44
.LM1406:
	ldi r24,lo8(16)
	rjmp .L719
.L677:
	.stabn	68,0,6882,.LM1407-.LFBB44
.LM1407:
	ldi r19,2
	add r6,r19
	adc r7,__zero_reg__
	.stabn	68,0,6925,.LM1408-.LFBB44
.LM1408:
	ld r2,Z
	ldd r3,Z+1
	mov r5,__zero_reg__
	mov r4,__zero_reg__
	cpi r22,lo8(100)
	brne .L679
	mov __tmp_reg__,r3
	lsl r0
	sbc r4,r4
	sbc r5,r5
	rjmp .L678
.L679:
	cpi r22,lo8(120)
	brne .L681
	ldi r20,lo8(39)
	adiw r28,113-63
	std Y+63,r20
	sbiw r28,113-63
.L682:
	.stabn	68,0,6880,.LM1409-.LFBB44
.LM1409:
	movw r30,r28
	subi r30,-71
	sbci r31,-1
	adiw r28,111-62
	std Y+63,r31
	std Y+62,r30
	sbiw r28,111-62
	.stabn	68,0,6931,.LM1410-.LFBB44
.LM1410:
	adiw r28,108-63
	std Y+63,__zero_reg__
	sbiw r28,108-63
	adiw r28,109-63
	std Y+63,__zero_reg__
	sbiw r28,109-63
	.stabn	68,0,6933,.LM1411-.LFBB44
.LM1411:
	movw r10,r24
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L685:
	movw r24,r4
	movw r22,r2
	movw r20,r12
	movw r18,r10
	call __udivmodsi4
	mov r23,r18
	mov r30,r19
	mov r31,r20
	mov r25,r21
	.stabn	68,0,6933,.LM1412-.LFBB44
.LM1412:
	mov r24,r22
	movw r20,r4
	movw r18,r2
	.stabn	68,0,6933,.LM1413-.LFBB44
.LM1413:
	mov r2,r23
	mov r3,r30
	mov r4,r31
	mov r5,r25
	.stabn	68,0,6934,.LM1414-.LFBB44
.LM1414:
	cpi r22,lo8(10)
	brlo .L683
	.stabn	68,0,6934,.LM1415-.LFBB44
.LM1415:
	adiw r28,113-63
	ldd r24,Y+63
	sbiw r28,113-63
	add r24,r22
.L683:
	.stabn	68,0,6935,.LM1416-.LFBB44
.LM1416:
	adiw r28,108-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,108-62
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	.stabn	68,0,6935,.LM1417-.LFBB44
.LM1417:
	subi r24,lo8(-(48))
	.stabn	68,0,6935,.LM1418-.LFBB44
.LM1418:
	adiw r28,111-62
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,111-62
	st X+,r24
	adiw r28,111-62
	std Y+63,r27
	std Y+62,r26
	sbiw r28,111-62
	.stabn	68,0,6936,.LM1419-.LFBB44
.LM1419:
	cp r18,r10
	cpc r19,r11
	cpc r20,r12
	cpc r21,r13
	brlo .L684
	.stabn	68,0,6936,.LM1420-.LFBB44
.LM1420:
	ldi r27,32
	cp r14,r27
	cpc r15,__zero_reg__
	breq .+2
	rjmp .L701
	ldi r30,lo8(31)
	adiw r28,108-63
	std Y+63,r30
	sbiw r28,108-63
	adiw r28,109-63
	std Y+63,__zero_reg__
	sbiw r28,109-63
.L684:
	.stabn	68,0,6937,.LM1421-.LFBB44
.LM1421:
	sbrs r8,0
	rjmp .L686
	.stabn	68,0,6937,.LM1422-.LFBB44
.LM1422:
	ldi r30,lo8(71)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r14
	adc r31,r15
	ldi r18,lo8(45)
	st Z,r18
	.stabn	68,0,6937,.LM1423-.LFBB44
.LM1423:
	adiw r28,108-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,108-62
	adiw r24,2
	movw r14,r24
.L686:
	.stabn	68,0,6939,.LM1424-.LFBB44
.LM1424:
	movw r12,r14
	.stabn	68,0,6939,.LM1425-.LFBB44
.LM1425:
	ldi r25,2
	and r8,r25
	clr r9
.L687:
	.stabn	68,0,6939,.LM1426-.LFBB44
.LM1426:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L688
	.stabn	68,0,6939,.LM1427-.LFBB44
.LM1427:
	adiw r28,106-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,106-62
	cp r12,r30
	cpc r13,r31
	brlo .L689
.L688:
	ldi r18,lo8(71)
	ldi r19,0
	add r18,r28
	adc r19,r29
	add r14,r18
	adc r15,r19
.L690:
	.stabn	68,0,6940,.LM1428-.LFBB44
.LM1428:
	movw r26,r14
	ld r22,-X
	movw r14,r26
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6940,.LM1429-.LFBB44
.LM1429:
	adiw r28,104-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,104-62
	cp r14,r30
	cpc r15,r31
	brne .L690
.L691:
	.stabn	68,0,6941,.LM1430-.LFBB44
.LM1430:
	adiw r28,106-62
	ldd r18,Y+62
	ldd r19,Y+63
	sbiw r28,106-62
	cp r12,r18
	cpc r13,r19
	brlo .+2
	rjmp .L645
	.stabn	68,0,6941,.LM1431-.LFBB44
.LM1431:
	ldi r22,lo8(32)
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	rjmp .L691
.L701:
	adiw r28,108-62
	std Y+63,r15
	std Y+62,r14
	sbiw r28,108-62
	rjmp .L685
.L689:
	.stabn	68,0,6939,.LM1432-.LFBB44
.LM1432:
	adiw r28,110-63
	ldd r22,Y+63
	sbiw r28,110-63
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r26,-1
	sub r12,r26
	sbc r13,r26
	rjmp .L687
.L643:
	.stabn	68,0,6946,.LM1433-.LFBB44
.LM1433:
	movw r24,r28
	adiw r24,1
	call putc_flush
/* epilogue start */
	.stabn	68,0,6947,.LM1434-.LFBB44
.LM1434:
	subi r28,-113
	sbci r29,-1
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	f_printf, .-f_printf
	.stabs	"pb:(0,49)",128,0,0,1
	.stabs	"j:r(0,19)",64,0,0,12
	.stabs	"w:(0,19)",128,0,0,106
	.stabs	"f:r(0,19)",64,0,0,8
	.stabs	"r:r(0,19)",64,0,0,24
	.stabs	"prec:r(0,18)",64,0,0,14
	.stabs	"pad:(0,20)",128,0,0,110
	.stabs	"tp:r(0,54)",64,0,0,10
	.stabs	"nul:(0,20)",128,0,0,103
	.stabs	"d:r(0,21)",64,0,0,24
	.stabs	"str:(0,57)=ar(0,15);0;31;(0,21)",128,0,0,71
	.stabs	"fp:r(0,42)",64,0,0,24
	.stabs	"fmt:r(0,23)",64,0,0,30
	.stabn	192,0,0,.LFBB44-.LFBB44
	.stabn	224,0,0,.Lscope44-.LFBB44
.Lscope44:
	.section	.rodata
	.type	ExCvt, @object
	.size	ExCvt, 128
ExCvt:
	.ascii	"\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216"
	.ascii	"\217\220\221\222\223\224\225\226\227\230\231\232\233\234\235"
	.ascii	"\236\237\200\201\202\203\204\205\206\207\210\211\212\213\214"
	.ascii	"\215\216\217\260\261\262\263\264\265\266\267\270\271\272\273"
	.ascii	"\274\275\276\277\300\301\302\303\304\305\306\307\310\311\312"
	.ascii	"\313\314\315\316\317\320\321\322\323\324\325\326\327\330\331"
	.ascii	"\332\333\334\335\336\337\220\221\222\223\224\225\226\227\230"
	.ascii	"\231\232\233\234\235\236\237\360\360\362\362\364\364\366\366"
	.ascii	"\370\371\372\373\374\375\376\377"
	.stabs	"ExCvt:S(0,58)=ar(0,15);0;127;(0,5)",38,0,0,ExCvt
	.local	Fsid
	.comm	Fsid,2,1
	.stabs	"Fsid:S(0,11)",40,0,0,Fsid
	.local	FatFs
	.comm	FatFs,2,1
	.stabs	"FatFs:S(0,59)=ar(0,15);0;0;(0,8)",40,0,0,FatFs
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
