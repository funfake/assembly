	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -Og -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64	
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 16
# main.c:5:     printf("%s\n", myName());
	mov	eax, 0	#,
	call	myName@PLT	#
	mov	rdi, rax	# _1, tmp85
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:112:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	puts@PLT	#
# main.c:7: }
	mov	eax, 0	#,
	add	rsp, 8	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
