	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp

	call print_hello

	# use r10 for counter, init to 1
	movq $0x1, %r10	

	call print_fizz
	call print_nl
	call print_buzz
	call print_nl
	call print_fizz
	call print_buzz
	call print_nl

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

print_nl:
        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq	$1, %rax
	movq	$1, %rdi
	movq	$nl_msg, %rsi
	movq	$nl_len, %rdx
	syscall

        popq    %rbp
        ret
        .size   print_nl, . - print_nl
        .globl  main
        .type   main, @function


	.data

hello_msg:
	.ascii	"Hello Assembler\n"	
	hello_len = . - hello_msg

fizz_msg:
	.ascii	"Fizz"	
	fizz_len = . - fizz_msg

buzz_msg:
	.ascii	"Buzz"	
	buzz_len = . - buzz_msg

nl_msg:
	.ascii	"\n"	
	nl_len = . - nl_msg
