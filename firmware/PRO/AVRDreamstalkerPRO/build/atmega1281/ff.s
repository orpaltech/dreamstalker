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
	.stabn	68,0,629,.LM0-.LFBB1
.LM0:
.LFBB1:
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
	.stabn	68,0,636,.LM1-.LFBB1
.LM1:
	movw r30,r24
	ld r18,Z
	ldd r19,Z+1
	ldd r20,Z+2
	ldd r21,Z+3
	.stabn	68,0,637,.LM2-.LFBB1
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
	.stabs	"fs:P(0,8)=*(0,9)=(0,10)=s560fs_type:(0,5),0,8;pdrv:(0,5),8,8;ldrv:(0,5),16,8;n_fats:(0,5),24,8;wflag:(0,5),32,8;fsi_flag:(0,5),40,8;id:(0,11)=(0,12)=(0,13)=r(0,13);0;65535;,48,16;n_rootdir:(0,11),64,16;csize:(0,11),80,16;last_clst:(0,1),96,32;free_clst:(0,1),128,32;n_fatent:(0,1),160,32;fsize:(0,1),192,32;volbase:(0,7),224,32;fatbase:(0,7),256,32;dirbase:(0,7),288,32;database:(0,7),320,32;winsect:(0,7),352,32;win:(0,14)=ar(0,15)=r(0,15);0;65535;;0;511;(0,5),384,4096;;",64,0,0,30
	.stabs	"clst:P(0,1)",64,0,0,20
	.stabs	"WORD:t(0,11)",128,0,0,0
	.stabs	"uint16_t:t(0,12)",128,0,0,0
	.stabs	"unsigned int:t(0,13)",128,0,0,0
	.type	clst2sect, @function
clst2sect:
	.stabn	68,0,1149,.LM3-.LFBB2
.LM3:
.LFBB2:
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
	movw r30,r24
	.stabn	68,0,1150,.LM4-.LFBB2
.LM4:
	movw r18,r20
	movw r20,r22
	subi r18,2
	sbc r19,__zero_reg__
	sbc r20,__zero_reg__
	sbc r21,__zero_reg__
	.stabn	68,0,1151,.LM5-.LFBB2
.LM5:
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	sbiw r24,2
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,1151,.LM6-.LFBB2
.LM6:
	cp r18,r24
	cpc r19,r25
	cpc r20,r26
	cpc r21,r27
	brsh .L4
	.stabn	68,0,1152,.LM7-.LFBB2
.LM7:
	ldd r26,Z+10
	ldd r27,Z+11
	.stabn	68,0,1152,.LM8-.LFBB2
.LM8:
	call __muluhisi3
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,1152,.LM9-.LFBB2
.LM9:
	ldd r24,Z+40
	ldd r25,Z+41
	ldd r26,Z+42
	ldd r27,Z+43
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
	.stabn	68,0,1153,.LM10-.LFBB2
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
	.stabn	68,0,1151,.LM11-.LFBB2
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
	.stabn	68,0,1871,.LM12-.LFBB3
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
	.stabn	68,0,659,.LM13-.LFBB3
.LM13:
	std Z+27,r17
	std Z+26,r16
.LBE81:
.LBE80:
	.stabn	68,0,1873,.LM14-.LFBB3
.LM14:
	movw r26,r24
	ld r24,X
	cpi r24,lo8(3)
	brne .L5
	.stabn	68,0,1874,.LM15-.LFBB3
.LM15:
	movw r16,r18
	clr r18
	clr r19
.LBB82:
.LBB83:
	.stabn	68,0,659,.LM16-.LFBB3
.LM16:
	std Z+20,r16
	.stabn	68,0,660,.LM17-.LFBB3
.LM17:
	std Z+21,r17
.L5:
/* epilogue start */
.LBE83:
.LBE82:
	.stabn	68,0,1876,.LM18-.LFBB3
.LM18:
	pop r17
	pop r16
	ret
	.size	st_clust, .-st_clust
.Lscope3:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sd"
	.text
	.stabs	"get_ldnumber:f(0,18)=r(0,18);-32768;32767;",36,0,0,get_ldnumber
	.stabs	"int:t(0,18)",128,0,0,0
	.stabs	"UINT:t(0,19)=(0,13)",128,0,0,0
	.stabs	"TCHAR:t(0,20)=(0,21)=r(0,21);0;255;",128,0,0,0
	.stabs	"char:t(0,21)",128,0,0,0
	.stabs	"path:P(0,22)=*(0,23)=*(0,20)",64,0,0,26
	.type	get_ldnumber, @function
get_ldnumber:
	.stabn	68,0,3142,.LM19-.LFBB4
.LM19:
.LFBB4:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	.stabn	68,0,3153,.LM20-.LFBB4
.LM20:
	ld r30,X+
	ld r31,X
	sbiw r26,1
	.stabn	68,0,3154,.LM21-.LFBB4
.LM21:
	sbiw r30,0
	breq .L30
	movw r24,r30
.L10:
	movw r28,r24
	.stabn	68,0,3156,.LM22-.LFBB4
.LM22:
	ld r18,Y
	adiw r24,1
	.stabn	68,0,3157,.LM23-.LFBB4
.LM23:
	cpi r18,lo8(33)
	brlo .L9
	.stabn	68,0,3157,.LM24-.LFBB4
.LM24:
	cpi r18,lo8(58)
	brne .L10
	.stabn	68,0,3161,.LM25-.LFBB4
.LM25:
	movw r18,r30
	subi r18,-2
	sbci r19,-1
	.stabn	68,0,3161,.LM26-.LFBB4
.LM26:
	cp r24,r18
	cpc r25,r19
	brne .L30
	.stabn	68,0,3177,.LM27-.LFBB4
.LM27:
	ld r18,Z
	cpi r18,lo8(48)
	brne .L30
	.stabn	68,0,3179,.LM28-.LFBB4
.LM28:
	st X+,r24
	st X,r25
.L31:
	.stabn	68,0,3208,.LM29-.LFBB4
.LM29:
	ldi r25,0
	ldi r24,0
.L7:
/* epilogue start */
	.stabn	68,0,3209,.LM30-.LFBB4
.LM30:
	pop r29
	pop r28
	ret
.L15:
	.stabn	68,0,3194,.LM31-.LFBB4
.LM31:
	cpi r24,lo8(47)
	breq .L18
	.stabn	68,0,3194,.LM32-.LFBB4
.LM32:
	cpi r24,lo8(33)
	brsh .L30
.L18:
	.stabn	68,0,3197,.LM33-.LFBB4
.LM33:
	st X,r20
	adiw r26,1
	st X,r21
	rjmp .L31
.L9:
	.stabn	68,0,3184,.LM34-.LFBB4
.LM34:
	ld r24,Z
	cpi r24,lo8(47)
	brne .L31
.L12:
	.stabn	68,0,3185,.LM35-.LFBB4
.LM35:
	ldd r24,Z+1
	.stabn	68,0,3185,.LM36-.LFBB4
.LM36:
	adiw r30,1
	.stabn	68,0,3185,.LM37-.LFBB4
.LM37:
	cpi r24,lo8(47)
	breq .L12
	.stabn	68,0,3188,.LM38-.LFBB4
.LM38:
	ldi r18,lo8(.LC0)
	ldi r19,hi8(.LC0)
.L16:
	movw r28,r18
	.stabn	68,0,3190,.LM39-.LFBB4
.LM39:
	ld r25,Y
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,3190,.LM40-.LFBB4
.LM40:
	movw r20,r30
	ld r24,Z+
	.stabn	68,0,3191,.LM41-.LFBB4
.LM41:
	ldi r22,lo8(-97)
	add r22,r25
	.stabn	68,0,3191,.LM42-.LFBB4
.LM42:
	cpi r22,lo8(26)
	brsh .L13
	.stabn	68,0,3191,.LM43-.LFBB4
.LM43:
	subi r25,lo8(-(-32))
.L13:
	.stabn	68,0,3192,.LM44-.LFBB4
.LM44:
	ldi r22,lo8(-97)
	add r22,r24
	.stabn	68,0,3192,.LM45-.LFBB4
.LM45:
	cpi r22,lo8(26)
	brsh .L14
	.stabn	68,0,3192,.LM46-.LFBB4
.LM46:
	subi r24,lo8(-(-32))
.L14:
	.stabn	68,0,3193,.LM47-.LFBB4
.LM47:
	tst r25
	breq .L15
	.stabn	68,0,3193,.LM48-.LFBB4
.LM48:
	cp r24,r25
	breq .L16
.L30:
	.stabn	68,0,3154,.LM49-.LFBB4
.LM49:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	rjmp .L7
	.size	get_ldnumber, .-get_ldnumber
	.stabs	"tp:r(0,23)",64,0,0,30
	.stabs	"c:r(0,21)",64,0,0,25
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
	.stabn	68,0,3618,.LM50-.LFBB5
.LM50:
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
	.stabn	68,0,3622,.LM51-.LFBB5
.LM51:
	or r24,r25
	brne .L33
.L35:
	.stabn	68,0,3619,.LM52-.LFBB5
.LM52:
	ldi r24,lo8(9)
	ldi r25,0
	.stabn	68,0,3639,.LM53-.LFBB5
.LM53:
	ldi r19,0
	ldi r18,0
.L34:
	.stabn	68,0,3639,.LM54-.LFBB5
.LM54:
	movw r30,r16
	std Z+1,r19
	st Z,r18
/* epilogue start */
	.stabn	68,0,3641,.LM55-.LFBB5
.LM55:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L33:
	.stabn	68,0,3622,.LM56-.LFBB5
.LM56:
	ld r30,Y
	ldd r31,Y+1
	.stabn	68,0,3622,.LM57-.LFBB5
.LM57:
	sbiw r30,0
	breq .L35
	.stabn	68,0,3622,.LM58-.LFBB5
.LM58:
	ld r24,Z
	tst r24
	breq .L35
	.stabn	68,0,3622,.LM59-.LFBB5
.LM59:
	ldd r18,Y+2
	ldd r19,Y+3
	ldd r24,Z+6
	ldd r25,Z+7
	cp r18,r24
	cpc r19,r25
	brne .L35
	.stabn	68,0,3634,.LM60-.LFBB5
.LM60:
	ldd r24,Z+1
	call disk_status
	.stabn	68,0,3634,.LM61-.LFBB5
.LM61:
	sbrc r24,0
	rjmp .L35
	.stabn	68,0,3639,.LM62-.LFBB5
.LM62:
	ld r18,Y
	ldd r19,Y+1
	.stabn	68,0,3635,.LM63-.LFBB5
.LM63:
	ldi r25,0
	ldi r24,0
	rjmp .L34
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
	.stabn	68,0,1059,.LM64-.LFBB6
.LM64:
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
	.stabn	68,0,1063,.LM65-.LFBB6
.LM65:
	ldd r24,Y+4
	cpse r24,__zero_reg__
	rjmp .L43
.L45:
	.stabn	68,0,1060,.LM66-.LFBB6
.LM66:
	mov r15,__zero_reg__
	mov r14,__zero_reg__
.L42:
	.stabn	68,0,1074,.LM67-.LFBB6
.LM67:
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
.L43:
.LBB86:
.LBB87:
	.stabn	68,0,1064,.LM68-.LFBB6
.LM68:
	movw r12,r28
	ldi r20,48
	add r12,r20
	adc r13,__zero_reg__
	.stabn	68,0,1064,.LM69-.LFBB6
.LM69:
	ldd r18,Y+44
	ldd r19,Y+45
	ldd r20,Y+46
	ldd r21,Y+47
	ldi r16,lo8(1)
	ldi r17,0
	movw r22,r12
	ldd r24,Y+1
	call disk_write
	movw r14,r24
	.stabn	68,0,1064,.LM70-.LFBB6
.LM70:
	or r24,r25
	brne .L46
	.stabn	68,0,1065,.LM71-.LFBB6
.LM71:
	std Y+4,__zero_reg__
	.stabn	68,0,1066,.LM72-.LFBB6
.LM72:
	ldd r16,Y+44
	ldd r17,Y+45
	ldd r18,Y+46
	ldd r19,Y+47
	.stabn	68,0,1066,.LM73-.LFBB6
.LM73:
	ldd r24,Y+24
	ldd r25,Y+25
	ldd r26,Y+26
	ldd r27,Y+27
	.stabn	68,0,1066,.LM74-.LFBB6
.LM74:
	ldd r8,Y+32
	ldd r9,Y+33
	ldd r10,Y+34
	ldd r11,Y+35
	movw r22,r18
	movw r20,r16
	sub r20,r8
	sbc r21,r9
	sbc r22,r10
	sbc r23,r11
	movw r8,r20
	movw r10,r22
	.stabn	68,0,1066,.LM75-.LFBB6
.LM75:
	cp r8,r24
	cpc r9,r25
	cpc r10,r26
	cpc r11,r27
	brsh .L45
	.stabn	68,0,1067,.LM76-.LFBB6
.LM76:
	ldd r22,Y+3
	cpi r22,lo8(2)
	brne .L45
	.stabn	68,0,1067,.LM77-.LFBB6
.LM77:
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
	rjmp .L42
.L46:
	.stabn	68,0,1070,.LM78-.LFBB6
.LM78:
	clr r14
	inc r14
	mov r15,__zero_reg__
.LBE87:
.LBE86:
	.stabn	68,0,1073,.LM79-.LFBB6
.LM79:
	rjmp .L42
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
	.stabn	68,0,1082,.LM80-.LFBB7
.LM80:
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
	.stabn	68,0,1086,.LM81-.LFBB7
.LM81:
	ldd r24,Y+44
	ldd r25,Y+45
	ldd r26,Y+46
	ldd r27,Y+47
	.stabn	68,0,1083,.LM82-.LFBB7
.LM82:
	ldi r19,0
	ldi r18,0
	.stabn	68,0,1086,.LM83-.LFBB7
.LM83:
	cp r24,r12
	cpc r25,r13
	cpc r26,r14
	cpc r27,r15
	breq .L47
	.stabn	68,0,1088,.LM84-.LFBB7
.LM84:
	movw r24,r28
	call sync_window
	movw r18,r24
	.stabn	68,0,1090,.LM85-.LFBB7
.LM85:
	or r24,r25
	brne .L47
.LBB90:
.LBB91:
	.stabn	68,0,1091,.LM86-.LFBB7
.LM86:
	ldi r16,lo8(1)
	ldi r17,0
	movw r20,r14
	movw r18,r12
	movw r22,r28
	subi r22,-48
	sbci r23,-1
	ldd r24,Y+1
	call disk_read
	movw r18,r24
	.stabn	68,0,1091,.LM87-.LFBB7
.LM87:
	or r24,r25
	breq .L49
	.stabn	68,0,1093,.LM88-.LFBB7
.LM88:
	ldi r18,lo8(1)
	ldi r19,0
	.stabn	68,0,1092,.LM89-.LFBB7
.LM89:
	clr r12
	dec r12
	mov r13,r12
	movw r14,r12
.L49:
	.stabn	68,0,1095,.LM90-.LFBB7
.LM90:
	std Y+44,r12
	std Y+45,r13
	std Y+46,r14
	std Y+47,r15
.L47:
.LBE91:
.LBE90:
	.stabn	68,0,1099,.LM91-.LFBB7
.LM91:
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
	.stabn	68,0,3296,.LM92-.LFBB8
.LM92:
.LFBB8:
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
/* stack size = 12 */
.L__stack_usage = 12
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,3301,.LM93-.LFBB8
.LM93:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,4
	st X,__zero_reg__
	.stabn	68,0,3301,.LM94-.LFBB8
.LM94:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	movw r26,r24
	ldd r30,Y+5
	ldd r31,Y+6
	std Z+44,r24
	std Z+45,r25
	std Z+46,r26
	std Z+47,r27
	.stabn	68,0,3302,.LM95-.LFBB8
.LM95:
	movw r24,r30
	call move_window
	movw r16,r24
	.stabn	68,0,3302,.LM96-.LFBB8
.LM96:
	or r24,r25
	breq .+2
	rjmp .L60
.LBB92:
.LBB93:
	.stabn	68,0,624,.LM97-.LFBB8
.LM97:
	ldd r30,Y+5
	ldd r31,Y+6
	subi r30,-46
	sbci r31,-3
	ld r14,Z
	ldd r15,Z+1
.LBE93:
.LBE92:
	.stabn	68,0,3307,.LM98-.LFBB8
.LM98:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,48
	ld r24,X
	.stabn	68,0,3308,.LM99-.LFBB8
.LM99:
	cpi r24,lo8(-21)
	breq .L56
	.stabn	68,0,3308,.LM100-.LFBB8
.LM100:
	subi r24,lo8(-(24))
	cpi r24,lo8(2)
	brlo .+2
	rjmp .L57
.L56:
	.stabn	68,0,3309,.LM101-.LFBB8
.LM101:
	ldi r27,85
	cp r14,r27
	ldi r27,-86
	cpc r15,r27
	brne .L58
	.stabn	68,0,3309,.LM102-.LFBB8
.LM102:
	ldi r20,lo8(8)
	ldi r21,0
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldd r24,Y+5
	ldd r25,Y+6
	subi r24,126
	sbci r25,-1
	call memcmp
	.stabn	68,0,3309,.LM103-.LFBB8
.LM103:
	or r24,r25
	brne .+2
	rjmp .L54
.L58:
	.stabn	68,0,3315,.LM104-.LFBB8
.LM104:
	ldd r30,Y+5
	ldd r31,Y+6
	ldd r24,Z+59
	ldd r25,Z+60
	cp r24,__zero_reg__
	sbci r25,2
	brne .L57
	.stabn	68,0,3314,.LM105-.LFBB8
.LM105:
	ldd r26,Y+5
	ldd r27,Y+6
	adiw r26,61
	ld r24,X
	sbiw r26,61
	.stabn	68,0,3316,.LM106-.LFBB8
.LM106:
	tst r24
	breq .L57
	.stabn	68,0,3316,.LM107-.LFBB8
.LM107:
	ldi r25,0
	.stabn	68,0,3316,.LM108-.LFBB8
.LM108:
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3316,.LM109-.LFBB8
.LM109:
	and r24,r18
	and r25,r19
	.stabn	68,0,3316,.LM110-.LFBB8
.LM110:
	or r24,r25
	brne .L57
	.stabn	68,0,3317,.LM111-.LFBB8
.LM111:
	adiw r26,62
	ld r24,X+
	ld r25,X
	sbiw r26,62+1
	or r24,r25
	breq .L57
	.stabn	68,0,3318,.LM112-.LFBB8
.LM112:
	movw r30,r26
	subi r30,-64
	sbci r31,-1
	.stabn	68,0,3318,.LM113-.LFBB8
.LM113:
	ld r24,Z
	.stabn	68,0,3318,.LM114-.LFBB8
.LM114:
	subi r24,1
	sbc r25,r25
	.stabn	68,0,3318,.LM115-.LFBB8
.LM115:
	sbiw r24,2
	brsh .L57
.LBB94:
.LBB95:
	.stabn	68,0,624,.LM116-.LFBB8
.LM116:
	adiw r30,1
.LBE95:
.LBE94:
	.stabn	68,0,3319,.LM117-.LFBB8
.LM117:
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	breq .L57
.LBB96:
.LBB97:
	.stabn	68,0,624,.LM118-.LFBB8
.LM118:
	adiw r30,2
.LBE97:
.LBE96:
	.stabn	68,0,3320,.LM119-.LFBB8
.LM119:
	ld r24,Z
	ldd r25,Z+1
	cpi r24,-128
	cpc r25,__zero_reg__
	brsh .L59
	.stabn	68,0,3320,.LM120-.LFBB8
.LM120:
	movw r24,r26
	subi r24,-80
	sbci r25,-1
	call ld_dword
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,3320,.LM121-.LFBB8
.LM121:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	sbci r24,1
	cpc r25,__zero_reg__
	brlo .L57
.L59:
.LBB98:
.LBB99:
	.stabn	68,0,624,.LM122-.LFBB8
.LM122:
	ldd r30,Y+5
	ldd r31,Y+6
	subi r30,-70
	sbci r31,-1
.LBE99:
.LBE98:
	.stabn	68,0,3321,.LM123-.LFBB8
.LM123:
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	brne .L54
.L57:
	.stabn	68,0,3325,.LM124-.LFBB8
.LM124:
	ldi r16,lo8(3)
	ldi r17,0
	ldi r31,85
	cp r14,r31
	ldi r31,-86
	cpc r15,r31
	brne .L54
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L54
.L60:
	.stabn	68,0,3302,.LM125-.LFBB8
.LM125:
	ldi r16,lo8(4)
	ldi r17,0
.L54:
	.stabn	68,0,3326,.LM126-.LFBB8
.LM126:
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
	.stabn	68,0,1245,.LM127-.LFBB9
.LM127:
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
	.stabn	68,0,1251,.LM128-.LFBB9
.LM128:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L84
	.stabn	68,0,1251,.LM129-.LFBB9
.LM129:
	movw r30,r24
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L85
.LBB106:
.LBB107:
	.stabn	68,0,1252,.LM130-.LFBB9
.LM130:
	ld r24,Z
	.stabn	68,0,1252,.LM131-.LFBB9
.LM131:
	cpi r24,lo8(2)
	brne .+2
	rjmp .L79
	cpi r24,lo8(3)
	brne .+2
	rjmp .L80
	cpi r24,lo8(1)
	breq .+2
	rjmp .L86
	.stabn	68,0,1254,.LM132-.LFBB9
.LM132:
	movw r16,r20
	lsr r17
	ror r16
	.stabn	68,0,1254,.LM133-.LFBB9
.LM133:
	add r16,r20
	adc r17,r21
	.stabn	68,0,1255,.LM134-.LFBB9
.LM134:
	movw r24,r16
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1255,.LM135-.LFBB9
.LM135:
	ldd r20,Z+32
	ldd r21,Z+33
	ldd r22,Z+34
	ldd r23,Z+35
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1256,.LM136-.LFBB9
.LM136:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	breq .+2
	rjmp .L77
	.stabn	68,0,1257,.LM137-.LFBB9
.LM137:
	movw r2,r10
	ldi r19,48
	add r2,r19
	adc r3,__zero_reg__
	.stabn	68,0,1257,.LM138-.LFBB9
.LM138:
	movw r8,r16
	ldi r20,-1
	sub r8,r20
	sbc r9,r20
	andi r17,1
	.stabn	68,0,1257,.LM139-.LFBB9
.LM139:
	movw r30,r2
	add r30,r16
	adc r31,r17
	.stabn	68,0,1258,.LM140-.LFBB9
.LM140:
	mov r24,r4
	.stabn	68,0,1258,.LM141-.LFBB9
.LM141:
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
	rjmp .L81
	.stabn	68,0,1258,.LM142-.LFBB9
.LM142:
	ld r24,Z
	andi r24,lo8(15)
	.stabn	68,0,1258,.LM143-.LFBB9
.LM143:
	ldi r20,lo8(16)
	mul r4,r20
	movw r18,r0
	clr __zero_reg__
	.stabn	68,0,1258,.LM144-.LFBB9
.LM144:
	or r24,r18
.L81:
	.stabn	68,0,1258,.LM145-.LFBB9
.LM145:
	st Z,r24
	.stabn	68,0,1259,.LM146-.LFBB9
.LM146:
	ldi r24,lo8(1)
	movw r26,r10
	adiw r26,4
	st X,r24
	sbiw r26,4
	.stabn	68,0,1260,.LM147-.LFBB9
.LM147:
	adiw r26,32
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X
	sbiw r26,32+3
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
	.stabn	68,0,1261,.LM148-.LFBB9
.LM148:
	ldd r30,Y+5
	ldd r31,Y+6
	or r30,r31
	brne .L77
	.stabn	68,0,1262,.LM149-.LFBB9
.LM149:
	ldi r31,1
	and r9,r31
	.stabn	68,0,1262,.LM150-.LFBB9
.LM150:
	movw r30,r2
	add r30,r8
	adc r31,r9
	.stabn	68,0,1263,.LM151-.LFBB9
.LM151:
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	or r18,r19
	or r18,r20
	or r18,r21
	breq .L82
	.stabn	68,0,1263,.LM152-.LFBB9
.LM152:
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
.L83:
	.stabn	68,0,1263,.LM153-.LFBB9
.LM153:
	st Z,r24
.L90:
	.stabn	68,0,1271,.LM154-.LFBB9
.LM154:
	ldi r24,lo8(1)
	movw r26,r10
	adiw r26,4
	st X,r24
.L77:
.LBE107:
.LBE106:
	.stabn	68,0,1289,.LM155-.LFBB9
.LM155:
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
.L82:
.LBB114:
.LBB112:
	.stabn	68,0,1263,.LM156-.LFBB9
.LM156:
	ld r24,Z
	andi r24,lo8(-16)
	.stabn	68,0,1263,.LM157-.LFBB9
.LM157:
	mov r25,r5
	andi r25,lo8(15)
	.stabn	68,0,1263,.LM158-.LFBB9
.LM158:
	or r24,r25
	rjmp .L83
.L79:
	.stabn	68,0,1268,.LM159-.LFBB9
.LM159:
	clr r23
	mov r22,r15
	mov r21,r14
	mov r20,r13
	.stabn	68,0,1268,.LM160-.LFBB9
.LM160:
	ldd r24,Z+32
	ldd r25,Z+33
	ldd r26,Z+34
	ldd r27,Z+35
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r10
	call move_window
	std Y+5,r24
	std Y+6,r25
	.stabn	68,0,1269,.LM161-.LFBB9
.LM161:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	brne .L77
	.stabn	68,0,1270,.LM162-.LFBB9
.LM162:
	movw r30,r12
	lsl r30
	rol r31
	andi r30,254
	andi r31,1
.LBB108:
.LBB109:
	.stabn	68,0,659,.LM163-.LFBB9
.LM163:
	add r30,r10
	adc r31,r11
	std Z+49,r17
	std Z+48,r16
	rjmp .L90
.L80:
.LBE109:
.LBE108:
	.stabn	68,0,1278,.LM164-.LFBB9
.LM164:
	ldd r24,Z+32
	ldd r25,Z+33
	ldd r26,Z+34
	ldd r27,Z+35
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
	.stabn	68,0,1279,.LM165-.LFBB9
.LM165:
	ldd r18,Y+5
	ldd r19,Y+6
	or r18,r19
	breq .+2
	rjmp .L77
	.stabn	68,0,1281,.LM166-.LFBB9
.LM166:
	movw r16,r10
	subi r16,-48
	sbci r17,-1
	.stabn	68,0,1281,.LM167-.LFBB9
.LM167:
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
	.stabn	68,0,1281,.LM168-.LFBB9
.LM168:
	ldi r20,15
	and r7,r20
	.stabn	68,0,1281,.LM169-.LFBB9
.LM169:
	movw r26,r24
	movw r24,r22
	clr r24
	clr r25
	clr r26
	andi r27,240
	.stabn	68,0,1281,.LM170-.LFBB9
.LM170:
	or r24,r4
	or r25,r5
	or r26,r6
	or r27,r7
.LBB110:
.LBB111:
	.stabn	68,0,665,.LM171-.LFBB9
.LM171:
	movw r30,r16
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	rjmp .L90
.L84:
.LBE111:
.LBE110:
.LBE112:
.LBE114:
	.stabn	68,0,1248,.LM172-.LFBB9
.LM172:
	ldi r30,lo8(2)
	ldi r31,0
	std Y+6,r31
	std Y+5,r30
	rjmp .L77
.L85:
	ldi r18,lo8(2)
	ldi r19,0
	std Y+6,r19
	std Y+5,r18
	rjmp .L77
.L86:
.LBB115:
.LBB113:
	.stabn	68,0,1252,.LM173-.LFBB9
.LM173:
	ldi r20,lo8(2)
	ldi r21,0
	std Y+6,r21
	std Y+5,r20
.LBE113:
.LBE115:
	.stabn	68,0,1288,.LM174-.LFBB9
.LM174:
	rjmp .L77
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
	.stabn	68,0,1663,.LM175-.LFBB10
.LM175:
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
	.stabn	68,0,1669,.LM176-.LFBB10
.LM176:
	call sync_window
	movw r14,r24
	.stabn	68,0,1669,.LM177-.LFBB10
.LM177:
	ldi r24,lo8(1)
	.stabn	68,0,1669,.LM178-.LFBB10
.LM178:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L99
.LBB118:
.LBB119:
	.stabn	68,0,1670,.LM179-.LFBB10
.LM179:
	movw r20,r10
	movw r22,r12
	movw r24,r28
	call clst2sect
	movw r8,r22
	movw r10,r24
	.stabn	68,0,1671,.LM180-.LFBB10
