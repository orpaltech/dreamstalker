	.file	"vs10xx.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs10xx.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs_patch_rom_data_next_instr:f(0,1)=(0,2)=xee_vs_patch_nir:",36,0,0,vs_patch_rom_data_next_instr
	.stabs	"uint8_t:t(0,3)=(0,4)=r(0,4);0;255;",128,0,0,0
	.stabs	"uint16_t:t(0,5)=(0,6)=r(0,6);0;65535;",128,0,0,0
	.stabs	"uint32_t:t(0,7)=(0,8)=r(0,8);0;4294967295;",128,0,0,0
	.stabs	"e_vs_patch_nir:T(0,2)=eVS_PNIR_ERR:0,VS_PNIR_OK:1,VS_PNIR_SKIP:2,VS_PNIR_EOP:3,;",128,0,0,0
	.stabs	"unsigned char:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,6)",128,0,0,0
	.stabs	"long unsigned int:t(0,8)",128,0,0,0
	.stabs	"patch:P(0,9)=(0,10)=*(0,11)=xss_vs_patch:",64,0,0,26
	.stabs	"instr:P(0,12)=(0,13)=*(0,14)=xss_vs_sci_instr:",64,0,0,28
	.stabs	"pvs_patch_t:t(0,9)",128,0,0,0
	.stabs	"s_vs_patch:T(0,11)=s9user_data:(0,15)=*(0,16)=(0,16),0,16;user_val:(0,5),16,16;next_instr:(0,17)=(0,18)=*(0,19)=f(0,1),32,16;act:(0,20)=(0,21)=xss_vs_patch_activation:,48,24;;",128,0,0,0
	.stabs	"pvs_sci_instr_t:t(0,12)",128,0,0,0
	.stabs	"s_vs_sci_instr:T(0,14)=s3reg:(0,3),0,8;data:(0,5),8,16;;",128,0,0,0
	.stabs	"void:t(0,16)",128,0,0,0
	.stabs	"pfnvs_patch_next_instr:t(0,17)",128,0,0,0
	.stabs	"s_vs_patch_activation:T(0,21)=s3instr:(0,22)=*(0,23)=(0,14),0,16;num_instr:(0,3),16,8;;",128,0,0,0
	.type	vs_patch_rom_data_next_instr, @function
vs_patch_rom_data_next_instr:
	.stabn	68,0,314,.LM0-.LFBB1
.LM0:
.LFBB1:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	movw r28,r22
	.stabn	68,0,315,.LM1-.LFBB1
.LM1:
	ld r24,X+
	ld r25,X
	sbiw r26,1
.LBB30:
	.stabn	68,0,317,.LM2-.LFBB1
.LM2:
	movw r20,r24
	mov __tmp_reg__,r25
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  317 "src/sound/vs10xx.c" 1
	out 59, r22
	movw r30, r20
	elpm r18, Z+
	elpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE30:
	.stabn	68,0,319,.LM3-.LFBB1
.LM3:
	adiw r26,2
	ld r20,X+
	ld r21,X
	sbiw r26,2+1
	.stabn	68,0,319,.LM4-.LFBB1
.LM4:
	cp r20,r18
	cpc r21,r19
	brsh .L3
	.stabn	68,0,322,.LM5-.LFBB1
.LM5:
	movw r18,r20
	subi r18,-1
	sbci r19,-1
	adiw r26,2+1
	st X,r19
	st -X,r18
	sbiw r26,2
	movw r18,r20
	lsl r18
	rol r19
	add r18,r20
	adc r19,r21
.LBB31:
	.stabn	68,0,324,.LM6-.LFBB1
.LM6:
	movw r20,r18
	subi r20,-2
	sbci r21,-1
	add r20,r24
	adc r21,r25
	mov __tmp_reg__,r21
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  324 "src/sound/vs10xx.c" 1
	out 59, r22
	movw r30, r20
	elpm r20, Z+
	
 ;  0 "" 2
/* #NOAPP */
.LBE31:
	.stabn	68,0,324,.LM7-.LFBB1
.LM7:
	st Y,r20
.LBB32:
	.stabn	68,0,325,.LM8-.LFBB1
.LM8:
	subi r18,-3
	sbci r19,-1
	add r24,r18
	adc r25,r19
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  325 "src/sound/vs10xx.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE32:
	.stabn	68,0,325,.LM9-.LFBB1
.LM9:
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,327,.LM10-.LFBB1
.LM10:
	ldi r24,lo8(1)
	ldi r25,0
.L1:
/* epilogue start */
	.stabn	68,0,328,.LM11-.LFBB1
.LM11:
	pop r29
	pop r28
	ret
.L3:
	.stabn	68,0,320,.LM12-.LFBB1
.LM12:
	ldi r24,lo8(3)
	ldi r25,0
	rjmp .L1
	.size	vs_patch_rom_data_next_instr, .-vs_patch_rom_data_next_instr
	.stabs	"data:r(0,24)=*(0,25)=(0,26)=xss_vs_patch_data:",64,0,0,24
	.stabs	"s_vs_patch_data:T(0,26)=s5count:(0,5),0,16;instr:(0,27)=ar(0,28)=r(0,28);0;65535;;0;0;(0,23),16,24;;",128,0,0,0
	.stabs	"vs_patch_data_t:t(0,25)",128,0,0,0
	.stabn	192,0,0,.LFBB1-.LFBB1
	.stabn	224,0,0,.Lscope1-.LFBB1
.Lscope1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%*s %x %x %x"
	.text
	.stabs	"vs_patch_file_next_instr:f(0,1)",36,0,0,vs_patch_file_next_instr
	.stabs	"int:t(0,29)=r(0,29);-32768;32767;",128,0,0,0
	.stabs	"patch:P(0,30)=*(0,31)=(0,11)",64,0,0,24
	.stabs	"instr:P(0,22)",64,0,0,6
	.type	vs_patch_file_next_instr, @function
vs_patch_file_next_instr:
	.stabn	68,0,247,.LM13-.LFBB2
.LM13:
.LFBB2:
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
	subi r28,106
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 106 */
/* stack size = 120 */
.L__stack_usage = 120
	movw r6,r22
	.stabn	68,0,248,.LM14-.LFBB2
.LM14:
	movw r26,r24
	ld r16,X+
	ld r17,X
	.stabn	68,0,251,.LM15-.LFBB2
.LM15:
	movw r30,r16
	ld r24,Z
	sbrc r24,7
	rjmp .L5
	.stabn	68,0,253,.LM16-.LFBB2
.LM16:
	ldd r20,Z+1
	ldd r21,Z+2
	ldi r22,lo8(100)
	ldi r23,0
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r8,r18
	movw r24,r18
	call f_gets
	.stabn	68,0,253,.LM17-.LFBB2
.LM17:
	or r24,r25
	brne .+2
	rjmp .L6
	.stabn	68,0,255,.LM18-.LFBB2
.LM18:
	ldi r22,lo8(35)
	ldi r23,0
	movw r24,r8
	call strchr
	.stabn	68,0,255,.LM19-.LFBB2
.LM19:
	or r24,r25
	breq .+2
	rjmp .L11
.LBB35:
.LBB36:
	.stabn	68,0,234,.LM20-.LFBB2
.LM20:
	movw r14,r28
	ldi r19,101
	add r14,r19
	adc r15,__zero_reg__
	push r15
	push r14
	movw r12,r28
	ldi r24,103
	add r12,r24
	adc r13,__zero_reg__
	push r13
	push r12
	movw r10,r28
	ldi r25,105
	add r10,r25
	adc r11,__zero_reg__
	push r11
	push r10
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r9
	push r8
	call sscanf
	.stabn	68,0,234,.LM21-.LFBB2
.LM21:
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	sbiw r24,3
	breq .L8
