	.file	"vs1002.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/sound/vs1002.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"vs1002_patch_rom:F(0,1)=(0,2)=*(0,3)=xss_vs_patch_rom:",36,0,0,vs1002_patch_rom
	.stabs	"pvs_patch_rom_t:t(0,1)",128,0,0,0
	.stabs	"s_vs_patch_rom:T(0,3)=s9revision:(0,4)=(0,5)=r(0,5);0;65535;,0,16;patch_count:(0,4),16,16;patch_data:(0,6)=ar(0,7)=r(0,7);0;65535;;0;0;(0,8)=(0,9)=xss_vs_patch_data:,32,40;;",128,0,0,0
	.stabs	"uint16_t:t(0,4)",128,0,0,0
	.stabs	"unsigned int:t(0,5)",128,0,0,0
	.stabs	"s_vs_patch_data:T(0,9)=s5count:(0,4),0,16;instr:(0,10)=ar(0,7);0;0;(0,11)=(0,12)=xss_vs_sci_instr:,16,24;;",128,0,0,0
	.stabs	"s_vs_sci_instr:T(0,12)=s3reg:(0,13)=(0,14)=r(0,14);0;255;,0,8;data:(0,4),8,16;;",128,0,0,0
	.stabs	"uint8_t:t(0,13)",128,0,0,0
	.stabs	"unsigned char:t(0,14)",128,0,0,0
.global	vs1002_patch_rom
	.type	vs1002_patch_rom, @function
vs1002_patch_rom:
	.stabn	68,0,70,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,72,.LM1-.LFBB1
.LM1:
	ldi r24,lo8(__vs1002_patch_rom)
	ldi r25,hi8(__vs1002_patch_rom)
/* epilogue start */
	ret
	.size	vs1002_patch_rom, .-vs1002_patch_rom
.Lscope1:
	.stabs	"vs1002_init:F(0,15)=eFalse:0,True:1,;",36,0,0,vs1002_init
	.stabs	"_Bool:t(0,15)",128,0,0,0
.global	vs1002_init
	.type	vs1002_init, @function
vs1002_init:
	.stabn	68,0,97,.LM2-.LFBB2
.LM2:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,99,.LM3-.LFBB2
.LM3:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1002_init, .-vs1002_init
.Lscope2:
.global	vs1002_process_patches
	.type	vs1002_process_patches, @function
vs1002_process_patches:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1002_process_patches, .-vs1002_process_patches
	.stabs	"vs1002_set_clockf:F(0,16)=(0,16)",36,0,0,vs1002_set_clockf
	.stabs	"void:t(0,16)",128,0,0,0
.global	vs1002_set_clockf
	.type	vs1002_set_clockf, @function
vs1002_set_clockf:
	.stabn	68,0,112,.LM4-.LFBB3
.LM4:
.LFBB3:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,124,.LM5-.LFBB3
.LM5:
	ldi r22,0
	ldi r23,lo8(-128)
	ldi r24,lo8(3)
	jmp vs_sci_write
	.size	vs1002_set_clockf, .-vs1002_set_clockf
.Lscope3:
	.stabs	"vs1002_suspend:F(0,16)",36,0,0,vs1002_suspend
.global	vs1002_suspend
	.type	vs1002_suspend, @function
vs1002_suspend:
	.stabn	68,0,128,.LM6-.LFBB4
.LM6:
.LFBB4:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,129,.LM7-.LFBB4
.LM7:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_is_set
	.stabn	68,0,129,.LM8-.LFBB4
.LM8:
	cpse r24,__zero_reg__
	rjmp .L5
	.stabn	68,0,132,.LM9-.LFBB4
.LM9:
	call vs_analog_power_down
	.stabn	68,0,134,.LM10-.LFBB4
.LM10:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	jmp vs_sci_set
.L5:
/* epilogue start */
	.stabn	68,0,135,.LM11-.LFBB4
.LM11:
	ret
	.size	vs1002_suspend, .-vs1002_suspend
.Lscope4:
	.stabs	"vs1002_resume:F(0,16)",36,0,0,vs1002_resume
.global	vs1002_resume
	.type	vs1002_resume, @function