.LM180:
	std Y+44,r8
	std Y+45,r9
	std Y+46,r10
	std Y+47,r11
	.stabn	68,0,1672,.LM181-.LFBB10
.LM181:
	movw r12,r28
	ldi r18,48
	add r12,r18
	adc r13,__zero_reg__
	.stabn	68,0,1672,.LM182-.LFBB10
.LM182:
	ldi r24,0
	ldi r25,lo8(2)
	movw r30,r12
	movw r18,r24
	0:
	st Z+,__zero_reg__
	subi r18,1
	sbci r19,0
	brne 0b
.L93:
	.stabn	68,0,1685,.LM183-.LFBB10
.LM183:
	ldd r24,Y+10
	ldd r25,Y+11
	cp r14,r24
	cpc r15,r25
	brlo .L94
.L97:
	.stabn	68,0,1687,.LM184-.LFBB10
.LM184:
	ldi r24,lo8(1)
	ldd r18,Y+10
	ldd r19,Y+11
	cp r18,r14
	cpc r19,r15
	brne .L99
	ldi r24,0
.L99:
.LBE119:
.LBE118:
	.stabn	68,0,1669,.LM185-.LFBB10
.LM185:
	ldi r25,0
/* epilogue start */
	.stabn	68,0,1688,.LM186-.LFBB10
.LM186:
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
.L94:
.LBB121:
.LBB120:
	.stabn	68,0,1685,.LM187-.LFBB10
.LM187:
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
	.stabn	68,0,1685,.LM188-.LFBB10
.LM188:
	or r24,r25
	brne .L97
	.stabn	68,0,1685,.LM189-.LFBB10
.LM189:
	ldi r19,-1
	sub r14,r19
	sbc r15,r19
	rjmp .L93
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
	.stabs	"rfs:P(0,30)",64,0,0,14
	.stabs	"mode:P(0,5)",64,0,0,13
	.type	mount_volume, @function
mount_volume:
	.stabn	68,0,3391,.LM190-.LFBB11
.LM190:
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
	movw r14,r22
	mov r13,r20
	.stabn	68,0,3402,.LM191-.LFBB11
.LM191:
	movw r26,r22
	st X+,__zero_reg__
	st X,__zero_reg__
	.stabn	68,0,3403,.LM192-.LFBB11
.LM192:
	call get_ldnumber
	movw r18,r24
	.stabn	68,0,3404,.LM193-.LFBB11
.LM193:
	ldi r20,lo8(11)
	mov r10,r20
	mov r11,__zero_reg__
	.stabn	68,0,3404,.LM194-.LFBB11
.LM194:
	sbrc r25,7
	rjmp .L100
	.stabn	68,0,3407,.LM195-.LFBB11
.LM195:
	lsl r18
	rol r19
	movw r30,r18
	subi r30,lo8(-(FatFs))
	sbci r31,hi8(-(FatFs))
	ld r16,Z
	ldd r17,Z+1
	.stabn	68,0,3408,.LM196-.LFBB11
.LM196:
	ldi r19,lo8(12)
	mov r10,r19
	mov r11,__zero_reg__
	.stabn	68,0,3408,.LM197-.LFBB11
.LM197:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L100
	.stabn	68,0,3412,.LM198-.LFBB11
.LM198:
	movw r30,r14
	std Z+1,r17
	st Z,r16
	.stabn	68,0,3414,.LM199-.LFBB11
.LM199:
	clt
	bld r13,0
	.stabn	68,0,3416,.LM200-.LFBB11
.LM200:
	movw r26,r16
	adiw r26,1
	ld r24,X
	sbiw r26,1
	.stabn	68,0,3415,.LM201-.LFBB11
.LM201:
	ld r25,X
	tst r25
	breq .L102
	.stabn	68,0,3416,.LM202-.LFBB11
.LM202:
	call disk_status
	.stabn	68,0,3417,.LM203-.LFBB11
.LM203:
	sbrc r24,0
	rjmp .L102
	.stabn	68,0,3418,.LM204-.LFBB11
.LM204:
	tst r13
	brne .+2
	rjmp .L126
	.stabn	68,0,3418,.LM205-.LFBB11
.LM205:
	sbrs r24,2
	rjmp .L126
.L104:
	.stabn	68,0,3419,.LM206-.LFBB11
.LM206:
	ldi r16,lo8(10)
	mov r10,r16
	mov r11,__zero_reg__
.L100:
	.stabn	68,0,3605,.LM207-.LFBB11
.LM207:
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
.L102:
	.stabn	68,0,3428,.LM208-.LFBB11
.LM208:
	movw r30,r16
	st Z,__zero_reg__
	.stabn	68,0,3429,.LM209-.LFBB11
.LM209:
	ldd r24,Z+1
	call disk_initialize
	.stabn	68,0,3431,.LM210-.LFBB11
.LM210:
	ldi r18,lo8(3)
	mov r10,r18
	mov r11,__zero_reg__
	.stabn	68,0,3430,.LM211-.LFBB11
.LM211:
	sbrc r24,0
	rjmp .L100
	.stabn	68,0,3433,.LM212-.LFBB11
.LM212:
	tst r13
	breq .L103
	.stabn	68,0,3433,.LM213-.LFBB11
.LM213:
	sbrc r24,2
	rjmp .L104
.L103:
.LBB140:
.LBB141:
	.stabn	68,0,3341,.LM214-.LFBB11
.LM214:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	movw r24,r16
	call check_fs
	.stabn	68,0,3342,.LM215-.LFBB11
.LM215:
	cpi r24,2
	cpc r25,__zero_reg__
	breq .+2
	rjmp .L105
	movw r12,r16
	ldi r31,10
	sub r12,r31
	ldi r31,-2
	sbc r13,r31
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r14,r18
	movw r8,r16
	ldi r19,-54
	sub r8,r19
	ldi r19,-3
	sbc r9,r19
	movw r10,r14
.L106:
	.stabn	68,0,3370,.LM216-.LFBB11
.LM216:
	movw r24,r12
	call ld_dword
	std Y+17,r22
	std Y+18,r23
	std Y+19,r24
	std Y+20,r25
	.stabn	68,0,3370,.LM217-.LFBB11
.LM217:
	movw r26,r10
	st X+,r22
	st X+,r23
	st X+,r24
	st X+,r25
	movw r10,r26
	.stabn	68,0,3369,.LM218-.LFBB11
.LM218:
	ldi r27,16
	add r12,r27
	adc r13,__zero_reg__
	cp r12,r8
	cpc r13,r9
	brne .L106
	movw r12,r14
	ldi r30,16
	add r12,r30
	adc r13,__zero_reg__
.L109:
	.stabn	68,0,3374,.LM219-.LFBB11
.LM219:
	movw r26,r14
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X+
	movw r14,r26
	.stabn	68,0,3374,.LM220-.LFBB11
.LM220:
	ldi r18,lo8(3)
	ldi r19,0
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L107
	.stabn	68,0,3374,.LM221-.LFBB11
.LM221:
	movw r24,r16
	call check_fs
	movw r18,r24
	.stabn	68,0,3375,.LM222-.LFBB11
.LM222:
	sbiw r24,2
	brlo .+2
	rjmp .L107
.L111:
.LBE141:
.LBE140:
	.stabn	68,0,3445,.LM223-.LFBB11
.LM223:
	movw r26,r16
	adiw r26,44
	ld r18,X+
	ld r19,X+
	ld r20,X+
	ld r21,X
	sbiw r26,44+3
	std Y+25,r18
	std Y+26,r19
	std Y+27,r20
	std Y+28,r21
	.stabn	68,0,3513,.LM224-.LFBB11
.LM224:
	adiw r26,59
	ld r24,X+
	ld r25,X
	cp r24,__zero_reg__
	sbci r25,2
	breq .+2
	rjmp .L112
.LBB143:
.LBB144:
	.stabn	68,0,624,.LM225-.LFBB11
.LM225:
	movw r30,r16
	subi r30,-70
	sbci r31,-1
.LBE144:
.LBE143:
	.stabn	68,0,3515,.LM226-.LFBB11
.LM226:
	ld r24,Z
	ldd r25,Z+1
	movw r18,r24
	ldi r21,0
	ldi r20,0
	std Y+17,r18
	std Y+18,r19
	std Y+19,r20
	std Y+20,r21
	.stabn	68,0,3516,.LM227-.LFBB11
.LM227:
	or r24,r25
	brne .L113
	.stabn	68,0,3516,.LM228-.LFBB11
.LM228:
	movw r24,r16
	subi r24,-84
	sbci r25,-1
	call ld_dword
	std Y+17,r22
	std Y+18,r23
	std Y+19,r24
	std Y+20,r25
.L113:
	.stabn	68,0,3517,.LM229-.LFBB11
.LM229:
	ldd r24,Y+17
	ldd r25,Y+18
	ldd r26,Y+19
	ldd r27,Y+20
	movw r30,r16
	std Z+24,r24
	std Z+25,r25
	std Z+26,r26
	std Z+27,r27
	.stabn	68,0,3519,.LM230-.LFBB11
.LM230:
	subi r30,-64
	sbci r31,-1
	ld r8,Z
	.stabn	68,0,3519,.LM231-.LFBB11
.LM231:
	movw r26,r16
	adiw r26,3
	st X,r8
	sbiw r26,3
	.stabn	68,0,3520,.LM232-.LFBB11
.LM232:
	ldi r24,lo8(-1)
	add r24,r8
	.stabn	68,0,3520,.LM233-.LFBB11
.LM233:
	cpi r24,lo8(2)
	brlo .+2
	rjmp .L112
	.stabn	68,0,3523,.LM234-.LFBB11
.LM234:
	adiw r26,61
	ld r4,X
	sbiw r26,61
	mov r24,r4
	ldi r25,0
	.stabn	68,0,3523,.LM235-.LFBB11
.LM235:
	adiw r26,10+1
	st X,r25
	st -X,r24
	sbiw r26,10
	.stabn	68,0,3524,.LM236-.LFBB11
.LM236:
	sbiw r24,0
	brne .+2
	rjmp .L112
	.stabn	68,0,3524,.LM237-.LFBB11
.LM237:
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3524,.LM238-.LFBB11
.LM238:
	and r24,r18
	and r25,r19
	.stabn	68,0,3524,.LM239-.LFBB11
.LM239:
	or r24,r25
	breq .+2
	rjmp .L112
.LBB145:
.LBB146:
	.stabn	68,0,624,.LM240-.LFBB11
.LM240:
	adiw r30,1
	ld r2,Z
	ldd r3,Z+1
.LBE146:
.LBE145:
	.stabn	68,0,3526,.LM241-.LFBB11
.LM241:
	movw r30,r16
	std Z+9,r3
	std Z+8,r2
	.stabn	68,0,3527,.LM242-.LFBB11
.LM242:
	movw r10,r2
	ldi r31,15
	and r10,r31
	clr r11
	.stabn	68,0,3527,.LM243-.LFBB11
.LM243:
	cp r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .+2
	rjmp .L112
.LBB147:
.LBB148:
	.stabn	68,0,624,.LM244-.LFBB11
.LM244:
	movw r30,r16
	subi r30,-67
	sbci r31,-1
.LBE148:
.LBE147:
	.stabn	68,0,3529,.LM245-.LFBB11
.LM245:
	ld r24,Z
	ldd r25,Z+1
	movw r12,r24
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	.stabn	68,0,3530,.LM246-.LFBB11
.LM246:
	or r24,r25
	brne .L114
	.stabn	68,0,3530,.LM247-.LFBB11
.LM247:
	movw r24,r16
	subi r24,-80
	sbci r25,-1
	call ld_dword
	movw r12,r22
	movw r14,r24
.L114:
.LBB149:
.LBB150:
	.stabn	68,0,624,.LM248-.LFBB11
.LM248:
	movw r26,r16
	adiw r26,62
	ld r30,X+
	ld r31,X
.LBE150:
.LBE149:
	.stabn	68,0,3533,.LM249-.LFBB11
.LM249:
	sbiw r30,0
	brne .+2
	rjmp .L112
	.stabn	68,0,3521,.LM250-.LFBB11
.LM250:
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
	.stabn	68,0,3536,.LM251-.LFBB11
.LM251:
	movw r18,r30
	ldi r21,0
	ldi r20,0
	std Y+29,r18
	std Y+30,r19
	std Y+31,r20
	std Y+32,r21
	.stabn	68,0,3536,.LM252-.LFBB11
.LM252:
	movw r24,r2
	ldi r27,4
	1:
	lsr r25
	ror r24
	dec r27
	brne 1b
	.stabn	68,0,3536,.LM253-.LFBB11
.LM253:
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
	.stabn	68,0,3537,.LM254-.LFBB11
.LM254:
	cp r12,r18
	cpc r13,r19
	cpc r14,r20
	cpc r15,r21
	brsh .+2
	rjmp .L112
	.stabn	68,0,3538,.LM255-.LFBB11
.LM255:
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
	.stabn	68,0,3538,.LM256-.LFBB11
.LM256:
	mov r5,__zero_reg__
	mov r7,__zero_reg__
	mov r6,__zero_reg__
	.stabn	68,0,3538,.LM257-.LFBB11
.LM257:
	movw r22,r24
	movw r24,r26
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	.stabn	68,0,3539,.LM258-.LFBB11
.LM258:
	ldd r24,Y+33
	ldd r25,Y+34
	ldd r26,Y+35
	ldd r27,Y+36
	cp r24,r4
	cpc r25,r5
	cpc r26,r6
	cpc r27,r7
	brsh .+2
	rjmp .L112
	.stabn	68,0,3541,.LM259-.LFBB11
.LM259:
	cpi r18,-10
	ldi r25,-1
	cpc r19,r25
	cpc r20,r25
	ldi r25,15
	cpc r21,r25
	brlo .+2
	rjmp .L112
	.stabn	68,0,3541,.LM260-.LFBB11
.LM260:
	ldi r26,lo8(3)
	mov r8,r26
	mov r9,__zero_reg__
	.stabn	68,0,3542,.LM261-.LFBB11
.LM261:
	cpi r18,-10
	ldi r26,-1
	cpc r19,r26
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	brsh .L122
	.stabn	68,0,3543,.LM262-.LFBB11
.LM262:
	clr r8
	inc r8
	mov r9,__zero_reg__
	.stabn	68,0,3543,.LM263-.LFBB11
.LM263:
	cpi r18,-10
	ldi r27,15
	cpc r19,r27
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	brlo .L122
	.stabn	68,0,3542,.LM264-.LFBB11
.LM264:
	ldi r31,lo8(2)
	mov r8,r31
	mov r9,__zero_reg__
.L122:
	.stabn	68,0,3547,.LM265-.LFBB11
.LM265:
	movw r12,r18
	movw r14,r20
	ldi r27,2
	add r12,r27
	adc r13,__zero_reg__
	adc r14,__zero_reg__
	adc r15,__zero_reg__
	.stabn	68,0,3547,.LM266-.LFBB11
.LM266:
	movw r30,r16
	std Z+20,r12
	std Z+21,r13
	std Z+22,r14
	std Z+23,r15
	.stabn	68,0,3548,.LM267-.LFBB11
.LM267:
	ldd r18,Y+25
	ldd r19,Y+26
	ldd r20,Y+27
	ldd r21,Y+28
	std Z+28,r18
	std Z+29,r19
	std Z+30,r20
	std Z+31,r21
	.stabn	68,0,3549,.LM268-.LFBB11
.LM268:
	ldd r4,Y+29
	ldd r5,Y+30
	ldd r6,Y+31
	ldd r7,Y+32
	add r4,r18
	adc r5,r19
	adc r6,r20
	adc r7,r21
	.stabn	68,0,3549,.LM269-.LFBB11
.LM269:
	std Z+32,r4
	std Z+33,r5
	std Z+34,r6
	std Z+35,r7
	.stabn	68,0,3550,.LM270-.LFBB11
.LM270:
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
	.stabn	68,0,3550,.LM271-.LFBB11
.LM271:
	std Z+40,r24
	std Z+41,r25
	std Z+42,r26
	std Z+43,r27
	.stabn	68,0,3551,.LM272-.LFBB11
.LM272:
	ldi r31,3
	cp r8,r31
	cpc r9,__zero_reg__
	breq .+2
	rjmp .L116
.LBB151:
.LBB152:
	.stabn	68,0,624,.LM273-.LFBB11
.LM273:
	movw r30,r16
	subi r30,-90
	sbci r31,-1
.LBE152:
.LBE151:
	.stabn	68,0,3552,.LM274-.LFBB11
.LM274:
	ld r24,Z
	ldd r25,Z+1
	or r24,r2
	or r25,r3
	or r24,r25
	breq .+2
	rjmp .L112
	.stabn	68,0,3554,.LM275-.LFBB11
.LM275:
	movw r24,r16
	subi r24,-92
	sbci r25,-1
	call ld_dword
	movw r4,r22
	movw r6,r24
	.stabn	68,0,3555,.LM276-.LFBB11
.LM276:
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
.L117:
	.stabn	68,0,3554,.LM277-.LFBB11
.LM277:
	movw r30,r16
	std Z+36,r4
	std Z+37,r5
	std Z+38,r6
	std Z+39,r7
	.stabn	68,0,3562,.LM278-.LFBB11
.LM278:
	movw r12,r24
	movw r14,r26
	ldi r31,-1
	add r12,r31
	ldi r31,1
	adc r13,r31
	adc r14,__zero_reg__
	adc r15,__zero_reg__
	.stabn	68,0,3562,.LM279-.LFBB11
.LM279:
	ldi r21,9
	1:
	lsr r15
	ror r14
	ror r13
	ror r12
	dec r21
	brne 1b
	.stabn	68,0,3562,.LM280-.LFBB11
.LM280:
	ldd r18,Y+17
	ldd r19,Y+18
	ldd r20,Y+19
	ldd r21,Y+20
	cp r18,r12
	cpc r19,r13
	cpc r20,r14
	cpc r21,r15
	brsh .+2
	rjmp .L112
	.stabn	68,0,3566,.LM281-.LFBB11
.LM281:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	movw r26,r24
	movw r30,r16
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	.stabn	68,0,3566,.LM282-.LFBB11
.LM282:
	std Z+12,r24
	std Z+13,r25
	std Z+14,r26
	std Z+15,r27
	.stabn	68,0,3567,.LM283-.LFBB11
.LM283:
	ldi r24,lo8(-128)
	std Z+5,r24
	.stabn	68,0,3569,.LM284-.LFBB11
.LM284:
	ldi r31,3
	cp r8,r31
	cpc r9,__zero_reg__
	breq .+2
	rjmp .L120
.LBB153:
.LBB154:
	.stabn	68,0,624,.LM285-.LFBB11
.LM285:
	movw r30,r16
	subi r30,-96
	sbci r31,-1
.LBE154:
.LBE153:
	.stabn	68,0,3570,.LM286-.LFBB11
.LM286:
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,1
	breq .+2
	rjmp .L120
	.stabn	68,0,3571,.LM287-.LFBB11
.LM287:
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
	.stabn	68,0,3571,.LM288-.LFBB11
.LM288:
	or r24,r25
	brne .L120
	.stabn	68,0,3573,.LM289-.LFBB11
.LM289:
	movw r26,r16
	adiw r26,5
	st X,__zero_reg__
.LBB155:
.LBB156:
	.stabn	68,0,624,.LM290-.LFBB11
.LM290:
	movw r30,r16
	subi r30,-46
	sbci r31,-3
.LBE156:
.LBE155:
	.stabn	68,0,3574,.LM291-.LFBB11
.LM291:
	ld r24,Z
	ldd r25,Z+1
	cpi r24,85
	sbci r25,-86
	brne .L120
	.stabn	68,0,3575,.LM292-.LFBB11
.LM292:
	movw r24,r16
	adiw r24,48
	call ld_dword
	.stabn	68,0,3575,.LM293-.LFBB11
.LM293:
	cpi r22,82
	sbci r23,82
	sbci r24,97
	sbci r25,65
	brne .L120
	.stabn	68,0,3576,.LM294-.LFBB11
.LM294:
	movw r24,r16
	subi r24,-20
	sbci r25,-3
	call ld_dword
	.stabn	68,0,3576,.LM295-.LFBB11
.LM295:
	cpi r22,114
	sbci r23,114
	sbci r24,65
	sbci r25,97
	brne .L120
	.stabn	68,0,3579,.LM296-.LFBB11
.LM296:
	movw r24,r16
	subi r24,-24
	sbci r25,-3
	call ld_dword
	movw r26,r16
	adiw r26,16
	st X+,r22
	st X+,r23
	st X+,r24
	st X,r25
	sbiw r26,16+3
	.stabn	68,0,3582,.LM297-.LFBB11
.LM297:
	movw r24,r16
	subi r24,-28
	sbci r25,-3
	call ld_dword
	movw r30,r16
	std Z+12,r22
	std Z+13,r23
	std Z+14,r24
	std Z+15,r25
.L120:
	.stabn	68,0,3590,.LM298-.LFBB11
.LM298:
	movw r26,r16
	st X,r8
	.stabn	68,0,3591,.LM299-.LFBB11
.LM299:
	lds r24,Fsid
	lds r25,Fsid+1
	adiw r24,1
	.stabn	68,0,3591,.LM300-.LFBB11
.LM300:
	sts Fsid+1,r25
	sts Fsid,r24
	adiw r26,6+1
	st X,r25
	st -X,r24
	sbiw r26,6
	.stabn	68,0,3604,.LM301-.LFBB11
.LM301:
	rjmp .L100
.L107:
.LBB157:
.LBB142:
	.stabn	68,0,3375,.LM302-.LFBB11
.LM302:
	cp r12,r14
	cpc r13,r15
	breq .+2
	rjmp .L109
.LBE142:
.LBE157:
	.stabn	68,0,3443,.LM303-.LFBB11
.LM303:
	cpi r18,4
	cpc r19,__zero_reg__
	brne .L112
.L131:
	.stabn	68,0,3443,.LM304-.LFBB11
.LM304:
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L100
.L105:
	.stabn	68,0,3443,.LM305-.LFBB11
.LM305:
	cpi r24,4
	cpc r25,__zero_reg__
	breq .L131
	.stabn	68,0,3444,.LM306-.LFBB11
.LM306:
	sbiw r24,2
	brsh .+2
	rjmp .L111
.L112:
	.stabn	68,0,3444,.LM307-.LFBB11
.LM307:
	ldi r17,lo8(13)
	mov r10,r17
	mov r11,__zero_reg__
	rjmp .L100
.L116:
	.stabn	68,0,3557,.LM308-.LFBB11
.LM308:
	or r2,r3
	breq .L112
	.stabn	68,0,3558,.LM309-.LFBB11
.LM309:
	ldd r18,Y+37
	ldd r19,Y+38
	ldd r20,Y+39
	ldd r21,Y+40
	add r4,r18
	adc r5,r19
	adc r6,r20
	adc r7,r21
	.stabn	68,0,3560,.LM310-.LFBB11
.LM310:
	ldi r19,2
	cp r8,r19
	cpc r9,__zero_reg__
	brne .L118
	.stabn	68,0,3560,.LM311-.LFBB11
.LM311:
	movw r26,r14
	movw r24,r12
	lsl r24
	rol r25
	rol r26
	rol r27
	rjmp .L117
.L118:
	.stabn	68,0,3560,.LM312-.LFBB11
.LM312:
	ldi r26,lo8(3)
	ldi r27,0
	movw r20,r14
	movw r18,r12
	call __muluhisi3
	std Y+21,r22
	std Y+22,r23
	std Y+23,r24
	std Y+24,r25
	.stabn	68,0,3560,.LM313-.LFBB11
.LM313:
	movw r26,r24
	movw r24,r22
	lsr r27
	ror r26
	ror r25
	ror r24
	.stabn	68,0,3560,.LM314-.LFBB11
.LM314:
	ldi r20,1
	and r12,r20
	clr r13
	clr r14
	clr r15
	.stabn	68,0,3560,.LM315-.LFBB11
.LM315:
	add r24,r12
	adc r25,r13
	adc r26,r14
	adc r27,r15
	rjmp .L117
.L126:
	.stabn	68,0,3421,.LM316-.LFBB11
.LM316:
	mov r11,__zero_reg__
	mov r10,__zero_reg__
	rjmp .L100
	.size	mount_volume, .-mount_volume
	.stabs	"vol:r(0,18)",64,0,0,18
	.stabs	"fs:r(0,8)",64,0,0,16
	.stabs	"FATFS:t(0,9)",128,0,0,0
	.stabs	"bsect:(0,7)",128,0,0,25
	.stabs	"DSTATUS:t(0,32)=(0,5)",128,0,0,0
	.stabs	"tsect:r(0,1)",64,0,0,12
	.stabs	"sysect:(0,1)",128,0,0,21
	.stabs	"szbfat:r(0,1)",64,0,0,24
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
	.stabs	"ISRA.303:P(0,17)",64,0,0,16
	.stabs	"fno:P(0,34)=*(0,35)=(0,36)=s22fsize:(0,29),0,32;fdate:(0,11),32,16;ftime:(0,11),48,16;fattrib:(0,5),64,8;fname:(0,37)=ar(0,15);0;12;(0,20),72,104;;",64,0,0,28
	.type	get_fileinfo.part.0.constprop.0.isra.0, @function
get_fileinfo.part.0.constprop.0.isra.0:
	.stabn	68,0,2618,.LM317-.LFBB12
.LM317:
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
	.stabn	68,0,2734,.LM318-.LFBB12
.LM318:
	ldi r25,0
	ldi r24,0
	.stabn	68,0,2734,.LM319-.LFBB12
.LM319:
	ldi r19,0
	ldi r18,0
	.stabn	68,0,2739,.LM320-.LFBB12
.LM320:
	ldi r21,lo8(46)
.L154:
	.stabn	68,0,2736,.LM321-.LFBB12
.LM321:
	subi r18,-1
	sbci r19,-1
	.stabn	68,0,2736,.LM322-.LFBB12
.LM322:
	ld r20,Z+
	.stabn	68,0,2737,.LM323-.LFBB12
.LM323:
	cpi r20,lo8(32)
	breq .L151
	.stabn	68,0,2738,.LM324-.LFBB12
.LM324:
	cpi r20,lo8(5)
	brne .L152
	.stabn	68,0,2738,.LM325-.LFBB12
.LM325:
	ldi r20,lo8(-27)
.L152:
	.stabn	68,0,2739,.LM326-.LFBB12
.LM326:
	cpi r18,9
	cpc r19,__zero_reg__
	brne .L153
	.stabn	68,0,2739,.LM327-.LFBB12
.LM327:
	movw r26,r28
	add r26,r24
	adc r27,r25
	adiw r26,9
	st X,r21
	.stabn	68,0,2739,.LM328-.LFBB12
.LM328:
	adiw r24,1
.L153:
	.stabn	68,0,2740,.LM329-.LFBB12
.LM329:
	movw r26,r28
	add r26,r24
	adc r27,r25
	adiw r26,9
	st X,r20
	.stabn	68,0,2740,.LM330-.LFBB12
.LM330:
	adiw r24,1
.L151:
	.stabn	68,0,2735,.LM331-.LFBB12
.LM331:
	cpi r18,11
	cpc r19,__zero_reg__
	brne .L154
	.stabn	68,0,2742,.LM332-.LFBB12
.LM332:
	add r24,r28
	adc r25,r29
	movw r26,r24
	adiw r26,9
	st X,__zero_reg__
	.stabn	68,0,2745,.LM333-.LFBB12
.LM333:
	movw r30,r16
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2745,.LM334-.LFBB12
.LM334:
	std Y+8,r24
	.stabn	68,0,2746,.LM335-.LFBB12
.LM335:
	movw r24,r16
	adiw r24,28
	call ld_dword
	st Y,r22
	std Y+1,r23
	std Y+2,r24
	std Y+3,r25
.LBB166:
.LBB167:
	.stabn	68,0,624,.LM336-.LFBB12
.LM336:
	movw r26,r16
	adiw r26,22
	ld r24,X+
	ld r25,X
	sbiw r26,22+1
.LBE167:
.LBE166:
	.stabn	68,0,2747,.LM337-.LFBB12
.LM337:
	std Y+7,r25
	std Y+6,r24
.LBB168:
.LBB169:
	.stabn	68,0,624,.LM338-.LFBB12
.LM338:
	adiw r26,24
	ld r24,X+
	ld r25,X
.LBE169:
.LBE168:
	.stabn	68,0,2748,.LM339-.LFBB12
.LM339:
	std Y+5,r25
	std Y+4,r24
