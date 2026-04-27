	.file	"float_ops.c"
	.text
	.p2align 4
	.globl	dot_product
	.def	dot_product;	.scl	2;	.type	32;	.endef
	.seh_proc	dot_product
dot_product:
	.seh_endprologue
	testl	%r8d, %r8d
	jle	.L4
	movslq	%r8d, %r8
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	salq	$3, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	movsd	(%rcx,%rax), %xmm0
	mulsd	(%rdx,%rax), %xmm0
	addq	$8, %rax
	addsd	%xmm0, %xmm1
	cmpq	%rax, %r8
	jne	.L3
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.seh_endproc
	.p2align 4
	.globl	running_average
	.def	running_average;	.scl	2;	.type	32;	.endef
	.seh_proc	running_average
running_average:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L10
	movslq	%edx, %r8
	pxor	%xmm0, %xmm0
	leaq	(%rcx,%r8,8), %rax
	andl	$1, %r8d
	je	.L9
	addsd	(%rcx), %xmm0
	addq	$8, %rcx
	cmpq	%rax, %rcx
	je	.L8
	.p2align 5
	.p2align 4
	.p2align 3
.L9:
	addsd	(%rcx), %xmm0
	addq	$16, %rcx
	addsd	-8(%rcx), %xmm0
	cmpq	%rax, %rcx
	jne	.L9
.L8:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	ret
	.seh_endproc
	.p2align 4
	.globl	euclidean_norm
	.def	euclidean_norm;	.scl	2;	.type	32;	.endef
	.seh_proc	euclidean_norm
euclidean_norm:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L23
	movslq	%edx, %rdx
	pxor	%xmm0, %xmm0
	leaq	(%rcx,%rdx,8), %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L19:
	movsd	(%rcx), %xmm1
	addq	$8, %rcx
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rcx, %rax
	jne	.L19
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L26
	sqrtsd	%xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	pxor	%xmm0, %xmm0
	ret
.L26:
	jmp	sqrt
	.seh_endproc
	.p2align 4
	.globl	scale_accumulate
	.def	scale_accumulate;	.scl	2;	.type	32;	.endef
	.seh_proc	scale_accumulate
scale_accumulate:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L30
	movslq	%edx, %rdx
	pxor	%xmm1, %xmm1
	leaq	(%rcx,%rdx,8), %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L29:
	movsd	(%rcx), %xmm0
	addq	$8, %rcx
	mulsd	%xmm2, %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rcx, %rax
	jne	.L29
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "dot_product:       %.2f\12\0"
.LC4:
	.ascii "running_average:   %.2f\12\0"
.LC5:
	.ascii "euclidean_norm:    %.2f\12\0"
.LC6:
	.ascii "scale_accumulate:  %.2f\12\0"
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
	movupd	.LC1(%rip), %xmm0
	movsd	.LC7(%rip), %xmm1
	movabsq	$0x4034000000000000, %rdx
	leaq	.LC3(%rip), %rcx
	movups	%xmm0, 32(%rsp)
	movupd	.LC2(%rip), %xmm0
	movups	%xmm0, 48(%rsp)
	call	printf
	movsd	.LC8(%rip), %xmm1
	movabsq	$0x4004000000000000, %rdx
	leaq	.LC4(%rip), %rcx
	call	printf
	leaq	32(%rsp), %rcx
	movl	$4, %edx
	call	euclidean_norm
	leaq	.LC5(%rip), %rcx
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	call	printf
	movsd	.LC9(%rip), %xmm1
	movabsq	$0x4038000000000000, %rdx
	leaq	.LC6(%rip), %rcx
	call	printf
	xorl	%eax, %eax
	addq	$72, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC1:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.align 16
.LC2:
	.long	0
	.long	1074266112
	.long	0
	.long	1074790400
	.align 8
.LC7:
	.long	0
	.long	1077149696
	.align 8
.LC8:
	.long	0
	.long	1074003968
	.align 8
.LC9:
	.long	0
	.long	1077411840
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
