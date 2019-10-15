# Exercise 4
# a = b[15] - c

# Registers
# a = $s0
# b = $s1
# c = $s2

# Input values
# b[15] = 15
# c = 12

# Expected output
# a => 3

.text
	# loading value of "b[15]" in $s1
	la $t0, addressB
	lw $s1, 60($t0)		# 15 * 4 = 60
	
	# loading value of "c" in $s2
	la $t0, addressC
	lw $s2, 0($t0)
	
	# calculating the subtraction "b[15] - c" and storing the result in $s0
	sub $s0, $s1, $s2
	
	# storing result in memory address of "a"
	la $t0, addressA
	sw $s0, 0($t0)

.data
addressA: .space 4		# address with reserved space for "a"
addressB: .word 0, 1, 2,	# address of the array "b"
		    3, 4, 5,
		    6, 7, 8,
		    9, 10, 11,
		    12, 13, 14,
		    15
addressC: .word 12		# address with the integer value of "c"