.L12:
.LBE36:
.LBE35:
	.stabn	68,0,264,.LM22-.LFBB2
.LM22:
	ldi r25,0
	ldi r24,0
	rjmp .L4
.L8:
.LBB38:
.LBB37:
	.stabn	68,0,235,.LM23-.LFBB2
.LM23:
	movw r30,r10
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,2
	brne .L12
	.stabn	68,0,236,.LM24-.LFBB2
.LM24:
	movw r26,r12
	ld r24,X
	movw r30,r6
	st Z,r24
	.stabn	68,0,237,.LM25-.LFBB2
.LM25:
	movw r26,r14
	ld r24,X+
	ld r25,X
	std Z+2,r25
	std Z+1,r24
.L10:
.LBE37:
.LBE38:
	.stabn	68,0,267,.LM26-.LFBB2
.LM26:
	movw r26,r16
	ld r24,X
	sbrs r24,7
	rjmp .L13
.L5:
	.stabn	68,0,268,.LM27-.LFBB2
.LM27:
	ldi r24,lo8(3)
	ldi r25,0
.L4:
/* epilogue start */
	.stabn	68,0,271,.LM28-.LFBB2
.LM28:
	subi r28,-106
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
	ret
.L6:
	.stabn	68,0,261,.LM29-.LFBB2
.LM29:
	movw r26,r16
	adiw r26,1
	ld r30,X+
	ld r31,X
	.stabn	68,0,261,.LM30-.LFBB2
.LM30:
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
	brne .L12
	.stabn	68,0,262,.LM31-.LFBB2
.LM31:
	movw r30,r16
	ld r24,Z
	ori r24,lo8(-128)
	st Z,r24
	rjmp .L10
.L11:
	.stabn	68,0,256,.LM32-.LFBB2
.LM32:
	ldi r24,lo8(2)
	ldi r25,0
	rjmp .L4
.L13:
	.stabn	68,0,270,.LM33-.LFBB2
.LM33:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L4
	.size	vs_patch_file_next_instr, .-vs_patch_file_next_instr
	.stabs	"pfd:r(0,32)=*(0,33)=(0,34)=xss_vs_patch_file:",64,0,0,16
	.stabs	"s_vs_patch_file:T(0,34)=s3flags:(0,3),0,8;fp:(0,35)=*(0,36)=(0,37)=s34obj:(0,38)=(0,39)=s14fs:(0,40)=*(0,41)=(0,42)=s560fs_type:(0,43)=(0,4),0,8;pdrv:(0,43),8,8;ldrv:(0,43),16,8;n_fats:(0,43),24,8;wflag:(0,43),32,8;fsi_flag:(0,43),40,8;id:(0,44)=(0,5),48,16;n_rootdir:(0,44),64,16;csize:(0,44),80,16;last_clst:(0,45)=(0,7),96,32;free_clst:(0,45),128,32;n_fatent:(0,45),160,32;fsize:(0,45),192,32;volbase:(0,46)=(0,45),224,32;fatbase:(0,46),256,32;dirbase:(0,46),288,32;database:(0,46),320,32;winsect:(0,46),352,32;win:(0,47)=ar(0,28);0;511;(0,43),384,4096;;,0,16;id:(0,44),16,16;attr:(0,43),32,8;stat:(0,43),40,8;sclust:(0,45),48,32;objsize:(0,48)=(0,45),80,32;;,0,112;flag:(0,43),112,8;err:(0,43),120,8;fptr:(0,48),128,32;clust:(0,45),160,32;sect:(0,46),192,32;dir_sect:(0,46),224,32;dir_ptr:(0,49)=*(0,43),256,16;;,8,16;;",128,0,0,0
	.stabs	"vs_patch_file_t:t(0,33)",128,0,0,0
	.stabs	"BYTE:t(0,43)",128,0,0,0
	.stabs	"WORD:t(0,44)",128,0,0,0
	.stabs	"DWORD:t(0,45)",128,0,0,0
	.stabs	"LBA_t:t(0,46)",128,0,0,0
	.stabs	"FSIZE_t:t(0,48)",128,0,0,0
	.stabs	"line:(0,50)=ar(0,28);0;99;(0,51)=r(0,51);0;255;",128,0,0,1
	.stabs	"char:t(0,51)",128,0,0,0
	.stabn	192,0,0,.LFBB2-.LFBB2
	.stabs	"op:(0,29)",128,0,0,105
	.stabs	"reg:(0,29)",128,0,0,103
	.stabs	"val:(0,29)",128,0,0,101
	.stabn	192,0,0,.LBB36-.LFBB2
	.stabn	224,0,0,.LBE36-.LFBB2
	.stabs	"op:(0,29)",128,0,0,105
	.stabs	"reg:(0,29)",128,0,0,103
	.stabs	"val:(0,29)",128,0,0,101
	.stabn	192,0,0,.LBB37-.LFBB2
	.stabn	224,0,0,.LBE37-.LFBB2
	.stabn	224,0,0,.Lscope2-.LFBB2
.Lscope2:
	.stabs	"vs_patch_rom:F(0,52)=*(0,53)=(0,54)=xss_vs_patch_rom:",36,0,0,vs_patch_rom
	.stabs	"e_vs_hw_spec:T(0,55)=eVS_HWS_UNKNOWN:0,VS_HWS_1002:2,VS_HWS_1003:3,VS_HWS_1053:53,;",128,0,0,0
	.stabs	"s_vs_patch_rom:T(0,54)=s9revision:(0,5),0,16;patch_count:(0,5),16,16;patch_data:(0,56)=ar(0,28);0;0;(0,25),32,40;;",128,0,0,0
.global	vs_patch_rom
	.type	vs_patch_rom, @function
vs_patch_rom:
	.stabn	68,0,50,.LM34-.LFBB3
.LM34:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB39:
.LBB40:
	.stabn	68,0,168,.LM35-.LFBB3
.LM35:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE40:
.LBE39:
	.stabn	68,0,51,.LM36-.LFBB3
.LM36:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L15
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L16
	sbiw r24,2
	brne .L17
	.stabn	68,0,53,.LM37-.LFBB3
.LM37:
	jmp vs1002_patch_rom
.L15:
	.stabn	68,0,56,.LM38-.LFBB3
.LM38:
	jmp vs1003_patch_rom
.L16:
	.stabn	68,0,59,.LM39-.LFBB3
.LM39:
	jmp vs1053_patch_rom
.L17:
	.stabn	68,0,66,.LM40-.LFBB3
.LM40:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	vs_patch_rom, .-vs_patch_rom
.Lscope3:
	.stabs	"vs_patch_rom_get_data:F(0,24)",36,0,0,vs_patch_rom_get_data
	.stabs	"pos:P(0,3)",64,0,0,28
.global	vs_patch_rom_get_data
	.type	vs_patch_rom_get_data, @function
vs_patch_rom_get_data:
	.stabn	68,0,69,.LM41-.LFBB4
.LM41:
.LFBB4:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.stabn	68,0,72,.LM42-.LFBB4
.LM42:
	call vs_patch_rom
.LBB41:
	.stabn	68,0,73,.LM43-.LFBB4
.LM43:
	movw r20,r24
	subi r20,-2
	sbci r21,-1
	mov __tmp_reg__,r21
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  73 "src/sound/vs10xx.c" 1
	out 59, r22
	movw r30, r20
	elpm r20, Z+
	elpm r21, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE41:
	.stabn	68,0,79,.LM44-.LFBB4
.LM44:
	adiw r24,4
	.stabn	68,0,81,.LM45-.LFBB4
.LM45:
	ldi r26,0
	.stabn	68,0,76,.LM46-.LFBB4
.LM46:
	cp r28,r20
	cpc __zero_reg__,r21
	breq .L20
	brlt .L20
	.stabn	68,0,77,.LM47-.LFBB4