/* epilogue start */
	.stabn	68,0,2749,.LM340-.LFBB12
.LM340:
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
	.stabs	"ISRA.314:P(0,5)",64,0,0,24
	.stabs	"dir:P(0,4)",64,0,0,30
	.type	ld_clust.isra.0, @function
ld_clust.isra.0:
	.stabn	68,0,1849,.LM341-.LFBB13
.LM341:
.LFBB13:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r18,r24
	movw r30,r22
	.stabn	68,0,1856,.LM342-.LFBB13
.LM342:
	ldd r22,Z+26
	ldd r23,Z+27
	ldi r25,0
	ldi r24,0
	.stabn	68,0,1857,.LM343-.LFBB13
.LM343:
	cpi r18,lo8(3)
	brne .L159
	.stabn	68,0,1858,.LM344-.LFBB13
.LM344:
	ldd r16,Z+20
	ldd r17,Z+21
	ldi r19,0
	ldi r18,0
	.stabn	68,0,1858,.LM345-.LFBB13
.LM345:
	movw r18,r16
	clr r17
	clr r16
	.stabn	68,0,1858,.LM346-.LFBB13
.LM346:
	or r22,r16
	or r23,r17
	or r24,r18
	or r25,r19
.L159:
/* epilogue start */
	.stabn	68,0,1862,.LM347-.LFBB13
.LM347:
	pop r17
	pop r16
	ret
	.size	ld_clust.isra.0, .-ld_clust.isra.0
	.stabs	"cl:r(0,1)",64,0,0,22
	.stabn	192,0,0,.LFBB13-.LFBB13
	.stabn	224,0,0,.Lscope13-.LFBB13
.Lscope13:
	.stabs	"get_fat.isra.0:f(0,1)",36,0,0,get_fat.isra.0
	.stabs	"ISRA.318:P(0,8)",64,0,0,16
	.stabs	"clst:P(0,1)",64,0,0,12
	.type	get_fat.isra.0, @function
get_fat.isra.0:
	.stabn	68,0,1162,.LM348-.LFBB14
.LM348:
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
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 14 */
.L__stack_usage = 14
	movw r16,r24
	movw r12,r20
	movw r14,r22
	.stabn	68,0,1172,.LM349-.LFBB14
.LM349:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L170
	.stabn	68,0,1172,.LM350-.LFBB14
.LM350:
	movw r30,r16
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L170
	.stabn	68,0,1178,.LM351-.LFBB14
.LM351:
	ld r24,Z
	.stabn	68,0,1178,.LM352-.LFBB14
.LM352:
	cpi r24,lo8(2)
	brne .+2
	rjmp .L163
	cpi r24,lo8(3)
	brne .+2
	rjmp .L164
	cpi r24,lo8(1)
	breq .+2
	rjmp .L170
	.stabn	68,0,1180,.LM353-.LFBB14
.LM353:
	movw r24,r20
	lsr r25
	ror r24
	.stabn	68,0,1180,.LM354-.LFBB14
.LM354:
	add r24,r20
	adc r25,r21
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,1181,.LM355-.LFBB14
.LM355:
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1181,.LM356-.LFBB14
.LM356:
	ldd r20,Z+32
	ldd r21,Z+33
	ldd r22,Z+34
	ldd r23,Z+35
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r16
	call move_window
	.stabn	68,0,1181,.LM357-.LFBB14
.LM357:
	or r24,r25
	breq .L165
.L166:
	.stabn	68,0,1176,.LM358-.LFBB14
.LM358:
	ldi r22,lo8(-1)
	ldi r23,lo8(-1)
	movw r24,r22
.L161:
/* epilogue start */
	.stabn	68,0,1230,.LM359-.LFBB14
.LM359:
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
.L165:
	.stabn	68,0,1182,.LM360-.LFBB14
.LM360:
	ldd r10,Y+1
	ldd r11,Y+2
	ldi r25,-1
	sub r10,r25
	sbc r11,r25
	.stabn	68,0,1182,.LM361-.LFBB14
.LM361:
	ldd r30,Y+1
	ldd r31,Y+2
	andi r31,1
	.stabn	68,0,1182,.LM362-.LFBB14
.LM362:
	add r30,r16
	adc r31,r17
	ldd r31,Z+48
	std Y+1,r31
	.stabn	68,0,1183,.LM363-.LFBB14
.LM363:
	movw r24,r10
	mov r24,r25
	clr r25
	lsr r24
	.stabn	68,0,1183,.LM364-.LFBB14
.LM364:
	movw r30,r16
	ldd r20,Z+32
	ldd r21,Z+33
	ldd r22,Z+34
	ldd r23,Z+35
	add r20,r24
	adc r21,r25
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	movw r24,r16
	call move_window
	.stabn	68,0,1183,.LM365-.LFBB14
.LM365:
	or r24,r25
	brne .L166
	.stabn	68,0,1184,.LM366-.LFBB14
.LM366:
	ldi r31,1
	and r11,r31
	.stabn	68,0,1184,.LM367-.LFBB14
.LM367:
	movw r30,r16
	add r30,r10
	adc r31,r11
	ldd r24,Z+48
	.stabn	68,0,1184,.LM368-.LFBB14
.LM368:
	ldd r25,Y+1
	mov r23,r24
	mov r22,r25
	.stabn	68,0,1185,.LM369-.LFBB14
.LM369:
	sbrs r12,0
	rjmp .L167
	.stabn	68,0,1185,.LM370-.LFBB14
.LM370:
	ldi r30,4
	1:
	lsr r23
	ror r22
	dec r30
	brne 1b
.L171:
	.stabn	68,0,1185,.LM371-.LFBB14
.LM371:
	ldi r25,0
	ldi r24,0
	rjmp .L161
.L167:
	andi r23,15
	rjmp .L171
.L163:
	.stabn	68,0,1189,.LM372-.LFBB14
.LM372:
	clr r23
	mov r22,r15
	mov r21,r14
	mov r20,r13
	.stabn	68,0,1189,.LM373-.LFBB14
.LM373:
	ldd r24,Z+32
	ldd r25,Z+33
	ldd r26,Z+34
	ldd r27,Z+35
	add r20,r24
	adc r21,r25
	adc r22,r26
	adc r23,r27
	movw r24,r16
	call move_window
	.stabn	68,0,1189,.LM374-.LFBB14
.LM374:
	or r24,r25
	breq .+2
	rjmp .L166
	.stabn	68,0,1190,.LM375-.LFBB14
.LM375:
	movw r30,r12
	lsl r30
	rol r31
	andi r30,254
	andi r31,1
.LBB176:
.LBB177:
	.stabn	68,0,624,.LM376-.LFBB14
.LM376:
	add r30,r16
	adc r31,r17
.LBE177:
.LBE176:
	.stabn	68,0,1190,.LM377-.LFBB14
.LM377:
	ldd r22,Z+48
	ldd r23,Z+49
	rjmp .L171
.L164:
	.stabn	68,0,1194,.LM378-.LFBB14
.LM378:
	ldd r24,Z+32
	ldd r25,Z+33
	ldd r26,Z+34
	ldd r27,Z+35
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
	.stabn	68,0,1194,.LM379-.LFBB14
.LM379:
	or r24,r25
	breq .+2
	rjmp .L166
	.stabn	68,0,1195,.LM380-.LFBB14
.LM380:
	subi r16,-48
	sbci r17,-1
	.stabn	68,0,1195,.LM381-.LFBB14
.LM381:
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
	.stabn	68,0,1195,.LM382-.LFBB14
.LM382:
	andi r25,15
	.stabn	68,0,1196,.LM383-.LFBB14
.LM383:
	rjmp .L161
.L170:
	.stabn	68,0,1178,.LM384-.LFBB14
.LM384:
	ldi r22,lo8(1)
	ldi r23,0
	ldi r24,0
	ldi r25,0
	.stabn	68,0,1229,.LM385-.LFBB14
.LM385:
	rjmp .L161
	.size	get_fat.isra.0, .-get_fat.isra.0
	.stabs	"val:r(0,1)",64,0,0,22
	.stabn	192,0,0,.LFBB14-.LFBB14
	.stabn	224,0,0,.Lscope14-.LFBB14
.Lscope14:
	.stabs	"remove_chain.isra.0:f(0,24)",36,0,0,remove_chain.isra.0
	.stabs	"ISRA.322:P(0,8)",64,0,0,28
	.stabs	"clst:P(0,1)",64,0,0,12
	.stabs	"pclst:P(0,1)",64,0,0,20
	.type	remove_chain.isra.0, @function
remove_chain.isra.0:
	.stabn	68,0,1430,.LM386-.LFBB15
.LM386:
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
	.stabn	68,0,1446,.LM387-.LFBB15
.LM387:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L173
	.stabn	68,0,1446,.LM388-.LFBB15
.LM388:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L173
	.stabn	68,0,1449,.LM389-.LFBB15
.LM389:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L175
	.stabn	68,0,1450,.LM390-.LFBB15
.LM390:
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
	movw r18,r16
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1451,.LM391-.LFBB15
.LM391:
	or r24,r25
	brne .L172
.L175:
	movw r8,r12
	movw r10,r14
	.stabn	68,0,1456,.LM392-.LFBB15
.LM392:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1457,.LM393-.LFBB15
.LM393:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L178
.L180:
	.stabn	68,0,1515,.LM394-.LFBB15
.LM394:
	ldi r19,0
	ldi r18,0
.L172:
	.stabn	68,0,1516,.LM395-.LFBB15
.LM395:
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
.L178:
	.stabn	68,0,1458,.LM396-.LFBB15
.LM396:
	ldi r24,1
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L173
	.stabn	68,0,1459,.LM397-.LFBB15
.LM397:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	breq .L181
	.stabn	68,0,1461,.LM398-.LFBB15
.LM398:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r20,r8
	movw r22,r10
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1462,.LM399-.LFBB15
.LM399:
	or r24,r25
	brne .L172
	.stabn	68,0,1464,.LM400-.LFBB15
.LM400:
	ldd r24,Y+16
	ldd r25,Y+17
	ldd r26,Y+18
	ldd r27,Y+19
	.stabn	68,0,1464,.LM401-.LFBB15
.LM401:
	ldd r20,Y+20
	ldd r21,Y+21
	ldd r22,Y+22
	ldd r23,Y+23
	.stabn	68,0,1464,.LM402-.LFBB15
.LM402:
	movw r16,r20
	movw r18,r22
	subi r16,2
	sbc r17,__zero_reg__
	sbc r18,__zero_reg__
	sbc r19,__zero_reg__
	.stabn	68,0,1464,.LM403-.LFBB15
.LM403:
	cp r24,r16
	cpc r25,r17
	cpc r26,r18
	cpc r27,r19
	brsh .L179
	.stabn	68,0,1465,.LM404-.LFBB15
.LM404:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+16,r24
	std Y+17,r25
	std Y+18,r26
	std Y+19,r27
	.stabn	68,0,1466,.LM405-.LFBB15
.LM405:
	ldd r24,Y+5
	ori r24,lo8(1)
	std Y+5,r24
.L179:
	.stabn	68,0,1487,.LM406-.LFBB15
.LM406:
	cp r12,r20
	cpc r13,r21
	cpc r14,r22
	cpc r15,r23
	brsh .+2
	rjmp .L175
	rjmp .L180
.L173:
	.stabn	68,0,1446,.LM407-.LFBB15
.LM407:
	ldi r18,lo8(2)
	ldi r19,0
	rjmp .L172
.L181:
	.stabn	68,0,1459,.LM408-.LFBB15
.LM408:
	ldi r18,lo8(1)
	ldi r19,0
	rjmp .L172
	.size	remove_chain.isra.0, .-remove_chain.isra.0
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"nxt:r(0,1)",64,0,0,12
	.stabn	192,0,0,.LFBB15-.LFBB15
	.stabn	224,0,0,.Lscope15-.LFBB15
.Lscope15:
	.stabs	"create_chain.isra.0:f(0,1)",36,0,0,create_chain.isra.0
	.stabs	"ISRA.326:P(0,8)",64,0,0,28
	.stabs	"clst:P(0,1)",64,0,0,8
	.type	create_chain.isra.0, @function
create_chain.isra.0:
	.stabn	68,0,1525,.LM409-.LFBB16
.LM409:
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
	.stabn	68,0,1535,.LM410-.LFBB16
.LM410:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L187
	.stabn	68,0,1536,.LM411-.LFBB16
.LM411:
	ldd r4,Y+12
	ldd r5,Y+13
	ldd r6,Y+14
	ldd r7,Y+15
	.stabn	68,0,1537,.LM412-.LFBB16
.LM412:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	breq .L206
	.stabn	68,0,1537,.LM413-.LFBB16
.LM413:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	cp r4,r24
	cpc r5,r25
	cpc r6,r26
	cpc r7,r27
	brlo .L188
.L206:
	.stabn	68,0,1537,.LM414-.LFBB16
.LM414:
	mov r4,__zero_reg__
	mov r5,__zero_reg__
	movw r6,r4
	inc r4
	rjmp .L188
.L187:
	.stabn	68,0,1540,.LM415-.LFBB16
.LM415:
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1541,.LM416-.LFBB16
.LM416:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .L189
.L195:
	.stabn	68,0,1541,.LM417-.LFBB16
.LM417:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	inc r12
.L186:
	.stabn	68,0,1616,.LM418-.LFBB16
.LM418:
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
.L189:
	.stabn	68,0,1542,.LM419-.LFBB16
.LM419:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	brne .+2
	rjmp .L191
	.stabn	68,0,1543,.LM420-.LFBB16
.LM420:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	movw r4,r8
	movw r6,r10
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L186
.L188:
	.stabn	68,0,1546,.LM421-.LFBB16
.LM421:
	ldd r24,Y+16
	ldd r25,Y+17
	ldd r26,Y+18
	ldd r27,Y+19
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L192
.L199:
	.stabn	68,0,1546,.LM422-.LFBB16
.LM422:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	rjmp .L186
.L192:
	.stabn	68,0,1578,.LM423-.LFBB16
.LM423:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	.stabn	68,0,1576,.LM424-.LFBB16
.LM424:
	cp r8,r4
	cpc r9,r5
	cpc r10,r6
	cpc r11,r7
	breq .+2
	rjmp .L193
	.stabn	68,0,1577,.LM425-.LFBB16
.LM425:
	movw r14,r10
	movw r12,r8
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	sbc r14,r18
	sbc r15,r18
	.stabn	68,0,1578,.LM426-.LFBB16
.LM426:
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L194
	.stabn	68,0,1578,.LM427-.LFBB16
.LM427:
	ldi r18,lo8(2)
	mov r12,r18
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L194:
	.stabn	68,0,1579,.LM428-.LFBB16
.LM428:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,1580,.LM429-.LFBB16
.LM429:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L195
	.stabn	68,0,1580,.LM430-.LFBB16
.LM430:
	cpi r20,-1
	ldi r24,-1
	cpc r21,r24
	cpc r22,r24
	cpc r23,r24
	brne .+2
	rjmp .L191
	.stabn	68,0,1581,.LM431-.LFBB16
.LM431:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .+2
	rjmp .L196
	.stabn	68,0,1582,.LM432-.LFBB16
.LM432:
	ldd r24,Y+12
	ldd r25,Y+13
	ldd r26,Y+14
	ldd r27,Y+15
	.stabn	68,0,1583,.LM433-.LFBB16
.LM433:
	cpi r24,2
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brlo .L193
	.stabn	68,0,1583,.LM434-.LFBB16
.LM434:
	ldd r20,Y+20
	ldd r21,Y+21
	ldd r22,Y+22
	ldd r23,Y+23
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L193
	movw r4,r24
	movw r6,r26
.L193:
	movw r14,r6
	movw r12,r4
.L200:
	.stabn	68,0,1590,.LM435-.LFBB16
.LM435:
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	sbc r14,r18
	sbc r15,r18
	.stabn	68,0,1591,.LM436-.LFBB16
.LM436:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L198
	.stabn	68,0,1593,.LM437-.LFBB16
.LM437:
	ldi r24,1
	cp r4,r24
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brne .+2
	rjmp .L199
	.stabn	68,0,1592,.LM438-.LFBB16
.LM438:
	ldi r25,lo8(2)
	mov r12,r25
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L198:
	.stabn	68,0,1595,.LM439-.LFBB16
.LM439:
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,1596,.LM440-.LFBB16
.LM440:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L197
	.stabn	68,0,1597,.LM441-.LFBB16
.LM441:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L195
	.stabn	68,0,1597,.LM442-.LFBB16
.LM442:
	cpi r20,-1
	sbci r21,-1
	sbci r22,-1
	sbci r23,-1
	brne .+2
	rjmp .L191
	.stabn	68,0,1598,.LM443-.LFBB16
.LM443:
	cp r4,r12
	cpc r5,r13
	cpc r6,r14
	cpc r7,r15
	brne .L200
	rjmp .L199
.L196:
	.stabn	68,0,1587,.LM444-.LFBB16
.LM444:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .+2
	rjmp .L193
.L197:
	.stabn	68,0,1601,.LM445-.LFBB16
.LM445:
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
	movw r18,r16
	movw r22,r14
	movw r20,r12
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1602,.LM446-.LFBB16
.LM446:
	or r24,r25
	brne .L201
	.stabn	68,0,1602,.LM447-.LFBB16
.LM447:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L202
.L205:
	.stabn	68,0,1608,.LM448-.LFBB16
.LM448:
	std Y+12,r12
	std Y+13,r13
	std Y+14,r14
	std Y+15,r15
	.stabn	68,0,1609,.LM449-.LFBB16
.LM449:
	ldd r24,Y+16
	ldd r25,Y+17
	ldd r26,Y+18
	ldd r27,Y+19
	.stabn	68,0,1609,.LM450-.LFBB16
.LM450:
	ldd r20,Y+20
	ldd r21,Y+21
	ldd r22,Y+22
	ldd r23,Y+23
	subi r20,2
	sbc r21,__zero_reg__
	sbc r22,__zero_reg__
	sbc r23,__zero_reg__
	.stabn	68,0,1609,.LM451-.LFBB16
.LM451:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L203
.L204:
	.stabn	68,0,1610,.LM452-.LFBB16
.LM452:
	ldd r24,Y+5
	ori r24,lo8(1)
	std Y+5,r24
	rjmp .L186
.L202:
	.stabn	68,0,1603,.LM453-.LFBB16
.LM453:
	movw r18,r14
	movw r16,r12
	movw r22,r10
	movw r20,r8
	movw r24,r28
	call put_fat
	movw r18,r24
	.stabn	68,0,1607,.LM454-.LFBB16
.LM454:
	or r24,r25
	breq .L205
.L201:
	.stabn	68,0,1612,.LM455-.LFBB16
.LM455:
	cpi r18,1
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L195
.L191:
	clr r12
	dec r12
	mov r13,r12
	movw r14,r12
	rjmp .L186
.L203:
	.stabn	68,0,1609,.LM456-.LFBB16
.LM456:
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	std Y+16,r24
	std Y+17,r25
	std Y+18,r26
	std Y+19,r27
	rjmp .L204
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
	.stabn	68,0,1698,.LM457-.LFBB17
.LM457:
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
	.stabn	68,0,1704,.LM458-.LFBB17
.LM458:
	movw r30,r24
	ld r28,Z
	ldd r29,Z+1
	.stabn	68,0,1710,.LM459-.LFBB17
.LM459:
	std Z+14,__zero_reg__
	std Z+15,__zero_reg__
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	.stabn	68,0,1711,.LM460-.LFBB17
.LM460:
	ldd r12,Z+6
	ldd r13,Z+7
	ldd r14,Z+8
	ldd r15,Z+9
	.stabn	68,0,1712,.LM461-.LFBB17
.LM461:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L240
	.stabn	68,0,1712,.LM462-.LFBB17
.LM462:
	ld r24,Y
	cpi r24,lo8(3)
	brlo .L233
	.stabn	68,0,1713,.LM463-.LFBB17
.LM463:
	ldd r24,Y+36
	ldd r25,Y+37
	ldd r26,Y+38
	ldd r27,Y+39
	.stabn	68,0,1717,.LM464-.LFBB17
.LM464:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L232
.L233:
	.stabn	68,0,1718,.LM465-.LFBB17
.LM465:
	ldd r24,Y+8
	ldd r25,Y+9
	or r24,r25
	brne .L234
.L238:
	.stabn	68,0,1718,.LM466-.LFBB17
.LM466:
	ldi r24,lo8(2)
	ldi r25,0
.L231:
/* epilogue start */
	.stabn	68,0,1737,.LM467-.LFBB17
.LM467:
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
.L234:
	.stabn	68,0,1719,.LM468-.LFBB17
.LM468:
	ldd r20,Y+36
	ldd r21,Y+37
	ldd r22,Y+38
	ldd r23,Y+39
.L236:
	.stabn	68,0,1719,.LM469-.LFBB17
.LM469:
	movw r30,r16
	std Z+22,r20
	std Z+23,r21
	std Z+24,r22
	std Z+25,r23
	.stabn	68,0,1731,.LM470-.LFBB17
.LM470:
	std Z+18,r12
	std Z+19,r13
	std Z+20,r14
	std Z+21,r15
	.stabn	68,0,1732,.LM471-.LFBB17
.LM471:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .L238
	.stabn	68,0,1734,.LM472-.LFBB17
.LM472:
	adiw r28,48
	.stabn	68,0,1734,.LM473-.LFBB17
.LM473:
	std Z+27,r29
	std Z+26,r28
	.stabn	68,0,1736,.LM474-.LFBB17
.LM474:
	ldi r25,0
	ldi r24,0
	rjmp .L231
.L240:
	movw r26,r14
	movw r24,r12
.L232:
	.stabn	68,0,1722,.LM475-.LFBB17
.LM475:
	ldd r8,Y+10
	ldd r9,Y+11
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
	.stabn	68,0,1723,.LM476-.LFBB17
.LM476:
	movw r12,r24
	movw r14,r26
.L237:
	.stabn	68,0,1724,.LM477-.LFBB17
.LM477:
	movw r22,r14
	movw r20,r12
	.stabn	68,0,1723,.LM478-.LFBB17
.LM478:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .L239
	.stabn	68,0,1729,.LM479-.LFBB17
.LM479:
	movw r24,r28
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	rjmp .L236
.L239:
	.stabn	68,0,1724,.LM480-.LFBB17
.LM480:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1725,.LM481-.LFBB17
.LM481:
	ldi r31,-1
	cp r12,r31
	cpc r13,r31
	cpc r14,r31
	cpc r15,r31
	breq .L241
	.stabn	68,0,1726,.LM482-.LFBB17
.LM482:
	ldi r24,2
	cp r12,r24
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L238
	.stabn	68,0,1726,.LM483-.LFBB17
.LM483:
	ldd r24,Y+20
	ldd r25,Y+21
	ldd r26,Y+22
	ldd r27,Y+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L237
	rjmp .L238
.L241:
	.stabn	68,0,1725,.LM484-.LFBB17
.LM484:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L231
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
	.stabn	68,0,1750,.LM485-.LFBB18
.LM485:
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
	.stabn	68,0,1752,.LM486-.LFBB18
.LM486:
	ld r16,Y
	ldd r17,Y+1
	.stabn	68,0,1755,.LM487-.LFBB18
.LM487:
	ldd r4,Y+14
	ldd r5,Y+15
	ldd r6,Y+16
	ldd r7,Y+17
	ldi r24,32
	add r4,r24
	adc r5,__zero_reg__
	adc r6,__zero_reg__
	adc r7,__zero_reg__
	.stabn	68,0,1756,.LM488-.LFBB18
.LM488:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	ldi r25,32
	cpc r6,r25
	cpc r7,__zero_reg__
	brlo .L246
	.stabn	68,0,1756,.LM489-.LFBB18
.LM489:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
.L246:
	.stabn	68,0,1757,.LM490-.LFBB18
.LM490:
	ldd r24,Y+22
	ldd r25,Y+23
	ldd r26,Y+24
	ldd r27,Y+25
	.stabn	68,0,1757,.LM491-.LFBB18
.LM491:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L258
	.stabn	68,0,1759,.LM492-.LFBB18
.LM492:
	movw r22,r6
	movw r20,r4
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,1759,.LM493-.LFBB18
.LM493:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L249
	.stabn	68,0,1760,.LM494-.LFBB18
.LM494:
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	std Y+22,r24
	std Y+23,r25
	std Y+24,r26
	std Y+25,r27
	.stabn	68,0,1762,.LM495-.LFBB18
.LM495:
	ldd r20,Y+18
	ldd r21,Y+19
	ldd r22,Y+20
	ldd r23,Y+21
	.stabn	68,0,1762,.LM496-.LFBB18
.LM496:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L250
	.stabn	68,0,1763,.LM497-.LFBB18
.LM497:
	movw r26,r16
	adiw r26,8
	ld r24,X+
	ld r25,X
	ldi r27,0
	ldi r26,0
	.stabn	68,0,1763,.LM498-.LFBB18
.LM498:
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
	rjmp .L249
.L255:
	.stabn	68,0,1764,.LM499-.LFBB18
.LM499:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
.L258:
	.stabn	68,0,1757,.LM500-.LFBB18
.LM500:
	ldi r24,lo8(4)
	ldi r25,0
	rjmp .L245
.L250:
	.stabn	68,0,1768,.LM501-.LFBB18
.LM501:
	movw r30,r16
	ldd r24,Z+10
	ldd r25,Z+11
	sbiw r24,1
	ldi r27,0
	ldi r26,0
	.stabn	68,0,1768,.LM502-.LFBB18
.LM502:
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
	.stabn	68,0,1768,.LM503-.LFBB18
.LM503:
	and r24,r12
	and r25,r13
	and r26,r14
	and r27,r15
	.stabn	68,0,1768,.LM504-.LFBB18
.LM504:
	or r24,r25
	or r24,r26
	or r24,r27
	breq .+2
	rjmp .L249
	.stabn	68,0,1769,.LM505-.LFBB18
.LM505:
	movw r24,r16
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1770,.LM506-.LFBB18
.LM506:
	ldi r31,2
	cp r12,r31
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .L252
.L256:
	.stabn	68,0,1770,.LM507-.LFBB18
.LM507:
	ldi r24,lo8(2)
	ldi r25,0
.L245:
/* epilogue start */
	.stabn	68,0,1797,.LM508-.LFBB18
.LM508:
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
.L252:
	.stabn	68,0,1771,.LM509-.LFBB18
.LM509:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	brne .L253
.L257:
	.stabn	68,0,1771,.LM510-.LFBB18
.LM510:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L245
.L253:
	.stabn	68,0,1772,.LM511-.LFBB18
.LM511:
	movw r30,r16
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .L254
	.stabn	68,0,1774,.LM512-.LFBB18
.LM512:
	or r10,r11
	brne .+2
	rjmp .L255
	.stabn	68,0,1777,.LM513-.LFBB18
.LM513:
	ldd r20,Y+18
	ldd r21,Y+19
	ldd r22,Y+20
	ldd r23,Y+21
	ld r24,Y
	ldd r25,Y+1
	call create_chain.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,1778,.LM514-.LFBB18
.LM514:
	ldi r24,lo8(7)
	ldi r25,0
	.stabn	68,0,1778,.LM515-.LFBB18
.LM515:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L245
	.stabn	68,0,1779,.LM516-.LFBB18
.LM516:
	ldi r31,1
	cp r12,r31
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L256
	.stabn	68,0,1780,.LM517-.LFBB18
.LM517:
	ldi r24,-1
	cp r12,r24
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	breq .L257
	.stabn	68,0,1781,.LM518-.LFBB18
.LM518:
	movw r22,r14
	movw r20,r12
	movw r24,r16
	call dir_clear
	.stabn	68,0,1781,.LM519-.LFBB18
.LM519:
	or r24,r25
	brne .L257
.L254:
	.stabn	68,0,1788,.LM520-.LFBB18
.LM520:
	std Y+18,r12
	std Y+19,r13
	std Y+20,r14
	std Y+21,r15
	.stabn	68,0,1789,.LM521-.LFBB18
.LM521:
	movw r22,r14
	movw r20,r12
	movw r24,r16
	call clst2sect
	std Y+22,r22
	std Y+23,r23
	std Y+24,r24
	std Y+25,r25
.L249:
	.stabn	68,0,1793,.LM522-.LFBB18
.LM522:
	std Y+14,r4
	std Y+15,r5
	std Y+16,r6
	std Y+17,r7
	.stabn	68,0,1794,.LM523-.LFBB18
.LM523:
	subi r16,-48
	sbci r17,-1
	.stabn	68,0,1794,.LM524-.LFBB18