vs1002_resume:
	.stabn	68,0,138,.LM12-.LFBB5
.LM12:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,139,.LM13-.LFBB5
.LM13:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_is_set
	.stabn	68,0,139,.LM14-.LFBB5
.LM14:
	tst r24
	breq .L7
	.stabn	68,0,142,.LM15-.LFBB5
.LM15:
	ldi r22,lo8(16)
	ldi r23,0
	ldi r24,0
	call vs_sci_unset
	.stabn	68,0,144,.LM16-.LFBB5
.LM16:
	ldi r22,lo8(54)
	ldi r24,lo8(54)
	jmp vs_set_volume
.L7:
/* epilogue start */
	.stabn	68,0,145,.LM17-.LFBB5
.LM17:
	ret
	.size	vs1002_resume, .-vs1002_resume
.Lscope5:
	.stabs	"vs1002_playback_start:F(0,15)",36,0,0,vs1002_playback_start
.global	vs1002_playback_start
	.type	vs1002_playback_start, @function
vs1002_playback_start:
	.stabn	68,0,148,.LM18-.LFBB6
.LM18:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,149,.LM19-.LFBB6
.LM19:
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call vs_sw_reset
	.stabn	68,0,152,.LM20-.LFBB6
.LM20:
	call vs1002_set_clockf
	.stabn	68,0,155,.LM21-.LFBB6
.LM21:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	vs1002_playback_start, .-vs1002_playback_start
.Lscope6:
	.stabs	"vs1002_playback_stop:F(0,16)",36,0,0,vs1002_playback_stop
.global	vs1002_playback_stop
	.type	vs1002_playback_stop, @function
vs1002_playback_stop:
	.stabn	68,0,158,.LM22-.LFBB7
.LM22:
.LFBB7:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	.stabn	68,0,159,.LM23-.LFBB7
.LM23:
	ret
	.size	vs1002_playback_stop, .-vs1002_playback_stop
.Lscope7:
	.stabs	"vs1002_adpcm_rec_start:F(0,15)",36,0,0,vs1002_adpcm_rec_start
	.stabs	"sample_rate:P(0,4)",64,0,0,28
	.stabs	"gain:P(0,13)",64,0,0,15
	.stabs	"highpass_filter:P(0,15)",64,0,0,20
.global	vs1002_adpcm_rec_start
	.type	vs1002_adpcm_rec_start, @function
vs1002_adpcm_rec_start:
	.stabn	68,0,168,.LM24-.LFBB8
.LM24:
.LFBB8:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r28,r24
	mov r15,r22
	.stabn	68,0,173,.LM25-.LFBB8
.LM25:
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call vs_sw_reset
	.stabn	68,0,175,.LM26-.LFBB8
.LM26:
	ldi r17,0
	ldi r16,0
	ldi r19,0
	ldi r18,0
	ldi r20,lo8(gs(vs_patch_apply))
	ldi r21,hi8(gs(vs_patch_apply))
	ldi r23,0
	ldi r22,0
	ldi r24,0
	call vs_patch_process_rom
	.stabn	68,0,179,.LM27-.LFBB8
.LM27:
	call vs1002_set_clockf
	.stabn	68,0,188,.LM28-.LFBB8
.LM28:
	movw r18,r28
	ldi r21,0
	ldi r20,0
	mov r21,r20
	mov r20,r19
	mov r19,r18
	clr r18
	.stabn	68,0,188,.LM29-.LFBB8
.LM29:
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(119)
	ldi r25,lo8(1)
	call __udivmodsi4
	.stabn	68,0,191,.LM30-.LFBB8
.LM30:
	movw r22,r18
	ldi r24,lo8(12)
	call vs_sci_write
	.stabn	68,0,197,.LM31-.LFBB8
.LM31:
	mov r23,r15
	lsl r23
	lsl r23
	ldi r22,0
	ldi r24,lo8(13)
	call vs_sci_write
	.stabn	68,0,221,.LM32-.LFBB8
.LM32:
	ldi r22,lo8(48)
	ldi r23,0
	ldi r24,lo8(10)
	call vs_sci_write
	.stabn	68,0,225,.LM33-.LFBB8