.LM47:
	ldi r25,0
	ldi r24,0
	rjmp .L18
.L21:
.LBB42:
	.stabn	68,0,82,.LM48-.LFBB4
.LM48:
	movw r20,r24
	mov __tmp_reg__,r25
	lsl r0
	sbc r22,r22
	sbc r23,r23
/* #APP */
 ;  82 "src/sound/vs10xx.c" 1
	out 59, r22
	movw r30, r20
	elpm r20, Z+
	elpm r21, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE42:
	.stabn	68,0,83,.LM49-.LFBB4
.LM49:
	subi r20,1
	sbc r21,__zero_reg__
	.stabn	68,0,83,.LM50-.LFBB4
.LM50:
	movw r18,r20
	lsl r18
	rol r19
	add r18,r20
	adc r19,r21
	.stabn	68,0,83,.LM51-.LFBB4
.LM51:
	subi r18,-5
	sbci r19,-1
	.stabn	68,0,83,.LM52-.LFBB4
.LM52:
	add r24,r18
	adc r25,r19
	.stabn	68,0,81,.LM53-.LFBB4
.LM53:
	subi r26,lo8(-(1))
.L20:
	.stabn	68,0,81,.LM54-.LFBB4
.LM54:
	cpse r26,r28
	rjmp .L21
.L18:
/* epilogue start */
	.stabn	68,0,86,.LM55-.LFBB4
.LM55:
	pop r28
	ret
	.size	vs_patch_rom_get_data, .-vs_patch_rom_get_data
	.stabs	"i:r(0,3)",64,0,0,26
	.stabs	"buff:r(0,57)=*(0,3)",64,0,0,24
	.stabs	"rom:r(0,52)",64,0,0,18
	.stabs	"vs_patch_rom_t:t(0,53)",128,0,0,0
	.stabn	192,0,0,.LFBB4-.LFBB4
	.stabn	224,0,0,.Lscope4-.LFBB4
.Lscope4:
	.stabs	"vs_wait_for_dreq:F(0,16)",36,0,0,vs_wait_for_dreq
.global	vs_wait_for_dreq
	.type	vs_wait_for_dreq, @function
vs_wait_for_dreq:
	.stabn	68,0,93,.LM56-.LFBB5
.LM56:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L24:
	.stabn	68,0,94,.LM57-.LFBB5
.LM57:
	sbis 0x16,4
	rjmp .L24
/* epilogue start */
	.stabn	68,0,95,.LM58-.LFBB5
.LM58:
	ret
	.size	vs_wait_for_dreq, .-vs_wait_for_dreq
.Lscope5:
	.stabs	"vs_is_dreq:F(0,58)=eFalse:0,True:1,;",36,0,0,vs_is_dreq
	.stabs	"_Bool:t(0,58)",128,0,0,0
.global	vs_is_dreq
	.type	vs_is_dreq, @function
vs_is_dreq:
	.stabn	68,0,98,.LM59-.LFBB6
.LM59:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,99,.LM60-.LFBB6
.LM60:
	in r24,0x16
	.stabn	68,0,100,.LM61-.LFBB6
.LM61:
	swap r24
	andi r24,1
/* epilogue start */
	ret
	.size	vs_is_dreq, .-vs_is_dreq
.Lscope6:
	.stabs	"vs_hw_spec:F(0,59)=(0,55)",36,0,0,vs_hw_spec
.global	vs_hw_spec
	.type	vs_hw_spec, @function
vs_hw_spec:
	.stabn	68,0,167,.LM62-.LFBB7
.LM62:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,169,.LM63-.LFBB7
.LM63:
	lds r24,vs_hws
	lds r25,vs_hws+1
/* epilogue start */
	ret
	.size	vs_hw_spec, .-vs_hw_spec
.Lscope7:
	.stabs	"vs_process_patches:F(0,58)",36,0,0,vs_process_patches
.global	vs_process_patches
	.type	vs_process_patches, @function
vs_process_patches:
	.stabn	68,0,172,.LM64-.LFBB8
.LM64:
.LFBB8:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,173,.LM65-.LFBB8
.LM65:
	call vs_patch_rom
.LBB43:
	.stabn	68,0,177,.LM66-.LFBB8
.LM66:
	mov __tmp_reg__,r25
	lsl r0
	sbc r26,r26
	sbc r27,r27
/* #APP */
 ;  177 "src/sound/vs10xx.c" 1
	out 59, r26
	movw r30, r24
	elpm r24, Z+
	elpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE43:
	.stabn	68,0,178,.LM67-.LFBB8
.LM67:
	cpi r24,-127
	sbci r25,-120
	brne .L33
.LBB44:
.LBB45:
	.stabn	68,0,168,.LM68-.LFBB8
.LM68:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE45:
.LBE44:
	.stabn	68,0,181,.LM69-.LFBB8
.LM69:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L31
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L32
	sbiw r24,2
	brne .L34
	.stabn	68,0,183,.LM70-.LFBB8
.LM70:
	jmp vs1002_process_patches
.L31:
	.stabn	68,0,187,.LM71-.LFBB8
.LM71:
	jmp vs1003_process_patches
.L32:
	.stabn	68,0,191,.LM72-.LFBB8
.LM72:
	jmp vs1053_process_patches
.L33:
	.stabn	68,0,179,.LM73-.LFBB8
.LM73:
	ldi r24,0
	ret
.L34:
	.stabn	68,0,181,.LM74-.LFBB8
.LM74:
	ldi r24,lo8(1)
/* epilogue start */
	.stabn	68,0,199,.LM75-.LFBB8
.LM75:
	ret
	.size	vs_process_patches, .-vs_process_patches
	.stabs	"res:r(0,58)",64,0,0,24
	.stabn	192,0,0,.LFBB8-.LFBB8
	.stabn	224,0,0,.Lscope8-.LFBB8
.Lscope8:
	.stabs	"vs_patch_process_file:F(0,58)",36,0,0,vs_patch_process_file
	.stabs	" :T(0,60)=eFR_OK:0,FR_DISK_ERR:1,FR_INT_ERR:2,FR_NOT_READY:3,FR_NO_FILE:4,FR_NO_PATH:5,FR_INVALID_NAME:6,FR_DENIED:7,FR_EXIST:8,FR_INVALID_OBJECT:9,FR_WRITE_PROTECTED:10,FR_INVALID_DRIVE:11,FR_NOT_ENABLED:12,FR_NO_FILESYSTEM:13,FR_MKFS_ABORTED:14,FR_TIMEOUT:15,FR_LOCKED:16,FR_NOT_ENOUGH_CORE:17,FR_TOO_MANY_OPEN_FILES:18,FR_INVALID_PARAMETER:19,;",128,0,0,0
	.stabs	"handler_func:P(0,61)=(0,62)=*(0,63)=f(0,58)",64,0,0,10
	.stabs	"init_func:P(0,64)=(0,62)",64,0,0,8
	.stabs	"end_func:P(0,65)=(0,66)=*(0,67)=f(0,16)",64,0,0,12
	.stabs	"pfnvs_patch_handler:t(0,61)",128,0,0,0
	.stabs	"pfnvs_patch_init:t(0,64)",128,0,0,0
	.stabs	"pfnvs_patch_end:t(0,65)",128,0,0,0
.global	vs_patch_process_file
	.type	vs_patch_process_file, @function
vs_patch_process_file:
	.stabn	68,0,278,.LM76-.LFBB9
.LM76:
.LFBB9:
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
	sbiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 12 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r14,r22
	movw r10,r20
	movw r8,r18
	movw r12,r16
	.stabn	68,0,283,.LM77-.LFBB9
.LM77:
	ldi r18,lo8(gs(vs_patch_file_next_instr))
	ldi r19,hi8(gs(vs_patch_file_next_instr))
	std Y+6,r19
	std Y+5,r18
	.stabn	68,0,284,.LM78-.LFBB9
