	.file	"float_ops.c"
	.text
	.globl	dot_product
	.def	dot_product;	.scl	2;	.type	32;	.endef
	.seh_proc	dot_product
dot_product:
	.seh_endprologue
	testl	%r8d, %r8d
	jle	.L4
	movslq	%r8d, %r8
	salq	$3, %r8
	movl	$0, %eax
	pxor	%xmm1, %xmm1
	.p2align 5
.L3:
	movsd	(%rcx,%rax), %xmm0
	mulsd	(%rdx,%rax), %xmm0
	addsd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%r8, %rax
	jne	.L3
.L1:
	movapd	%xmm1, %xmm0
	ret
.L4:
	pxor	%xmm1, %xmm1
	jmp	.L1
	.seh_endproc
	.globl	running_average
	.def	running_average;	.scl	2;	.type	32;	.endef
	.seh_proc	running_average
running_average:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L9
	movq	%rcx, %rax
	movslq	%edx, %r8
	leaq	(%rcx,%r8,8), %rcx
	pxor	%xmm0, %xmm0
	.p2align 4
.L8:
	addsd	(%rax), %xmm0
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L8
.L7:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	ret
.L9:
	pxor	%xmm0, %xmm0
	jmp	.L7
	.seh_endproc
	.globl	euclidean_norm
	.def	euclidean_norm;	.scl	2;	.type	32;	.endef
	.seh_proc	euclidean_norm
euclidean_norm:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	testl	%edx, %edx
	jle	.L17
	movq	%rcx, %rax
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,8), %rdx
	pxor	%xmm0, %xmm0
	.p2align 5
.L13:
	movsd	(%rax), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L13
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L20
.L12:
	sqrtsd	%xmm0, %xmm0
.L11:
	addq	$40, %rsp
	ret
.L17:
	pxor	%xmm0, %xmm0
	jmp	.L12
.L20:
	call	sqrt
	jmp	.L11
	.seh_endproc
	.globl	scale_accumulate
	.def	scale_accumulate;	.scl	2;	.type	32;	.endef
	.seh_proc	scale_accumulate
scale_accumulate:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L24
	movq	%rcx, %rax
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,8), %rdx
	pxor	%xmm1, %xmm1
	.p2align 5
.L23:
	movapd	%xmm2, %xmm0
	mulsd	(%rax), %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L23
.L21:
	movapd	%xmm1, %xmm0
	ret
.L24:
	pxor	%xmm1, %xmm1
	jmp	.L21
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
	pushq	%rbx
	.seh_pushreg	%rbx
	addq	$-128, %rsp
	.seh_stackalloc	128
	movups	%xmm6, 96(%rsp)
	.seh_savexmm	%xmm6, 96
	movups	%xmm7, 112(%rsp)
	.seh_savexmm	%xmm7, 112
	.seh_endprologue
	call	__main
	movsd	.LC1(%rip), %xmm7
	movsd	%xmm7, 64(%rsp)
	movsd	.LC2(%rip), %xmm6
	movsd	%xmm6, 72(%rsp)
	movsd	.LC3(%rip), %xmm0
	movsd	%xmm0, 80(%rsp)
	movsd	.LC4(%rip), %xmm1
	movsd	%xmm1, 88(%rsp)
	movsd	%xmm1, 32(%rsp)
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm6, 48(%rsp)
	movsd	%xmm7, 56(%rsp)
	leaq	32(%rsp), %rdx
	leaq	64(%rsp), %rbx
	movl	$4, %r8d
	movq	%rbx, %rcx
	call	dot_product
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC5(%rip), %rcx
	call	printf
	movl	$4, %edx
	movq	%rbx, %rcx
	call	running_average
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC6(%rip), %rcx
	call	printf
	movl	$4, %edx
	movq	%rbx, %rcx
	call	euclidean_norm
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC7(%rip), %rcx
	call	printf
	movapd	%xmm7, %xmm3
	movapd	%xmm6, %xmm2
	movl	$4, %edx
	movq	%rbx, %rcx
	call	scale_accumulate
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC8(%rip), %rcx
	call	printf
	movl	$0, %eax
	movups	96(%rsp), %xmm6
	movups	112(%rsp), %xmm7
	subq	$-128, %rsp
	popq	%rbx
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
