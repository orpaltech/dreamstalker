	.file	"diskio.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/fatfs/diskio.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
	.stabs	"disk_status:F(0,1)=(0,2)=(0,3)=r(0,3);0;255;",36,0,0,disk_status
	.stabs	"DSTATUS:t(0,1)",128,0,0,0
	.stabs	"BYTE:t(0,2)",128,0,0,0
	.stabs	"unsigned char:t(0,3)",128,0,0,0
	.stabs	"pdrv:P(0,2)",64,0,0,24
.global	disk_status
	.type	disk_status, @function
disk_status:
	.stabn	68,0,27,.LM0-.LFBB1
.LM0:
.LFBB1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,28,.LM1-.LFBB1
.LM1:
	cpse r24,__zero_reg__
	rjmp .L2
	.stabn	68,0,35,.LM2-.LFBB1
.LM2:
	jmp mmc_disk_status
.L2:
	.stabn	68,0,39,.LM3-.LFBB1
.LM3:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	disk_status, .-disk_status
.Lscope1:
	.stabs	"disk_initialize:F(0,1)",36,0,0,disk_initialize
	.stabs	"pdrv:P(0,2)",64,0,0,24
.global	disk_initialize
	.type	disk_initialize, @function
disk_initialize:
	.stabn	68,0,50,.LM4-.LFBB2
.LM4:
.LFBB2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,51,.LM5-.LFBB2
.LM5:
	cpse r24,__zero_reg__
	rjmp .L4
	.stabn	68,0,58,.LM6-.LFBB2
.LM6:
	jmp mmc_disk_initialize
.L4:
	.stabn	68,0,62,.LM7-.LFBB2
.LM7:
	ldi r24,lo8(1)
/* epilogue start */
	ret
	.size	disk_initialize, .-disk_initialize
.Lscope2:
	.stabs	"disk_read:F(0,4)=(0,5)=eRES_OK:0,RES_ERROR:1,RES_WRPRT:2,RES_NOTRDY:3,RES_PARERR:4,;",36,0,0,disk_read
	.stabs	" :T(0,5)",128,0,0,0
	.stabs	"pdrv:P(0,2)",64,0,0,24
.global	disk_read
	.type	disk_read, @function
disk_read:
	.stabn	68,0,76,.LM8-.LFBB3
.LM8:
.LFBB3:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r30,r24
	movw r24,r22
	movw r22,r20
	movw r20,r18
	movw r18,r16
	.stabn	68,0,77,.LM9-.LFBB3
.LM9:
	cpse r30,__zero_reg__
	rjmp .L6
/* epilogue start */
	.stabn	68,0,88,.LM10-.LFBB3
.LM10:
	pop r17
	pop r16
	.stabn	68,0,84,.LM11-.LFBB3
.LM11:
	jmp mmc_disk_read
.L6:
	.stabn	68,0,88,.LM12-.LFBB3
.LM12:
	ldi r24,lo8(4)
	ldi r25,0
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	disk_read, .-disk_read
.Lscope3:
	.stabs	"disk_write:F(0,4)",36,0,0,disk_write
	.stabs	"pdrv:P(0,2)",64,0,0,24
.global	disk_write
	.type	disk_write, @function
disk_write:
	.stabn	68,0,103,.LM13-.LFBB4
.LM13:
.LFBB4:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r30,r24
	movw r24,r22
	movw r22,r20
	movw r20,r18
	movw r18,r16
	.stabn	68,0,104,.LM14-.LFBB4
.LM14:
	cpse r30,__zero_reg__
	rjmp .L8
/* epilogue start */
	.stabn	68,0,115,.LM15-.LFBB4
.LM15:
	pop r17
	pop r16
	.stabn	68,0,111,.LM16-.LFBB4
.LM16:
	jmp mmc_disk_write
.L8:
	.stabn	68,0,115,.LM17-.LFBB4
.LM17:
	ldi r24,lo8(4)
	ldi r25,0
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	disk_write, .-disk_write
.Lscope4:
	.stabs	"disk_ioctl:F(0,4)",36,0,0,disk_ioctl
	.stabs	"pdrv:P(0,2)",64,0,0,24
	.stabs	"cmd:P(0,2)",64,0,0,24
.global	disk_ioctl
	.type	disk_ioctl, @function
disk_ioctl:
	.stabn	68,0,129,.LM18-.LFBB5
.LM18:
.LFBB5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r25,r24
	mov r24,r22
	movw r22,r20
	.stabn	68,0,130,.LM19-.LFBB5
.LM19:
	cpse r25,__zero_reg__
	rjmp .L10
	.stabn	68,0,137,.LM20-.LFBB5
.LM20:
	jmp mmc_disk_ioctl
.L10:
	.stabn	68,0,141,.LM21-.LFBB5
.LM21:
	ldi r24,lo8(4)
	ldi r25,0
/* epilogue start */
	ret
	.size	disk_ioctl, .-disk_ioctl
.Lscope5:
	.stabs	"disk_timerproc:F(0,6)=(0,6)",36,0,0,disk_timerproc
	.stabs	"void:t(0,6)",128,0,0,0
.global	disk_timerproc
	.type	disk_timerproc, @function
disk_timerproc:
	.stabn	68,0,151,.LM22-.LFBB6
.LM22:
.LFBB6:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.stabn	68,0,156,.LM23-.LFBB6
.LM23:
	jmp mmc_disk_timerproc
	.size	disk_timerproc, .-disk_timerproc
.Lscope6:
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
