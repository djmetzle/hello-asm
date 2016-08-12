	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp

	call func

	popq	%rbp
	ret
	.size	main, .-main

func:
        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$hello_msg, %rsi
	movq	$len, %rdx
	syscall

        popq    %rbp
        ret
        .size   func, .-func
        .globl  main
        .type   main, @function


	.data

hello_msg:
	.ascii	"Hello Assembler\n"	
	len = . - hello_msg