.LM33:
	ldi r24,lo8(1)
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	vs1002_adpcm_rec_start, .-vs1002_adpcm_rec_start
.Lscope8:
	.stabs	"vs1002_adpcm_rec_stop:F(0,16)",36,0,0,vs1002_adpcm_rec_stop
.global	vs1002_adpcm_rec_stop
	.type	vs1002_adpcm_rec_stop, @function
vs1002_adpcm_rec_stop:
	.stabn	68,0,228,.LM34-.LFBB9
.LM34:
.LFBB9:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,234,.LM35-.LFBB9
.LM35:
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(10)
	call vs_sci_write
	.stabn	68,0,236,.LM36-.LFBB9
.LM36:
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	jmp vs_sw_reset
	.size	vs1002_adpcm_rec_stop, .-vs1002_adpcm_rec_stop
.Lscope9:
.global	__vs1002_patch_rom
	.section	.progmem.data,"a",@progbits
	.type	__vs1002_patch_rom, @object
	.size	__vs1002_patch_rom, 4005
__vs1002_patch_rom:
	.string	"\201\210\001"
	.string	"5\005\0070\200\006?"
	.string	"\006\217\377\006"
	.string	""
	.string	"\006\327;\006"
	.string	"\364\006\300U\006"
	.string	""
	.string	"\006\327\b\006"
	.string	"\364\006\300W\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\300s\006"
	.string	""
	.string	"\006V"
	.string	"\0078\200\006\022>\006\001\270\006"
	.string	""
	.string	"\006\n\200\006\222h\006\0028\006\002\376\006C\270\006\273H\006\345\344\006\"\376\006L\030\006\372r\006N8\006\346\360\006GA\006\262H\006\0178\006"
	.string	""
	.string	"\006\304\003\006F\255\006\r\270\006"
	.string	""
	.string	"\006\316\004\006"
	.string	"$\006\316\022\006\212\276\006$"
	.string	"\006\312n\006\303@\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\301\022\006\326\215\006$"
	.string	"\006\312N\006\212B\006\352\216\006$"
	.string	"\006"
	.string	""
	.string	"\006\001\002\006\026b\006\200@\006\3636\006\r\330\006"
	.string	"(\006\210\024\006\216G\006\316\033\006"
	.string	""
	.string	"\006\300\001\006\3616\006\005\030\006"
	.string	"(\006\230\025\006\3606\006\003\230\006\020\300\006$"
	.string	"\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\001\230\007X\200\006\022>\006\023\270\006\022>\006\0258\006\005>\006\024\270\006%6\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006\020>\006\003\270\006\0200\006\f\323\006"
	.string	"4\006$"
	.string	"\006\006c\006B\020\0066\361\006$"
	.string	"\006"
	.string	""
	.string	"\006\001\002\006\020\240\006\0048\0066\376\006E\270\006\277H\006\347\346\006"
	.string	""
	.string	"\006\003@\006\246\377\006$"
	.string	"\006\266H\006$"
	.string	"\0064\300\006"
	.string	"\b\006\020\240\006B\244\006\232h\006"
	.string	"\244\006"
	.string	"(\006@\"\006\232e\006"
	.string	"\021\006"
	.string	"2\006L\230\006\"A\006G8\006"
	.string	"\364\006U@\006"
	.string	"5\006$"
	.string	"\006"
	.string	"<\006$"
	.string	"\006\2614\006$\300\006P4\006$\200\006"
	.string	")\006"
	.string	"\016\006"
	.string	"0\006$"
	.string	"\006I\265\006\300g\006"
	.string	""
	.string	"\006\200"
	.string	"\006"
	.string	"d\006\223D\006\t0\006"
	.string	"\020\006"
	.string	"(\006\325\037\006HD\006$"
	.string	"\006\202\261\006L\204\006\t0\006\001$\006BD\006\004\220\006\020\240\006\001\204\006"
	.string	"\301\006\302\022\006"
	.string	")\006\200%\006"
	.string	"4\006"
	.string	"$\006\232e\006A"
	.string	"\006\002a\006@0\006\022\361\006$"
	.string	"\006\022\376\006$"
	.string	"\006\276O\006"
	.string	"\021\006\002e\006$"
	.string	"\006\027"
	.string	"\006AB\006"
	.string	"(\006\211\033\006"
	.string	""
	.string	"\006\304"
	.string	"\006\202O\006\314\223\006\3616\006\007\230\006\3616\006\005\030\006\3606\006\003\230\006\0054\006\024\220\006\3636\006$"
	.string	"\006\3626\006\025\030\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\023\230\007\226\200\006\022>\006\003\270\006"
	.string	""
	.string	"\006\n\200\006"
	.string	""
	.string	"\006\303\001\0066\264\006\005\270\006"
	.string	""
	.string	"\006\305"
	.string	"\006Rc\006\0018\006"
	.string	"3\006$@\006"
	.string	"(\006Y)\006Zc\006$"
	.string	"\006\222A\006$"
	.string	"\006"
	.string	""
	.string	"\006\005\001\006"
	.string	"(\006X+\006\202\261\006\001,\006"
	.string	"(\006@+\006"
	.string	";\006$@\006ZE\006$"
	.string	"\006\022E\006$"
	.string	"\006"
	.string	""
	.string	"\006\005\026\006Za\006\001,\006"
	.string	""
	.string	"\006\001\026\006"
	.string	"(\006I+\006"
	.string	""
	.string	"\006\005\001\006"
	.string	";\006$@\006R\264\006\005\230\006"
	.string	""
	.string	"\006\201"
	.string	"\006"
	.string	"(\006\205,\006\206\270\006$"
	.string	"\006&C\006$"
	.string	"\006\022\264\006$"
	.string	"\006"
	.string	""
	.string	"\006A"
	.string	"\006"
	.string	"(\006\305-\006$\361\006$"
	.string	"\006&C\006$"
	.string	"\006\022\264\006$"
	.string	"\006"
	.string	""
	.string	"\006\001\002\006"
	.string	"(\006\005/\006$\361\006$"
	.string	"\006&C\006$"
	.string	"\006$\361\006$"
	.string	"\006&C\006$"
	.string	"\006\022\264\006$"
	.string	"\006\3606\006$@\006"
	.string	"(\006\0051\006\001"
	.string	"\006\n\200\006"
	.string	"(\006@1\0060`\006$"
	.string	"\0060@\006$"
	.string	"\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\003\230\007\307\200\006\021>\006\007\270\006\024>\006\0218\006\024>\006\023\270\006\023>\006\016\370\006\023>\006\nx\006\001"
	.string	"\006\n"
	.string	"\006\b"
	.string	"\006\323\037\006\004"
	.string	"\006\027\265\006\0047\006\006\200\006\201:\006$\200\006\001"
	.string	"\006\225\310\006\004?\006\006\224\006\214F\006\027D\006"
	.string	""
	.string	"\006Q"
	.string	"\006"
	.string	"(\006\2256\006\214\270\006\0018\006\234h\006\301\033\006"
	.string	"(\006@:\006\200\260\006\006\264\0060"
	.string	"\006\020"
	.string	"\006"
	.string	"0\006\0064\006\b"
	.string	"\006\006"
	.string	"\006`\260\006$"
	.string	"\006\021"
	.string	"\006\020\353\006"
	.string	"(\006\2058\006"
	.string	""
	.string	"\006\216\017\006\021"
	.string	"\006\020\373\006\217\277\006\t(\006"
	.string	"$\006N9\006\021\376\006\t(\006\037P\006\t(\006\276O\006$"
	.string	"\006\376\367\006\301\033\006\220h\006\007\274\006\3636\006\nX\006\3636\006\016\330\006\3646\006\023\230\006\3646\006\021\030\006"
	.string	" \006"
	.string	""
	.string	"\006\3616\006\007\230\006"
	.string	"*\006\016<\006\t0\006W8\006\024>\006\022\370\006\021>\006\021\270\006\002>\006$\200\006\001"
	.string	"\006\n"
	.string	"\006"
	.string	""
	.string	"\006\027&\006 "
	.string	"\006\322\377\0060"
	.string	"\006\321\007\006\0011\006\023\234\006\201;\006$\200\006\t0\006\023<\006\3626\006$\200\006\3616\006\021\230\006\3646\006\022\330\0060"
	.string	"\006\027\007\006"
	.string	"!\006"
	.string	""
	.string	"\006\005?\006\327\333\007\001\201\006\0236\006$"
	.string	"\006\022>\006\027\270\006\022>\006\0258\006\005>\006\024\270\00656\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006\020>\006\0018\006"
	.string	""
	.string	"\006\001@\006\020>\006\004\270\006"
	.string	""
	.string	"\006\002\002\006\021>\006\007x\006\004>\006\023\270\006\0234\006"
	.string	""
	.string	"\006\202\377\006$"
	.string	"\006\262H\006$"
	.string	"\006\200A\006A\200\006\"\241\006$"
	.string	"\006\020@\006$"
	.string	"\006"
	.string	""
	.string	"\006\001@\006\t0\006@0\006\t0\006@"
	.string	"\006\202\377\006$"
	.string	"\006\262H\006$"
	.string	"\006\200A\006\3013\006"
	.string	""
	.string	"\006\001\026\006\022`\006"
	.string	"\223\006"
	.string	"\364\006\022E\006"
	.string	"(\006\311H\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006"
	.string	""
	.string	"\006S4\006$"
	.string	"\006\360<\006$"
	.string	"\006\t0\006"
	.string	"\023\006"
	.string	"\364\006\022E\006\0209\006$"
	.string	"\00604\006$"
	.string	"\006\220@\006$"
	.string	"\006"
	.string	"(\006\300P\006\200\270\006"
	.string	")\006\0234\006\005"
	.string	"\006"
	.string	"4\006$"
	.string	"\006\220`\006$"
	.string	"\006\220`\006$"
	.string	"\006\020\260\006$"
	.string	"\006"
	.string	"@\006$"
	.string	"\006"
	.string	"@\006$"
	.string	"\006"
	.string	"h\006$"
	.string	"\006\n\245\006@\020\006\020\260\006$"
	.string	"\006\024`\006\001\020\006"
	.string	""
	.string	"\006\300\003\006"
	.string	"(\006\325M\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"4\006L@\006\n\265\006L\230\006\027"
	.string	"\006@B\006\020@\006\023E\006\210E\006\025@\006\0015\006\314\323\006"
	.string	")\006\200%\006\204G\006\300\223\006\0234\006$"
	.string	"\006"
	.string	"\364\006\022E\006\0209\006"
	.string	"0\006\3604\006$"
	.string	"\006\220`\006$"
	.string	"\006"
	.string	":\006L\020\006\3004\006$"
	.string	"\00604\006$@\006\024`\006$"
	.string	"\006"
	.string	""
	.string	"\006\301"
	.string	"\006"
	.string	"(\006\bJ\006"
	.string	""
	.string	"\006$"
	.string	"\006\3646\006\023\230\006\3616\006\007X\006\3606\006\004\230\006\3606\006\001\030\006\0054\006\024\220\006\3636\006$"
	.string	"\006\3626\006\025\030\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\027\230\007S\201\006\034"
	.string	"\006"
	.string	""
	.string	"\006\">\006\025\270\006\005>\006\024\270\006\0256\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006\020>\006\002x\006"
	.string	">\006\f\323\006\202\270\006B\020\00604\006$\300\006\302m\006$"
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006"
	.string	"(\006\211X\006\222H\006$"
	.string	"\006"
	.string	"(\006\300Y\006\034"
	.string	"\006"
	.string	""
	.string	"\006\302m\006$"
	.string	"\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\330Y\006\202M\006$"
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006\3606\006$\300\006\3606\006\002X\006\0054\006\024\220\006\3436\006$"
	.string	"\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\025\230\007m\201\006\022>\006\027\270\006\022>\006\0258\006\005>\006\024\270\006%6\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006\020>\006\0018\006\020>\006\003\270\006\021>\006\0058\006\024>\006\0218\0060"
	.ascii	"\006P\003\006\023>\006\016\370\006\003"
	.string	">\006LP\006"
	.string	"0\006$"
	.string	"\006\200@\006"
	.string	"3\006"
	.string	""
	.string	"\006\004"
	.string	"\006"
	.string	"(\006\005`\006"
	.string	""
	.string	"\006$"
	.string	"\006\001"
	.string	"\006\021\340\006\210\270\006"
	.string	"\244\00604\006$"
	.string	"\006\002d\006$"
	.string	"\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\030k\006"
	.string	""
	.string	"\006$"
	.string	"\006\220@\006$"
	.string	"\006"
	.string	"$\006\300j\006"
	.string	""
	.string	"\006$"
	.string	"\006?"
	.string	"\006\201\375\006\001"
	.string	"\006\020\340\006"
	.string	"2\006\002\300\006\246\376\006L\030\006\266H\006$"
	.string	"\006\026\255\006$"
	.string	"\006\020>\006$\200\006"
	.string	")\006\300T\006\020>\006$\300\006\212@\006L\220\006\020:\006\214\033\006\3604\006$"
	.string	"\006\200@\006$"
	.string	"\006\t"
	.string	"\006"
	.string	"\304\006"
	.string	"(\006\325j\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"e\006$"
	.string	"\006?"
	.string	"\006\301\377\006"
	.string	"(\006\330h\006\t0\006"
	.string	""
	.string	"\006\022`\006"
	.string	"\200\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\301h\006"
	.string	""
	.string	"\006$"
	.string	"\006\220`\006$"
	.string	"\006"
	.string	"(\006\300j\006\t0\006"
	.string	" \006\023"
	.string	"\006"
	.string	"\210\006R`\006$"
	.string	"\006="
	.string	"\006"
	.string	"\206\006"
	.string	"(\006\301j\006\t0\006\001"
	.string	"\006\202\377\006$"
	.string	"\006\262H\006$"
	.string	"\006\t0\006\001 \006\230d\006$"
	.string	"\006\3636\006$@\006\3636\006\016\330\006\3646\006\021\030\006\3616\006\005\030\006\3606\006\003\230\006\3606\006\001\030\006\0054\006\024\220\006\3636\006$"
	.string	"\006\3626\006\025\030\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\027\230\007\267\201\006\">\006\025\270\006\005>\006\024\270\006\0256\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006\020>\006\0048\006\024>\006\0218\006\001"
	.string	"\006Q\310\006\001"
	.string	"\006\020\310\006\004>\006\004\200\006\t0\006"
	.string	"\004\006\bd\006$"
	.string	"\006\210D\006$"
	.string	"\0060"
	.string	"\006R\002\006"
	.string	"(\006\330q\006\001"
	.string	"\006"
	.string	""
	.string	"\006\bD\006$"
	.string	"\006\001:\006$"
	.string	"\006\3646\006$\200\006\3646\006\021\030\006\3606\006\004\030\006\0054\006\024\220\006\3436\006$"
	.string	"\006"
	.string	" \006"
	.string	""
	.string	"\006\3626\006\025\230\007\317\201\006\004"
	.string	"\006\001"
	.string	"\0060"
	.string	"\006\222\002\006\001"
	.string	"\006\221F\0060"
	.string	"\006\020\003\0060"
	.string	"\006\023\007\006\005>\006\024\270\006E6\006$"
	.string	"\006"
	.string	""
	.string	"\006\n\200\006"
	.string	"0\006L\020\006\004"
	.string	"\006\020\265\006\220h\006"
	.string	"0\006\200\270\006"
	.string	"\260\006"
	.string	"9\006$"
	.string	"\006\001"
	.string	"\006Q\310\006"
	.string	":\006$"
	.string	"\0060"
	.string	"\006\022"
	.string	"\006"
	.string	"2\006$"
	.string	"\006\022\300\006$"
	.string	"\006\220h\006\001(\006\220h\006"
	.string	",\006"
	.string	";\006$"
	.string	"\006\001"
	.string	"\006"
	.string	""
	.string	"\006\004"
	.string	"\006\023\300\006\0048\006$\300\006\001"
	.string	"\006\020\340\006\200\270\006"
	.string	"\240\006\001"
	.string	"\006\220\310\006\t0\006"
	.string	" \006"
	.string	""
	.string	"\006P*\006\t0\006\020$\006\001"
	.string	"\006\021\310\006"
	.string	")\006\300m\006\t0\006\020$\006\3604\006$"
	.string	"\006\200@\006$"
	.string	"\006."
	.string	"\006\004\340\006"
	.string	"(\006\025~\006"
	.string	""
	.string	"\006\220(\006"
	.string	""
	.string	"\006"
	.string	"\003\006\0234\006$"
	.string	"\006\360<\006$"
	.string	"\006\212\270\006L\030\006"
	.string	">\006"
	.string	"x\006\006"
	.string	"\006"
	.string	""
	.string	"\006\t0\006\002"
	.string	"\006\324\377\006\205@\006\266H\006$"
	.string	"\006\312\377\006$"
	.string	"\006\266B\006$"
	.string	"\006"
	.string	")\006@\254\006\202\270\006$"
	.string	"\006\206L\006\300\233\006"
	.string	")\006@\254\006\202\261\006$"
	.string	"\006\004"
	.string	"\006\020\340\0060"
	.string	"\006\221\007\006"
	.string	"8\006L\030\006\222h\006@8\006\020)\006@\360\006\020>\006$@\006\3636\006L\020\006\3604\006$"
	.string	"\006\3009\006$"
	.string	"\006"
	.string	""
	.string	"\006@\b\0060"
	.string	"\006\322\007\006\030)\006@\311\006"
	.string	"9\006$"
	.string	"\006\001"
	.string	"\006Q\340\006\030)\006@\311\006\0236\006$"
	.string	"\006"
	.string	""
	.string	"\006\316\371\006\202\274\006$"
	.string	"\0060"
	.string	"\006\323\003\006"
	.string	"2\006@$\006"
	.string	";\006\301'\0060"
	.string	"\006\223\006\006"
	.string	""
	.string	"\006\300\016\006"
	.string	"$\006\216\211\006"
	.string	";\006$"
	.string	"\006\200\270\006\214\020\006"
	.string	"\364\006\020E\006"
	.string	")\006\3001\006\0236\006\2003\006\220h\006\214\020\006"
	.string	"\364\006\020E\006\023)\006\2008\006\3434\006L\030\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006\0216\006\001"
	.string	"\006P\340\006"
	.string	""
	.string	"\006A"
	.string	"\006#4\006$"
	.string	"\006\t0\006"
	.string	"\020\006\002\376\006$"
	.string	"\006\262H\006$"
	.string	"\006"
	.string	"\364\006\001@\006"
	.string	""
	.string	"\006"
	.string	""
	.string	"\006\340<\006@ \006"
	.string	"9\006\301#\006\210\270\006$"
	.string	"\006"
	.string	""
	.string	"\006\001\001\006\031)\006\200\004\006\0236\006$"
	.string	"\006\022`\006$"
	.string	"\006\001"
	.string	"\006R\340\006"
	.string	"(\006\310\214\006"
	.string	""
	.string	"\006$"
	.string	"\006\220h\006\214\020\006"
	.string	"\364\006\020E\006\023)\006\2008\006\3434\006L\030\006\001"
	.string	"\006\220\340\006#4\006\301\003\006\200A\006\021E\006\0236\006\201\023\006"
	.string	"a\006PD\006"
	.string	""
	.string	"\006A"
	.string	"\006\002\376\006"
	.string	"\244\006\t0\006F\b\006\t0\006\307\013\006\262O\006$"
	.string	"\006\t0\006@(\006"
	.string	")\006\3001\006\t0\006\301+\006\200@\006$"
	.string	"\006\001"
	.string	"\006\301F\006"
	.string	"(\006E\241\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006\0206\006BA\006"
	.string	"\204\006\222h\006U@\006"
	.string	"=\006L\030\006\001"
	.string	"\006\300F\006@@\006A8\006\001"
	.string	"\006\301F\006"
	.string	")\006@[\006"
	.string	"\364\006\022@\006BA\006\002"
	.string	"\006\224b\006U@\006"
	.string	""
	.string	"\006\001&\006\230d\006"
	.string	"\024\006\224B\006\002 \006\"A\006\314\233\006"
	.string	"\364\006U@\006"
	.string	""
	.string	"\006\001\b\006"
	.string	"=\006$"
	.string	"\006"
	.string	"0\006$"
	.string	"\006\022`\006$"
	.string	"\006"
	.string	""
	.string	"\006\001\370\006"
	.string	"(\006H\241\006"
	.string	""
	.string	"\006$"
	.string	"\006\031)\006\300\001\006\0236\006$"
	.string	"\006\022`\006$"
	.string	"\006\004"
	.string	"\006\022\340\006"
	.string	"(\006\311\234\006"
	.string	""
	.string	"\006\001\350\006"
	.string	"2\006L\030\006\220`\006$"
	.string	"\006\222h\006@8\006\020>\006$@\006\020)\006@\360\006"
	.string	""
	.string	"\006H\240\006"
	.string	""
	.string	"\006\001\350\006\031)\006\300\001\006\0236\006$"
	.string	"\006\022`\006L\230\006\004"
	.string	"\006\022\340\006"
	.string	"(\006\230\237\006\222h\006"
	.string	"\b\006\220@\006$"
	.string	"\006\020>\006$"
	.string	"\006\020>\006$@\006\020)\006@\360\006"
	.string	""
	.string	"\006H\240\006\020>\006$"
	.string	"\006\020)\006@\360\006\020>\006$@\006\023)\006"
	.string	"e\006\3636\006$"
	.string	"\006"
	.string	""
	.string	"\006"
	.string	""
	.string	"\006"
	.string	"8\006$"
	.string	"\006"
	.string	""
	.string	"\006@~\006"
	.string	"d\006$"
	.string	"\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\310\214\006"
	.string	""
	.string	"\006$"
	.string	"\006\001"
	.string	"\006\320F\006"
	.string	""
	.string	"\006C~\006\001"
	.string	"\006\323F\006"
	.string	"3\006L\230\006\001"
	.string	"\006\023\310\006\020>\006\021\214\006\020>\006\214\320\006"
	.string	"\364\006\022E\006"
	.string	")\006"
	.string	"\026\006\3434\006$"
	.string	"\006"
	.string	""
	.string	"\006\316\037\006"
	.string	"$\006N\251\006\3436\006$"
	.string	"\006\001"
	.string	"\006Q\310\006\001"
	.string	"\006\020\310\006\t0\006"
	.string	""
	.string	"\006\t0\006\001\004\006\024`\006$"
	.string	"\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\325\250\006"
	.string	""
	.string	"\006$"
	.string	"\0060"
	.string	"\006\023\002\006\t0\006\022"
	.string	"\006\t0\006"
	.string	"\b\006"
	.string	";\006$"
	.string	"\006\t0\006"
	.string	""
	.string	"\006\220`\006$"
	.string	"\006\t0\006"
	.string	" \006\001"
	.string	"\006A*\006\001"
	.string	"\006\020\310\006\0236\006"
	.string	""
	.string	"\006\024`\006$"
	.string	"\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\321\253\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	""
	.string	"\006Q*\006\t0\006\021 \006"
	.string	")\006\300m\006"
	.string	""
	.string	"\006\210\214\007\261\202\006\0236\006$"
	.string	"\006"
	.string	""
	.string	"\006 "
	.string	"\006\001>\006Dx\006\003>\006M\370\006\212\276\006\303@\006\326M\006\0168\006"
	.string	""
	.string	"\006\316\007\006"
	.string	"$\006\316\257\006\352\216\006$"
	.string	"\006\312n\006\303@\006"
	.string	""
	.string	"\006$"
	.string	"\006"
	.string	"(\006\301\257\006\326\215\006$"
	.string	"\006\312N\006\212B\006\352\216\006$"
	.string	"\006\3636\006$\200\006\202M\006\017\030\006\346\362\006\315\233\006"
	.string	" \006"
	.string	""
	.ascii	"\006"
	.ascii	"\3616\006\004X"
	.stabs	"__vs1002_patch_rom:G(0,17)=ar(0,7);0;4004;(0,13)",32,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