.LM524:
	ldi r25,1
	and r5,r25
	add r16,r4
	adc r17,r5
	.stabn	68,0,1794,.LM525-.LFBB18
.LM525:
	std Y+27,r17
	std Y+26,r16
	.stabn	68,0,1796,.LM526-.LFBB18
.LM526:
	ldi r25,0
	ldi r24,0
	rjmp .L245
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
	.stabn	68,0,3056,.LM527-.LFBB19
.LM527:
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 26 */
.L__stack_usage = 26
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,3059,.LM528-.LFBB19
.LM528:
	ldd r26,Y+3
	ldd r27,Y+4
	ld r4,X+
	ld r5,X
	movw r30,r22
.L312:
	movw r12,r30
	.stabn	68,0,3068,.LM529-.LFBB19
.LM529:
	ld r24,Z+
	cpi r24,lo8(47)
	breq .L312
	.stabn	68,0,3068,.LM530-.LFBB19
.LM530:
	cpi r24,lo8(92)
	breq .L312
	.stabn	68,0,3069,.LM531-.LFBB19
.LM531:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+6,__zero_reg__
	std Z+7,__zero_reg__
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
	.stabn	68,0,3088,.LM532-.LFBB19
.LM532:
	movw r26,r12
	ld r24,X
	cpi r24,lo8(32)
	brsh .+2
	rjmp .L321
.LBB182:
.LBB183:
	.stabn	68,0,2987,.LM533-.LFBB19
.LM533:
	movw r10,r30
	ldi r27,28
	add r10,r27
	adc r11,__zero_reg__
	.stabn	68,0,3038,.LM534-.LFBB19
.LM534:
	ldi r18,lo8(5)
	mov r2,r18
.LBE183:
.LBE182:
	.stabn	68,0,3124,.LM535-.LFBB19
.LM535:
	movw r30,r4
	adiw r30,48
	std Y+2,r31
	std Y+1,r30
.L271:
.LBB188:
.LBB184:
	.stabn	68,0,2988,.LM536-.LFBB19
.LM536:
	ldi r20,lo8(11)
	ldi r21,0
	ldi r22,lo8(32)
	ldi r23,0
	movw r24,r10
	call memset
	movw r6,r12
	.stabn	68,0,2989,.LM537-.LFBB19
.LM537:
	ldi r16,0
	ldi r17,0
	.stabn	68,0,2989,.LM538-.LFBB19
.LM538:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
	.stabn	68,0,2989,.LM539-.LFBB19
.LM539:
	ldi r25,lo8(8)
	mov r14,r25
.L323:
	mov r15,__zero_reg__
.L272:
	.stabn	68,0,3004,.LM540-.LFBB19
.LM540:
	ldi r27,-1
	sub r8,r27
	sbc r9,r27
	.stabn	68,0,3004,.LM541-.LFBB19
.LM541:
	movw r30,r6
	ld r3,Z+
	movw r6,r30
	.stabn	68,0,3005,.LM542-.LFBB19
.LM542:
	ldi r31,lo8(32)
	cp r31,r3
	brsh .L273
	.stabn	68,0,3006,.LM543-.LFBB19
.LM543:
	ldi r24,lo8(47)
	cp r3,r24
	breq .L276
	.stabn	68,0,3006,.LM544-.LFBB19
.LM544:
	ldi r25,lo8(92)
	cpse r3,r25
	rjmp .L322
.L276:
	.stabn	68,0,3007,.LM545-.LFBB19
.LM545:
	movw r30,r12
	add r30,r8
	adc r31,r9
	ld r24,Z
	cpi r24,lo8(47)
	brne .+2
	rjmp .L277
	cpi r24,lo8(92)
	brne .+2
	rjmp .L277
.L273:
	.stabn	68,0,3035,.LM546-.LFBB19
.LM546:
	add r12,r8
	adc r13,r9
	.stabn	68,0,3036,.LM547-.LFBB19
.LM547:
	or r16,r17
	brne .+2
	rjmp .L297
	.stabn	68,0,3038,.LM548-.LFBB19
.LM548:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,28
	ld r24,X
	sbiw r26,28
	cpi r24,lo8(-27)
	brne .L283
	.stabn	68,0,3038,.LM549-.LFBB19
.LM549:
	adiw r26,28
	st X,r2
.L283:
	.stabn	68,0,3039,.LM550-.LFBB19
.LM550:
	ldi r27,lo8(32)
	ldi r24,lo8(4)
	cp r27,r3
	brsh .L284
	.stabn	68,0,3039,.LM551-.LFBB19
.LM551:
	ldi r24,lo8(1)
	movw r30,r12
	ld r25,Z
	cpi r25,lo8(33)
	brlo .L285
	ldi r24,0
.L285:
	lsl r24
	lsl r24
.L284:
	.stabn	68,0,3039,.LM552-.LFBB19
.LM552:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,39
	st X,r24
	sbiw r26,39
.LBE184:
.LBE188:
.LBB189:
.LBB190:
	.stabn	68,0,2390,.LM553-.LFBB19
.LM553:
	ld r14,X+
	ld r15,X
	sbiw r26,1
	.stabn	68,0,2396,.LM554-.LFBB19
.LM554:
	movw r24,r26
	call dir_sdi.constprop.0
.L324:
	movw r16,r24
	.stabn	68,0,2397,.LM555-.LFBB19
.LM555:
	or r24,r25
	breq .+2
	rjmp .L286
	.stabn	68,0,2423,.LM556-.LFBB19
.LM556:
	ldd r30,Y+3
	ldd r31,Y+4
	ldd r20,Z+22
	ldd r21,Z+23
	ldd r22,Z+24
	ldd r23,Z+25
	movw r24,r14
	call move_window
	movw r16,r24
	.stabn	68,0,2424,.LM557-.LFBB19
.LM557:
	or r24,r25
	breq .+2
	rjmp .L286
	.stabn	68,0,2425,.LM558-.LFBB19
.LM558:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,26
	ld r30,X+
	ld r31,X
	sbiw r26,26+1
	.stabn	68,0,2426,.LM559-.LFBB19
.LM559:
	ld r24,Z
	tst r24
	brne .+2
	rjmp .L294
	.stabn	68,0,2449,.LM560-.LFBB19
.LM560:
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2449,.LM561-.LFBB19
.LM561:
	adiw r26,4
	st X,r24
	.stabn	68,0,2450,.LM562-.LFBB19
.LM562:
	ldd r24,Z+11
	sbrc r24,3
	rjmp .L287
	.stabn	68,0,2450,.LM563-.LFBB19
.LM563:
	ldi r20,lo8(11)
	ldi r21,0
	movw r22,r10
	movw r24,r30
	call memcmp
	.stabn	68,0,2450,.LM564-.LFBB19
.LM564:
	or r24,r25
	brne .+2
	rjmp .L286
.L287:
	.stabn	68,0,2452,.LM565-.LFBB19
.LM565:
	ldi r22,0
	ldi r23,0
	ldd r24,Y+3
	ldd r25,Y+4
	call dir_next
	rjmp .L324
.L321:
.LBE190:
.LBE189:
	.stabn	68,0,3089,.LM566-.LFBB19
.LM566:
	ldi r24,lo8(-128)
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,39
	st X,r24
	sbiw r26,39
	.stabn	68,0,3090,.LM567-.LFBB19
.LM567:
	movw r24,r26
/* epilogue start */
	.stabn	68,0,3130,.LM568-.LFBB19
.LM568:
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
	.stabn	68,0,3090,.LM569-.LFBB19
.LM569:
	jmp dir_sdi.constprop.0
.L277:
.LBB192:
.LBB185:
	.stabn	68,0,3007,.LM570-.LFBB19
.LM570:
	ldi r26,-1
	sub r8,r26
	sbc r9,r26
	rjmp .L276
.L322:
	.stabn	68,0,3010,.LM571-.LFBB19
.LM571:
	ldi r27,lo8(46)
	cp r3,r27
	brne .+2
	rjmp .L278
	.stabn	68,0,3010,.LM572-.LFBB19
.LM572:
	cp r16,r14
	cpc r17,r15
	brlo .+2
	rjmp .L297
	.stabn	68,0,3020,.LM573-.LFBB19
.LM573:
	sbrs r3,7
	rjmp .L280
	.stabn	68,0,3021,.LM574-.LFBB19
.LM574:
	mov r30,r3
	andi r30,lo8(127)
	ldi r31,0
	.stabn	68,0,3021,.LM575-.LFBB19
.LM575:
	subi r30,lo8(-(ExCvt))
	sbci r31,hi8(-(ExCvt))
	ld r3,Z
.L280:
	.stabn	68,0,3030,.LM576-.LFBB19
.LM576:
	mov r22,r3
	ldi r23,0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call strchr
	.stabn	68,0,3030,.LM577-.LFBB19
.LM577:
	or r24,r25
	breq .+2
	rjmp .L297
	.stabn	68,0,3031,.LM578-.LFBB19
.LM578:
	ldi r24,lo8(-97)
	add r24,r3
	.stabn	68,0,3031,.LM579-.LFBB19
.LM579:
	cpi r24,lo8(26)
	brsh .L281
	.stabn	68,0,3031,.LM580-.LFBB19
.LM580:
	ldi r30,lo8(-32)
	add r3,r30
.L281:
	.stabn	68,0,3032,.LM581-.LFBB19
.LM581:
	movw r30,r10
	add r30,r16
	adc r31,r17
	st Z,r3
	.stabn	68,0,3032,.LM582-.LFBB19
.LM582:
	subi r16,-1
	sbci r17,-1
	rjmp .L272
.L294:
.LBE185:
.LBE192:
.LBB193:
.LBB191:
	.stabn	68,0,2426,.LM583-.LFBB19
.LM583:
	ldi r16,lo8(4)
	ldi r17,0
.L286:
.LBE191:
.LBE193:
	.stabn	68,0,3097,.LM584-.LFBB19
.LM584:
	ldd r30,Y+3
	ldd r31,Y+4
	ldd r24,Z+39
	.stabn	68,0,3098,.LM585-.LFBB19
.LM585:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L289
	.stabn	68,0,3099,.LM586-.LFBB19
.LM586:
	cpi r16,4
	cpc r17,__zero_reg__
	brne .L269
	.stabn	68,0,3105,.LM587-.LFBB19
.LM587:
	sbrs r24,2
	rjmp .L296
.L269:
	.stabn	68,0,3130,.LM588-.LFBB19
.LM588:
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
.L289:
	.stabn	68,0,3110,.LM589-.LFBB19
.LM589:
	sbrc r24,2
	rjmp .L269
	.stabn	68,0,3112,.LM590-.LFBB19
.LM590:
	ldd r26,Y+3
	ldd r27,Y+4
	adiw r26,4
	ld r24,X
	sbiw r26,4
	sbrs r24,4
	rjmp .L296
	.stabn	68,0,3124,.LM591-.LFBB19
.LM591:
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
	.stabn	68,0,3124,.LM592-.LFBB19
.LM592:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+6,r22
	std Z+7,r23
	std Z+8,r24
	std Z+9,r25
	.stabn	68,0,3094,.LM593-.LFBB19
.LM593:
	rjmp .L271
.L296:
	.stabn	68,0,3105,.LM594-.LFBB19
.LM594:
	ldi r16,lo8(5)
	ldi r17,0
	rjmp .L269
.L297:
.LBB194:
.LBB186:
	.stabn	68,0,3011,.LM595-.LFBB19
.LM595:
	ldi r16,lo8(6)
	ldi r17,0
.LBE186:
.LBE194:
	.stabn	68,0,3129,.LM596-.LFBB19
.LM596:
	rjmp .L269
.L278:
.LBB195:
.LBB187:
	.stabn	68,0,3011,.LM597-.LFBB19
.LM597:
	ldi r31,11
	cp r14,r31
	cpc r15,__zero_reg__
	breq .L297
	.stabn	68,0,3012,.LM598-.LFBB19
.LM598:
	ldi r16,lo8(8)
	ldi r17,0
	.stabn	68,0,3012,.LM599-.LFBB19
.LM599:
	ldi r24,lo8(11)
	mov r14,r24
	rjmp .L323
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
	.stabn	68,0,2307,.LM600-.LFBB20
.LM600:
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
	.stabn	68,0,2313,.LM601-.LFBB20
.LM601:
	ld r16,Y
	ldd r17,Y+1
	.stabn	68,0,2312,.LM602-.LFBB20
.LM602:
	ldi r18,lo8(4)
	ldi r19,0
.L326:
	.stabn	68,0,2319,.LM603-.LFBB20
.LM603:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	.stabn	68,0,2319,.LM604-.LFBB20
.LM604:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L330
	.stabn	68,0,2373,.LM605-.LFBB20
.LM605:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L331
	rjmp .L327
.L330:
	.stabn	68,0,2320,.LM606-.LFBB20
.LM606:
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,2321,.LM607-.LFBB20
.LM607:
	or r24,r25
	brne .L327
	.stabn	68,0,2322,.LM608-.LFBB20
.LM608:
	ldd r30,Y+26
	ldd r31,Y+27
	.stabn	68,0,2322,.LM609-.LFBB20
.LM609:
	ld r25,Z
	.stabn	68,0,2323,.LM610-.LFBB20
.LM610:
	tst r25
	breq .L332
	.stabn	68,0,2343,.LM611-.LFBB20
.LM611:
	ldd r24,Z+11
	andi r24,lo8(63)
	.stabn	68,0,2343,.LM612-.LFBB20
.LM612:
	std Y+4,r24
	.stabn	68,0,2364,.LM613-.LFBB20
.LM613:
	cpi r25,lo8(-27)
	breq .L328
	.stabn	68,0,2364,.LM614-.LFBB20
.LM614:
	cpi r25,lo8(46)
	breq .L328
	.stabn	68,0,2364,.LM615-.LFBB20
.LM615:
	cpi r24,lo8(15)
	breq .L328
	.stabn	68,0,2364,.LM616-.LFBB20
.LM616:
	andi r24,lo8(31)
	.stabn	68,0,2364,.LM617-.LFBB20
.LM617:
	cpi r24,lo8(8)
	breq .L328
.L331:
	.stabn	68,0,2320,.LM618-.LFBB20
.LM618:
	ldi r19,0
	ldi r18,0
.L325:
	.stabn	68,0,2375,.LM619-.LFBB20
.LM619:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L328:
	.stabn	68,0,2369,.LM620-.LFBB20
.LM620:
	ldi r23,0
	ldi r22,0
	movw r24,r28
	call dir_next
	movw r18,r24
	.stabn	68,0,2370,.LM621-.LFBB20
.LM621:
	or r24,r25
	breq .L326
.L327:
	.stabn	68,0,2373,.LM622-.LFBB20
.LM622:
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
	.stabn	68,0,2374,.LM623-.LFBB20
.LM623:
	rjmp .L325
.L332:
	.stabn	68,0,2324,.LM624-.LFBB20
.LM624:
	ldi r18,lo8(4)
	ldi r19,0
	rjmp .L327
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
	.stabn	68,0,2469,.LM625-.LFBB21
.LM625:
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
	.stabn	68,0,2471,.LM626-.LFBB21
.LM626:
	ld r16,Y
	ldd r17,Y+1
.LBB198:
.LBB199:
	.stabn	68,0,1817,.LM627-.LFBB21
.LM627:
	call dir_sdi.constprop.0
.L360:
	movw r18,r24
	.stabn	68,0,1818,.LM628-.LFBB21
.LM628:
	or r24,r25
	brne .L349
	.stabn	68,0,1821,.LM629-.LFBB21
.LM629:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,1822,.LM630-.LFBB21
.LM630:
	or r24,r25
	brne .L349
	.stabn	68,0,1826,.LM631-.LFBB21
.LM631:
	ldd r30,Y+26
	ldd r31,Y+27
	ld r24,Z
	.stabn	68,0,1826,.LM632-.LFBB21
.LM632:
	cpi r24,lo8(-27)
	brne .L350
.L353:
.LBE199:
.LBE198:
	.stabn	68,0,2549,.LM633-.LFBB21
.LM633:
	ldd r20,Y+22
	ldd r21,Y+23
	ldd r22,Y+24
	ldd r23,Y+25
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,2550,.LM634-.LFBB21
.LM634:
	or r24,r25
	brne .L348
	.stabn	68,0,2551,.LM635-.LFBB21
.LM635:
	ldd r30,Y+26
	ldd r31,Y+27
	ldi r24,lo8(32)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,2552,.LM636-.LFBB21
.LM636:
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
	.stabn	68,0,2556,.LM637-.LFBB21
.LM637:
	ldi r24,lo8(1)
	movw r30,r16
	std Z+4,r24
.L348:
	.stabn	68,0,2561,.LM638-.LFBB21
.LM638:
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L350:
.LBB201:
.LBB200:
	.stabn	68,0,1826,.LM639-.LFBB21
.LM639:
	tst r24
	breq .L353
	.stabn	68,0,1832,.LM640-.LFBB21
.LM640:
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	call dir_next
	rjmp .L360
.L349:
	.stabn	68,0,1836,.LM641-.LFBB21
.LM641:
	cpi r18,4
	cpc r19,__zero_reg__
	brne .L348
	.stabn	68,0,1836,.LM642-.LFBB21
.LM642:
	ldi r18,lo8(7)
	ldi r19,0
	rjmp .L348
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
	.stabn	68,0,1112,.LM643-.LFBB22
.LM643:
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
	.stabn	68,0,1116,.LM644-.LFBB22
.LM644:
	call sync_window
	.stabn	68,0,1117,.LM645-.LFBB22
.LM645:
	sbiw r24,0
	breq .+2
	rjmp .L361
.LBB214:
.LBB215:
	.stabn	68,0,1118,.LM646-.LFBB22
.LM646:
	ld r24,Y
	cpi r24,lo8(3)
	breq .+2
	rjmp .L363
	.stabn	68,0,1118,.LM647-.LFBB22
.LM647:
	ldd r24,Y+5
	cpi r24,lo8(1)
	breq .+2
	rjmp .L363
	.stabn	68,0,1120,.LM648-.LFBB22
.LM648:
	ldi r24,0
	ldi r25,lo8(2)
	movw r22,r28
	subi r22,-48
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
	.stabn	68,0,659,.LM649-.LFBB22
.LM649:
	ldi r24,lo8(85)
	movw r30,r28
	subi r30,-46
	sbci r31,-3
	st Z,r24
	.stabn	68,0,660,.LM650-.LFBB22
.LM650:
	ldi r24,lo8(-86)
	adiw r30,1
	st Z,r24
.LBE217:
.LBE216:
.LBB218:
.LBB219:
	.stabn	68,0,665,.LM651-.LFBB22
.LM651:
	ldi r24,lo8(82)
	std Y+48,r24
	.stabn	68,0,666,.LM652-.LFBB22
.LM652:
	std Y+49,r24
	.stabn	68,0,667,.LM653-.LFBB22
.LM653:
	ldi r24,lo8(97)
	std Y+50,r24
	.stabn	68,0,668,.LM654-.LFBB22
.LM654:
	ldi r25,lo8(65)
	std Y+51,r25
.LBE219:
.LBE218:
.LBB220:
.LBB221:
	.stabn	68,0,665,.LM655-.LFBB22
.LM655:
	ldi r18,lo8(114)
	sbiw r30,27
	st Z,r18
	.stabn	68,0,666,.LM656-.LFBB22
.LM656:
	adiw r30,1
	st Z,r18
	.stabn	68,0,667,.LM657-.LFBB22
.LM657:
	adiw r30,1
	st Z,r25
	.stabn	68,0,668,.LM658-.LFBB22
.LM658:
	adiw r30,1
	st Z,r24
.LBE221:
.LBE220:
.LBB222:
.LBB223:
	.stabn	68,0,665,.LM659-.LFBB22
.LM659:
	ldd r24,Y+16
	ldd r25,Y+17
	ldd r26,Y+18
	ldd r27,Y+19
	adiw r30,1
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.LBE223:
.LBE222:
.LBB224:
.LBB225:
	ldd r24,Y+12
	ldd r25,Y+13
	ldd r26,Y+14
	ldd r27,Y+15
	adiw r30,4
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.LBE225:
.LBE224:
	.stabn	68,0,1126,.LM660-.LFBB22
.LM660:
	ldd r18,Y+28
	ldd r19,Y+29
	ldd r20,Y+30
	ldd r21,Y+31
	subi r18,-1
	sbci r19,-1
	sbci r20,-1
	sbci r21,-1
	.stabn	68,0,1126,.LM661-.LFBB22
.LM661:
	std Y+44,r18
	std Y+45,r19
	std Y+46,r20
	std Y+47,r21
	.stabn	68,0,1127,.LM662-.LFBB22
.LM662:
	ldi r16,lo8(1)
	ldi r17,0
	ldd r24,Y+1
	call disk_write
	.stabn	68,0,1128,.LM663-.LFBB22
.LM663:
	std Y+5,__zero_reg__
.L363:
	.stabn	68,0,1131,.LM664-.LFBB22
.LM664:
	ldi r21,0
	ldi r20,0
	ldi r22,0
	ldd r24,Y+1
	call disk_ioctl
	.stabn	68,0,1131,.LM665-.LFBB22
.LM665:
	ldi r18,lo8(1)
	or r24,r25
	brne .L364
	ldi r18,0
.L364:
	.stabn	68,0,1131,.LM666-.LFBB22
.LM666:
	mov r24,r18
	ldi r25,0
.L361:
/* epilogue start */
.LBE215:
.LBE214:
	.stabn	68,0,1135,.LM667-.LFBB22
.LM667:
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
	.stabn	68,0,3663,.LM668-.LFBB23
.LM668:
.LFBB23:
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
/* stack size = 9 */
.L__stack_usage = 9
	std Y+4,r25
	std Y+3,r24
	std Y+6,r23
	std Y+5,r22
	mov r17,r20
	.stabn	68,0,3667,.LM669-.LFBB23
.LM669:
	std Y+2,r23
	std Y+1,r22
	.stabn	68,0,3671,.LM670-.LFBB23
.LM670:
	movw r24,r28
	adiw r24,1
	call get_ldnumber
	movw r18,r24
	.stabn	68,0,3672,.LM671-.LFBB23
.LM671:
	sbrc r25,7
	rjmp .L369
	.stabn	68,0,3673,.LM672-.LFBB23
.LM672:
	lsl r24
	rol r25
	movw r26,r24
	subi r26,lo8(-(FatFs))
	sbci r27,hi8(-(FatFs))
	ld r30,X+
	ld r31,X
	sbiw r26,1
	.stabn	68,0,3675,.LM673-.LFBB23
.LM673:
	sbiw r30,0
	breq .L367
	.stabn	68,0,3676,.LM674-.LFBB23
.LM674:
	st X+,__zero_reg__
	st X,__zero_reg__
	.stabn	68,0,3683,.LM675-.LFBB23
.LM675:
	st Z,__zero_reg__
.L367:
	.stabn	68,0,3686,.LM676-.LFBB23
.LM676:
	ldd r30,Y+3
	ldd r31,Y+4
	.stabn	68,0,3686,.LM677-.LFBB23
.LM677:
	sbiw r30,0
	breq .L368
	.stabn	68,0,3687,.LM678-.LFBB23
.LM678:
	std Z+1,r18
	.stabn	68,0,3701,.LM679-.LFBB23
.LM679:
	st Z,__zero_reg__
	.stabn	68,0,3702,.LM680-.LFBB23
.LM680:
	subi r24,lo8(-(FatFs))
	sbci r25,hi8(-(FatFs))
	movw r26,r24
	st X+,r30
	st X,r31
.L368:
	.stabn	68,0,3705,.LM681-.LFBB23
.LM681:
	ldi r24,0
	.stabn	68,0,3705,.LM682-.LFBB23
.LM682:
	tst r17
	breq .L377
	.stabn	68,0,3707,.LM683-.LFBB23
.LM683:
	ldi r20,0
	movw r22,r28
	subi r22,-3
	sbci r23,-1
	movw r24,r28
	adiw r24,5
	call mount_volume
.L365:
/* epilogue start */
	.stabn	68,0,3709,.LM684-.LFBB23
.LM684:
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
.L369:
	.stabn	68,0,3672,.LM685-.LFBB23
.LM685:
	ldi r24,lo8(11)
.L377:
	.stabn	68,0,3705,.LM686-.LFBB23
.LM686:
	ldi r25,0
	rjmp .L365
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
	.stabn	68,0,3723,.LM687-.LFBB24
.LM687:
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
	.stabn	68,0,3735,.LM688-.LFBB24
.LM688:
	ldi r16,lo8(9)
	ldi r17,0
	.stabn	68,0,3735,.LM689-.LFBB24
.LM689:
	or r24,r25
	brne .+2
	rjmp .L378
	.stabn	68,0,3738,.LM690-.LFBB24
.LM690:
	mov r18,r20
	andi r18,lo8(63)
	mov r3,r18
	.stabn	68,0,3739,.LM691-.LFBB24
.LM691:
	mov r20,r18
	movw r22,r28
	subi r22,-41
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call mount_volume
	movw r16,r24
	.stabn	68,0,3740,.LM692-.LFBB24
.LM692:
	or r24,r25
	brne .L380
	.stabn	68,0,3741,.LM693-.LFBB24
.LM693:
	ldd r12,Y+41
	ldd r13,Y+42
	std Y+2,r13
	std Y+1,r12
	.stabn	68,0,3743,.LM694-.LFBB24
.LM694:
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
	.stabn	68,0,3745,.LM695-.LFBB24
.LM695:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L381
	.stabn	68,0,3746,.LM696-.LFBB24
.LM696:
	ldd r18,Y+40
	sbrs r18,7
	rjmp .L381
	.stabn	68,0,3747,.LM697-.LFBB24
.LM697:
	ldi r16,lo8(6)
	ldi r17,0
.L381:
	.stabn	68,0,3756,.LM698-.LFBB24
.LM698:
	mov r18,r11
	andi r18,lo8(28)
	brne .+2
	rjmp .L382
	.stabn	68,0,3757,.LM699-.LFBB24
.LM699:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L383
	.stabn	68,0,3758,.LM700-.LFBB24
.LM700:
	cpi r16,4
	cpc r17,__zero_reg__
	brne .L380
	.stabn	68,0,3762,.LM701-.LFBB24
.LM701:
	call dir_register
	movw r16,r24
	.stabn	68,0,3765,.LM702-.LFBB24
.LM702:
	set
	bld r3,3
	.stabn	68,0,3774,.LM703-.LFBB24
.LM703:
	or r24,r25
	breq .L384
.L380:
	.stabn	68,0,3903,.LM704-.LFBB24
.LM704:
	movw r26,r14
	st X+,__zero_reg__
	st X,__zero_reg__
	rjmp .L378
.L383:
	.stabn	68,0,3768,.LM705-.LFBB24
.LM705:
	ldd r24,Y+5
	andi r24,lo8(17)
	breq .+2
	rjmp .L398
	.stabn	68,0,3771,.LM706-.LFBB24
.LM706:
	sbrc r11,2
	rjmp .L396
	.stabn	68,0,3774,.LM707-.LFBB24
.LM707:
	sbrs r11,3
	rjmp .L385
.L384:
	.stabn	68,0,3796,.LM708-.LFBB24
.LM708:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB238:
.LBB239:
	.stabn	68,0,665,.LM709-.LFBB24
.LM709:
	std Z+14,__zero_reg__
	.stabn	68,0,666,.LM710-.LFBB24
.LM710:
	std Z+15,__zero_reg__
	.stabn	68,0,667,.LM711-.LFBB24
.LM711:
	ldi r25,lo8(33)
	std Z+16,r25
	.stabn	68,0,668,.LM712-.LFBB24
.LM712:
	ldi r24,lo8(84)
	std Z+17,r24
.LBE239:
.LBE238:
	.stabn	68,0,3797,.LM713-.LFBB24
.LM713:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB240:
.LBB241:
	.stabn	68,0,665,.LM714-.LFBB24
.LM714:
	std Z+22,__zero_reg__
	.stabn	68,0,666,.LM715-.LFBB24
.LM715:
	std Z+23,__zero_reg__
	.stabn	68,0,667,.LM716-.LFBB24
.LM716:
	std Z+24,r25
	.stabn	68,0,668,.LM717-.LFBB24
.LM717:
	std Z+25,r24
.LBE241:
.LBE240:
	.stabn	68,0,3798,.LM718-.LFBB24
.LM718:
	ldd r16,Y+27
	ldd r17,Y+28
	.stabn	68,0,3798,.LM719-.LFBB24
