	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$hello_msg, %rsi
	movq	$len, %rdx
	syscall

	popq	%rbp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 5.3.1 20160406 (Red Hat 5.3.1-6)"
	.section	.note.GNU-stack,"",@progbits

	.data
hello_msg:
	.ascii	"Hello Assembler\n"	
	len = . - hello_msg
