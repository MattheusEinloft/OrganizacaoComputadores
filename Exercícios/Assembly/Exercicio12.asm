# Exercise 12
# main() {
#   n1 = 10;
#   n2 = 15;
#   printf(soma(n1,n2));
# }
# 
# int soma ( int n1, int n2) {
#   return ( n1 + n2 );
# }

# Registers
# n1 = $s0
# n2 = $s1

.text
.globl main

main:
	li $a0, 10
	li $a1, 15
	
	# reserving space in the stack for 2 registers
	addi $sp, $sp, -8		# 2 * 4 = 8
	
	# saving the values in the stack
	sw $a0, 4($sp)
	sw $a1, 0($sp)
	
	jal soma
	
	add $a0, $v0, $zero
	
	# printing result
	li $v0, 1
	add $a0, $a0, $zero
	syscall
	
	# restoring values from the stack
	lw $a1, 0($sp)
	lw $a0, 4($sp)
	
	# freeing space in the stack
	addi $sp, $sp, 8		# 2 * 4 = 8

	# ending program
	li $v0, 10
	syscall
	
soma:
	# calculating the sum (n1 + n2) and storing the result in $t0
	add $t0, $a0, $a1
	
	add $v0, $t0, $zero
	
	jr $ra