.LM719:
	movw r22,r16
	movw r26,r12
	ld r24,X
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3799,.LM720-.LFBB24
.LM720:
	ldi r24,lo8(32)
	movw r30,r16
	std Z+11,r24
	.stabn	68,0,3800,.LM721-.LFBB24
.LM721:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB242:
.LBB243:
.LBB244:
.LBB245:
	.stabn	68,0,659,.LM722-.LFBB24
.LM722:
	std Z+26,__zero_reg__
	.stabn	68,0,660,.LM723-.LFBB24
.LM723:
	std Z+27,__zero_reg__
.LBE245:
.LBE244:
	.stabn	68,0,1873,.LM724-.LFBB24
.LM724:
	movw r26,r12
	ld r24,X
	cpi r24,lo8(3)
	brne .L386
.LBB246:
.LBB247:
	.stabn	68,0,659,.LM725-.LFBB24
.LM725:
	std Z+20,__zero_reg__
	.stabn	68,0,660,.LM726-.LFBB24
.LM726:
	std Z+21,__zero_reg__
.L386:
.LBE247:
.LBE246:
.LBE243:
.LBE242:
	.stabn	68,0,3801,.LM727-.LFBB24
.LM727:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB248:
.LBB249:
	.stabn	68,0,665,.LM728-.LFBB24
.LM728:
	std Z+28,__zero_reg__
	.stabn	68,0,666,.LM729-.LFBB24
.LM729:
	std Z+29,__zero_reg__
	.stabn	68,0,667,.LM730-.LFBB24
.LM730:
	std Z+30,__zero_reg__
	.stabn	68,0,668,.LM731-.LFBB24
.LM731:
	std Z+31,__zero_reg__
.LBE249:
.LBE248:
	.stabn	68,0,3802,.LM732-.LFBB24
.LM732:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+4,r24
	.stabn	68,0,3803,.LM733-.LFBB24
.LM733:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	breq .L385
	.stabn	68,0,3804,.LM734-.LFBB24
.LM734:
	ldd r4,Z+44
	ldd r5,Z+45
	ldd r6,Z+46
	ldd r7,Z+47
	.stabn	68,0,3805,.LM735-.LFBB24
.LM735:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	ldd r24,Y+1
	ldd r25,Y+2
	call remove_chain.isra.0
	movw r16,r24
	.stabn	68,0,3806,.LM736-.LFBB24
.LM736:
	or r24,r25
	breq .+2
	rjmp .L380
	.stabn	68,0,3807,.LM737-.LFBB24
.LM737:
	movw r22,r6
	movw r20,r4
	movw r24,r12
	call move_window
	movw r16,r24
	.stabn	68,0,3808,.LM738-.LFBB24
.LM738:
	ldi r31,1
	sub r8,r31
	sbc r9,__zero_reg__
	sbc r10,__zero_reg__
	sbc r11,__zero_reg__
	.stabn	68,0,3808,.LM739-.LFBB24
.LM739:
	movw r26,r12
	adiw r26,12
	st X+,r8
	st X+,r9
	st X+,r10
	st X,r11
	sbiw r26,12+3
	.stabn	68,0,3825,.LM740-.LFBB24
.LM740:
	or r24,r25
	breq .+2
	rjmp .L380
.L385:
	.stabn	68,0,3826,.LM741-.LFBB24
.LM741:
	sbrs r3,3
	rjmp .L387
	.stabn	68,0,3826,.LM742-.LFBB24
.LM742:
	set
	bld r3,6
.L387:
	.stabn	68,0,3827,.LM743-.LFBB24
.LM743:
	movw r30,r12
	ldd r24,Z+44
	ldd r25,Z+45
	ldd r26,Z+46
	ldd r27,Z+47
	movw r30,r14
	std Z+28,r24
	std Z+29,r25
	std Z+30,r26
	std Z+31,r27
	.stabn	68,0,3828,.LM744-.LFBB24
.LM744:
	ldd r16,Y+27
	ldd r17,Y+28
	.stabn	68,0,3828,.LM745-.LFBB24
.LM745:
	std Z+33,r17
	std Z+32,r16
	.stabn	68,0,3856,.LM746-.LFBB24
.LM746:
	movw r22,r16
	movw r26,r12
	ld r24,X
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3856,.LM747-.LFBB24
.LM747:
	movw r30,r14
	std Z+6,r8
	std Z+7,r9
	std Z+8,r10
	std Z+9,r11
	.stabn	68,0,3857,.LM748-.LFBB24
.LM748:
	movw r24,r16
	adiw r24,28
	call ld_dword
	movw r4,r22
	movw r6,r24
	.stabn	68,0,3857,.LM749-.LFBB24
.LM749:
	movw r26,r14
	adiw r26,10
	st X+,r4
	st X+,r5
	st X+,r6
	st X,r7
	sbiw r26,10+3
	.stabn	68,0,3862,.LM750-.LFBB24
.LM750:
	adiw r26,1
	st X,r13
	st -X,r12
	.stabn	68,0,3863,.LM751-.LFBB24
.LM751:
	movw r30,r12
	ldd r24,Z+6
	ldd r25,Z+7
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	.stabn	68,0,3864,.LM752-.LFBB24
.LM752:
	adiw r26,14
	st X,r3
	sbiw r26,14
	.stabn	68,0,3865,.LM753-.LFBB24
.LM753:
	adiw r26,15
	st X,__zero_reg__
	sbiw r26,15
	.stabn	68,0,3866,.LM754-.LFBB24
.LM754:
	adiw r26,24
	st X+,__zero_reg__
	st X+,__zero_reg__
	st X+,__zero_reg__
	st X,__zero_reg__
	sbiw r26,24+3
	.stabn	68,0,3867,.LM755-.LFBB24
.LM755:
	movw r30,r14
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	std Z+18,__zero_reg__
	std Z+19,__zero_reg__
	.stabn	68,0,3872,.LM756-.LFBB24
.LM756:
	sbrc r3,5
	rjmp .L388
.L389:
	.stabn	68,0,3735,.LM757-.LFBB24
.LM757:
	ldi r17,0
	ldi r16,0
.L378:
	.stabn	68,0,3906,.LM758-.LFBB24
.LM758:
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
.L382:
	.stabn	68,0,3815,.LM759-.LFBB24
.LM759:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L380
	.stabn	68,0,3816,.LM760-.LFBB24
.LM760:
	ldd r24,Y+5
	.stabn	68,0,3816,.LM761-.LFBB24
.LM761:
	sbrc r24,4
	rjmp .L397
	.stabn	68,0,3819,.LM762-.LFBB24
.LM762:
	sbrs r11,1
	rjmp .L385
	.stabn	68,0,3819,.LM763-.LFBB24
.LM763:
	sbrs r24,0
	rjmp .L385
.L398:
	.stabn	68,0,3769,.LM764-.LFBB24
.LM764:
	ldi r16,lo8(7)
	ldi r17,0
	rjmp .L380
.L388:
	.stabn	68,0,3872,.LM765-.LFBB24
.LM765:
	cp r4,__zero_reg__
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	breq .L389
	.stabn	68,0,3873,.LM766-.LFBB24
.LM766:
	adiw r26,16
	st X+,r4
	st X+,r5
	st X+,r6
	st X,r7
	sbiw r26,16+3
	.stabn	68,0,3874,.LM767-.LFBB24
.LM767:
	movw r30,r12
	ldd r24,Z+10
	ldd r25,Z+11
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
.L390:
	.stabn	68,0,3876,.LM768-.LFBB24
.LM768:
	ldd r24,Y+45
	ldd r25,Y+46
	ldd r26,Y+47
	ldd r27,Y+48
	cp r24,r4
	cpc r25,r5
	cpc r26,r6
	cpc r27,r7
	brlo .L392
	ldi r17,0
	ldi r16,0
.L391:
	.stabn	68,0,3881,.LM769-.LFBB24
.LM769:
	movw r26,r14
	adiw r26,20
	st X+,r8
	st X+,r9
	st X+,r10
	st X,r11
	sbiw r26,20+3
	.stabn	68,0,3882,.LM770-.LFBB24
.LM770:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L380
	.stabn	68,0,3882,.LM771-.LFBB24
.LM771:
	movw r26,r6
	movw r24,r4
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,3882,.LM772-.LFBB24
.LM772:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L389
	.stabn	68,0,3883,.LM773-.LFBB24
.LM773:
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,3884,.LM774-.LFBB24
.LM774:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L401
	.stabn	68,0,3887,.LM775-.LFBB24
.LM775:
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
	.stabn	68,0,3887,.LM776-.LFBB24
.LM776:
	add r20,r2
	adc r21,r3
	adc r22,r4
	adc r23,r5
	.stabn	68,0,3887,.LM777-.LFBB24
.LM777:
	movw r30,r14
	std Z+24,r20
	std Z+25,r21
	std Z+26,r22
	std Z+27,r23
	rjmp .L378
.L392:
	.stabn	68,0,3877,.LM778-.LFBB24
.LM778:
	movw r22,r10
	movw r20,r8
	movw r26,r14
	ld r24,X+
	ld r25,X
	call get_fat.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,3876,.LM779-.LFBB24
.LM779:
	ldd r18,Y+45
	ldd r19,Y+46
	ldd r20,Y+47
	ldd r21,Y+48
	sub r4,r18
	sbc r5,r19
	sbc r6,r20
	sbc r7,r21
	.stabn	68,0,3878,.LM780-.LFBB24
.LM780:
	ldi r19,2
	cp r8,r19
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brlo .L399
	.stabn	68,0,3876,.LM781-.LFBB24
.LM781:
	ldi r20,-1
	cp r8,r20
	cpc r9,r20
	cpc r10,r20
	cpc r11,r20
	breq .+2
	rjmp .L390
	.stabn	68,0,3879,.LM782-.LFBB24
.LM782:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L391
.L399:
	.stabn	68,0,3878,.LM783-.LFBB24
.LM783:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L391
.L396:
	.stabn	68,0,3771,.LM784-.LFBB24
.LM784:
	ldi r16,lo8(8)
	ldi r17,0
	rjmp .L380
.L397:
	.stabn	68,0,3817,.LM785-.LFBB24
.LM785:
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L380
.L401:
	.stabn	68,0,3885,.LM786-.LFBB24
.LM786:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L380
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
	.stabn	68,0,3921,.LM787-.LFBB25
.LM787:
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
	rcall .
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
	.stabn	68,0,3931,.LM788-.LFBB25
.LM788:
	ldd r30,Y+3
	ldd r31,Y+4
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,3932,.LM789-.LFBB25
.LM789:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r12,r24
	.stabn	68,0,3933,.LM790-.LFBB25
.LM790:
	or r24,r25
	breq .+2
	rjmp .L423
	.stabn	68,0,3933,.LM791-.LFBB25
.LM791:
	movw r30,r14
	ldd r24,Z+15
	mov r12,r24
	mov r13,__zero_reg__
	.stabn	68,0,3933,.LM792-.LFBB25
.LM792:
	cpse r24,__zero_reg__
	rjmp .L423
	.stabn	68,0,3934,.LM793-.LFBB25
.LM793:
	ldd r24,Z+14
	sbrs r24,0
	rjmp .L441
	.stabn	68,0,3935,.LM794-.LFBB25
.LM794:
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
	.stabn	68,0,3936,.LM795-.LFBB25
.LM795:
	movw r20,r16
	ldi r23,0
	ldi r22,0
	.stabn	68,0,3936,.LM796-.LFBB25
.LM796:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L425
	.stabn	68,0,3936,.LM797-.LFBB25
.LM797:
	movw r16,r24
.L425:
	.stabn	68,0,3921,.LM798-.LFBB25
.LM798:
	movw r12,r16
.L426:
	.stabn	68,0,3938,.LM799-.LFBB25
.LM799:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	breq .L423
	.stabn	68,0,3939,.LM800-.LFBB25
.LM800:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,3939,.LM801-.LFBB25
.LM801:
	movw r20,r24
	movw r22,r26
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,3939,.LM802-.LFBB25
.LM802:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L427
	.stabn	68,0,3940,.LM803-.LFBB25
.LM803:
	ldd r8,Y+1
	ldd r9,Y+2
	.stabn	68,0,3940,.LM804-.LFBB25
.LM804:
	movw r30,r8
	ldd r18,Z+10
	ldd r19,Z+11
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,3940,.LM805-.LFBB25
.LM805:
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
	.stabn	68,0,3940,.LM806-.LFBB25
.LM806:
	movw r16,r18
	and r16,r20
	and r17,r21
	.stabn	68,0,3941,.LM807-.LFBB25
.LM807:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L428
	.stabn	68,0,3943,.LM808-.LFBB25
.LM808:
	movw r30,r14
	.stabn	68,0,3942,.LM809-.LFBB25
.LM809:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L429
	.stabn	68,0,3943,.LM810-.LFBB25
.LM810:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
.L430:
	.stabn	68,0,3954,.LM811-.LFBB25
.LM811:
	cpi r20,2
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brsh .L431
.L433:
	.stabn	68,0,3954,.LM812-.LFBB25
.LM812:
	ldi r24,lo8(2)
	movw r30,r14
	std Z+15,r24
	ldi r23,lo8(2)
	mov r12,r23
	mov r13,__zero_reg__
.L423:
	.stabn	68,0,4005,.LM813-.LFBB25
.LM813:
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
.L429:
	.stabn	68,0,3951,.LM814-.LFBB25
.LM814:
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
	rjmp .L430
.L431:
	.stabn	68,0,3955,.LM815-.LFBB25
.LM815:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	brne .L432
.L436:
	.stabn	68,0,3955,.LM816-.LFBB25
.LM816:
	ldi r24,lo8(1)
	movw r30,r14
	std Z+15,r24
	clr r12
	inc r12
	mov r13,__zero_reg__
	rjmp .L423
.L432:
	.stabn	68,0,3956,.LM817-.LFBB25
.LM817:
	movw r30,r14
	std Z+20,r20
	std Z+21,r21
	std Z+22,r22
	std Z+23,r23
.L428:
	.stabn	68,0,3958,.LM818-.LFBB25
.LM818:
	movw r30,r14
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	movw r24,r8
	call clst2sect
	movw r2,r22
	movw r4,r24
	.stabn	68,0,3959,.LM819-.LFBB25
.LM819:
	cp r2,__zero_reg__
	cpc r3,__zero_reg__
	cpc r4,__zero_reg__
	cpc r5,__zero_reg__
	brne .+2
	rjmp .L433
	.stabn	68,0,3960,.LM820-.LFBB25
.LM820:
	add r2,r16
	adc r3,r17
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,3962,.LM821-.LFBB25
.LM821:
	cp r12,__zero_reg__
	ldi r31,2
	cpc r13,r31
	brsh .+2
	rjmp .L434
	.stabn	68,0,3961,.LM822-.LFBB25
.LM822:
	movw r10,r12
	mov r10,r11
	clr r11
	lsr r10
	.stabn	68,0,3963,.LM823-.LFBB25
.LM823:
	movw r30,r8
	ldd r24,Z+10
	ldd r25,Z+11
	.stabn	68,0,3963,.LM824-.LFBB25
.LM824:
	movw r18,r16
	add r18,r10
	adc r19,r11
	.stabn	68,0,3963,.LM825-.LFBB25
.LM825:
	cp r24,r18
	cpc r25,r19
	brsh .L435
	.stabn	68,0,3964,.LM826-.LFBB25
.LM826:
	movw r10,r24
	sub r10,r16
	sbc r11,r17
.L435:
	.stabn	68,0,3966,.LM827-.LFBB25
.LM827:
	movw r16,r10
	movw r20,r4
	movw r18,r2
	movw r22,r6
	movw r30,r8
	ldd r24,Z+1
	call disk_read
	.stabn	68,0,3966,.LM828-.LFBB25
.LM828:
	or r24,r25
	brne .L436
	.stabn	68,0,3969,.LM829-.LFBB25
.LM829:
	movw r30,r8
	ldd r24,Z+4
	tst r24
	breq .L437
	.stabn	68,0,3969,.LM830-.LFBB25
.LM830:
	ldd r24,Z+44
	ldd r25,Z+45
	ldd r26,Z+46
	ldd r27,Z+47
	sub r24,r2
	sbc r25,r3
	sbc r26,r4
	sbc r27,r5
	.stabn	68,0,3969,.LM831-.LFBB25
.LM831:
	movw r20,r10
	ldi r23,0
	ldi r22,0
	.stabn	68,0,3969,.LM832-.LFBB25
.LM832:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L437
	.stabn	68,0,3970,.LM833-.LFBB25
.LM833:
	movw r26,r24
	mov r27,r26
	clr r26
	lsl r27
	.stabn	68,0,3970,.LM834-.LFBB25
.LM834:
	add r26,r6
	adc r27,r7
	.stabn	68,0,3970,.LM835-.LFBB25
.LM835:
	adiw r30,48
	ldi r24,0
	ldi r25,lo8(2)
	0:
	ld r0,Z+
	st X+,r0
	sbiw r24,1
	brne 0b
.L437:
	.stabn	68,0,3978,.LM836-.LFBB25
.LM836:
	mov r11,r10
	clr r10
	lsl r11
.L438:
	.stabn	68,0,3938,.LM837-.LFBB25
.LM837:
	sub r12,r10
	sbc r13,r11
	.stabn	68,0,3938,.LM838-.LFBB25
.LM838:
	ldd r30,Y+3
	ldd r31,Y+4
	ld r24,Z
	ldd r25,Z+1
	add r24,r10
	adc r25,r11
	std Z+1,r25
	st Z,r24
	.stabn	68,0,3938,.LM839-.LFBB25
.LM839:
	add r6,r10
	adc r7,r11
	.stabn	68,0,3938,.LM840-.LFBB25
.LM840:
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
	rjmp .L426
.L434:
	.stabn	68,0,3992,.LM841-.LFBB25
.LM841:
	movw r30,r14
	std Z+24,r2
	std Z+25,r3
	std Z+26,r4
	std Z+27,r5
.L427:
	.stabn	68,0,3994,.LM842-.LFBB25
.LM842:
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
	brsh .L439
	movw r10,r12
.L439:
	.stabn	68,0,3997,.LM843-.LFBB25
.LM843:
	ldd r16,Y+1
	ldd r17,Y+2
	movw r30,r14
	ldd r20,Z+24
	ldd r21,Z+25
	ldd r22,Z+26
	ldd r23,Z+27
	movw r24,r16
	call move_window
	.stabn	68,0,3997,.LM844-.LFBB25
.LM844:
	or r24,r25
	breq .+2
	rjmp .L436
	.stabn	68,0,3998,.LM845-.LFBB25
.LM845:
	movw r22,r16
	subi r22,-48
	sbci r23,-1
	.stabn	68,0,3998,.LM846-.LFBB25
.LM846:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	add r22,r24
	adc r23,r25
	movw r20,r10
	movw r24,r6
	call memcpy
	rjmp .L438
.L441:
	.stabn	68,0,3934,.LM847-.LFBB25
.LM847:
	ldi r24,lo8(7)
	mov r12,r24
	mov r13,__zero_reg__
	rjmp .L423
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
	.stabn	68,0,4021,.LM848-.LFBB26
.LM848:
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
	.stabn	68,0,4030,.LM849-.LFBB26
.LM849:
	ldd r30,Y+5
	ldd r31,Y+6
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	.stabn	68,0,4031,.LM850-.LFBB26
.LM850:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	std Y+3,r24
	std Y+4,r25
	.stabn	68,0,4032,.LM851-.LFBB26
.LM851:
	ldd r18,Y+3
	ldd r19,Y+4
	or r18,r19
	breq .+2
	rjmp .L448
	.stabn	68,0,4032,.LM852-.LFBB26
.LM852:
	movw r30,r14
	ldd r24,Z+15
	mov r18,r24
	ldi r19,0
	std Y+4,r19
	std Y+3,r18
	.stabn	68,0,4032,.LM853-.LFBB26
.LM853:
	cpse r24,__zero_reg__
	rjmp .L448
	.stabn	68,0,4033,.LM854-.LFBB26
.LM854:
	ldd r24,Z+14
	sbrs r24,1
	rjmp .L473
	.stabn	68,0,4036,.LM855-.LFBB26
.LM855:
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4036,.LM856-.LFBB26
.LM856:
	movw r20,r24
	movw r22,r26
	add r20,r12
	adc r21,r13
	adc r22,__zero_reg__
	adc r23,__zero_reg__
	.stabn	68,0,4036,.LM857-.LFBB26
.LM857:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L451
	.stabn	68,0,4037,.LM858-.LFBB26
.LM858:
	movw r12,r24
	com r12
	com r13
.L451:
	.stabn	68,0,4040,.LM859-.LFBB26
.LM859:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	brne .+2
	rjmp .L472
	.stabn	68,0,4041,.LM860-.LFBB26
.LM860:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4041,.LM861-.LFBB26
.LM861:
	movw r20,r24
	movw r22,r26
	andi r21,1
	clr r22
	clr r23
	.stabn	68,0,4041,.LM862-.LFBB26
.LM862:
	or r20,r21
	or r20,r22
	or r20,r23
	breq .+2
	rjmp .L452
	.stabn	68,0,4042,.LM863-.LFBB26
.LM863:
	ldd r10,Y+1
	ldd r11,Y+2
	.stabn	68,0,4042,.LM864-.LFBB26
.LM864:
	movw r30,r10
	ldd r18,Z+10
	ldd r19,Z+11
	subi r18,1
	sbc r19,__zero_reg__
	.stabn	68,0,4042,.LM865-.LFBB26
.LM865:
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
	.stabn	68,0,4042,.LM866-.LFBB26
.LM866:
	movw r16,r18
	and r16,r20
	and r17,r21
	.stabn	68,0,4043,.LM867-.LFBB26
.LM867:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L454
	.stabn	68,0,4045,.LM868-.LFBB26
.LM868:
	movw r30,r14
	.stabn	68,0,4044,.LM869-.LFBB26
.LM869:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L455
	.stabn	68,0,4045,.LM870-.LFBB26
.LM870:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
	.stabn	68,0,4046,.LM871-.LFBB26
.LM871:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L456
	.stabn	68,0,4047,.LM872-.LFBB26
.LM872:
	ldi r20,0
	ldi r21,0
	movw r22,r20
.L477:
	.stabn	68,0,4056,.LM873-.LFBB26
.LM873:
	ld r24,Z
	ldd r25,Z+1
	call create_chain.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4059,.LM874-.LFBB26
.LM874:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L456
.L472:
	.stabn	68,0,4124,.LM875-.LFBB26
.LM875:
	movw r30,r14
	ldd r24,Z+14
	ori r24,lo8(64)
	std Z+14,r24
.L448:
	.stabn	68,0,4127,.LM876-.LFBB26
.LM876:
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
.L455:
	.stabn	68,0,4056,.LM877-.LFBB26
.LM877:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	rjmp .L477
.L456:
	.stabn	68,0,4060,.LM878-.LFBB26
.LM878:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L458
.L463:
	.stabn	68,0,4060,.LM879-.LFBB26
.LM879:
	ldi r24,lo8(2)
	movw r30,r14
	std Z+15,r24
	ldi r18,lo8(2)
	ldi r19,0
.L478:
	.stabn	68,0,4033,.LM880-.LFBB26
.LM880:
	std Y+4,r19
	std Y+3,r18
	rjmp .L448
.L458:
	.stabn	68,0,4061,.LM881-.LFBB26
.LM881:
	cpi r20,-1
	ldi r19,-1
	cpc r21,r19
	cpc r22,r19
	cpc r23,r19
	brne .L459
.L462:
	.stabn	68,0,4061,.LM882-.LFBB26
.LM882:
	ldi r24,lo8(1)
	movw r30,r14
	std Z+15,r24
	ldi r18,lo8(1)
	ldi r19,0
	rjmp .L478
.L459:
	.stabn	68,0,4062,.LM883-.LFBB26
.LM883:
	movw r30,r14
	std Z+20,r20
	std Z+21,r21
	std Z+22,r22
	std Z+23,r23
	.stabn	68,0,4063,.LM884-.LFBB26
.LM884:
	ldd r24,Z+6
	ldd r25,Z+7
	ldd r26,Z+8
	ldd r27,Z+9
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L454
	.stabn	68,0,4063,.LM885-.LFBB26
.LM885:
	std Z+6,r20
	std Z+7,r21
	std Z+8,r22
	std Z+9,r23
.L454:
	.stabn	68,0,4066,.LM886-.LFBB26
.LM886:
	movw r30,r10
	ldd r20,Z+44
	ldd r21,Z+45
	ldd r22,Z+46
	ldd r23,Z+47
	movw r30,r14
	ldd r24,Z+24
	ldd r25,Z+25
	ldd r26,Z+26
	ldd r27,Z+27
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brne .L461
	.stabn	68,0,4066,.LM887-.LFBB26
.LM887:
	movw r24,r10
	call sync_window
	.stabn	68,0,4066,.LM888-.LFBB26
.LM888:
	or r24,r25
	brne .L462
.L461:
	.stabn	68,0,4073,.LM889-.LFBB26
.LM889:
	movw r30,r14
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	movw r24,r10
	call clst2sect
	movw r2,r22
	movw r4,r24
	.stabn	68,0,4074,.LM890-.LFBB26
.LM890:
	cp r2,__zero_reg__
	cpc r3,__zero_reg__
	cpc r4,__zero_reg__
	cpc r5,__zero_reg__
	brne .+2
	rjmp .L463
	.stabn	68,0,4075,.LM891-.LFBB26
.LM891:
	add r2,r16
	adc r3,r17
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,4077,.LM892-.LFBB26
.LM892:
	cp r12,__zero_reg__
	ldi r31,2
	cpc r13,r31
	brsh .+2
	rjmp .L464
	.stabn	68,0,4076,.LM893-.LFBB26
.LM893:
	movw r8,r12
	mov r8,r9
	clr r9
	lsr r8
	.stabn	68,0,4078,.LM894-.LFBB26
.LM894:
	movw r30,r10
	ldd r24,Z+10
	ldd r25,Z+11
	.stabn	68,0,4078,.LM895-.LFBB26
.LM895:
	movw r18,r16
	add r18,r8
	adc r19,r9
	.stabn	68,0,4078,.LM896-.LFBB26
.LM896:
	cp r24,r18
	cpc r25,r19
	brsh .L465
	.stabn	68,0,4079,.LM897-.LFBB26
.LM897:
	movw r8,r24
	sub r8,r16
	sbc r9,r17
.L465:
	.stabn	68,0,4081,.LM898-.LFBB26
.LM898:
	movw r16,r8
	movw r20,r4
	movw r18,r2
	movw r22,r6
	movw r30,r10
	ldd r24,Z+1
	call disk_write
	.stabn	68,0,4081,.LM899-.LFBB26
.LM899:
	or r24,r25
	breq .+2
	rjmp .L462
	.stabn	68,0,4084,.LM900-.LFBB26
.LM900:
	movw r30,r10
	ldd r24,Z+44
	ldd r25,Z+45
	ldd r26,Z+46
	ldd r27,Z+47
	sub r24,r2
	sbc r25,r3
	sbc r26,r4
	sbc r27,r5
	.stabn	68,0,4084,.LM901-.LFBB26
.LM901:
	movw r20,r8
	ldi r23,0
	ldi r22,0
	.stabn	68,0,4084,.LM902-.LFBB26
.LM902:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L466
	.stabn	68,0,4085,.LM903-.LFBB26
.LM903:
	movw r18,r10
	subi r18,-48
	sbci r19,-1
	movw r30,r24
	mov r31,r30
	clr r30
	lsl r31
	.stabn	68,0,4085,.LM904-.LFBB26
.LM904:
	add r30,r6
	adc r31,r7
	.stabn	68,0,4085,.LM905-.LFBB26
.LM905:
	ldi r24,0
	ldi r25,lo8(2)
	movw r26,r18
	0:
	ld r0,Z+
	st X+,r0
	sbiw r24,1
	brne 0b
	.stabn	68,0,4086,.LM906-.LFBB26
.LM906:
	movw r30,r10
	std Z+4,__zero_reg__
.L466:
	.stabn	68,0,4095,.LM907-.LFBB26
.LM907:
	movw r16,r8
	mov r17,r16
	clr r16
	lsl r17
.L467:
	.stabn	68,0,4040,.LM908-.LFBB26
.LM908:
	sub r12,r16
	sbc r13,r17
	.stabn	68,0,4040,.LM909-.LFBB26
.LM909:
	ldd r30,Y+5
	ldd r31,Y+6
	ld r24,Z
	ldd r25,Z+1
	add r24,r16
	adc r25,r17
	std Z+1,r25
	st Z,r24
	.stabn	68,0,4040,.LM910-.LFBB26
