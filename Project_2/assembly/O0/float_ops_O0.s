	.file	"float_ops.c"
	.text
	.globl	dot_product
	.def	dot_product;	.scl	2;	.type	32;	.endef
	.seh_proc	dot_product
dot_product:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L3:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L3
	movsd	-8(%rbp), %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	running_average
	.def	running_average;	.scl	2;	.type	32;	.endef
	.seh_proc	running_average
running_average:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L6
.L7:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L6:
	movl	-12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L7
	pxor	%xmm1, %xmm1
	cvtsi2sdl	24(%rbp), %xmm1
	movsd	-8(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	euclidean_norm
	.def	euclidean_norm;	.scl	2;	.type	32;	.endef
	.seh_proc	euclidean_norm
euclidean_norm:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L10
.L11:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L10:
	movl	-12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L11
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	scale_accumulate
	.def	scale_accumulate;	.scl	2;	.type	32;	.endef
	.seh_proc	scale_accumulate
scale_accumulate:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movsd	%xmm2, 32(%rbp)
	movsd	%xmm3, 40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L14
.L15:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	32(%rbp), %xmm0
	addsd	40(%rbp), %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L14:
	movl	-12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L15
	movsd	-8(%rbp), %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "dot_product:       %.2f\12\0"
.LC6:
	.ascii "running_average:   %.2f\12\0"
.LC7:
	.ascii "euclidean_norm:    %.2f\12\0"
.LC8:
	.ascii "scale_accumulate:  %.2f\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	call	__main
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	.LC4(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$4, %r8d
	movq	%rax, %rcx
	call	dot_product
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movl	$4, %edx
	movq	%rax, %rcx
	call	running_average
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movl	$4, %edx
	movq	%rax, %rcx
	call	euclidean_norm
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movsd	.LC1(%rip), %xmm1
	movsd	.LC2(%rip), %xmm0
	leaq	-32(%rbp), %rax
	movapd	%xmm1, %xmm3
	movapd	%xmm0, %xmm2
	movl	$4, %edx
	movq	%rax, %rcx
	call	scale_accumulate
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	0
	.long	1074266112
	.align 8
.LC4:
	.long	0
	.long	1074790400
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
