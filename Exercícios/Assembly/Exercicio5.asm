# Exercise 5
# b = a[5] + c[3]

# Registers
# a = $s0
# b = $s1
# c = $s2

# Input values
# a[5] = 5
# c[3] = 3

# Expected output
# b => 8

.text
	# loading value of "a[5]" in $s0
	la $t0, addressA
	lw $s0, 20($t0)		# 5 * 4 = 20
	
	# loading value of "c[3]" in $s2
	la $t0, addressC
	lw $s2, 12($t0)		# 3 * 4 = 12
	
	# calculating the sum "a[5] + c[3]" and storing the result in $s1
	add $s1, $s0, $s2
	
	# storing result in memory address of "b"
	la $t0, addressB
	sw $s1, 0($t0)

.data
addressA: .word 0, 1, 2,	# address of the array "a"
		    3, 4, 5	
addressB: .space 4		# address with reserved space for "b"
addressC: .word 0, 1, 2,	# address of the array "c"
		    3