.LM78:
	movw r18,r28
	subi r18,-10
	sbci r19,-1
	std Y+2,r19
	std Y+1,r18
	.stabn	68,0,286,.LM79-.LFBB9
.LM79:
	movw r30,r28
	adiw r30,7
	ldi r18,lo8(3)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r18
	brne 0b
	.stabn	68,0,287,.LM80-.LFBB9
.LM80:
	std Y+10,__zero_reg__
	.stabn	68,0,288,.LM81-.LFBB9
.LM81:
	ldi r18,lo8(shared_fp)
	ldi r19,hi8(shared_fp)
	std Y+12,r19
	std Y+11,r18
	.stabn	68,0,291,.LM82-.LFBB9
.LM82:
	ldi r20,lo8(1)
	movw r22,r24
	movw r24,r18
	call f_open
	.stabn	68,0,293,.LM83-.LFBB9
.LM83:
	ldi r17,0
	.stabn	68,0,291,.LM84-.LFBB9
.LM84:
	or r24,r25
	brne .L35
	.stabn	68,0,295,.LM85-.LFBB9
.LM85:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L37
.L39:
	.stabn	68,0,300,.LM86-.LFBB9
.LM86:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r10
	icall
	mov r17,r24
.L38:
	.stabn	68,0,303,.LM87-.LFBB9
.LM87:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	breq .L40
	.stabn	68,0,304,.LM88-.LFBB9
.LM88:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r12
	icall
.L40:
	.stabn	68,0,307,.LM89-.LFBB9
.LM89:
	ldd r24,Y+11
	ldd r25,Y+12
	call f_close
.L35:
	.stabn	68,0,310,.LM90-.LFBB9
.LM90:
	mov r24,r17
/* epilogue start */
	adiw r28,12
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
.L37:
	.stabn	68,0,296,.LM91-.LFBB9
.LM91:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r8
	icall
	mov r17,r24
	.stabn	68,0,299,.LM92-.LFBB9
.LM92:
	cpse r24,__zero_reg__
	rjmp .L39
	rjmp .L38
	.size	vs_patch_process_file, .-vs_patch_process_file
	.stabs	"patch:(0,31)",128,0,0,1
	.stabs	"vs_patch_t:t(0,31)",128,0,0,0
	.stabs	"patch_file:(0,33)",128,0,0,10
	.stabs	"res:r(0,58)",64,0,0,17
	.stabn	192,0,0,.LFBB9-.LFBB9
	.stabn	224,0,0,.Lscope9-.LFBB9
.Lscope9:
	.stabs	"vs_patch_process_rom:F(0,58)",36,0,0,vs_patch_process_rom
	.stabs	"patch_position:P(0,3)",64,0,0,24
	.stabs	"handler_func:P(0,61)",64,0,0,10
	.stabs	"init_func:P(0,64)",64,0,0,8
	.stabs	"end_func:P(0,65)",64,0,0,12
.global	vs_patch_process_rom
	.type	vs_patch_process_rom, @function
vs_patch_process_rom:
	.stabn	68,0,335,.LM93-.LFBB10
.LM93:
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,9
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 9 */
/* stack size = 21 */
.L__stack_usage = 21
	movw r14,r22
	movw r10,r20
	movw r8,r18
	movw r12,r16
	.stabn	68,0,339,.LM94-.LFBB10
.LM94:
	ldi r18,lo8(gs(vs_patch_rom_data_next_instr))
	ldi r19,hi8(gs(vs_patch_rom_data_next_instr))
	std Y+6,r19
	std Y+5,r18
	.stabn	68,0,340,.LM95-.LFBB10
.LM95:
	call vs_patch_rom_get_data
	movw r18,r24
	.stabn	68,0,340,.LM96-.LFBB10
.LM96:
	std Y+2,r25
	std Y+1,r24
	.stabn	68,0,341,.LM97-.LFBB10
.LM97:
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
	.stabn	68,0,343,.LM98-.LFBB10
.LM98:
	movw r30,r28
	adiw r30,7
	ldi r24,lo8(3)
	movw r26,r30
	0:
	st X+,__zero_reg__
	dec r24
	brne 0b
	.stabn	68,0,346,.LM99-.LFBB10
.LM99:
	ldi r17,0
	.stabn	68,0,345,.LM100-.LFBB10
.LM100:
	or r18,r19
	breq .L45
	.stabn	68,0,348,.LM101-.LFBB10
.LM101:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L47
.L49:
	.stabn	68,0,353,.LM102-.LFBB10
.LM102:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r10
	icall
	mov r17,r24
.L48:
	.stabn	68,0,356,.LM103-.LFBB10
.LM103:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	breq .L45
	.stabn	68,0,357,.LM104-.LFBB10
.LM104:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r12
	icall
.L45:
	.stabn	68,0,360,.LM105-.LFBB10
.LM105:
	mov r24,r17
/* epilogue start */
	adiw r28,9
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
.L47:
	.stabn	68,0,349,.LM106-.LFBB10
.LM106:
	movw r22,r14
	movw r24,r28
	adiw r24,1
	movw r30,r8
	icall
	mov r17,r24
	.stabn	68,0,352,.LM107-.LFBB10
.LM107:
	cpse r24,__zero_reg__
	rjmp .L49
	rjmp .L48
	.size	vs_patch_process_rom, .-vs_patch_process_rom
	.stabs	"patch:(0,31)",128,0,0,1
	.stabs	"res:r(0,58)",64,0,0,17
	.stabn	192,0,0,.LFBB10-.LFBB10
	.stabn	224,0,0,.Lscope10-.LFBB10
.Lscope10:
	.stabs	"vs_suspend:F(0,16)",36,0,0,vs_suspend
.global	vs_suspend
	.type	vs_suspend, @function
vs_suspend:
	.stabn	68,0,378,.LM108-.LFBB11
.LM108:
.LFBB11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB46:
.LBB47:
	.stabn	68,0,168,.LM109-.LFBB11
.LM109:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE47:
.LBE46:
	.stabn	68,0,379,.LM110-.LFBB11
.LM110:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L55
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L56
	sbiw r24,2
	brne .L54
	.stabn	68,0,381,.LM111-.LFBB11
.LM111:
	jmp vs1002_suspend
.L55:
	.stabn	68,0,385,.LM112-.LFBB11
.LM112:
	jmp vs1003_suspend
.L56:
	.stabn	68,0,389,.LM113-.LFBB11
.LM113:
	jmp vs1053_suspend
.L54:
/* epilogue start */
	.stabn	68,0,395,.LM114-.LFBB11
.LM114:
	ret
	.size	vs_suspend, .-vs_suspend
.Lscope11:
	.stabs	"vs_resume:F(0,16)",36,0,0,vs_resume
.global	vs_resume
	.type	vs_resume, @function
vs_resume:
	.stabn	68,0,398,.LM115-.LFBB12
.LM115:
.LFBB12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB48:
.LBB49:
	.stabn	68,0,168,.LM116-.LFBB12
.LM116:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE49:
.LBE48:
	.stabn	68,0,399,.LM117-.LFBB12
.LM117:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L59
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L60
	sbiw r24,2
	brne .L58
	.stabn	68,0,401,.LM118-.LFBB12
.LM118:
	jmp vs1002_resume
.L59:
	.stabn	68,0,405,.LM119-.LFBB12
.LM119:
	jmp vs1003_resume
.L60:
	.stabn	68,0,409,.LM120-.LFBB12
.LM120:
	jmp vs1053_resume
.L58:
/* epilogue start */
	.stabn	68,0,415,.LM121-.LFBB12
.LM121:
	ret
	.size	vs_resume, .-vs_resume
.Lscope12:
	.stabs	"vs_sci_sel:F(0,16)",36,0,0,vs_sci_sel