.LM910:
	add r6,r16
	adc r7,r17
	.stabn	68,0,4040,.LM911-.LFBB26
.LM911:
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
	.stabn	68,0,4040,.LM912-.LFBB26
.LM912:
	ldd r20,Z+10
	ldd r21,Z+11
	ldd r22,Z+12
	ldd r23,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L470
	movw r20,r24
	movw r22,r26
.L470:
	.stabn	68,0,4040,.LM913-.LFBB26
.LM913:
	movw r30,r14
	std Z+10,r20
	std Z+11,r21
	std Z+12,r22
	std Z+13,r23
	rjmp .L451
.L464:
	.stabn	68,0,4099,.LM914-.LFBB26
.LM914:
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
	brlo .L468
	.stabn	68,0,4100,.LM915-.LFBB26
.LM915:
	movw r24,r10
	call sync_window
	.stabn	68,0,4100,.LM916-.LFBB26
.LM916:
	or r24,r25
	breq .+2
	rjmp .L462
	.stabn	68,0,4101,.LM917-.LFBB26
.LM917:
	movw r30,r10
	std Z+44,r2
	std Z+45,r3
	std Z+46,r4
	std Z+47,r5
.L468:
	.stabn	68,0,4110,.LM918-.LFBB26
.LM918:
	movw r30,r14
	std Z+24,r2
	std Z+25,r3
	std Z+26,r4
	std Z+27,r5
.L452:
	.stabn	68,0,4112,.LM919-.LFBB26
.LM919:
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
	brsh .L469
	movw r16,r12
.L469:
	.stabn	68,0,4115,.LM920-.LFBB26
.LM920:
	ldd r10,Y+1
	ldd r11,Y+2
	movw r30,r14
	ldd r20,Z+24
	ldd r21,Z+25
	ldd r22,Z+26
	ldd r23,Z+27
	movw r24,r10
	call move_window
	.stabn	68,0,4115,.LM921-.LFBB26
.LM921:
	or r24,r25
	breq .+2
	rjmp .L462
	.stabn	68,0,4116,.LM922-.LFBB26
.LM922:
	movw r18,r10
	subi r18,-48
	sbci r19,-1
	.stabn	68,0,4116,.LM923-.LFBB26
.LM923:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	andi r25,1
	movw r20,r16
	movw r22,r6
	add r24,r18
	adc r25,r19
	call memcpy
	.stabn	68,0,4117,.LM924-.LFBB26
.LM924:
	ldi r18,lo8(1)
	movw r30,r10
	std Z+4,r18
	rjmp .L467
.L473:
	.stabn	68,0,4033,.LM925-.LFBB26
.LM925:
	ldi r18,lo8(7)
	ldi r19,0
	rjmp .L478
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
	.stabn	68,0,6580,.LM926-.LFBB27
.LM926:
.LFBB27:
	push r12
	push r13
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
/* frame size = 2 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	.stabn	68,0,6595,.LM927-.LFBB27
.LM927:
	movw r30,r24
	ldd r24,Z+2
	ldd r25,Z+3
	.stabn	68,0,6596,.LM928-.LFBB27
.LM928:
	sbrc r25,7
	rjmp .L479
	.stabn	68,0,6597,.LM929-.LFBB27
.LM929:
	ldd r12,Z+4
	ldd r13,Z+5
	.stabn	68,0,6696,.LM930-.LFBB27
.LM930:
	movw r14,r24
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	.stabn	68,0,6696,.LM931-.LFBB27
.LM931:
	add r24,r16
	adc r25,r17
	movw r30,r24
	std Z+6,r22
	.stabn	68,0,6699,.LM932-.LFBB27
.LM932:
	ldi r31,60
	cp r14,r31
	cpc r15,__zero_reg__
	brlt .L481
	.stabn	68,0,6700,.LM933-.LFBB27
.LM933:
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
	.stabn	68,0,6701,.LM934-.LFBB27
.LM934:
	ldi r24,lo8(1)
	ldi r25,0
	ldd r18,Y+1
	ldd r19,Y+2
	cp r18,r14
	cpc r19,r15
	brne .L482
	ldi r25,0
	ldi r24,0
.L482:
	clr r14
	clr r15
	sub r14,r24
	sbc r15,r25
.L481:
	.stabn	68,0,6703,.LM935-.LFBB27
.LM935:
	movw r30,r16
	std Z+3,r15
	std Z+2,r14
	.stabn	68,0,6704,.LM936-.LFBB27
.LM936:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	.stabn	68,0,6704,.LM937-.LFBB27
.LM937:
	movw r30,r16
	std Z+5,r13
	std Z+4,r12
.L479:
/* epilogue start */
	.stabn	68,0,6705,.LM938-.LFBB27
.LM938:
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
	.stabn	68,0,6711,.LM939-.LFBB28
.LM939:
.LFBB28:
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,6714,.LM940-.LFBB28
.LM940:
	movw r30,r24
	ldd r20,Z+2
	ldd r21,Z+3
	.stabn	68,0,6714,.LM941-.LFBB28
.LM941:
	sbrs r21,7
	rjmp .L484
.L486:
	.stabn	68,0,6717,.LM942-.LFBB28
.LM942:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L483:
/* epilogue start */
	.stabn	68,0,6718,.LM943-.LFBB28
.LM943:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L484:
	.stabn	68,0,6715,.LM944-.LFBB28
.LM944:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r22,r24
	subi r22,-6
	sbci r23,-1
	ld r24,Z
	ldd r25,Z+1
	call f_write
	.stabn	68,0,6715,.LM945-.LFBB28
.LM945:
	or r24,r25
	brne .L486
	.stabn	68,0,6716,.LM946-.LFBB28
.LM946:
	movw r30,r16
	ldd r18,Z+2
	ldd r19,Z+3
	ldd r24,Y+1
	ldd r25,Y+2
	cp r18,r24
	cpc r19,r25
	brne .L486
	.stabn	68,0,6716,.LM947-.LFBB28
.LM947:
	ldd r24,Z+4
	ldd r25,Z+5
	rjmp .L483
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
	.stabn	68,0,4139,.LM948-.LFBB29
.LM948:
.LFBB29:
	push r12
	push r13
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
/* frame size = 2 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	.stabn	68,0,4146,.LM949-.LFBB29
.LM949:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r18,r24
	.stabn	68,0,4147,.LM950-.LFBB29
.LM950:
	or r24,r25
	brne .L487
	.stabn	68,0,4148,.LM951-.LFBB29
.LM951:
	movw r30,r16
	ldd r24,Z+14
	sbrs r24,6
	rjmp .L487
	.stabn	68,0,4189,.LM952-.LFBB29
.LM952:
	ldd r12,Y+1
	ldd r13,Y+2
	ldd r20,Z+28
	ldd r21,Z+29
	ldd r22,Z+30
	ldd r23,Z+31
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,4190,.LM953-.LFBB29
.LM953:
	or r24,r25
	brne .L487
	.stabn	68,0,4191,.LM954-.LFBB29
.LM954:
	movw r30,r16
	ldd r14,Z+32
	ldd r15,Z+33
	.stabn	68,0,4192,.LM955-.LFBB29
.LM955:
	movw r30,r14
	ldd r24,Z+11
	ori r24,lo8(32)
	std Z+11,r24
	.stabn	68,0,4193,.LM956-.LFBB29
.LM956:
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
	.stabn	68,0,665,.LM957-.LFBB29
.LM957:
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
	.stabn	68,0,666,.LM958-.LFBB29
.LM958:
	std Z+23,__zero_reg__
	.stabn	68,0,667,.LM959-.LFBB29
.LM959:
	ldi r24,lo8(33)
	std Z+24,r24
	.stabn	68,0,668,.LM960-.LFBB29
.LM960:
	ldi r24,lo8(84)
	std Z+25,r24
.LBE259:
.LBE258:
.LBB260:
.LBB261:
	.stabn	68,0,659,.LM961-.LFBB29
.LM961:
	std Z+18,__zero_reg__
	.stabn	68,0,660,.LM962-.LFBB29
.LM962:
	std Z+19,__zero_reg__
.LBE261:
.LBE260:
	.stabn	68,0,4197,.LM963-.LFBB29
.LM963:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+4,r24
	.stabn	68,0,4198,.LM964-.LFBB29
.LM964:
	movw r24,r12
	call sync_fs
	movw r18,r24
	.stabn	68,0,4199,.LM965-.LFBB29
.LM965:
	movw r30,r16
	ldd r24,Z+14
	andi r24,lo8(-65)
	std Z+14,r24
.L487:
	.stabn	68,0,4206,.LM966-.LFBB29
.LM966:
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
	.stabn	68,0,4220,.LM967-.LFBB30
.LM967:
.LFBB30:
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,4225,.LM968-.LFBB30
.LM968:
	call f_sync
	movw r18,r24
	.stabn	68,0,4226,.LM969-.LFBB30
.LM969:
	or r24,r25
	brne .L492
	.stabn	68,0,4229,.LM970-.LFBB30
.LM970:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call validate
	movw r18,r24
	.stabn	68,0,4230,.LM971-.LFBB30
.LM971:
	or r24,r25
	brne .L492
	.stabn	68,0,4235,.LM972-.LFBB30
.LM972:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.L492:
	.stabn	68,0,4243,.LM973-.LFBB30
.LM973:
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
	.stabn	68,0,4438,.LM974-.LFBB31
.LM974:
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 26 */
.L__stack_usage = 26
	movw r16,r24
	movw r12,r20
	movw r14,r22
	.stabn	68,0,4450,.LM975-.LFBB31
.LM975:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r10,r24
	.stabn	68,0,4451,.LM976-.LFBB31
.LM976:
	or r24,r25
	breq .+2
	rjmp .L494
	.stabn	68,0,4451,.LM977-.LFBB31
.LM977:
	movw r26,r16
	adiw r26,15
	ld r24,X
	sbiw r26,15
	mov r10,r24
	mov r11,__zero_reg__
	.stabn	68,0,4457,.LM978-.LFBB31
.LM978:
	cpse r24,__zero_reg__
	rjmp .L494
	.stabn	68,0,4516,.LM979-.LFBB31
.LM979:
	adiw r26,10
	ld r24,X+
	ld r25,X+
	ld __tmp_reg__,X+
	ld r27,X
	mov r26,__tmp_reg__
	.stabn	68,0,4516,.LM980-.LFBB31
.LM980:
	cp r24,r12
	cpc r25,r13
	cpc r26,r14
	cpc r27,r15
	brsh .L496
	.stabn	68,0,4516,.LM981-.LFBB31
.LM981:
	movw r30,r16
	ldd r18,Z+14
	sbrc r18,1
	rjmp .L496
	.stabn	68,0,4516,.LM982-.LFBB31
.LM982:
	movw r12,r24
	movw r14,r26
.L496:
	.stabn	68,0,4519,.LM983-.LFBB31
.LM983:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4520,.LM984-.LFBB31
.LM984:
	std Z+16,__zero_reg__
	std Z+17,__zero_reg__
	std Z+18,__zero_reg__
	std Z+19,__zero_reg__
	.stabn	68,0,4521,.LM985-.LFBB31
.LM985:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L497
.L505:
	.stabn	68,0,4520,.LM986-.LFBB31
.LM986:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
.L498:
	.stabn	68,0,4570,.LM987-.LFBB31
.LM987:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4570,.LM988-.LFBB31
.LM988:
	ldd r20,Z+10
	ldd r21,Z+11
	ldd r22,Z+12
	ldd r23,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L512
	.stabn	68,0,4571,.LM989-.LFBB31
.LM989:
	std Z+10,r24
	std Z+11,r25
	std Z+12,r26
	std Z+13,r27
	.stabn	68,0,4572,.LM990-.LFBB31
.LM990:
	ldd r18,Z+14
	ori r18,lo8(64)
	std Z+14,r18
.L512:
	.stabn	68,0,4574,.LM991-.LFBB31
.LM991:
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,4574,.LM992-.LFBB31
.LM992:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L494
	.stabn	68,0,4574,.LM993-.LFBB31
.LM993:
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
	rjmp .L494
	.stabn	68,0,4584,.LM994-.LFBB31
.LM994:
	std Z+24,r12
	std Z+25,r13
	std Z+26,r14
	std Z+27,r15
	rjmp .L494
.L497:
	.stabn	68,0,4522,.LM995-.LFBB31
.LM995:
	ldd r8,Y+1
	ldd r9,Y+2
	.stabn	68,0,4522,.LM996-.LFBB31
.LM996:
	movw r30,r8
	ldd r4,Z+10
	ldd r5,Z+11
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
	.stabn	68,0,4523,.LM997-.LFBB31
.LM997:
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .+2
	rjmp .L499
	.stabn	68,0,4524,.LM998-.LFBB31
.LM998:
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
	.stabn	68,0,4524,.LM999-.LFBB31
.LM999:
	movw r26,r14
	movw r24,r12
	sbiw r24,1
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	.stabn	68,0,4524,.LM1000-.LFBB31
.LM1000:
	movw r22,r24
	movw r24,r26
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	std Y+7,r18
	std Y+8,r19
	std Y+9,r20
	std Y+10,r21
	.stabn	68,0,4524,.LM1001-.LFBB31
.LM1001:
	ldd r22,Y+3
	ldd r23,Y+4
	ldd r24,Y+5
	ldd r25,Y+6
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	.stabn	68,0,4523,.LM1002-.LFBB31
.LM1002:
	ldd r24,Y+7
	ldd r25,Y+8
	ldd r26,Y+9
	ldd r27,Y+10
	cp r24,r18
	cpc r25,r19
	cpc r26,r20
	cpc r27,r21
	brsh .+2
	rjmp .L499
	.stabn	68,0,4525,.LM1003-.LFBB31
.LM1003:
	clr r24
	clr r25
	movw r26,r24
	sub r24,r4
	sbc r25,r5
	sbc r26,r6
	sbc r27,r7
	.stabn	68,0,4525,.LM1004-.LFBB31
.LM1004:
	ldd r18,Y+3
	ldd r19,Y+4
	ldd r20,Y+5
	ldd r21,Y+6
	and r24,r18
	and r25,r19
	and r26,r20
	and r27,r21
	.stabn	68,0,4525,.LM1005-.LFBB31
.LM1005:
	movw r30,r16
	std Z+16,r24
	std Z+17,r25
	std Z+18,r26
	std Z+19,r27
	.stabn	68,0,4526,.LM1006-.LFBB31
.LM1006:
	sub r12,r24
	sbc r13,r25
	sbc r14,r26
	sbc r15,r27
	.stabn	68,0,4527,.LM1007-.LFBB31
.LM1007:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
.L500:
	.stabn	68,0,4540,.LM1008-.LFBB31
.LM1008:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L505
.L504:
	.stabn	68,0,4542,.LM1009-.LFBB31
.LM1009:
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
	.stabn	68,0,4541,.LM1010-.LFBB31
.LM1010:
	cp r4,r12
	cpc r5,r13
	cpc r6,r14
	cpc r7,r15
	brsh .+2
	rjmp .L511
.L507:
	.stabn	68,0,4562,.LM1011-.LFBB31
.LM1011:
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
	.stabn	68,0,4563,.LM1012-.LFBB31
.LM1012:
	movw r26,r14
	movw r24,r12
	andi r25,1
	clr r26
	clr r27
	.stabn	68,0,4563,.LM1013-.LFBB31
.LM1013:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .+2
	rjmp .L505
	.stabn	68,0,4564,.LM1014-.LFBB31
.LM1014:
	movw r24,r8
	call clst2sect
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4565,.LM1015-.LFBB31
.LM1015:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L510
	.stabn	68,0,4566,.LM1016-.LFBB31
.LM1016:
	ldi r24,9
	1:
	lsr r15
	ror r14
	ror r13
	ror r12
	dec r24
	brne 1b
	.stabn	68,0,4566,.LM1017-.LFBB31
.LM1017:
	add r12,r20
	adc r13,r21
	adc r14,r22
	adc r15,r23
	rjmp .L498
.L499:
	.stabn	68,0,4529,.LM1018-.LFBB31
.LM1018:
	movw r26,r16
	adiw r26,6
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X
	sbiw r26,6+3
	.stabn	68,0,4531,.LM1019-.LFBB31
.LM1019:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .+2
	rjmp .L501
	.stabn	68,0,4532,.LM1020-.LFBB31
.LM1020:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	ld r24,X+
	ld r25,X
	call create_chain.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4533,.LM1021-.LFBB31
.LM1021:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L502
.L510:
	.stabn	68,0,4533,.LM1022-.LFBB31
.LM1022:
	ldi r24,lo8(2)
	movw r30,r16
	std Z+15,r24
	ldi r18,lo8(2)
	mov r10,r18
	mov r11,__zero_reg__
.L494:
	.stabn	68,0,4589,.LM1023-.LFBB31
.LM1023:
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
.L502:
	.stabn	68,0,4534,.LM1024-.LFBB31
.LM1024:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	brne .L503
.L509:
	.stabn	68,0,4534,.LM1025-.LFBB31
.LM1025:
	ldi r24,lo8(1)
	movw r26,r16
	adiw r26,15
	st X,r24
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L494
.L503:
	.stabn	68,0,4535,.LM1026-.LFBB31
.LM1026:
	movw r30,r16
	std Z+6,r20
	std Z+7,r21
	std Z+8,r22
	std Z+9,r23
.L501:
	.stabn	68,0,4538,.LM1027-.LFBB31
.LM1027:
	movw r26,r16
	adiw r26,20
	st X+,r20
	st X+,r21
	st X+,r22
	st X,r23
	sbiw r26,20+3
	rjmp .L500
.L511:
	.stabn	68,0,4542,.LM1028-.LFBB31
.LM1028:
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
	.stabn	68,0,4542,.LM1029-.LFBB31
.LM1029:
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
	.stabn	68,0,4544,.LM1030-.LFBB31
.LM1030:
	ldd r18,Z+14
	sbrs r18,1
	rjmp .L506
	.stabn	68,0,4549,.LM1031-.LFBB31
.LM1031:
	call create_chain.isra.0
	movw r12,r22
	movw r14,r24
	.stabn	68,0,4550,.LM1032-.LFBB31
.LM1032:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L508
	.stabn	68,0,4549,.LM1033-.LFBB31
.LM1033:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	rjmp .L507
.L506:
	.stabn	68,0,4556,.LM1034-.LFBB31
.LM1034:
	call get_fat.isra.0
	movw r12,r22
	movw r14,r24
.L508:
	.stabn	68,0,4558,.LM1035-.LFBB31
.LM1035:
	ldi r31,-1
	cp r12,r31
	cpc r13,r31
	cpc r14,r31
	cpc r15,r31
	brne .+2
	rjmp .L509
	.stabn	68,0,4559,.LM1036-.LFBB31
.LM1036:
	ldi r18,2
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brsh .+2
	rjmp .L510
	.stabn	68,0,4559,.LM1037-.LFBB31
.LM1037:
	movw r30,r8
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r12,r24
	cpc r13,r25
	cpc r14,r26
	cpc r15,r27
	brlo .+2
	rjmp .L510
	.stabn	68,0,4560,.LM1038-.LFBB31
.LM1038:
	movw r26,r16
	adiw r26,20
	st X+,r12
	st X+,r13
	st X+,r14
	st X,r15
	sbiw r26,20+3
	movw r22,r14
	movw r20,r12
	.stabn	68,0,4542,.LM1039-.LFBB31
.LM1039:
	ldd r12,Y+3
	ldd r13,Y+4
	ldd r14,Y+5
	ldd r15,Y+6
	rjmp .L504
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
	.stabn	68,0,4602,.LM1040-.LFBB32
.LM1040:
.LFBB32:
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
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	std Y+4,r23
	std Y+3,r22
	.stabn	68,0,4608,.LM1041-.LFBB32
.LM1041:
	ldi r18,lo8(9)
	ldi r19,0
	.stabn	68,0,4608,.LM1042-.LFBB32
.LM1042:
	or r24,r25
	brne .+2
	rjmp .L530
	.stabn	68,0,4611,.LM1043-.LFBB32
.LM1043:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,3
	call mount_volume
	movw r18,r24
	.stabn	68,0,4612,.LM1044-.LFBB32
.LM1044:
	or r24,r25
	brne .L532
	.stabn	68,0,4613,.LM1045-.LFBB32
.LM1045:
	ldd r14,Y+1
	ldd r15,Y+2
	movw r26,r16
	st X+,r14
	st X,r15
	.stabn	68,0,4615,.LM1046-.LFBB32
.LM1046:
	ldd r22,Y+3
	ldd r23,Y+4
	movw r24,r16
	call follow_path
	movw r18,r24
	.stabn	68,0,4616,.LM1047-.LFBB32
.LM1047:
	sbiw r24,0
	brne .L533
	.stabn	68,0,4617,.LM1048-.LFBB32
.LM1048:
	movw r30,r16
	ldd r24,Z+39
	sbrc r24,7
	rjmp .L534
	.stabn	68,0,4618,.LM1049-.LFBB32
.LM1049:
	ldd r24,Z+4
	sbrc r24,4
	rjmp .L535
.L536:
	.stabn	68,0,4631,.LM1050-.LFBB32
.LM1050:
	ldi r18,lo8(5)
	ldi r19,0
.L532:
	.stabn	68,0,4652,.LM1051-.LFBB32
.LM1051:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	rjmp .L530
.L535:
	.stabn	68,0,4628,.LM1052-.LFBB32
.LM1052:
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
.L534:
	.stabn	68,0,4635,.LM1053-.LFBB32
.LM1053:
	movw r30,r14
	ldd r24,Z+6
	ldd r25,Z+7
	movw r26,r16
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	.stabn	68,0,4636,.LM1054-.LFBB32
.LM1054:
	movw r24,r16
	call dir_sdi.constprop.0
	movw r18,r24
	.stabn	68,0,4650,.LM1055-.LFBB32
.LM1055:
	cpi r24,4
	cpc r25,__zero_reg__
	breq .L536
	.stabn	68,0,4652,.LM1056-.LFBB32
.LM1056:
	or r24,r25
	brne .L532
.L530:
	.stabn	68,0,4655,.LM1057-.LFBB32
.LM1057:
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
.L533:
	.stabn	68,0,4650,.LM1058-.LFBB32
.LM1058:
	sbiw r24,4
	breq .L536
	rjmp .L532
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
	.stabn	68,0,4667,.LM1059-.LFBB33
.LM1059:
.LFBB33:
	push r16
	push r17
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r16,r24
	.stabn	68,0,4672,.LM1060-.LFBB33
.LM1060:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	.stabn	68,0,4673,.LM1061-.LFBB33
.LM1061:
	sbiw r24,0
	brne .L547
	.stabn	68,0,4678,.LM1062-.LFBB33
.LM1062:
	movw r30,r16
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.L547:
/* epilogue start */
	.stabn	68,0,4685,.LM1063-.LFBB33
.LM1063:
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
	.stabn	68,0,4698,.LM1064-.LFBB34
.LM1064:
.LFBB34:
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
/* frame size = 2 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r16,r24
	movw r14,r22
	.stabn	68,0,4704,.LM1065-.LFBB34
.LM1065:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r18,r24
	.stabn	68,0,4705,.LM1066-.LFBB34
.LM1066:
	or r24,r25
	brne .L549
	.stabn	68,0,4707,.LM1067-.LFBB34
.LM1067:
	movw r24,r16
	.stabn	68,0,4706,.LM1068-.LFBB34
.LM1068:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L551
/* epilogue start */
	.stabn	68,0,4721,.LM1069-.LFBB34
.LM1069:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	.stabn	68,0,4707,.LM1070-.LFBB34
.LM1070:
	jmp dir_sdi.constprop.0
.L551:
	.stabn	68,0,4710,.LM1071-.LFBB34
.LM1071:
	call dir_read.constprop.0
	movw r18,r24
	.stabn	68,0,4712,.LM1072-.LFBB34
.LM1072:
	andi r24,251
	or r24,r25
	brne .L549
.LBB264:
.LBB265:
	.stabn	68,0,2634,.LM1073-.LFBB34
.LM1073:
	movw r30,r14
	std Z+9,__zero_reg__
	.stabn	68,0,2635,.LM1074-.LFBB34
.LM1074:
	movw r30,r16
	ldd r24,Z+22
	ldd r25,Z+23
	ldd r26,Z+24
	ldd r27,Z+25
	or r24,r25
	or r24,r26
	or r24,r27
	breq .L552
	movw r22,r14
	ldd r24,Z+26
	ldd r25,Z+27
	call get_fileinfo.part.0.constprop.0.isra.0
.L552:
.LBE265:
.LBE264:
	.stabn	68,0,4714,.LM1075-.LFBB34
.LM1075:
	ldi r23,0
	ldi r22,0
	movw r24,r16
	call dir_next
	movw r18,r24
	.stabn	68,0,4715,.LM1076-.LFBB34
.LM1076:
	sbiw r24,4
	brne .L549
	.stabn	68,0,4715,.LM1077-.LFBB34
.LM1077:
	ldi r19,0
	ldi r18,0
.L549:
	.stabn	68,0,4721,.LM1078-.LFBB34
.LM1078:
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
	.stabn	68,0,4786,.LM1079-.LFBB35
.LM1079:
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
	.stabn	68,0,4793,.LM1080-.LFBB35
.LM1080:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,41
	call mount_volume
	movw r16,r24
	.stabn	68,0,4794,.LM1081-.LFBB35
.LM1081:
	or r24,r25
	brne .L556
	.stabn	68,0,4796,.LM1082-.LFBB35
.LM1082:
	ldd r22,Y+41
	ldd r23,Y+42
	movw r24,r28
	adiw r24,1
	call follow_path
	movw r16,r24
	.stabn	68,0,4797,.LM1083-.LFBB35
.LM1083:
	or r24,r25
	brne .L556
	.stabn	68,0,4798,.LM1084-.LFBB35
.LM1084:
	ldd r24,Y+40
	sbrc r24,7
	rjmp .L560
	.stabn	68,0,4801,.LM1085-.LFBB35
.LM1085:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L556
.LBB268:
.LBB269:
	.stabn	68,0,2634,.LM1086-.LFBB35
.LM1086:
	movw r30,r14
	std Z+9,__zero_reg__
	.stabn	68,0,2635,.LM1087-.LFBB35
.LM1087:
	ldd r24,Y+23
	ldd r25,Y+24
	ldd r26,Y+25
	ldd r27,Y+26
	or r24,r25
	or r24,r26
	or r24,r27
	breq .L556
	movw r22,r14
	ldd r24,Y+27
	ldd r25,Y+28
	call get_fileinfo.part.0.constprop.0.isra.0
.L556:
.LBE269:
.LBE268:
	.stabn	68,0,4808,.LM1088-.LFBB35
.LM1088:
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
.L560:
	.stabn	68,0,4799,.LM1089-.LFBB35
.LM1089:
	ldi r16,lo8(6)
	ldi r17,0
	.stabn	68,0,4807,.LM1090-.LFBB35
.LM1090:
	rjmp .L556
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
	.stabn	68,0,4822,.LM1091-.LFBB36
.LM1091:
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
	.stabn	68,0,4832,.LM1092-.LFBB36
.LM1092:
	ldi r20,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,3
	call mount_volume
	movw r10,r24
	.stabn	68,0,4833,.LM1093-.LFBB36
.LM1093:
	or r24,r25
	brne .L564
	.stabn	68,0,4834,.LM1094-.LFBB36
.LM1094:
	ldd r16,Y+1
	ldd r17,Y+2
	movw r26,r14
	st X+,r16
	st X,r17
	.stabn	68,0,4836,.LM1095-.LFBB36
.LM1095:
	movw r30,r16
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	.stabn	68,0,4836,.LM1096-.LFBB36
.LM1096:
	ldd r4,Z+20
	ldd r5,Z+21
	ldd r6,Z+22
	ldd r7,Z+23
	.stabn	68,0,4836,.LM1097-.LFBB36
.LM1097:
	movw r22,r6
	movw r20,r4
	subi r20,2
	sbc r21,__zero_reg__
	sbc r22,__zero_reg__
	sbc r23,__zero_reg__
	.stabn	68,0,4836,.LM1098-.LFBB36
.LM1098:
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brlo .L566
	.stabn	68,0,4837,.LM1099-.LFBB36
.LM1099:
	ldd r30,Y+5
	ldd r31,Y+6
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
.L564:
	.stabn	68,0,4904,.LM1100-.LFBB36
.LM1100:
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
.L566:
	.stabn	68,0,4841,.LM1101-.LFBB36
