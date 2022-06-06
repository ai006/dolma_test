	.file	"control_mem_dtlb_store.c"
	.text
	.globl	array1_size
	.data
	.align 4
	.type	array1_size, @object
	.size	array1_size, 4
array1_size:
	.long	256
	.comm	unused1,64,32
	.globl	array1
	.bss
	.align 32
	.type	array1, @object
	.size	array1, 256
array1:
	.zero	256
	.comm	unused2,64,32
	.comm	array2,1048576,32
	.comm	unused3,64,32
	.comm	array3,1048576,32
	.globl	secret
	.section	.rodata
.LC0:
	.string	"*"
	.section	.data.rel.local,"aw"
	.align 8
	.type	secret, @object
	.size	secret, 8
secret:
	.quad	.LC0
	.globl	temp
	.bss
	.type	temp, @object
	.size	temp, 1
temp:
	.zero	1
	.text
	.globl	readMemoryByte
	.type	readMemoryByte, @function
readMemoryByte:
.LFB4262:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -2168(%rbp)
	movq	%rsi, -2176(%rbp)
	movq	%rdx, -2184(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -2148(%rbp)
	movl	$0, -2136(%rbp)
	jmp	.L2
.L3:
	movl	-2136(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25734(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-2136(%rbp), %eax
	cltq
	movq	$0, -2080(%rbp,%rax,8)
	addl	$1, -2136(%rbp)
.L2:
	cmpl	$255, -2136(%rbp)
	jle	.L3
	movl	$0, -2136(%rbp)
	jmp	.L4
.L16:
	movl	$1, -2140(%rbp)
	jmp	.L5
.L13:
	movl	-2140(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, -2112(%rbp)
	movl	$6, -2132(%rbp)
	jmp	.L6
.L12:
	movl	$0, -2128(%rbp)
	jmp	.L7
.L8:
	movzbl	temp(%rip), %edx
	movl	-2128(%rbp), %eax
	cltq
	leaq	array3(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	addl	$1, -2128(%rbp)
.L7:
	cmpl	$63, -2128(%rbp)
	jle	.L8
	clflush	array1_size(%rip)
	movl	$0, -2144(%rbp)
	jmp	.L9
.L10:
	movl	-2144(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2144(%rbp)
.L9:
	movl	-2144(%rbp), %eax
	cmpl	$99, %eax
	jle	.L10
	movl	-2132(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movq	%rax, %rdx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	-1(%rdx), %eax
	movw	$0, %ax
	cltq
	movq	%rax, -2104(%rbp)
	movq	-2104(%rbp), %rax
	shrq	$16, %rax
	orq	%rax, -2104(%rbp)
	movq	-2168(%rbp), %rax
	xorq	-2112(%rbp), %rax
	andq	-2104(%rbp), %rax
	xorq	-2112(%rbp), %rax
	movq	%rax, -2104(%rbp)
	movl	array1_size(%rip), %eax
	movl	%eax, %eax
	cmpq	%rax, -2104(%rbp)
	movq	-2104(%rbp), %rax
	jnb	.L11
	leaq	array1(%rip), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$12, %eax
	cltq
	leaq	array2(%rip), %rdx
	movb	$0, (%rax,%rdx)
.L11:
	subl	$1, -2132(%rbp)
.L6:
	cmpl	$0, -2132(%rbp)
	jns	.L12
	subl	$1, -2140(%rbp)
.L5:
	cmpl	$0, -2140(%rbp)
	jg	.L13
	movl	$0, %esi
	movl	$42, %edi
	call	m5_work_begin@PLT
	movl	-2136(%rbp), %eax
	sall	$12, %eax
	cltq
	leaq	array2(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -2120(%rbp)
	leaq	-2148(%rbp), %rax
	movq	%rax, -2088(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2088(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %rbx
	movq	-2120(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -2148(%rbp)
	leaq	-2148(%rbp), %rax
	movq	%rax, -2096(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2096(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%rbx, %rax
	movq	%rax, %rbx
	movl	-2136(%rbp), %eax
	cltq
	movq	-2080(%rbp,%rax,8), %rax
	leaq	(%rbx,%rax), %rdx
	movl	-2136(%rbp), %eax
	cltq
	movq	%rdx, -2080(%rbp,%rax,8)
	movl	$0, %esi
	movl	$43, %edi
	call	m5_work_begin@PLT
	addl	$1, -2136(%rbp)
.L4:
	cmpl	$255, -2136(%rbp)
	jle	.L16
	movl	results.25734(%rip), %edx
	movl	-2148(%rbp), %eax
	xorl	%edx, %eax
	movl	%eax, results.25734(%rip)
	movl	-2132(%rbp), %eax
	movl	%eax, %edx
	movq	-2176(%rbp), %rax
	movb	%dl, (%rax)
	movl	-2132(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25734(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-2184(%rbp), %rax
	movl	%edx, (%rax)
	movq	-2176(%rbp), %rax
	addq	$1, %rax
	movl	-2124(%rbp), %edx
	movb	%dl, (%rax)
	movq	-2184(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-2124(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.25734(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%eax, (%rdx)
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	addq	$2184, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4262:
	.size	readMemoryByte, .-readMemoryByte
	.section	.rodata
.LC1:
	.string	"%p"
.LC2:
	.string	"%d"
.LC3:
	.string	"array2[%i * STEP_SIZE] @ %p\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4263:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	secret(%rip), %rax
	leaq	array1(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movl	$1, -40(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L19
.L20:
	movl	-36(%rbp), %eax
	cltq
	leaq	array2(%rip), %rdx
	movb	$1, (%rax,%rdx)
	addl	$1, -36(%rbp)
.L19:
	movl	-36(%rbp), %eax
	cmpl	$1048575, %eax
	jbe	.L20
	cmpl	$3, -52(%rbp)
	jne	.L21
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movq	-32(%rbp), %rax
	leaq	array1(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-40(%rbp), %rdx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
.L21:
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	leaq	-20(%rbp), %rdx
	leaq	-10(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	readMemoryByte
	movl	$0, -36(%rbp)
	jmp	.L22
.L23:
	movl	-36(%rbp), %eax
	sall	$12, %eax
	cltq
	leaq	array2(%rip), %rdx
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -36(%rbp)
.L22:
	cmpl	$255, -36(%rbp)
	jle	.L23
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4263:
	.size	main, .-main
	.local	results.25734
	.comm	results.25734,1024,32
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
