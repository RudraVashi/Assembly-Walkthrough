	.file	"loops.c"
	.text
	.p2align 4
	.globl	array_sum
	.def	array_sum;	.scl	2;	.type	32;	.endef
	.seh_proc	array_sum
array_sum:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L4
	movslq	%edx, %rdx
	xorl	%eax, %eax
	leaq	(%rcx,%rdx,4), %rdx
	.p2align 4
	.p2align 4
	.p2align 3
.L3:
	addl	(%rcx), %eax
	addq	$4, %rcx
	cmpq	%rdx, %rcx
	jne	.L3
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	factorial
	.def	factorial;	.scl	2;	.type	32;	.endef
	.seh_proc	factorial
factorial:
	.seh_endprologue
	cmpl	$1, %ecx
	jle	.L10
	leal	1(%rcx), %r8d
	andl	$1, %ecx
	movl	$2, %eax
	movl	$1, %edx
	jne	.L9
	movl	$3, %eax
	movl	$2, %edx
	cmpl	%r8d, %eax
	je	.L7
	.p2align 5
	.p2align 4
	.p2align 3
.L9:
	imull	%eax, %edx
	leal	1(%rax), %ecx
	addl	$2, %eax
	imull	%ecx, %edx
	cmpl	%r8d, %eax
	jne	.L9
.L7:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movl	$1, %edx
	movl	%edx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	loop_invariant
	.def	loop_invariant;	.scl	2;	.type	32;	.endef
	.seh_proc	loop_invariant
loop_invariant:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L20
	movslq	%edx, %rdx
	imull	%r9d, %r8d
	xorl	%eax, %eax
	leaq	(%rcx,%rdx,4), %r9
	.p2align 4
	.p2align 4
	.p2align 3
.L19:
	movl	(%rcx), %edx
	addq	$4, %rcx
	addl	%r8d, %edx
	addl	%edx, %eax
	cmpq	%r9, %rcx
	jne	.L19
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	xorl	%eax, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	linear_search
	.def	linear_search;	.scl	2;	.type	32;	.endef
	.seh_proc	linear_search
linear_search:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L26
	movslq	%edx, %rdx
	xorl	%eax, %eax
	jmp	.L25
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L28:
	addq	$1, %rax
	cmpq	%rax, %rdx
	je	.L26
.L25:
	cmpl	%r8d, (%rcx,%rax,4)
	jne	.L28
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	movl	$-1, %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "array_sum:      %d\12\0"
.LC3:
	.ascii "factorial(10):  %ld\12\0"
.LC4:
	.ascii "loop_invariant: %d\12\0"
.LC5:
	.ascii "linear_search:  %d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	call	__main
	movdqu	.LC0(%rip), %xmm0
	movl	$36, %edx
	leaq	.LC2(%rip), %rcx
	movups	%xmm0, 32(%rsp)
	movdqu	.LC1(%rip), %xmm0
	movups	%xmm0, 48(%rsp)
	call	printf
	movl	$2, %eax
	movl	$1, %edx
.L30:
	imull	%eax, %edx
	leal	1(%rax), %ecx
	addl	$2, %eax
	imull	%ecx, %edx
	imull	%eax, %edx
	leal	2(%rcx), %eax
	cmpl	$9, %ecx
	jne	.L30
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$132, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	xorl	%edx, %edx
	leaq	32(%rsp), %rax
	.p2align 4
	.p2align 4
	.p2align 3
.L32:
	cmpl	$6, (%rax,%rdx,4)
	je	.L33
	addq	$1, %rdx
	cmpq	$8, %rdx
	jne	.L32
	orl	$-1, %edx
.L33:
	leaq	.LC5(%rip), %rcx
	call	printf
	xorl	%eax, %eax
	addq	$72, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC1:
	.long	5
	.long	6
	.long	7
	.long	8
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