.LM1101:
	ld r24,Z
	cpi r24,lo8(1)
	breq .+2
	rjmp .L567
	.stabn	68,0,4842,.LM1102-.LFBB36
.LM1102:
	ldi r18,lo8(2)
	mov r4,r18
	mov r5,__zero_reg__
	mov r6,__zero_reg__
	mov r7,__zero_reg__
	.stabn	68,0,4840,.LM1103-.LFBB36
.LM1103:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
.L569:
	.stabn	68,0,4844,.LM1104-.LFBB36
.LM1104:
	movw r22,r6
	movw r20,r4
	movw r24,r16
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4845,.LM1105-.LFBB36
.LM1105:
	cpi r20,-1
	ldi r27,-1
	cpc r21,r27
	cpc r22,r27
	cpc r23,r27
	brne .+2
	rjmp .L577
	.stabn	68,0,4848,.LM1106-.LFBB36
.LM1106:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L578
	.stabn	68,0,4851,.LM1107-.LFBB36
.LM1107:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .L568
	.stabn	68,0,4851,.LM1108-.LFBB36
.LM1108:
	ldi r30,-1
	sub r12,r30
	sbc r13,r30
	sbc r14,r30
	sbc r15,r30
.L568:
	.stabn	68,0,4852,.LM1109-.LFBB36
.LM1109:
	ldi r31,-1
	sub r4,r31
	sbc r5,r31
	sbc r6,r31
	sbc r7,r31
	movw r30,r16
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r4,r24
	cpc r5,r25
	cpc r6,r26
	cpc r7,r27
	brlo .L569
.L570:
	.stabn	68,0,4896,.LM1110-.LFBB36
.LM1110:
	ldd r26,Y+5
	ldd r27,Y+6
	st X+,r12
	st X+,r13
	st X+,r14
	st X,r15
	sbiw r26,3
	.stabn	68,0,4897,.LM1111-.LFBB36
.LM1111:
	movw r30,r16
	std Z+16,r12
	std Z+17,r13
	std Z+18,r14
	std Z+19,r15
	.stabn	68,0,4898,.LM1112-.LFBB36
.LM1112:
	ldd r24,Z+5
	ori r24,lo8(1)
	std Z+5,r24
	rjmp .L564
.L567:
	.stabn	68,0,4877,.LM1113-.LFBB36
.LM1113:
	ldd r24,Z+32
	ldd r25,Z+33
	ldd r26,Z+34
	ldd r27,Z+35
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	.stabn	68,0,4878,.LM1114-.LFBB36
.LM1114:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
	.stabn	68,0,4840,.LM1115-.LFBB36
.LM1115:
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	.stabn	68,0,4885,.LM1116-.LFBB36
.LM1116:
	movw r2,r16
	ldi r27,48
	add r2,r27
	adc r3,__zero_reg__
.L576:
	.stabn	68,0,4880,.LM1117-.LFBB36
.LM1117:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L571
	.stabn	68,0,4881,.LM1118-.LFBB36
.LM1118:
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
	.stabn	68,0,4882,.LM1119-.LFBB36
.LM1119:
	sbiw r24,0
	breq .+2
	rjmp .L579
	.stabn	68,0,4881,.LM1120-.LFBB36
.LM1120:
	ldd r24,Y+11
	ldd r25,Y+12
	ldd r26,Y+13
	ldd r27,Y+14
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
.L571:
	.stabn	68,0,4885,.LM1121-.LFBB36
.LM1121:
	movw r24,r2
	add r24,r8
	adc r25,r9
	.stabn	68,0,4884,.LM1122-.LFBB36
.LM1122:
	movw r26,r16
	ld r18,X
	cpi r18,lo8(2)
	brne .L572
	.stabn	68,0,4885,.LM1123-.LFBB36
.LM1123:
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	brne .L573
	.stabn	68,0,4885,.LM1124-.LFBB36
.LM1124:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	sbc r14,r31
	sbc r15,r31
.L573:
	.stabn	68,0,4886,.LM1125-.LFBB36
.LM1125:
	ldi r24,2
	add r8,r24
	adc r9,__zero_reg__
.L574:
	.stabn	68,0,4891,.LM1126-.LFBB36
.LM1126:
	ldi r27,1
	and r9,r27
	.stabn	68,0,4892,.LM1127-.LFBB36
.LM1127:
	ldi r30,1
	sub r4,r30
	sbc r5,__zero_reg__
	sbc r6,__zero_reg__
	sbc r7,__zero_reg__
	breq .+2
	rjmp .L576
	rjmp .L570
.L572:
	.stabn	68,0,4888,.LM1128-.LFBB36
.LM1128:
	call ld_dword
	std Y+11,r22
	std Y+12,r23
	std Y+13,r24
	std Y+14,r25
	.stabn	68,0,4888,.LM1129-.LFBB36
.LM1129:
	movw r26,r24
	movw r24,r22
	andi r27,15
	.stabn	68,0,4888,.LM1130-.LFBB36
.LM1130:
	or r24,r25
	or r24,r26
	or r24,r27
	brne .L575
	.stabn	68,0,4888,.LM1131-.LFBB36
.LM1131:
	ldi r25,-1
	sub r12,r25
	sbc r13,r25
	sbc r14,r25
	sbc r15,r25
.L575:
	.stabn	68,0,4889,.LM1132-.LFBB36
.LM1132:
	ldi r26,4
	add r8,r26
	adc r9,__zero_reg__
	rjmp .L574
.L577:
	.stabn	68,0,4846,.LM1133-.LFBB36
.LM1133:
	clr r10
	inc r10
	mov r11,__zero_reg__
	rjmp .L564
.L578:
	.stabn	68,0,4849,.LM1134-.LFBB36
.LM1134:
	ldi r24,lo8(2)
	mov r10,r24
	mov r11,__zero_reg__
	rjmp .L564
.L579:
	movw r10,r24
	.stabn	68,0,4903,.LM1135-.LFBB36
.LM1135:
	rjmp .L564
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
	.stabn	68,0,4916,.LM1136-.LFBB37
.LM1136:
.LFBB37:
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
/* frame size = 2 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r14,r24
	.stabn	68,0,4922,.LM1137-.LFBB37
.LM1137:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call validate
	movw r16,r24
	.stabn	68,0,4923,.LM1138-.LFBB37
.LM1138:
	or r24,r25
	brne .L582
	.stabn	68,0,4923,.LM1139-.LFBB37
.LM1139:
	movw r30,r14
	ldd r24,Z+15
	mov r16,r24
	ldi r17,0
	.stabn	68,0,4923,.LM1140-.LFBB37
.LM1140:
	cpse r24,__zero_reg__
	rjmp .L582
	.stabn	68,0,4924,.LM1141-.LFBB37
.LM1141:
	ldd r24,Z+14
	sbrs r24,1
	rjmp .L586
	.stabn	68,0,4926,.LM1142-.LFBB37
.LM1142:
	ldd r20,Z+16
	ldd r21,Z+17
	ldd r22,Z+18
	ldd r23,Z+19
	.stabn	68,0,4926,.LM1143-.LFBB37
.LM1143:
	ldd r24,Z+10
	ldd r25,Z+11
	ldd r26,Z+12
	ldd r27,Z+13
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L582
	ld r24,Z
	ldd r25,Z+1
	.stabn	68,0,4927,.LM1144-.LFBB37
.LM1144:
	or r20,r21
	or r20,r22
	or r20,r23
	brne .L584
	.stabn	68,0,4928,.LM1145-.LFBB37
.LM1145:
	ldd r20,Z+6
	ldd r21,Z+7
	ldd r22,Z+8
	ldd r23,Z+9
	ldi r16,0
	ldi r17,0
	movw r18,r16
	call remove_chain.isra.0
	movw r16,r24
	.stabn	68,0,4929,.LM1146-.LFBB37
.LM1146:
	movw r30,r14
	std Z+6,__zero_reg__
	std Z+7,__zero_reg__
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
.L585:
	.stabn	68,0,4939,.LM1147-.LFBB37
.LM1147:
	movw r30,r14
	ldd r24,Z+16
	ldd r25,Z+17
	ldd r26,Z+18
	ldd r27,Z+19
	std Z+10,r24
	std Z+11,r25
	std Z+12,r26
	std Z+13,r27
	.stabn	68,0,4940,.LM1148-.LFBB37
.LM1148:
	ldd r24,Z+14
	ori r24,lo8(64)
	std Z+14,r24
	.stabn	68,0,4950,.LM1149-.LFBB37
.LM1149:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L582
	.stabn	68,0,4950,.LM1150-.LFBB37
.LM1150:
	std Z+15,r16
.L582:
	.stabn	68,0,4954,.LM1151-.LFBB37
.LM1151:
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
.L584:
	.stabn	68,0,4931,.LM1152-.LFBB37
.LM1152:
	ldd r20,Z+20
	ldd r21,Z+21
	ldd r22,Z+22
	ldd r23,Z+23
	call get_fat.isra.0
	mov r20,r22
	mov r21,r23
	movw r22,r24
	.stabn	68,0,4933,.LM1153-.LFBB37
.LM1153:
	cpi r20,-1
	ldi r31,-1
	cpc r21,r31
	cpc r22,r31
	cpc r23,r31
	breq .L587
	.stabn	68,0,4934,.LM1154-.LFBB37
.LM1154:
	cpi r20,1
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L588
	.stabn	68,0,4935,.LM1155-.LFBB37
.LM1155:
	ldd r30,Y+1
	ldd r31,Y+2
	.stabn	68,0,4935,.LM1156-.LFBB37
.LM1156:
	ldd r24,Z+20
	ldd r25,Z+21
	ldd r26,Z+22
	ldd r27,Z+23
	cp r20,r24
	cpc r21,r25
	cpc r22,r26
	cpc r23,r27
	brsh .L585
	.stabn	68,0,4936,.LM1157-.LFBB37
.LM1157:
	movw r30,r14
	ldd r16,Z+20
	ldd r17,Z+21
	ldd r18,Z+22
	ldd r19,Z+23
	ld r24,Z
	ldd r25,Z+1
	call remove_chain.isra.0
	movw r16,r24
	rjmp .L585
.L587:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L585
.L588:
	.stabn	68,0,4934,.LM1158-.LFBB37
.LM1158:
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L585
.L586:
	.stabn	68,0,4924,.LM1159-.LFBB37
.LM1159:
	ldi r16,lo8(7)
	ldi r17,0
	rjmp .L582
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
	.stabn	68,0,4966,.LM1160-.LFBB38
.LM1160:
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
	.stabn	68,0,4978,.LM1161-.LFBB38
.LM1161:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-81
	sbci r23,-1
	movw r24,r28
	subi r24,-83
	sbci r25,-1
	call mount_volume
	movw r18,r24
	.stabn	68,0,4979,.LM1162-.LFBB38
.LM1162:
	or r24,r25
	brne .L592
	.stabn	68,0,4980,.LM1163-.LFBB38
.LM1163:
	adiw r28,81-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,81-62
	std Y+42,r15
	std Y+41,r14
	.stabn	68,0,4982,.LM1164-.LFBB38
.LM1164:
	adiw r28,83-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,83-62
	movw r24,r28
	adiw r24,41
	call follow_path
	movw r18,r24
	.stabn	68,0,4989,.LM1165-.LFBB38
.LM1165:
	or r24,r25
	brne .L592
	.stabn	68,0,4990,.LM1166-.LFBB38
.LM1166:
	adiw r28,80-63
	ldd r24,Y+63
	sbiw r28,80-63
	.stabn	68,0,4991,.LM1167-.LFBB38
.LM1167:
	ldi r18,lo8(6)
	ldi r19,0
	.stabn	68,0,4990,.LM1168-.LFBB38
.LM1168:
	sbrc r24,7
	rjmp .L592
	.stabn	68,0,4993,.LM1169-.LFBB38
.LM1169:
	ldd r13,Y+45
	.stabn	68,0,4993,.LM1170-.LFBB38
.LM1170:
	sbrs r13,0
	rjmp .L594
.L597:
	.stabn	68,0,4994,.LM1171-.LFBB38
.LM1171:
	ldi r18,lo8(7)
	ldi r19,0
.L592:
	.stabn	68,0,5048,.LM1172-.LFBB38
.LM1172:
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
.L594:
	.stabn	68,0,5006,.LM1173-.LFBB38
.LM1173:
	adiw r28,67-62
	ldd r16,Y+62
	ldd r17,Y+63
	sbiw r28,67-62
	.stabn	68,0,5006,.LM1174-.LFBB38
.LM1174:
	movw r22,r16
	movw r30,r14
	ld r24,Z
	call ld_clust.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,5008,.LM1175-.LFBB38
.LM1175:
	sbrc r13,4
	rjmp .L595
.L598:
.LBB272:
.LBB273:
	.stabn	68,0,2577,.LM1176-.LFBB38
.LM1176:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,2599,.LM1177-.LFBB38
.LM1177:
	adiw r28,63-60
	ldd r20,Y+60
	ldd r21,Y+61
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,63-60
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,2600,.LM1178-.LFBB38
.LM1178:
	or r24,r25
	brne .L592
	.stabn	68,0,2601,.LM1179-.LFBB38
.LM1179:
	ldi r24,lo8(-27)
	movw r30,r16
	st Z,r24
	.stabn	68,0,2602,.LM1180-.LFBB38
.LM1180:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+4,r24
.LBE273:
.LBE272:
	.stabn	68,0,5034,.LM1181-.LFBB38
.LM1181:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L599
.L600:
	.stabn	68,0,5041,.LM1182-.LFBB38
.LM1182:
	movw r24,r14
	call sync_fs
	movw r18,r24
	rjmp .L592
.L595:
	.stabn	68,0,5015,.LM1183-.LFBB38
.LM1183:
	std Y+2,r15
	std Y+1,r14
	.stabn	68,0,5016,.LM1184-.LFBB38
.LM1184:
	std Y+7,r8
	std Y+8,r9
	std Y+9,r10
	std Y+10,r11
	.stabn	68,0,5023,.LM1185-.LFBB38
.LM1185:
	movw r24,r28
	adiw r24,1
	call dir_sdi.constprop.0
	movw r18,r24
	.stabn	68,0,5024,.LM1186-.LFBB38
.LM1186:
	or r24,r25
	breq .+2
	rjmp .L592
	.stabn	68,0,5025,.LM1187-.LFBB38
.LM1187:
	movw r24,r28
	adiw r24,1
	call dir_read.constprop.0
	movw r18,r24
	.stabn	68,0,5026,.LM1188-.LFBB38
.LM1188:
	sbiw r24,0
	brne .+2
	rjmp .L597
	.stabn	68,0,5027,.LM1189-.LFBB38
.LM1189:
	sbiw r24,4
	breq .+2
	rjmp .L592
	rjmp .L598
.L599:
	.stabn	68,0,5038,.LM1190-.LFBB38
.LM1190:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call remove_chain.isra.0
	movw r18,r24
	.stabn	68,0,5041,.LM1191-.LFBB38
.LM1191:
	or r24,r25
	breq .+2
	rjmp .L592
	rjmp .L600
	.size	f_unlink, .-f_unlink
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,81
	.stabs	"dj:(0,39)",128,0,0,41
	.stabs	"sdj:(0,39)",128,0,0,1
	.stabs	"dclst:r(0,1)",64,0,0,8
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
	.stabn	68,0,5060,.LM1192-.LFBB39
.LM1192:
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
	.stabn	68,0,5069,.LM1193-.LFBB39
.LM1193:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-41
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call mount_volume
	movw r14,r24
	.stabn	68,0,5070,.LM1194-.LFBB39
.LM1194:
	or r24,r25
	breq .+2
	rjmp .L611
	.stabn	68,0,5071,.LM1195-.LFBB39
.LM1195:
	ldd r24,Y+41
	ldd r25,Y+42
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,5073,.LM1196-.LFBB39
.LM1196:
	ldd r22,Y+43
	ldd r23,Y+44
	movw r24,r28
	adiw r24,1
	call follow_path
	movw r14,r24
	.stabn	68,0,5074,.LM1197-.LFBB39
.LM1197:
	or r24,r25
	brne .+2
	rjmp .L616
	.stabn	68,0,5078,.LM1198-.LFBB39
.LM1198:
	ldi r24,4
	cp r14,r24
	cpc r15,__zero_reg__
	breq .+2
	rjmp .L611
	.stabn	68,0,5079,.LM1199-.LFBB39
.LM1199:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,5080,.LM1200-.LFBB39
.LM1200:
	ldi r20,0
	ldi r21,0
	movw r22,r20
	movw r24,r12
	call create_chain.isra.0
	movw r8,r22
	movw r10,r24
	.stabn	68,0,5082,.LM1201-.LFBB39
.LM1201:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .+2
	rjmp .L617
	.stabn	68,0,5083,.LM1202-.LFBB39
.LM1202:
	ldi r18,lo8(2)
	mov r14,r18
	mov r15,__zero_reg__
	.stabn	68,0,5083,.LM1203-.LFBB39
.LM1203:
	ldi r30,1
	cp r8,r30
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .+2
	rjmp .L613
	.stabn	68,0,5084,.LM1204-.LFBB39
.LM1204:
	clr r14
	inc r14
	mov r15,__zero_reg__
	.stabn	68,0,5084,.LM1205-.LFBB39
.LM1205:
	ldi r31,-1
	cp r8,r31
	cpc r9,r31
	cpc r10,r31
	cpc r11,r31
	brne .+2
	rjmp .L613
	.stabn	68,0,5087,.LM1206-.LFBB39
.LM1206:
	movw r22,r10
	movw r20,r8
	ldd r24,Y+41
	ldd r25,Y+42
	call dir_clear
	movw r14,r24
	.stabn	68,0,5088,.LM1207-.LFBB39
.LM1207:
	or r24,r25
	breq .+2
	rjmp .L613
	.stabn	68,0,5090,.LM1208-.LFBB39
.LM1208:
	ldd r16,Y+41
	ldd r17,Y+42
	.stabn	68,0,5090,.LM1209-.LFBB39
.LM1209:
	movw r14,r16
	ldi r31,48
	add r14,r31
	adc r15,__zero_reg__
	.stabn	68,0,5090,.LM1210-.LFBB39
.LM1210:
	ldi r20,lo8(10)
	ldi r21,0
	ldi r22,lo8(32)
	ldi r23,0
	movw r24,r16
	adiw r24,49
	call memset
	.stabn	68,0,5091,.LM1211-.LFBB39
.LM1211:
	ldi r20,lo8(46)
	mov r4,r20
	movw r30,r16
	std Z+48,r4
	.stabn	68,0,5092,.LM1212-.LFBB39
.LM1212:
	ldi r21,lo8(16)
	mov r7,r21
	std Z+59,r7
.LBB278:
.LBB279:
	.stabn	68,0,665,.LM1213-.LFBB39
.LM1213:
	subi r30,-70
	sbci r31,-1
	st Z,__zero_reg__
	.stabn	68,0,666,.LM1214-.LFBB39
.LM1214:
	adiw r30,1
	st Z,__zero_reg__
	.stabn	68,0,667,.LM1215-.LFBB39
.LM1215:
	adiw r30,1
	ldi r22,lo8(33)
	mov r5,r22
	st Z,r5
	.stabn	68,0,668,.LM1216-.LFBB39
.LM1216:
	adiw r30,1
	ldi r23,lo8(84)
	mov r6,r23
	st Z,r6
.LBE279:
.LBE278:
	.stabn	68,0,5094,.LM1217-.LFBB39
.LM1217:
	movw r20,r10
	movw r18,r8
	movw r22,r14
	movw r24,r16
	call st_clust
	.stabn	68,0,5095,.LM1218-.LFBB39
.LM1218:
	movw r22,r16
	subi r22,-80
	sbci r23,-1
	ldi r24,lo8(32)
	movw r30,r14
	movw r26,r22
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.stabn	68,0,5096,.LM1219-.LFBB39
.LM1219:
	movw r30,r16
	subi r30,-81
	sbci r31,-1
	st Z,r4
	.stabn	68,0,5097,.LM1220-.LFBB39
.LM1220:
	ldd r18,Y+7
	ldd r19,Y+8
	ldd r20,Y+9
	ldd r21,Y+10
	movw r24,r16
	call st_clust
	.stabn	68,0,5098,.LM1221-.LFBB39
.LM1221:
	clr r4
	inc r4
	movw r30,r16
	std Z+4,r4
	.stabn	68,0,5100,.LM1222-.LFBB39
.LM1222:
	movw r24,r28
	adiw r24,1
	call dir_register
	movw r14,r24
	.stabn	68,0,5103,.LM1223-.LFBB39
.LM1223:
	or r24,r25
	brne .L613
	.stabn	68,0,5116,.LM1224-.LFBB39
.LM1224:
	ldd r30,Y+27
	ldd r31,Y+28
.LBB280:
.LBB281:
	.stabn	68,0,665,.LM1225-.LFBB39
.LM1225:
	std Z+22,__zero_reg__
	.stabn	68,0,666,.LM1226-.LFBB39
.LM1226:
	std Z+23,__zero_reg__
	.stabn	68,0,667,.LM1227-.LFBB39
.LM1227:
	std Z+24,r5
	.stabn	68,0,668,.LM1228-.LFBB39
.LM1228:
	std Z+25,r6
.LBE281:
.LBE280:
	.stabn	68,0,5117,.LM1229-.LFBB39
.LM1229:
	ldd r16,Y+41
	ldd r17,Y+42
	ldd r22,Y+27
	ldd r23,Y+28
	movw r20,r10
	movw r18,r8
	movw r24,r16
	call st_clust
	.stabn	68,0,5118,.LM1230-.LFBB39
.LM1230:
	ldd r30,Y+27
	ldd r31,Y+28
	.stabn	68,0,5118,.LM1231-.LFBB39
.LM1231:
	std Z+11,r7
	.stabn	68,0,5119,.LM1232-.LFBB39
.LM1232:
	movw r30,r16
	std Z+4,r4
	.stabn	68,0,5122,.LM1233-.LFBB39
.LM1233:
	movw r24,r16
	call sync_fs
	movw r14,r24
.L611:
	.stabn	68,0,5132,.LM1234-.LFBB39
.LM1234:
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
.L617:
	.stabn	68,0,5082,.LM1235-.LFBB39
.LM1235:
	ldi r19,lo8(7)
	mov r14,r19
	mov r15,__zero_reg__
.L613:
	.stabn	68,0,5125,.LM1236-.LFBB39
.LM1236:
	ldi r16,0
	ldi r17,0
	movw r18,r16
	movw r22,r10
	movw r20,r8
	movw r24,r12
	call remove_chain.isra.0
	rjmp .L611
.L616:
	.stabn	68,0,5074,.LM1237-.LFBB39
.LM1237:
	ldi r24,lo8(8)
	mov r14,r24
	mov r15,__zero_reg__
	.stabn	68,0,5131,.LM1238-.LFBB39
.LM1238:
	rjmp .L611
	.size	f_mkdir, .-f_mkdir
	.stabs	"res:r(0,24)",64,0,0,14
	.stabs	"fs:(0,8)",128,0,0,41
	.stabs	"dj:(0,39)",128,0,0,1
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
	.stabn	68,0,5145,.LM1239-.LFBB40
.LM1239:
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
	.stabn	68,0,5154,.LM1240-.LFBB40
.LM1240:
	movw r24,r28
	subi r24,-117
	sbci r25,-1
	call get_ldnumber
	.stabn	68,0,5155,.LM1241-.LFBB40
.LM1241:
	ldi r20,lo8(2)
	movw r22,r28
	subi r22,-113
	sbci r23,-1
	movw r24,r28
	subi r24,-115
	sbci r25,-1
	call mount_volume
	movw r18,r24
	.stabn	68,0,5156,.LM1242-.LFBB40
.LM1242:
	or r24,r25
	breq .+2
	rjmp .L622
	.stabn	68,0,5157,.LM1243-.LFBB40
.LM1243:
	adiw r28,113-62
	ldd r16,Y+62
	ldd r17,Y+63
	sbiw r28,113-62
	std Y+42,r17
	std Y+41,r16
	.stabn	68,0,5159,.LM1244-.LFBB40
.LM1244:
	adiw r28,115-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,115-62
	movw r24,r28
	adiw r24,41
	call follow_path
	movw r18,r24
	.stabn	68,0,5160,.LM1245-.LFBB40
.LM1245:
	or r24,r25
	breq .+2
	rjmp .L622
	.stabn	68,0,5160,.LM1246-.LFBB40
.LM1246:
	adiw r28,80-63
	ldd r24,Y+63
	sbiw r28,80-63
	andi r24,lo8(-96)
	.stabn	68,0,5160,.LM1247-.LFBB40
.LM1247:
	ldi r18,lo8(6)
	ldi r19,0
	.stabn	68,0,5160,.LM1248-.LFBB40
.LM1248:
	breq .+2
	rjmp .L622
	.stabn	68,0,5194,.LM1249-.LFBB40
.LM1249:
	adiw r28,67-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,67-62
	.stabn	68,0,5194,.LM1250-.LFBB40
.LM1250:
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
	.stabn	68,0,5195,.LM1251-.LFBB40
.LM1251:
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
	.stabn	68,0,5196,.LM1252-.LFBB40
.LM1252:
	adiw r28,117-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,117-62
	movw r24,r18
	call follow_path
	movw r18,r24
	movw r24,r12
	.stabn	68,0,5197,.LM1253-.LFBB40
.LM1253:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L624
	.stabn	68,0,5198,.LM1254-.LFBB40
.LM1254:
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
	brne .L632
	.stabn	68,0,5198,.LM1255-.LFBB40
.LM1255:
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
	breq .L625
.L632:
	.stabn	68,0,5198,.LM1256-.LFBB40
.LM1256:
	ldi r18,lo8(8)
	ldi r19,0
	rjmp .L622
.L624:
	.stabn	68,0,5200,.LM1257-.LFBB40
.LM1257:
	cpi r18,4
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L622
.L625:
	.stabn	68,0,5201,.LM1258-.LFBB40
.LM1258:
	call dir_register
	movw r18,r24
	.stabn	68,0,5202,.LM1259-.LFBB40
.LM1259:
	or r24,r25
	breq .+2
	rjmp .L622
	.stabn	68,0,5203,.LM1260-.LFBB40
.LM1260:
	ldd r22,Y+27
	ldd r23,Y+28
	.stabn	68,0,5204,.LM1261-.LFBB40
.LM1261:
	movw r26,r22
	adiw r26,13
	.stabn	68,0,5204,.LM1262-.LFBB40
.LM1262:
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
	.stabn	68,0,5205,.LM1263-.LFBB40
.LM1263:
	adiw r28,92-63
	ldd r24,Y+63
	sbiw r28,92-63
	.stabn	68,0,5206,.LM1264-.LFBB40
.LM1264:
	sbrs r24,4
	rjmp .L626
.L634:
	.stabn	68,0,5206,.LM1265-.LFBB40
.LM1265:
	movw r30,r22
	std Z+11,r24
	.stabn	68,0,5207,.LM1266-.LFBB40
.LM1266:
	clr r13
	inc r13
	movw r30,r16
	std Z+4,r13
	.stabn	68,0,5208,.LM1267-.LFBB40
.LM1267:
	movw r30,r22
	ldd r24,Z+11
	sbrs r24,4
	rjmp .L629
	.stabn	68,0,5208,.LM1268-.LFBB40
.LM1268:
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
	breq .L629
	.stabn	68,0,5209,.LM1269-.LFBB40
.LM1269:
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
	.stabn	68,0,5211,.LM1270-.LFBB40
.LM1270:
	ldi r18,lo8(2)
	ldi r19,0
	.stabn	68,0,5210,.LM1271-.LFBB40
.LM1271:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L622
	.stabn	68,0,5214,.LM1272-.LFBB40
.LM1272:
	movw r24,r16
	call move_window
	movw r18,r24
	.stabn	68,0,5216,.LM1273-.LFBB40
.LM1273:
	or r24,r25
	brne .L622
	.stabn	68,0,5216,.LM1274-.LFBB40
.LM1274:
	movw r30,r16
	subi r30,-81
	sbci r31,-1
	.stabn	68,0,5216,.LM1275-.LFBB40
.LM1275:
	ld r24,Z
	cpi r24,lo8(46)
	brne .L629
	.stabn	68,0,5217,.LM1276-.LFBB40
.LM1276:
	ldd r18,Y+7
	ldd r19,Y+8
	ldd r20,Y+9
	ldd r21,Y+10
	movw r22,r16
	subi r22,-80
	sbci r23,-1
	movw r24,r16
	call st_clust
	.stabn	68,0,5218,.LM1277-.LFBB40
.LM1277:
	movw r30,r16
	std Z+4,r13
.L629:
.LBB284:
.LBB285:
	.stabn	68,0,2577,.LM1278-.LFBB40
.LM1278:
	ldd r12,Y+41
	ldd r13,Y+42
	.stabn	68,0,2599,.LM1279-.LFBB40
.LM1279:
	adiw r28,63-60
	ldd r20,Y+60
	ldd r21,Y+61
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,63-60
	movw r24,r12
	call move_window
	movw r18,r24
	.stabn	68,0,2600,.LM1280-.LFBB40
.LM1280:
	or r24,r25
	brne .L622
	.stabn	68,0,2601,.LM1281-.LFBB40
.LM1281:
	ldi r24,lo8(-27)
	movw r30,r14
	st Z,r24
	.stabn	68,0,2602,.LM1282-.LFBB40
.LM1282:
	ldi r24,lo8(1)
	movw r30,r12
	std Z+4,r24
.LBE285:
.LBE284:
	.stabn	68,0,5228,.LM1283-.LFBB40
.LM1283:
	movw r24,r16
	call sync_fs
	movw r18,r24
.L622:
	.stabn	68,0,5237,.LM1284-.LFBB40
.LM1284:
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
.L626:
	.stabn	68,0,5206,.LM1285-.LFBB40
.LM1285:
	ori r24,lo8(32)
	rjmp .L634
	.size	f_rename, .-f_rename
	.stabs	"res:r(0,24)",64,0,0,18
	.stabs	"fs:(0,8)",128,0,0,113
	.stabs	"djo:(0,39)",128,0,0,41
	.stabs	"djn:(0,39)",128,0,0,1
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
	.stabn	68,0,6432,.LM1286-.LFBB41
.LM1286:
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
	.stabn	68,0,6535,.LM1287-.LFBB41
.LM1287:
	movw r10,r22
	ldi r24,1
	sub r10,r24
	sbc r11,__zero_reg__
	.stabn	68,0,6434,.LM1288-.LFBB41
.LM1288:
	movw r16,r14
	.stabn	68,0,6433,.LM1289-.LFBB41
.LM1289:
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L636:
	.stabn	68,0,6536,.LM1290-.LFBB41
.LM1290:
	cp r12,r10
	cpc r13,r11
	brge .L637
	.stabn	68,0,6537,.LM1291-.LFBB41
.LM1291:
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
	.stabn	68,0,6538,.LM1292-.LFBB41
.LM1292:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,1
	brne .L637
	.stabn	68,0,6539,.LM1293-.LFBB41
.LM1293:
	ldd r24,Y+1
	.stabn	68,0,6541,.LM1294-.LFBB41
.LM1294:
	movw r30,r16
	st Z+,r24
	movw r16,r30
	.stabn	68,0,6541,.LM1295-.LFBB41
.LM1295:
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	.stabn	68,0,6542,.LM1296-.LFBB41
.LM1296:
	cpi r24,lo8(10)
	brne .L636
.L637:
	.stabn	68,0,6546,.LM1297-.LFBB41
.LM1297:
	movw r30,r16
	st Z,__zero_reg__
	.stabn	68,0,6547,.LM1298-.LFBB41
.LM1298:
	or r12,r13
	brne .L639
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L639:
	.stabn	68,0,6548,.LM1299-.LFBB41
.LM1299:
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
	.stabn	68,0,6735,.LM1300-.LFBB42
.LM1300:
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
	.stabn	68,0,6725,.LM1301-.LFBB42
.LM1301:
	movw r30,r28
	adiw r30,3
	ldi r25,lo8(68)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r25
	brne 0b
	.stabn	68,0,6726,.LM1302-.LFBB42
.LM1302:
	std Y+2,r23
	std Y+1,r22
.LBE289:
.LBE288:
	.stabn	68,0,6740,.LM1303-.LFBB42
.LM1303:
	mov r22,r24
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6741,.LM1304-.LFBB42
.LM1304:
	movw r24,r28
	adiw r24,1
	call putc_flush
/* epilogue start */
	.stabn	68,0,6742,.LM1305-.LFBB42
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
	.stabn	68,0,6755,.LM1306-.LFBB43
