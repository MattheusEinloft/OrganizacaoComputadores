# Exercise 1
# a = b - c

# Registers
# a = $s0
# b = $s1
# c = $s2

# Input values
# b = 3
# c = 2

# Expected output
# a => 1

.text
	# loading value of "b" in $s1
	la $t0, addressB
	lw $s1, 0($t0)
	
	# loading value of "c" in $s2
	la $t0, addressC
	lw $s2, 0($t0)
	
	# calculating the subtraction "b - c" and storing the result in $s0
	sub $s0, $s1, $s2
	
	# storing result in the memory address of "a"
	la $t0, addressA
	sw $s0, 0($t0)
	

.data
addressA: .space 4		# address with reserved space for "a"
addressB: .word 3			# address with the integer value of "b"
addressC: .word 2			# address with the integer value of "c"
