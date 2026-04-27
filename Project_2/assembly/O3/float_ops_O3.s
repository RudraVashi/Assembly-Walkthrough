	.file	"float_ops.c"
	.text
	.p2align 4
	.globl	dot_product
	.def	dot_product;	.scl	2;	.type	32;	.endef
	.seh_proc	dot_product
dot_product:
	.seh_endprologue
	testl	%r8d, %r8d
	jle	.L7
	cmpl	$1, %r8d
	je	.L8
	movl	%r8d, %r9d
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	shrl	%r9d
	salq	$4, %r9
	.p2align 6
	.p2align 4
	.p2align 3
.L4:
	movupd	(%rcx,%rax), %xmm1
	movupd	(%rdx,%rax), %xmm3
	addq	$16, %rax
	mulpd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rax, %r9
	jne	.L4
	movl	%r8d, %eax
	andl	$-2, %eax
	andl	$1, %r8d
	je	.L1
.L3:
	cltq
	movsd	(%rdx,%rax,8), %xmm1
	mulsd	(%rcx,%rax,8), %xmm1
	addsd	%xmm1, %xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm0, %xmm0
	ret
.L8:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L3
	.seh_endproc
	.p2align 4
	.globl	running_average
	.def	running_average;	.scl	2;	.type	32;	.endef
	.seh_proc	running_average
running_average:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L17
	cmpl	$1, %edx
	je	.L18
	movl	%edx, %r8d
	movq	%rcx, %rax
	pxor	%xmm0, %xmm0
	shrl	%r8d
	salq	$4, %r8
	addq	%rcx, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L14:
	addsd	(%rax), %xmm0
	addq	$16, %rax
	addsd	-8(%rax), %xmm0
	cmpq	%rax, %r8
	jne	.L14
	movl	%edx, %eax
	andl	$-2, %eax
	testb	$1, %dl
	je	.L12
.L13:
	cltq
	addsd	(%rcx,%rax,8), %xmm0
.L12:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	ret
.L18:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L13
	.seh_endproc
	.p2align 4
	.globl	euclidean_norm
	.def	euclidean_norm;	.scl	2;	.type	32;	.endef
	.seh_proc	euclidean_norm
euclidean_norm:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L29
	cmpl	$1, %edx
	je	.L32
	movl	%edx, %r8d
	movq	%rcx, %rax
	pxor	%xmm0, %xmm0
	shrl	%r8d
	salq	$4, %r8
	addq	%rcx, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L24:
	movupd	(%rax), %xmm1
	addq	$16, %rax
	mulpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rax, %r8
	jne	.L24
	movl	%edx, %eax
	andl	$-2, %eax
	andl	$1, %edx
	je	.L25
	movsd	(%rcx,%rax,8), %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.L25:
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L31
.L23:
	sqrtsd	%xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	pxor	%xmm0, %xmm0
	ret
.L32:
	movsd	(%rcx), %xmm0
	pxor	%xmm1, %xmm1
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	jmp	.L23
.L31:
	jmp	sqrt
	.seh_endproc
	.p2align 4
	.globl	scale_accumulate
	.def	scale_accumulate;	.scl	2;	.type	32;	.endef
	.seh_proc	scale_accumulate
scale_accumulate:
	subq	$24, %rsp
	.seh_stackalloc	24
	movups	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	.seh_endprologue
	testl	%edx, %edx
	jle	.L39
	cmpl	$1, %edx
	je	.L40
	movl	%edx, %r8d
	movddup	%xmm2, %xmm6
	movddup	%xmm3, %xmm5
	movq	%rcx, %rax
	shrl	%r8d
	pxor	%xmm0, %xmm0
	salq	$4, %r8
	addq	%rcx, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L36:
	movupd	(%rax), %xmm1
	addq	$16, %rax
	mulpd	%xmm6, %xmm1
	addpd	%xmm5, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rax, %r8
	jne	.L36
	movl	%edx, %eax
	andl	$-2, %eax
	andl	$1, %edx
	je	.L33
.L35:
	cltq
	mulsd	(%rcx,%rax,8), %xmm2
	addsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
.L33:
	movups	(%rsp), %xmm6
	addq	$24, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	movups	(%rsp), %xmm6
	pxor	%xmm0, %xmm0
	addq	$24, %rsp
	ret
.L40:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L35
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "dot_product:       %.2f\12\0"
.LC2:
	.ascii "running_average:   %.2f\12\0"
.LC3:
	.ascii "euclidean_norm:    %.2f\12\0"
.LC4:
	.ascii "scale_accumulate:  %.2f\12\0"
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
	leaq	.LC1(%rip), %rcx
	movabsq	$4626322717216342016, %rdx
	movq	%rdx, %xmm1
	call	printf
	leaq	.LC2(%rip), %rcx
	movabsq	$4612811918334230528, %rdx
	movq	%rdx, %xmm1
	call	printf
	leaq	.LC3(%rip), %rcx
	movabsq	$4617852826192094607, %rdx
	movq	%rdx, %xmm1
	call	printf
	leaq	.LC4(%rip), %rcx
	movabsq	$4627448617123184640, %rdx
	movq	%rdx, %xmm1
	call	printf
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