.LM1306:
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
	.stabn	68,0,6725,.LM1307-.LFBB43
.LM1307:
	movw r30,r28
	adiw r30,3
	ldi r18,lo8(68)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r18
	brne 0b
	.stabn	68,0,6726,.LM1308-.LFBB43
.LM1308:
	std Y+2,r23
	std Y+1,r22
	movw r16,r24
.L643:
.LBE293:
.LBE292:
	.stabn	68,0,6760,.LM1309-.LFBB43
.LM1309:
	movw r30,r16
	ld r22,Z+
	movw r16,r30
	.stabn	68,0,6760,.LM1310-.LFBB43
.LM1310:
	movw r24,r28
	adiw r24,1
	.stabn	68,0,6760,.LM1311-.LFBB43
.LM1311:
	cpse r22,__zero_reg__
	rjmp .L644
	.stabn	68,0,6761,.LM1312-.LFBB43
.LM1312:
	call putc_flush
/* epilogue start */
	.stabn	68,0,6762,.LM1313-.LFBB43
.LM1313:
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
.L644:
	.stabn	68,0,6760,.LM1314-.LFBB43
.LM1314:
	call putc_bfd
	rjmp .L643
	.size	f_puts, .-f_puts
	.stabs	"pb:(0,49)",128,0,0,1
	.stabn	192,0,0,.LFBB43-.LFBB43
	.stabn	224,0,0,.Lscope43-.LFBB43
.Lscope43:
	.stabs	"f_printf:F(0,18)",36,0,0,f_printf
	.stabs	"long int:t(0,56)=r(0,56);-2147483648;2147483647;",128,0,0,0
	.stabs	"fp:p(0,42)",160,0,0,134
	.stabs	"fmt:p(0,23)",160,0,0,136
.global	f_printf
	.type	f_printf, @function
f_printf:
	.stabn	68,0,6899,.LM1315-.LFBB44
.LM1315:
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
	subi r28,lo8(-136)
	sbci r29,hi8(-136)
	ld r30,Y
	ldd r31,Y+1
	subi r28,lo8(136)
	sbci r29,hi8(136)
	.stabn	68,0,6911,.LM1316-.LFBB44
.LM1316:
	adiw r28,103-63
	std Y+63,__zero_reg__
	sbiw r28,103-63
.LBB296:
.LBB297:
	.stabn	68,0,6725,.LM1317-.LFBB44
.LM1317:
	movw r18,r28
	subi r18,-3
	sbci r19,-1
	ldi r24,lo8(68)
	movw r26,r18
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,6726,.LM1318-.LFBB44
.LM1318:
	subi r28,lo8(-134)
	sbci r29,hi8(-134)
	ld r24,Y
	ldd r25,Y+1
	subi r28,lo8(134)
	sbci r29,hi8(134)
	std Y+2,r25
	std Y+1,r24
.LBE297:
.LBE296:
	.stabn	68,0,6917,.LM1319-.LFBB44
.LM1319:
	movw r6,r28
	ldi r27,-118
	add r6,r27
	adc r7,__zero_reg__
	subi r18,-68
	sbci r19,-1
	adiw r28,104-62
	std Y+63,r19
	std Y+62,r18
	sbiw r28,104-62
.L646:
	.stabn	68,0,6920,.LM1320-.LFBB44
.LM1320:
	ld r22,Z
	.stabn	68,0,6921,.LM1321-.LFBB44
.LM1321:
	tst r22
	brne .+2
	rjmp .L647
	.stabn	68,0,6920,.LM1322-.LFBB44
.LM1322:
	movw r16,r30
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,6922,.LM1323-.LFBB44
.LM1323:
	cpi r22,lo8(37)
	breq .+2
	rjmp .L665
	.stabn	68,0,6927,.LM1324-.LFBB44
.LM1324:
	ldd r22,Z+1
	.stabn	68,0,6929,.LM1325-.LFBB44
.LM1325:
	movw r16,r30
	.stabn	68,0,6928,.LM1326-.LFBB44
.LM1326:
	cpi r22,lo8(48)
	brne .L650
	.stabn	68,0,6929,.LM1327-.LFBB44
.LM1327:
	subi r16,-3
	sbci r17,-1
	.stabn	68,0,6929,.LM1328-.LFBB44
.LM1328:
	ldi r19,lo8(48)
	adiw r28,110-63
	std Y+63,r19
	sbiw r28,110-63
	.stabn	68,0,6929,.LM1329-.LFBB44
.LM1329:
	ldd r22,Z+2
.L722:
	.stabn	68,0,6926,.LM1330-.LFBB44
.LM1330:
	mov r9,__zero_reg__
	mov r8,__zero_reg__
.L651:
	.stabn	68,0,6933,.LM1331-.LFBB44
.LM1331:
	cpi r22,lo8(42)
	breq .+2
	rjmp .L697
	.stabn	68,0,6934,.LM1332-.LFBB44
.LM1332:
	movw r26,r6
	.stabn	68,0,6934,.LM1333-.LFBB44
.LM1333:
	ld r30,X+
	ld r31,X+
	adiw r28,106-62
	std Y+63,r31
	std Y+62,r30
	sbiw r28,106-62
	.stabn	68,0,6935,.LM1334-.LFBB44
.LM1334:
	movw r30,r16
	.stabn	68,0,6935,.LM1335-.LFBB44
.LM1335:
	ld r22,Z+
	.stabn	68,0,6934,.LM1336-.LFBB44
.LM1336:
	movw r6,r26
	.stabn	68,0,6935,.LM1337-.LFBB44
.LM1337:
	movw r16,r30
.L654:
	.stabn	68,0,6926,.LM1338-.LFBB44
.LM1338:
	clr r14
	dec r14
	clr r15
	dec r15
	.stabn	68,0,6942,.LM1339-.LFBB44
.LM1339:
	cpi r22,lo8(46)
	breq .+2
	rjmp .L656
	.stabn	68,0,6943,.LM1340-.LFBB44
.LM1340:
	movw r30,r16
	ld r22,Z
	.stabn	68,0,6944,.LM1341-.LFBB44
.LM1341:
	cpi r22,lo8(42)
	brne .+2
	rjmp .L657
	.stabn	68,0,6943,.LM1342-.LFBB44
.LM1342:
	subi r16,-1
	sbci r17,-1
	.stabn	68,0,6948,.LM1343-.LFBB44
.LM1343:
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L658:
	.stabn	68,0,6949,.LM1344-.LFBB44
.LM1344:
	ldi r24,lo8(-48)
	add r24,r22
	cpi r24,lo8(10)
	brlo .+2
	rjmp .L656
	.stabn	68,0,6950,.LM1345-.LFBB44
.LM1345:
	ldi r27,lo8(10)
	mul r27,r14
	movw r24,r0
	mul r27,r15
	add r25,r0
	clr __zero_reg__
	.stabn	68,0,6950,.LM1346-.LFBB44
.LM1346:
	add r24,r22
	adc r25,__zero_reg__
	.stabn	68,0,6950,.LM1347-.LFBB44
.LM1347:
	movw r14,r24
	ldi r30,48
	sub r14,r30
	sbc r15,__zero_reg__
	.stabn	68,0,6951,.LM1348-.LFBB44
.LM1348:
	movw r30,r16
	.stabn	68,0,6951,.LM1349-.LFBB44
.LM1349:
	ld r22,Z+
	.stabn	68,0,6951,.LM1350-.LFBB44
.LM1350:
	movw r16,r30
	rjmp .L658
.L650:
	.stabn	68,0,6930,.LM1351-.LFBB44
.LM1351:
	cpi r22,lo8(45)
	breq .L652
	.stabn	68,0,6927,.LM1352-.LFBB44
.LM1352:
	subi r16,-2
	sbci r17,-1
	.stabn	68,0,6926,.LM1353-.LFBB44
.LM1353:
	ldi r20,lo8(32)
	adiw r28,110-63
	std Y+63,r20
	sbiw r28,110-63
	rjmp .L722
.L652:
	.stabn	68,0,6931,.LM1354-.LFBB44
.LM1354:
	subi r16,-3
	sbci r17,-1
	.stabn	68,0,6931,.LM1355-.LFBB44
.LM1355:
	ldd r22,Z+2
	.stabn	68,0,6926,.LM1356-.LFBB44
.LM1356:
	ldi r24,lo8(32)
	adiw r28,110-63
	std Y+63,r24
	sbiw r28,110-63
	.stabn	68,0,6931,.LM1357-.LFBB44
.LM1357:
	ldi r24,lo8(2)
	mov r8,r24
	mov r9,__zero_reg__
	rjmp .L651
.L655:
	.stabn	68,0,6938,.LM1358-.LFBB44
.LM1358:
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
	.stabn	68,0,6938,.LM1359-.LFBB44
.LM1359:
	add r24,r22
	adc r25,__zero_reg__
	.stabn	68,0,6938,.LM1360-.LFBB44
.LM1360:
	movw r26,r24
	sbiw r26,48
	adiw r28,106-62
	std Y+63,r27
	std Y+62,r26
	sbiw r28,106-62
	.stabn	68,0,6939,.LM1361-.LFBB44
.LM1361:
	movw r30,r16
	.stabn	68,0,6939,.LM1362-.LFBB44
.LM1362:
	ld r22,Z+
	.stabn	68,0,6939,.LM1363-.LFBB44
.LM1363:
	movw r16,r30
.L653:
	.stabn	68,0,6937,.LM1364-.LFBB44
.LM1364:
	ldi r24,lo8(-48)
	add r24,r22
	cpi r24,lo8(10)
	brlo .L655
	rjmp .L654
.L697:
	.stabn	68,0,6926,.LM1365-.LFBB44
.LM1365:
	adiw r28,106-63
	std Y+63,__zero_reg__
	sbiw r28,106-63
	adiw r28,107-63
	std Y+63,__zero_reg__
	sbiw r28,107-63
	rjmp .L653
.L657:
	.stabn	68,0,6945,.LM1366-.LFBB44
.LM1366:
	movw r30,r6
	ld r14,Z+
	ld r15,Z+
	.stabn	68,0,6946,.LM1367-.LFBB44
.LM1367:
	movw r26,r16
	adiw r26,1
	ld r22,X
	.stabn	68,0,6945,.LM1368-.LFBB44
.LM1368:
	movw r6,r30
	.stabn	68,0,6946,.LM1369-.LFBB44
.LM1369:
	subi r16,-2
	sbci r17,-1
.L656:
	.stabn	68,0,6955,.LM1370-.LFBB44
.LM1370:
	cpi r22,lo8(108)
	brne .L660
	.stabn	68,0,6956,.LM1371-.LFBB44
.LM1371:
	set
	bld r8,2
	.stabn	68,0,6956,.LM1372-.LFBB44
.LM1372:
	movw r30,r16
	.stabn	68,0,6956,.LM1373-.LFBB44
.LM1373:
	ld r22,Z+
	.stabn	68,0,6956,.LM1374-.LFBB44
.LM1374:
	movw r16,r30
.L660:
	.stabn	68,0,6963,.LM1375-.LFBB44
.LM1375:
	tst r22
	brne .+2
	rjmp .L647
	.stabn	68,0,6964,.LM1376-.LFBB44
.LM1376:
	cpi r22,lo8(111)
	brne .+2
	rjmp .L699
	brsh .L662
	cpi r22,lo8(99)
	brne .+2
	rjmp .L663
	brsh .L664
	cpi r22,lo8(88)
	brne .+2
	rjmp .L704
	.stabn	68,0,6966,.LM1377-.LFBB44
.LM1377:
	ldi r24,lo8(2)
	.stabn	68,0,6964,.LM1378-.LFBB44
.LM1378:
	cpi r22,lo8(98)
	brne .+2
	rjmp .L723
.L665:
	.stabn	68,0,7003,.LM1379-.LFBB44
.LM1379:
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,7003,.LM1380-.LFBB44
.LM1380:
	rjmp .L649
.L664:
	.stabn	68,0,6964,.LM1381-.LFBB44
.LM1381:
	cpi r22,lo8(100)
	brne .L665
.L703:
	ldi r24,lo8(10)
	rjmp .L723
.L662:
	cpi r22,lo8(117)
	breq .L703
	cpi r22,lo8(120)
	brne .+2
	rjmp .L704
	cpi r22,lo8(115)
	brne .L665
	.stabn	68,0,6984,.LM1382-.LFBB44
.LM1382:
	movw r30,r6
	ld r10,Z
	ldd r11,Z+1
	ldi r27,2
	add r6,r27
	adc r7,__zero_reg__
	.stabn	68,0,6985,.LM1383-.LFBB44
.LM1383:
	cp r10,__zero_reg__
	cpc r11,__zero_reg__
	brne .L667
	.stabn	68,0,6985,.LM1384-.LFBB44
.LM1384:
	movw r10,r28
	ldi r30,103
	add r10,r30
	adc r11,__zero_reg__
.L667:
	movw r30,r10
	.stabn	68,0,6986,.LM1385-.LFBB44
.LM1385:
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L668:
	.stabn	68,0,6986,.LM1386-.LFBB44
.LM1386:
	ld r24,Z+
	.stabn	68,0,6986,.LM1387-.LFBB44
.LM1387:
	cpse r24,__zero_reg__
	rjmp .L669
	.stabn	68,0,6987,.LM1388-.LFBB44
.LM1388:
	sbrc r15,7
	rjmp .L670
	cp r14,r12
	cpc r15,r13
	brsh .L670
	movw r12,r14
.L670:
	.stabn	68,0,6988,.LM1389-.LFBB44
.LM1389:
	ldi r19,2
	and r8,r19
	clr r9
.L672:
	.stabn	68,0,6988,.LM1390-.LFBB44
.LM1390:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	breq .L673
.L676:
	add r14,r10
	adc r15,r11
.L674:
	.stabn	68,0,6989,.LM1391-.LFBB44
.LM1391:
	movw r26,r10
	ld r22,X
	.stabn	68,0,6989,.LM1392-.LFBB44
.LM1392:
	tst r22
	breq .L679
	.stabn	68,0,6989,.LM1393-.LFBB44
.LM1393:
	cp r10,r14
	cpc r11,r15
	brne .L678
.L679:
	.stabn	68,0,6990,.LM1394-.LFBB44
.LM1394:
	adiw r28,106-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,106-62
	cp r12,r30
	cpc r13,r31
	brsh .L649
	.stabn	68,0,6990,.LM1395-.LFBB44
.LM1395:
	ldi r22,lo8(32)
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r27,-1
	sub r12,r27
	sbc r13,r27
	rjmp .L679
.L663:
	.stabn	68,0,6980,.LM1396-.LFBB44
.LM1396:
	movw r14,r6
	ldi r31,2
	add r14,r31
	adc r15,__zero_reg__
	.stabn	68,0,6980,.LM1397-.LFBB44
.LM1397:
	movw r26,r6
	ld r22,X
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,6980,.LM1398-.LFBB44
.LM1398:
	movw r6,r14
.L649:
	movw r30,r16
	rjmp .L646
.L669:
	.stabn	68,0,6986,.LM1399-.LFBB44
.LM1399:
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	rjmp .L668
.L673:
	.stabn	68,0,6988,.LM1400-.LFBB44
.LM1400:
	adiw r28,106-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,106-62
	cp r12,r24
	cpc r13,r25
	brsh .L676
	.stabn	68,0,6988,.LM1401-.LFBB44
.LM1401:
	adiw r28,110-63
	ldd r22,Y+63
	sbiw r28,110-63
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r20,-1
	sub r12,r20
	sbc r13,r20
	rjmp .L672
.L678:
	.stabn	68,0,6989,.LM1402-.LFBB44
.LM1402:
	ldi r25,-1
	sub r10,r25
	sbc r11,r25
	.stabn	68,0,6989,.LM1403-.LFBB44
.LM1403:
	movw r24,r28
	adiw r24,1
	call putc_bfd
	rjmp .L674
.L699:
	.stabn	68,0,6969,.LM1404-.LFBB44
.LM1404:
	ldi r24,lo8(8)
.L723:
	.stabn	68,0,6977,.LM1405-.LFBB44
.LM1405:
	ldi r25,0
	.stabn	68,0,6980,.LM1406-.LFBB44
.LM1406:
	movw r30,r6
	.stabn	68,0,7019,.LM1407-.LFBB44
.LM1407:
	sbrs r8,2
	rjmp .L681
	.stabn	68,0,7020,.LM1408-.LFBB44
.LM1408:
	ldi r18,4
	add r6,r18
	adc r7,__zero_reg__
	.stabn	68,0,7020,.LM1409-.LFBB44
.LM1409:
	ld r2,Z
	ldd r3,Z+1
	ldd r4,Z+2
	ldd r5,Z+3
	.stabn	68,0,7024,.LM1410-.LFBB44
.LM1410:
	cpi r22,lo8(100)
	brne .L683
.L682:
	.stabn	68,0,7024,.LM1411-.LFBB44
.LM1411:
	sbrs r5,7
	rjmp .L685
	.stabn	68,0,7025,.LM1412-.LFBB44
.LM1412:
	com r5
	com r4
	com r3
	com r2
	adc r2,__zero_reg__
	adc r3,__zero_reg__
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	.stabn	68,0,7025,.LM1413-.LFBB44
.LM1413:
	set
	bld r8,0
.L685:
	ldi r26,lo8(7)
	adiw r28,113-63
	std Y+63,r26
	sbiw r28,113-63
	rjmp .L686
.L704:
	.stabn	68,0,6977,.LM1414-.LFBB44
.LM1414:
	ldi r24,lo8(16)
	rjmp .L723
.L681:
	.stabn	68,0,6980,.LM1415-.LFBB44
.LM1415:
	ldi r19,2
	add r6,r19
	adc r7,__zero_reg__
	.stabn	68,0,7022,.LM1416-.LFBB44
.LM1416:
	ld r2,Z
	ldd r3,Z+1
	mov r5,__zero_reg__
	mov r4,__zero_reg__
	cpi r22,lo8(100)
	brne .L683
	mov __tmp_reg__,r3
	lsl r0
	sbc r4,r4
	sbc r5,r5
	rjmp .L682
.L683:
	cpi r22,lo8(120)
	brne .L685
	ldi r20,lo8(39)
	adiw r28,113-63
	std Y+63,r20
	sbiw r28,113-63
.L686:
	.stabn	68,0,6977,.LM1417-.LFBB44
.LM1417:
	movw r30,r28
	subi r30,-71
	sbci r31,-1
	adiw r28,111-62
	std Y+63,r31
	std Y+62,r30
	sbiw r28,111-62
	.stabn	68,0,7028,.LM1418-.LFBB44
.LM1418:
	adiw r28,108-63
	std Y+63,__zero_reg__
	sbiw r28,108-63
	adiw r28,109-63
	std Y+63,__zero_reg__
	sbiw r28,109-63
	.stabn	68,0,7030,.LM1419-.LFBB44
.LM1419:
	movw r10,r24
	mov r13,__zero_reg__
	mov r12,__zero_reg__
.L689:
	movw r24,r4
	movw r22,r2
	movw r20,r12
	movw r18,r10
	call __udivmodsi4
	mov r23,r18
	mov r30,r19
	mov r31,r20
	mov r25,r21
	.stabn	68,0,7030,.LM1420-.LFBB44
.LM1420:
	mov r24,r22
	movw r20,r4
	movw r18,r2
	.stabn	68,0,7030,.LM1421-.LFBB44
.LM1421:
	mov r2,r23
	mov r3,r30
	mov r4,r31
	mov r5,r25
	.stabn	68,0,7031,.LM1422-.LFBB44
.LM1422:
	cpi r22,lo8(10)
	brlo .L687
	.stabn	68,0,7031,.LM1423-.LFBB44
.LM1423:
	adiw r28,113-63
	ldd r24,Y+63
	sbiw r28,113-63
	add r24,r22
.L687:
	.stabn	68,0,7032,.LM1424-.LFBB44
.LM1424:
	adiw r28,108-62
	ldd r14,Y+62
	ldd r15,Y+63
	sbiw r28,108-62
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	.stabn	68,0,7032,.LM1425-.LFBB44
.LM1425:
	subi r24,lo8(-(48))
	.stabn	68,0,7032,.LM1426-.LFBB44
.LM1426:
	adiw r28,111-62
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,111-62
	st X+,r24
	adiw r28,111-62
	std Y+63,r27
	std Y+62,r26
	sbiw r28,111-62
	.stabn	68,0,7033,.LM1427-.LFBB44
.LM1427:
	cp r18,r10
	cpc r19,r11
	cpc r20,r12
	cpc r21,r13
	brlo .L688
	.stabn	68,0,7033,.LM1428-.LFBB44
.LM1428:
	ldi r27,32
	cp r14,r27
	cpc r15,__zero_reg__
	breq .+2
	rjmp .L705
	ldi r30,lo8(31)
	adiw r28,108-63
	std Y+63,r30
	sbiw r28,108-63
	adiw r28,109-63
	std Y+63,__zero_reg__
	sbiw r28,109-63
.L688:
	.stabn	68,0,7034,.LM1429-.LFBB44
.LM1429:
	sbrs r8,0
	rjmp .L690
	.stabn	68,0,7034,.LM1430-.LFBB44
.LM1430:
	ldi r30,lo8(71)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r14
	adc r31,r15
	ldi r18,lo8(45)
	st Z,r18
	.stabn	68,0,7034,.LM1431-.LFBB44
.LM1431:
	adiw r28,108-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,108-62
	adiw r24,2
	movw r14,r24
.L690:
	.stabn	68,0,7036,.LM1432-.LFBB44
.LM1432:
	movw r12,r14
	.stabn	68,0,7036,.LM1433-.LFBB44
.LM1433:
	ldi r25,2
	and r8,r25
	clr r9
.L691:
	.stabn	68,0,7036,.LM1434-.LFBB44
.LM1434:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L692
	.stabn	68,0,7036,.LM1435-.LFBB44
.LM1435:
	adiw r28,106-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,106-62
	cp r12,r30
	cpc r13,r31
	brlo .L693
.L692:
	ldi r18,lo8(71)
	ldi r19,0
	add r18,r28
	adc r19,r29
	add r14,r18
	adc r15,r19
.L694:
	.stabn	68,0,7040,.LM1436-.LFBB44
.LM1436:
	movw r26,r14
	ld r22,-X
	movw r14,r26
	movw r24,r28
	adiw r24,1
	call putc_bfd
	.stabn	68,0,7041,.LM1437-.LFBB44
.LM1437:
	adiw r28,104-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,104-62
	cp r14,r30
	cpc r15,r31
	brne .L694
.L695:
	.stabn	68,0,7042,.LM1438-.LFBB44
.LM1438:
	adiw r28,106-62
	ldd r18,Y+62
	ldd r19,Y+63
	sbiw r28,106-62
	cp r12,r18
	cpc r13,r19
	brlo .+2
	rjmp .L649
	.stabn	68,0,7043,.LM1439-.LFBB44
.LM1439:
	ldi r22,lo8(32)
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	rjmp .L695
.L705:
	adiw r28,108-62
	std Y+63,r15
	std Y+62,r14
	sbiw r28,108-62
	rjmp .L689
.L693:
	.stabn	68,0,7037,.LM1440-.LFBB44
.LM1440:
	adiw r28,110-63
	ldd r22,Y+63
	sbiw r28,110-63
	movw r24,r28
	adiw r24,1
	call putc_bfd
	ldi r26,-1
	sub r12,r26
	sbc r13,r26
	rjmp .L691
.L647:
	.stabn	68,0,7049,.LM1441-.LFBB44
.LM1441:
	movw r24,r28
	adiw r24,1
	call putc_flush
/* epilogue start */
	.stabn	68,0,7050,.LM1442-.LFBB44
.LM1442:
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
	.stabs	"tp:r(0,54)",64,0,0,10
	.stabs	"pad:(0,20)",128,0,0,110
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
	.ascii	"\200\232EA\216A\217\200EEEIII\216\217\220\222\222O\231OUUY\231"
	.ascii	"\232\233\234\235\236\237AIOU\245\245\246\247\250\251\252\253"
	.ascii	"\254\255\256\257\260\261\262\263\264\265\266\267\270\271\272"
	.ascii	"\273\274\275\276\277\300\301\302\303\304\305\306\307\310\311"
	.ascii	"\312\313\314\315\316\317\320\321\322\323\324\325\326\327\330"
	.ascii	"\331\332\333\334\335\336\337\340\341\342\343\344\345\346\347"
	.ascii	"\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366"
	.ascii	"\367\370\371\372\373\374\375\376\377"
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
