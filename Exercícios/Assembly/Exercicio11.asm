# Exercise 11
# int exemplo ( int g, int h, int i, int j) {
#   int f;
#   f = ( g + h ) - ( i + j );
#   return f;
# }

# Registers
# $a0 = g
# $a1 = h
# $a2 = i
# $a3 = j

# $s0 = f

.text

main:
	# loading values to "g", "h", "i" and "j"
	li $a0, 8
	li $a1, 2
	li $a2, 3
	li $a3, 3

	jal exemplo
	
	# copying the return value of "exemplo" to $t0
	add $t0, $v0, $zero
	
	# printing the return value of "exemplo"
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# ending program
	li $v0, 10
	syscall
	
exemplo:
	# reserving space in the stack for 3 temporary registers
	addi $sp, $sp, -12	# 3 * 4 = 12
	
	# saving old values in the stack
	sw $t1, 8($sp)
	sw $t0, 4($sp)
	sw $s0, 0($sp)
	
	# calculating the sum (g + h) and storing the result in $t0
	add $t0, $a0, $a1
	
	# calculating the sum (i + j) and storing the result in $t1
	add $t1, $a2, $a3
	
	# calculating the subtraction (g+h) - (i+j) and storing the result in "f" ($s0)
	sub $s0, $t0, $t1
	
	# adding the result to $v0, the return register
	add $v0, $s0, $zero
	
	# restoring values from the stack
	lw $s0, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	
	# unstacking of the stack
	addi $sp, $sp, 12

	jr $ra