.global	vs_sci_sel
	.type	vs_sci_sel, @function
vs_sci_sel:
	.stabn	68,0,432,.LM122-.LFBB13
.LM122:
.LFBB13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,433,.LM123-.LFBB13
.LM123:
	cbi 0x18,6
/* epilogue start */
	.stabn	68,0,434,.LM124-.LFBB13
.LM124:
	ret
	.size	vs_sci_sel, .-vs_sci_sel
.Lscope13:
	.stabs	"vs_sci_unsel:F(0,16)",36,0,0,vs_sci_unsel
.global	vs_sci_unsel
	.type	vs_sci_unsel, @function
vs_sci_unsel:
	.stabn	68,0,436,.LM125-.LFBB14
.LM125:
.LFBB14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,437,.LM126-.LFBB14
.LM126:
	sbi 0x18,6
/* epilogue start */
	.stabn	68,0,438,.LM127-.LFBB14
.LM127:
	ret
	.size	vs_sci_unsel, .-vs_sci_unsel
.Lscope14:
	.stabs	"vs_hw_reset:F(0,16)",36,0,0,vs_hw_reset
.global	vs_hw_reset
	.type	vs_hw_reset, @function
vs_hw_reset:
	.stabn	68,0,363,.LM128-.LFBB15
.LM128:
.LFBB15:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.stabn	68,0,364,.LM129-.LFBB15
.LM129:
	cbi 0x3,7
.LBB50:
.LBB51:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext1
.Ltext1:
	.stabn	68,0,187,.LM130-.LFBB15
