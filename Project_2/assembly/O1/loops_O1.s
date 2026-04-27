	.file	"loops.c"
	.text
	.globl	array_sum
	.def	array_sum;	.scl	2;	.type	32;	.endef
	.seh_proc	array_sum
array_sum:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L4
	movq	%rcx, %rax
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,4), %rcx
	movl	$0, %edx
	.p2align 4
.L3:
	addl	(%rax), %edx
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L3
.L1:
	movl	%edx, %eax
	ret
.L4:
	movl	$0, %edx
	jmp	.L1
	.seh_endproc
	.globl	factorial
	.def	factorial;	.scl	2;	.type	32;	.endef
	.seh_proc	factorial
factorial:
	.seh_endprologue
	cmpl	$1, %ecx
	jle	.L9
	addl	$1, %ecx
	movl	$2, %eax
	movl	$1, %edx
	.p2align 4
.L8:
	imull	%eax, %edx
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L8
.L6:
	movl	%edx, %eax
	ret
.L9:
	movl	$1, %edx
	jmp	.L6
	.seh_endproc
	.globl	loop_invariant
	.def	loop_invariant;	.scl	2;	.type	32;	.endef
	.seh_proc	loop_invariant
loop_invariant:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L14
	imull	%r9d, %r8d
	movq	%rcx, %rax
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx,4), %r9
	movl	$0, %edx
	.p2align 4
.L13:
	movl	%r8d, %ecx
	addl	(%rax), %ecx
	addl	%ecx, %edx
	addq	$4, %rax
	cmpq	%r9, %rax
	jne	.L13
.L11:
	movl	%edx, %eax
	ret
.L14:
	movl	$0, %edx
	jmp	.L11
	.seh_endproc
	.globl	linear_search
	.def	linear_search;	.scl	2;	.type	32;	.endef
	.seh_proc	linear_search
linear_search:
	.seh_endprologue
	testl	%edx, %edx
	jle	.L20
	movslq	%edx, %rdx
	movl	$0, %eax
	.p2align 4
.L19:
	cmpl	%r8d, (%rcx,%rax,4)
	je	.L16
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L19
	movl	$-1, %eax
.L16:
	ret
.L20:
	movl	$-1, %eax
	jmp	.L16
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
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movl	$1, 32(%rsp)
	movl	$2, 36(%rsp)
	movl	$3, 40(%rsp)
	movl	$4, 44(%rsp)
	movl	$5, 48(%rsp)
	movl	$6, 52(%rsp)
	movl	$7, 56(%rsp)
	movl	$8, 60(%rsp)
	leaq	32(%rsp), %rbx
	movl	$8, %edx
	movq	%rbx, %rcx
	call	array_sum
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$10, %ecx
	call	factorial
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$4, %r9d
	movl	$3, %r8d
	movl	$8, %edx
	movq	%rbx, %rcx
	call	loop_invariant
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$6, %r8d
	movl	$8, %edx
	movq	%rbx, %rcx
	call	linear_search
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
