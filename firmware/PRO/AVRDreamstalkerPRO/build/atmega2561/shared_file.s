	.file	"shared_file.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.stabs	"src/shared_file.c",100,0,2,.Ltext0
	.text
.Ltext0:
	.stabs	"gcc2_compiled.",60,0,0,0
.global	brw
	.section .bss
	.type	brw, @object
	.size	brw, 2
brw:
	.zero	2
	.stabs	"brw:G(0,1)=(0,2)=r(0,2);0;65535;",32,0,0,0
	.stabs	"UINT:t(0,1)",128,0,0,0
	.stabs	"unsigned int:t(0,2)",128,0,0,0
.global	shared_fp
	.type	shared_fp, @object
	.size	shared_fp, 34
shared_fp:
	.zero	34
	.stabs	"shared_fp:G(0,3)=(0,4)=s34obj:(0,5)=(0,6)=s14fs:(0,7)=*(0,8)=(0,9)=s559fs_type:(0,10)=(0,11)=r(0,11);0;255;,0,8;pdrv:(0,10),8,8;n_fats:(0,10),16,8;wflag:(0,10),24,8;fsi_flag:(0,10),32,8;id:(0,12)=(0,13)=(0,2),40,16;n_rootdir:(0,12),56,16;csize:(0,12),72,16;last_clst:(0,14)=(0,15)=(0,16)=r(0,16);0;4294967295;,88,32;free_clst:(0,14),120,32;n_fatent:(0,14),152,32;fsize:(0,14),184,32;volbase:(0,17)=(0,14),216,32;fatbase:(0,17),248,32;dirbase:(0,17),280,32;database:(0,17),312,32;winsect:(0,17),344,32;win:(0,18)=ar(0,19)=r(0,19);0;65535;;0;511;(0,10),376,4096;;,0,16;id:(0,12),16,16;attr:(0,10),32,8;stat:(0,10),40,8;sclust:(0,14),48,32;objsize:(0,20)=(0,14),80,32;;,0,112;flag:(0,10),112,8;err:(0,10),120,8;fptr:(0,20),128,32;clust:(0,14),160,32;sect:(0,17),192,32;dir_sect:(0,17),224,32;dir_ptr:(0,21)=*(0,10),256,16;;",32,0,0,0
	.stabs	"FIL:t(0,3)",128,0,0,0
	.stabs	"BYTE:t(0,10)",128,0,0,0
	.stabs	"unsigned char:t(0,11)",128,0,0,0
	.stabs	"WORD:t(0,12)",128,0,0,0
	.stabs	"uint16_t:t(0,13)",128,0,0,0
	.stabs	"DWORD:t(0,14)",128,0,0,0
	.stabs	"uint32_t:t(0,15)",128,0,0,0
	.stabs	"long unsigned int:t(0,16)",128,0,0,0
	.stabs	"LBA_t:t(0,17)",128,0,0,0
	.stabs	"FSIZE_t:t(0,20)",128,0,0,0
	.text
	.stabs	"",100,0,0,.Letext0
.Letext0:
	.ident	"GCC: (GNU) 11.1.0"
.global __do_clear_bss