.LM130:
	ldi r24,lo8(3999)
	ldi r25,hi8(3999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE51:
.LBE50:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext2
.Ltext2:
	.stabn	68,0,366,.LM131-.LFBB15
.LM131:
	sbi 0x3,7
.LBB52:
.LBB53:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext3
.Ltext3:
	.stabn	68,0,187,.LM132-.LFBB15
.LM132:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LBE53:
.LBE52:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext4
.Ltext4:
	.stabn	68,0,369,.LM133-.LFBB15
.LM133:
	call vs_sci_sel
	ldi r28,lo8(10)
	ldi r29,0
.L65:
.LBB54:
	.stabn	68,0,372,.LM134-.LFBB15
.LM134:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,371,.LM135-.LFBB15
.LM135:
	sbiw r28,1
	brne .L65
.LBE54:
	.stabn	68,0,373,.LM136-.LFBB15
.LM136:
	call vs_sci_unsel
.LBB55:
.LBB56:
	.stabs	"/opt/avr-gcc/avr-gcc-11.1.0-x64-linux/avr/include/util/delay.h",132,0,0,.Ltext5
.Ltext5:
	.stabn	68,0,187,.LM137-.LFBB15
.LM137:
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
.LBE56:
.LBE55:
	.stabs	"src/sound/vs10xx.c",132,0,0,.Ltext6
.Ltext6:
	.stabn	68,0,375,.LM138-.LFBB15
.LM138:
	pop r29
	pop r28
	ret
	.size	vs_hw_reset, .-vs_hw_reset
.Lscope15:
	.stabs	"vs_sdi_sel:F(0,16)",36,0,0,vs_sdi_sel
.global	vs_sdi_sel
	.type	vs_sdi_sel, @function
vs_sdi_sel:
	.stabn	68,0,441,.LM139-.LFBB16
.LM139:
.LFBB16:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,442,.LM140-.LFBB16
.LM140:
	cbi 0x18,7
/* epilogue start */
	.stabn	68,0,443,.LM141-.LFBB16
.LM141:
	ret
	.size	vs_sdi_sel, .-vs_sdi_sel
.Lscope16:
	.stabs	"vs_sdi_unsel:F(0,16)",36,0,0,vs_sdi_unsel
.global	vs_sdi_unsel
	.type	vs_sdi_unsel, @function
vs_sdi_unsel:
	.stabn	68,0,445,.LM142-.LFBB17
.LM142:
.LFBB17:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,446,.LM143-.LFBB17
.LM143:
	sbi 0x18,7
/* epilogue start */
	.stabn	68,0,447,.LM144-.LFBB17
.LM144:
	ret
	.size	vs_sdi_unsel, .-vs_sdi_unsel
.Lscope17:
	.stabs	"vs_sci_read:F(0,5)",36,0,0,vs_sci_read
	.stabs	" :T(0,68)=eclock_div_1:1,clock_div_2:2,clock_div_4:4,clock_div_8:8,clock_div_16:16,clock_div_32:32,clock_div_64:64,clock_div_128:128,;",128,0,0,0
	.stabs	"reg:P(0,3)",64,0,0,28
.global	vs_sci_read
	.type	vs_sci_read, @function
vs_sci_read:
	.stabn	68,0,473,.LM145-.LFBB18
.LM145:
.LFBB18:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r28,r24
	.stabn	68,0,474,.LM146-.LFBB18
.LM146:
	call vs_wait_for_dreq
	.stabn	68,0,476,.LM147-.LFBB18
.LM147:
	ldi r24,lo8(4)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,478,.LM148-.LFBB18
.LM148:
	call vs_sci_sel
	.stabn	68,0,481,.LM149-.LFBB18
.LM149:
	ldi r24,lo8(3)
	call spi_xchg
	.stabn	68,0,482,.LM150-.LFBB18
.LM150:
	mov r24,r28
	call spi_xchg
	.stabn	68,0,485,.LM151-.LFBB18
.LM151:
	ldi r24,lo8(-1)
	call spi_xchg
	mov r28,r24
	ldi r29,0
	.stabn	68,0,485,.LM152-.LFBB18
.LM152:
	mov r29,r28
	clr r28
	.stabn	68,0,486,.LM153-.LFBB18
.LM153:
	ldi r24,lo8(-1)
	call spi_xchg
	.stabn	68,0,486,.LM154-.LFBB18
.LM154:
	or r28,r24
	.stabn	68,0,488,.LM155-.LFBB18
.LM155:
	call vs_sci_unsel
	.stabn	68,0,491,.LM156-.LFBB18
.LM156:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	vs_sci_read, .-vs_sci_read
.Lscope18:
	.stabs	"vs_init:F(0,58)",36,0,0,vs_init
.global	vs_init
	.type	vs_init, @function
vs_init:
	.stabn	68,0,129,.LM157-.LFBB19
.LM157:
.LFBB19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,130,.LM158-.LFBB19
.LM158:
	sbi 0x2,7
	in r24,0x17
	ori r24,lo8(-64)
	out 0x17,r24
	cbi 0x17,4
	.stabn	68,0,132,.LM159-.LFBB19
.LM159:
	call spi_enable
	.stabn	68,0,134,.LM160-.LFBB19
.LM160:
	call vs_sci_unsel
	.stabn	68,0,135,.LM161-.LFBB19
.LM161:
	call vs_sdi_unsel
	.stabn	68,0,137,.LM162-.LFBB19
.LM162:
	call vs_hw_reset
.LBB61:
.LBB62:
	.stabn	68,0,107,.LM163-.LFBB19
.LM163:
	ldi r24,lo8(1)
	call vs_sci_read
	.stabn	68,0,109,.LM164-.LFBB19
.LM164:
	ldi r18,4
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	andi r24,15
	clr r25
	.stabn	68,0,109,.LM165-.LFBB19
.LM165:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L71
	cpi r24,4
	cpc r25,__zero_reg__
	brne .L72
	.stabn	68,0,111,.LM166-.LFBB19
.LM166:
	ldi r24,lo8(53)
	ldi r25,0
	sts vs_hws+1,r25
	sts vs_hws,r24
.LBE62:
.LBE61:
	.stabn	68,0,154,.LM167-.LFBB19
.LM167:
	call vs1053_init
.L73:
	.stabn	68,0,161,.LM168-.LFBB19
.LM168:
	call vs_suspend
	.stabn	68,0,163,.LM169-.LFBB19
.LM169:
	ldi r24,lo8(1)
/* epilogue start */
	.stabn	68,0,164,.LM170-.LFBB19
.LM170:
	ret
.L72:
.LBB66:
.LBB63:
	.stabn	68,0,109,.LM171-.LFBB19
.LM171:
	cpi r24,2
	cpc r25,__zero_reg__
	breq .L74
	.stabn	68,0,111,.LM172-.LFBB19
.LM172:
	sts vs_hws+1,__zero_reg__
	sts vs_hws,__zero_reg__
.LBE63:
.LBE66:
	.stabn	68,0,142,.LM173-.LFBB19
.LM173:
	ldi r24,0
	ret
.L74:
.LBB67:
.LBB64:
	.stabn	68,0,111,.LM174-.LFBB19
.LM174:
	sts vs_hws+1,r25
	sts vs_hws,r24
.LBE64:
.LBE67:
	.stabn	68,0,146,.LM175-.LFBB19
.LM175:
	call vs1002_init
	.stabn	68,0,147,.LM176-.LFBB19
.LM176:
	rjmp .L73
.L71:
.LBB68:
.LBB65:
	.stabn	68,0,111,.LM177-.LFBB19
.LM177:
	sts vs_hws+1,r25
	sts vs_hws,r24
.LBE65:
.LBE68:
	.stabn	68,0,150,.LM178-.LFBB19
.LM178:
	call vs1003_init
	.stabn	68,0,151,.LM179-.LFBB19
.LM179:
	rjmp .L73
	.size	vs_init, .-vs_init
.Lscope19:
	.stabs	"vs_sci_write:F(0,16)",36,0,0,vs_sci_write
	.stabs	"reg:P(0,3)",64,0,0,17
.global	vs_sci_write
	.type	vs_sci_write, @function
vs_sci_write:
	.stabn	68,0,494,.LM180-.LFBB20
.LM180:
.LFBB20:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	movw r28,r22
	.stabn	68,0,495,.LM181-.LFBB20
.LM181:
	call vs_wait_for_dreq
	.stabn	68,0,497,.LM182-.LFBB20
.LM182:
	ldi r24,lo8(4)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,499,.LM183-.LFBB20
.LM183:
	call vs_sci_sel
	.stabn	68,0,502,.LM184-.LFBB20
.LM184:
	ldi r24,lo8(2)
	call spi_xchg
	.stabn	68,0,503,.LM185-.LFBB20
.LM185:
	mov r24,r17
	call spi_xchg
	.stabn	68,0,506,.LM186-.LFBB20
.LM186:
	mov r24,r29
	call spi_xchg
	.stabn	68,0,507,.LM187-.LFBB20
.LM187:
	mov r24,r28
	call spi_xchg
/* epilogue start */
	.stabn	68,0,510,.LM188-.LFBB20
.LM188:
	pop r29
	pop r28
	pop r17
	.stabn	68,0,509,.LM189-.LFBB20
.LM189:
	jmp vs_sci_unsel
	.size	vs_sci_write, .-vs_sci_write
.Lscope20:
	.stabs	"vs_patch_apply:F(0,58)",36,0,0,vs_patch_apply
	.stabs	"patch:P(0,30)",64,0,0,16
	.stabs	"state:P(0,69)=*(0,70)=(0,71)=xss_vs_patch_state:",64,0,0,22
.global	vs_patch_apply
	.type	vs_patch_apply, @function
vs_patch_apply:
	.stabn	68,0,202,.LM190-.LFBB21
.LM190:
.LFBB21:
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
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
.L80:
	.stabn	68,0,207,.LM191-.LFBB21
.LM191:
	movw r26,r16
	adiw r26,4
	ld r30,X+
	ld r31,X
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	icall
	movw r18,r24
	.stabn	68,0,207,.LM192-.LFBB21
.LM192:
	sbiw r24,3
	brne .L81
	.stabn	68,0,205,.LM193-.LFBB21
.LM193:
	ldi r24,0
	.stabn	68,0,221,.LM194-.LFBB21
.LM194:
	ldi r25,lo8(3)
	mov r15,r25
.L82:
	.stabn	68,0,219,.LM195-.LFBB21
.LM195:
	movw r30,r16
	ldd r25,Z+8
	cp r24,r25
	brlo .L83
	.stabn	68,0,225,.LM196-.LFBB21
.LM196:
	ldi r24,lo8(1)
.L77:
/* epilogue start */
	.stabn	68,0,226,.LM197-.LFBB21
.LM197:
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
.L81:
	.stabn	68,0,208,.LM198-.LFBB21
.LM198:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L84
	.stabn	68,0,211,.LM199-.LFBB21
.LM199:
	cpi r18,1
	cpc r19,__zero_reg__
	brne .L80
	.stabn	68,0,212,.LM200-.LFBB21
.LM200:
	ldd r22,Y+2
	ldd r23,Y+3
	ldd r24,Y+1
	call vs_sci_write
	rjmp .L80
.L83:
	.stabn	68,0,221,.LM201-.LFBB21
.LM201:
	clr r14
	inc r14
	add r14,r24
	.stabn	68,0,221,.LM202-.LFBB21
.LM202:
	movw r26,r16
	adiw r26,6
	ld r30,X+
	ld r31,X
	mul r24,r15
	add r30,r0
	adc r31,r1
	clr __zero_reg__
	.stabn	68,0,222,.LM203-.LFBB21
.LM203:
	ldd r22,Z+1
	ldd r23,Z+2
	ld r24,Z
	call vs_sci_write
	.stabn	68,0,221,.LM204-.LFBB21
.LM204:
	mov r24,r14
	rjmp .L82
.L84:
	.stabn	68,0,209,.LM205-.LFBB21
.LM205:
	ldi r24,0
	rjmp .L77
	.size	vs_patch_apply, .-vs_patch_apply
	.stabs	"instr:(0,23)",128,0,0,1
	.stabs	"vs_sci_instr_t:t(0,23)",128,0,0,0
	.stabs	"pinstr:r(0,22)",64,0,0,30
	.stabs	"nir:r(0,1)",64,0,0,18
	.stabs	"vs_patch_nir_t:t(0,1)",128,0,0,0
	.stabn	192,0,0,.LFBB21-.LFBB21
	.stabn	224,0,0,.Lscope21-.LFBB21
.Lscope21:
	.stabs	"vs_sw_reset:F(0,16)",36,0,0,vs_sw_reset
	.stabs	"mask_add:P(0,5)",64,0,0,16
	.stabs	"mask_remove:P(0,5)",64,0,0,28
.global	vs_sw_reset
	.type	vs_sw_reset, @function
vs_sw_reset:
	.stabn	68,0,418,.LM206-.LFBB22
.LM206:
.LFBB22:
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
	.stabn	68,0,419,.LM207-.LFBB22
.LM207:
	ldi r24,0
	call vs_sci_read
	.stabn	68,0,420,.LM208-.LFBB22
.LM208:
	com r28
	com r29
	.stabn	68,0,420,.LM209-.LFBB22
.LM209:
	movw r22,r28
	and r22,r24
	and r23,r25
	.stabn	68,0,421,.LM210-.LFBB22
.LM210:
	or r22,r16
	or r23,r17
	.stabn	68,0,422,.LM211-.LFBB22
.LM211:
	ori r22,4
	ori r23,8
	ldi r24,0
	call vs_sci_write
/* epilogue start */
	.stabn	68,0,425,.LM212-.LFBB22
.LM212:
	pop r29
	pop r28
	pop r17
	pop r16
	.stabn	68,0,424,.LM213-.LFBB22
.LM213:
	jmp vs_wait_for_dreq
	.size	vs_sw_reset, .-vs_sw_reset
.Lscope22:
	.stabs	"vs_analog_power_down:F(0,16)",36,0,0,vs_analog_power_down
.global	vs_analog_power_down
	.type	vs_analog_power_down, @function
vs_analog_power_down:
	.stabn	68,0,450,.LM214-.LFBB23
.LM214:
.LFBB23:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,452,.LM215-.LFBB23
.LM215:
	ldi r22,lo8(-1)
	ldi r23,lo8(-1)
	ldi r24,lo8(11)
	jmp vs_sci_write
	.size	vs_analog_power_down, .-vs_analog_power_down
.Lscope23:
	.stabs	"vs_set_volume:F(0,16)",36,0,0,vs_set_volume
	.stabs	"left_db:P(0,3)",64,0,0,24
	.stabs	"right_db:P(0,3)",64,0,0,25
.global	vs_set_volume
	.type	vs_set_volume, @function
vs_set_volume:
	.stabn	68,0,456,.LM216-.LFBB24
.LM216:
.LFBB24:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r25,r22
	.stabn	68,0,462,.LM217-.LFBB24
.LM217:
	cpi r24,lo8(-1)
	brlo .L89
	ldi r24,lo8(-2)
.L89:
	mov r22,r24
	ldi r23,0
	.stabn	68,0,463,.LM218-.LFBB24
.LM218:
	mov r23,r22
	clr r22
	.stabn	68,0,463,.LM219-.LFBB24
.LM219:
	cpi r25,lo8(-1)
	brlo .L90
	ldi r25,lo8(-2)
.L90:
	.stabn	68,0,463,.LM220-.LFBB24
.LM220:
	or r22,r25
	.stabn	68,0,465,.LM221-.LFBB24
.LM221:
	ldi r24,lo8(11)
	jmp vs_sci_write
	.size	vs_set_volume, .-vs_set_volume
.Lscope24:
	.stabs	"vs_sci_set:F(0,16)",36,0,0,vs_sci_set
	.stabs	"reg:P(0,3)",64,0,0,28
	.stabs	"flags:P(0,5)",64,0,0,16
.global	vs_sci_set
	.type	vs_sci_set, @function
vs_sci_set:
	.stabn	68,0,513,.LM222-.LFBB25
.LM222:
.LFBB25:
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r28,r24
	movw r16,r22
	.stabn	68,0,516,.LM223-.LFBB25
.LM223:
	call vs_sci_read
	.stabn	68,0,517,.LM224-.LFBB25
.LM224:
	movw r22,r24
	or r22,r16
	or r23,r17
	mov r24,r28
/* epilogue start */
	.stabn	68,0,518,.LM225-.LFBB25
.LM225:
	pop r28
	pop r17
	pop r16
	.stabn	68,0,517,.LM226-.LFBB25
.LM226:
	jmp vs_sci_write
	.size	vs_sci_set, .-vs_sci_set
.Lscope25:
	.stabs	"vs_sci_is_set:F(0,58)",36,0,0,vs_sci_is_set
	.stabs	"reg:P(0,3)",64,0,0,24
	.stabs	"flags:P(0,5)",64,0,0,28
.global	vs_sci_is_set
	.type	vs_sci_is_set, @function
vs_sci_is_set:
	.stabn	68,0,521,.LM227-.LFBB26
.LM227:
.LFBB26:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r22
	.stabn	68,0,524,.LM228-.LFBB26
.LM228:
	call vs_sci_read
	.stabn	68,0,525,.LM229-.LFBB26
.LM229:
	movw r18,r24
	and r18,r28
	and r19,r29
	.stabn	68,0,525,.LM230-.LFBB26
.LM230:
	ldi r24,lo8(1)
	cp r18,r28
	cpc r19,r29
	breq .L93
	ldi r24,0
.L93:
/* epilogue start */
	.stabn	68,0,526,.LM231-.LFBB26
.LM231:
	pop r29
	pop r28
	ret
	.size	vs_sci_is_set, .-vs_sci_is_set
.Lscope26:
	.stabs	"vs_sci_unset:F(0,16)",36,0,0,vs_sci_unset
	.stabs	"reg:P(0,3)",64,0,0,17
	.stabs	"flags:P(0,5)",64,0,0,28
.global	vs_sci_unset
	.type	vs_sci_unset, @function
vs_sci_unset:
	.stabn	68,0,529,.LM232-.LFBB27
.LM232:
.LFBB27:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24
	movw r28,r22
	.stabn	68,0,532,.LM233-.LFBB27
.LM233:
	call vs_sci_read
	.stabn	68,0,533,.LM234-.LFBB27
.LM234:
	com r28
	com r29
	.stabn	68,0,533,.LM235-.LFBB27
.LM235:
	movw r22,r28
	and r22,r24
	and r23,r25
	mov r24,r17
/* epilogue start */
	.stabn	68,0,534,.LM236-.LFBB27
.LM236:
	pop r29
	pop r28
	pop r17
	.stabn	68,0,533,.LM237-.LFBB27
.LM237:
	jmp vs_sci_write
	.size	vs_sci_unset, .-vs_sci_unset
.Lscope27:
	.stabs	"vs_sdi_write:F(0,16)",36,0,0,vs_sdi_write
.global	vs_sdi_write
	.type	vs_sdi_write, @function
vs_sdi_write:
	.stabn	68,0,541,.LM238-.LFBB28
.LM238:
.LFBB28:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
	mov r28,r25
	.stabn	68,0,542,.LM239-.LFBB28
.LM239:
	ldi r24,lo8(2)
	ldi r25,0
	call spi_set_clk
	.stabn	68,0,544,.LM240-.LFBB28
.LM240:
	call vs_wait_for_dreq
	.stabn	68,0,546,.LM241-.LFBB28
.LM241:
	call vs_sdi_sel
	.stabn	68,0,548,.LM242-.LFBB28
.LM242:
	ldi r20,lo8(32)
	ldi r21,0
	ldi r22,0
	ldi r23,0
	mov r24,r29
	mov r25,r28
	call spi_xmit_multi
/* epilogue start */
	.stabn	68,0,551,.LM243-.LFBB28
.LM243:
	pop r29
	pop r28
	.stabn	68,0,550,.LM244-.LFBB28
.LM244:
	jmp vs_sdi_unsel
	.size	vs_sdi_write, .-vs_sdi_write
.Lscope28:
	.stabs	"vs_playback_start:F(0,58)",36,0,0,vs_playback_start
.global	vs_playback_start
	.type	vs_playback_start, @function
vs_playback_start:
	.stabn	68,0,554,.LM245-.LFBB29
.LM245:
.LFBB29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,557,.LM246-.LFBB29
.LM246:
	call vs_resume
.LBB69:
.LBB70:
	.stabn	68,0,168,.LM247-.LFBB29
.LM247:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE70:
.LBE69:
	.stabn	68,0,559,.LM248-.LFBB29
.LM248:
	cpi r24,4
	cpc r25,__zero_reg__
	brsh .L97
	sbiw r24,2
	brlo .L99
	.stabn	68,0,562,.LM249-.LFBB29
.LM249:
	call vs1002_playback_start
.L101:
	.stabn	68,0,573,.LM250-.LFBB29
.LM250:
	tst r24
	breq .L99
.L96:
/* epilogue start */
	.stabn	68,0,579,.LM251-.LFBB29
.LM251:
	ret
.L97:
	.stabn	68,0,559,.LM252-.LFBB29
.LM252:
	sbiw r24,53
	breq .L100
.L99:
	.stabn	68,0,574,.LM253-.LFBB29
.LM253:
	call vs_suspend
	ldi r24,0
	.stabn	68,0,578,.LM254-.LFBB29
.LM254:
	rjmp .L96
.L100:
	.stabn	68,0,566,.LM255-.LFBB29
.LM255:
	call vs1053_playback_start
	.stabn	68,0,567,.LM256-.LFBB29
.LM256:
	rjmp .L101
	.size	vs_playback_start, .-vs_playback_start
	.stabs	"res:r(0,58)",64,0,0,24
	.stabn	192,0,0,.LFBB29-.LFBB29
	.stabn	224,0,0,.Lscope29-.LFBB29
.Lscope29:
	.stabs	"vs_playback_stop:F(0,16)",36,0,0,vs_playback_stop
.global	vs_playback_stop
	.type	vs_playback_stop, @function
vs_playback_stop:
	.stabn	68,0,582,.LM257-.LFBB30
.LM257:
.LFBB30:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB71:
.LBB72:
	.stabn	68,0,168,.LM258-.LFBB30
.LM258:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE72:
.LBE71:
	.stabn	68,0,583,.LM259-.LFBB30
.LM259:
	cpi r24,4
	cpc r25,__zero_reg__
	brsh .L104
	sbiw r24,2
	brlo .L106
	.stabn	68,0,586,.LM260-.LFBB30
.LM260:
	call vs1002_playback_stop
	.stabn	68,0,587,.LM261-.LFBB30
.LM261:
	rjmp .L106
.L104:
	.stabn	68,0,583,.LM262-.LFBB30
.LM262:
	sbiw r24,53
	breq .L107
.L106:
	.stabn	68,0,599,.LM263-.LFBB30
.LM263:
	jmp vs_suspend
.L107:
	.stabn	68,0,590,.LM264-.LFBB30
.LM264:
	call vs1053_playback_stop
	.stabn	68,0,591,.LM265-.LFBB30
.LM265:
	rjmp .L106
	.size	vs_playback_stop, .-vs_playback_stop
.Lscope30:
	.stabs	"vs_adpcm_rec_start:F(0,58)",36,0,0,vs_adpcm_rec_start
	.stabs	"gain:P(0,3)",64,0,0,17
	.stabs	"highpass_filter:P(0,58)",64,0,0,16
.global	vs_adpcm_rec_start
	.type	vs_adpcm_rec_start, @function
vs_adpcm_rec_start:
	.stabn	68,0,607,.LM266-.LFBB31
.LM266:
.LFBB31:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r29,r24
	mov r28,r25
	mov r17,r22
	mov r16,r20
	.stabn	68,0,610,.LM267-.LFBB31
.LM267:
	call vs_resume
.LBB73:
.LBB74:
	.stabn	68,0,168,.LM268-.LFBB31
.LM268:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE74:
.LBE73:
	.stabn	68,0,612,.LM269-.LFBB31
.LM269:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L109
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L110
	sbiw r24,2
	brne .L111
	.stabn	68,0,614,.LM270-.LFBB31
.LM270:
	mov r20,r16
	mov r22,r17
	mov r24,r29
	mov r25,r28
	call vs1002_adpcm_rec_start
.L112:
	.stabn	68,0,629,.LM271-.LFBB31
.LM271:
	cpse r24,__zero_reg__
	rjmp .L108
.L111:
	.stabn	68,0,630,.LM272-.LFBB31
.LM272:
	call vs_suspend
	ldi r24,0
.L108:
/* epilogue start */
	.stabn	68,0,633,.LM273-.LFBB31
.LM273:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L109:
	.stabn	68,0,618,.LM274-.LFBB31
.LM274:
	mov r20,r16
	mov r22,r17
	mov r24,r29
	mov r25,r28
	call vs1003_adpcm_rec_start
	.stabn	68,0,619,.LM275-.LFBB31
.LM275:
	rjmp .L112
.L110:
	.stabn	68,0,622,.LM276-.LFBB31
.LM276:
	mov r22,r17
	mov r24,r29
	mov r25,r28
	call vs1053_adpcm_rec_start
	.stabn	68,0,623,.LM277-.LFBB31
.LM277:
	rjmp .L112
	.size	vs_adpcm_rec_start, .-vs_adpcm_rec_start
	.stabs	"res:r(0,58)",64,0,0,24
	.stabn	192,0,0,.LFBB31-.LFBB31
	.stabn	224,0,0,.Lscope31-.LFBB31
.Lscope31:
	.stabs	"vs_adpcm_rec_stop:F(0,16)",36,0,0,vs_adpcm_rec_stop
.global	vs_adpcm_rec_stop
	.type	vs_adpcm_rec_stop, @function
vs_adpcm_rec_stop:
	.stabn	68,0,636,.LM278-.LFBB32
.LM278:
.LFBB32:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LBB75:
.LBB76:
	.stabn	68,0,168,.LM279-.LFBB32
.LM279:
	lds r24,vs_hws
	lds r25,vs_hws+1
.LBE76:
.LBE75:
	.stabn	68,0,637,.LM280-.LFBB32
.LM280:
	cpi r24,3
	cpc r25,__zero_reg__
	breq .L115
	cpi r24,53
	cpc r25,__zero_reg__
	breq .L116
	sbiw r24,2
	brne .L114
	.stabn	68,0,639,.LM281-.LFBB32
.LM281:
	call vs1002_adpcm_rec_stop
.L118:
	.stabn	68,0,654,.LM282-.LFBB32
.LM282:
	jmp vs_suspend
.L115:
	.stabn	68,0,643,.LM283-.LFBB32
.LM283:
	call vs1003_adpcm_rec_stop
	.stabn	68,0,644,.LM284-.LFBB32
.LM284:
	rjmp .L118
.L116:
	.stabn	68,0,647,.LM285-.LFBB32
.LM285:
	call vs1053_adpcm_rec_stop
	.stabn	68,0,648,.LM286-.LFBB32
.LM286:
	rjmp .L118
.L114:
/* epilogue start */
	.stabn	68,0,655,.LM287-.LFBB32
.LM287:
	ret
	.size	vs_adpcm_rec_stop, .-vs_adpcm_rec_stop
.Lscope32:
	.stabs	"vs_adpcm_read_block:F(0,58)",36,0,0,vs_adpcm_read_block
.global	vs_adpcm_read_block
	.type	vs_adpcm_read_block, @function
vs_adpcm_read_block:
	.stabn	68,0,658,.LM288-.LFBB33
.LM288:
.LFBB33:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	.stabn	68,0,664,.LM289-.LFBB33
.LM289:
	ldi r24,lo8(9)
	call vs_sci_read
	.stabn	68,0,671,.LM290-.LFBB33
.LM290:
	subi r24,-128
	sbc r25,__zero_reg__
	cp r24,__zero_reg__
	sbci r25,3
	brsh .L122
	movw r28,r16
	inc r17
.L121:
	.stabn	68,0,678,.LM291-.LFBB33
.LM291:
	ldi r24,lo8(8)
	call vs_sci_read
	.stabn	68,0,679,.LM292-.LFBB33
.LM292:
	st Y,r25
	.stabn	68,0,680,.LM293-.LFBB33
.LM293:
	std Y+1,r24
	.stabn	68,0,677,.LM294-.LFBB33
.LM294:
	adiw r28,2
	cp r28,r16
	cpc r29,r17
	brne .L121
	.stabn	68,0,684,.LM295-.LFBB33
.LM295:
	ldi r24,lo8(1)
.L119:
/* epilogue start */
	.stabn	68,0,685,.LM296-.LFBB33
.LM296:
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L122:
	.stabn	68,0,673,.LM297-.LFBB33
.LM297:
	ldi r24,0
	rjmp .L119
	.size	vs_adpcm_read_block, .-vs_adpcm_read_block
.Lscope33:
	.local	vs_hws
	.comm	vs_hws,2,1
	.stabs	"vs_hws:S(0,59)",38,0,0,vs_hws
	.stabs	"vs_hw_spec_t:t(0,59)",128,0,0,0
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_copy_data
.global __do_clear_bss
