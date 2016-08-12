	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
	.extern printf
main:
	pushq	%rbp
	movq	%rsp, %rbp

	call 	print_hello

	# use r15 for counter
	xorq 	%r15, %r15
	# run to 15
	movq 	$15, %r12


loop:	
	inc 	%r15
	movq	%r15, %r11

	# compare mod 3
testthree:
	xor 	%rdx, %rdx
	movq 	%r15, %rax
	movq 	$0x3, %r13
	div 	%r13
	movq	%rdx, %r14
	cmpq 	$0, %rdx
	jne 	testfive
	call 	print_fizz

testfive:
	xor 	%rdx, %rdx
	movq 	%r15, %rax
	movq 	$0x5, %r13
	div 	%r13
	cmpq 	$0, %rdx
	jne 	failed
	call 	print_buzz
	call	print_nl
	jmp	end_loop

failed:
	cmpq	$0, %r14
	jne	neither
	call	print_nl
	jmp	end_loop
	

neither:
	movq	%r15, %r11
	call 	print_number

end_loop:
	cmp 	%r12, %r15
	jl 	loop

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

print_number:

        pushq   %rbp
        movq    %rsp, %rbp

	# hello print	
	movq %r11, %rsi
	movq $number_format, %rdi
	call printf

        popq    %rbp
        ret
        .size   print_number, . - print_number
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

number_format:
	.asciz "%d\n"
