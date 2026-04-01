	.file	"func.c"
	.text
	.p2align 4
	.globl	add
	.def	add;	.scl	2;	.type	32;	.endef
	.seh_proc	add
add:
	.seh_endprologue
	leal	(%rcx,%rdx), %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	multiply
	.def	multiply;	.scl	2;	.type	32;	.endef
	.seh_proc	multiply
multiply:
	.seh_endprologue
	movl	%ecx, %eax
	imull	%edx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	compute
	.def	compute;	.scl	2;	.type	32;	.endef
	.seh_proc	compute
compute:
	.seh_endprologue
	leal	(%rcx,%rdx), %eax
	imull	%edx, %ecx
	addl	%ecx, %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC0(%rip), %rbx
	call	__main
	movq	%rbx, %rcx
	movl	$7, %edx
	call	printf
	movq	%rbx, %rcx
	movl	$12, %edx
	call	printf
	movl	$19, %edx
	movq	%rbx, %rcx
	call	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
