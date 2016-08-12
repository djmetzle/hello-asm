	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp

	call print_hello
	call print_fizz
	call print_buzz

	popq	%rbp
	ret
	.size	main, .-main

print_hello:
        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$hello_msg, %rsi
	movq	$hello_len, %rdx
	syscall

        popq    %rbp
        ret
        .size   print_hello, .-print_hello
        .globl  main
        .type   main, @function

print_fizz:
        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$fizz_msg, %rsi
	movq	$fizz_len, %rdx
	syscall

        popq    %rbp
        ret
        .size   print_fizz, . - print_fizz
        .globl  main
        .type   main, @function

print_buzz:
        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$buzz_msg, %rsi
	movq	$buzz_len, %rdx
	syscall

        popq    %rbp
        ret
        .size   print_buzz, . - print_buzz
        .globl  main
        .type   main, @function

	.data

hello_msg:
	.ascii	"Hello Assembler\n"	
	hello_len = . - hello_msg

fizz_msg:
	.ascii	"Fizz\n"	
	fizz_len = . - fizz_msg

buzz_msg:
	.ascii	"Buzz\n"	
	buzz_len = . - buzz_msg

