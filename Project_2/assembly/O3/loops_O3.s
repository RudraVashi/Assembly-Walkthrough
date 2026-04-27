	.file	"loops.c"
	.text
	.p2align 4
	.globl	array_sum
	.def	array_sum;	.scl	2;	.type	32;	.endef
	.seh_proc	array_sum
array_sum:
	.seh_endprologue
	movq	%rcx, %r8
	testl	%edx, %edx
	jle	.L7
	leal	-1(%rdx), %eax
	cmpl	$2, %eax
	jbe	.L8
	movq	%rcx, %rax
	movl	%edx, %ecx
	pxor	%xmm0, %xmm0
	shrl	$2, %ecx
	salq	$4, %rcx
	addq	%r8, %rcx
	.p2align 5
	.p2align 4
	.p2align 3
.L4:
	movdqu	(%rax), %xmm2
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	cmpq	%rax, %rcx
	jne	.L4
	movdqa	%xmm0, %xmm1
	movl	%edx, %ecx
	psrldq	$8, %xmm1
	andl	$-4, %ecx
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	testb	$3, %dl
	je	.L1
.L3:
	movslq	%ecx, %r9
	leaq	0(,%r9,4), %r10
	addl	(%r8,%r9,4), %eax
	leal	1(%rcx), %r9d
	cmpl	%r9d, %edx
	jle	.L1
	addl	$2, %ecx
	addl	4(%r8,%r10), %eax
	cmpl	%ecx, %edx
	jle	.L1
	addl	8(%r8,%r10), %eax
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	ret
.L8:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L3
	.seh_endproc
	.p2align 4
	.globl	factorial
	.def	factorial;	.scl	2;	.type	32;	.endef
	.seh_proc	factorial
factorial:
	.seh_endprologue
	cmpl	$1, %ecx
	jle	.L14
	leal	1(%rcx), %r8d
	andl	$1, %ecx
	movl	$2, %eax
	movl	$1, %edx
	jne	.L13
	movl	$3, %eax
	movl	$2, %edx
	cmpl	%r8d, %eax
	je	.L11
	.p2align 5
	.p2align 4
	.p2align 3
.L13:
	imull	%eax, %edx
	leal	1(%rax), %ecx
	addl	$2, %eax
	imull	%ecx, %edx
	cmpl	%r8d, %eax
	jne	.L13
.L11:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$1, %edx
	movl	%edx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	loop_invariant
	.def	loop_invariant;	.scl	2;	.type	32;	.endef
	.seh_proc	loop_invariant
loop_invariant:
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movq	%rcx, %r10
	movl	%edx, %ecx
	testl	%edx, %edx
	jle	.L27
	imull	%r9d, %r8d
	leal	-1(%rdx), %eax
	cmpl	$2, %eax
	jbe	.L28
	shrl	$2, %edx
	movd	%r8d, %xmm3
	pxor	%xmm1, %xmm1
	movq	%r10, %rax
	salq	$4, %rdx
	pshufd	$0, %xmm3, %xmm2
	addq	%r10, %rdx
	.p2align 5
	.p2align 4
	.p2align 3
.L24:
	movdqu	(%rax), %xmm0
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	paddd	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L24
	movdqa	%xmm1, %xmm0
	movl	%ecx, %edx
	psrldq	$8, %xmm0
	andl	$-4, %edx
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	testb	$3, %cl
	je	.L21
.L23:
	movslq	%edx, %r9
	movl	(%r10,%r9,4), %ebx
	leaq	0(,%r9,4), %r11
	leal	1(%rdx), %r9d
	addl	%r8d, %ebx
	addl	%ebx, %eax
	cmpl	%r9d, %ecx
	jle	.L21
	movl	4(%r10,%r11), %r9d
	addl	$2, %edx
	addl	%r8d, %r9d
	addl	%r9d, %eax
	cmpl	%edx, %ecx
	jle	.L21
	addl	8(%r10,%r11), %r8d
	addl	%r8d, %eax
.L21:
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	xorl	%eax, %eax
	popq	%rbx
	ret
.L28:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.L23
	.seh_endproc
	.p2align 4
	.globl	linear_search
	.def	linear_search;	.scl	2;	.type	32;	.endef
	.seh_proc	linear_search
linear_search:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L34
	movslq	%edx, %rdx
	xorl	%eax, %eax
	jmp	.L33
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$1, %rax
	cmpq	%rax, %rdx
	je	.L34
.L33:
	cmpl	%r8d, (%rcx,%rax,4)
	jne	.L36
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	movl	$-1, %eax
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "array_sum:      %d\12\0"
.LC1:
	.ascii "factorial(10):  %ld\12\0"
.LC2:
	.ascii "loop_invariant: %d\12\0"
.LC3:
	.ascii "linear_search:  %d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movl	$36, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$3628800, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$132, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$5, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
