.data
	newLine: .asciiz "\n"
	addition: .asciiz "The addition result is: "
	subtraction: .asciiz "The subtraction result is: "
	multiplication: .asciiz "The multiplication result is: "
	division: .asciiz "The division result is: "
	prompt_first_input: .asciiz "Please enter the first integer: \n"
	prompt_second_input: .asciiz "Please enter the second integer: \n"
	div_warning: .asciiz "You cannot divide by zero. Please enter an integer greater than 0. \n"
	program_title: .asciiz "Integer Calculation by Cyrus Lomibao \nNOTE: Only use small numbers in multiplication and division\n\n"
.text
	main:

	#PROGRAM TITLE
	li $v0, 4
	la $a0, program_title
	syscall

	#TAKING THE INPUT FROM USER
	#Prompt for first integer
	li $v0, 4
	la $a0, prompt_first_input
	syscall
	
	#Take first input from user
	li $v0, 5	
	syscall
	
	#Store first input to $t0
	move $t0, $v0

	#Prompt for second integer
	li $v0, 4
	la $a0, prompt_second_input
	syscall
	
	#Take second input from user
	li $v0, 5
	syscall
	
	#Store second input to $t1
	move $t1, $v0
	
	#Enter new line
	li $v0, 4
	la $a0, newLine
	syscall	
	
	#PERFORM ARITHMETIC INSTRUCTIONS AND DISPLAY RESULTS
	#Perform addition
	add $t2, $t0, $t1
	
	#Display addition
	li $v0, 4
	la $a0, addition
	syscall
	
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	#Enter new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Perform subtraction
	sub $t3, $t0, $t1
	
	#Display subtraction
	li $v0, 4
	la $a0, subtraction
	syscall
	
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
	#Enter new line	
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Perform multiplication
	mul $t4, $t0, $t1
			
	#Display multiplication
	li $v0, 4
	la $a0, multiplication
	syscall
	
	li $v0, 1
	add $a0, $zero, $t4
	syscall
	
	#Enter new line	
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Perform division
	beq $t1, $zero, display_div 
	div $t5, $t0, $t1
	
	#Display division
	li $v0, 4
	la $a0, division
	syscall
	
	li $v0, 1
	add $a0, $zero, $t5
	syscall
	
	bne $t5, $zero, continue_div
	display_div:
	#Display warning when dividing by 0
	li $v0, 4
	la $a0, division
	syscall		
	
	
	li $v0, 4
	la $a0, div_warning
	syscall
	
	
	continue_div:
	#Enter new line	
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Finish program
	li $v0, 10
	syscall
	
