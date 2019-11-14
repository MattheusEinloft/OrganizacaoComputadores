# Exercise 3
# d = (a + b - c)

# Registers
# a = $s0
# b = $s1
# c = $s2
# d = $s3

# Input values
# a = 5
# b = 5
# c = 2

# Expected output
# d => 8

.text
	# loading value of "a" in $s0
	la $t0, addressA
	lw $s0, 0($t0)
	
	# loading value of "b" in $s1
	la $t0, addressB
	lw $s1, 0($t0)
	
	# loading value of "c" in $s2
	la $t0, addressC
	lw $s2, 0($t0)
	
	# calculating the sum "a + b" and storing the result in $t0
	add $t0, $s0, $s1
	
	# calculating the subtraction "(a + b) - c" and storing the result in $s3
	sub $s3, $t0, $s2
	
	# storing result in memory address of "d"
	la $t0, addressD
	sw $s3, 0($t0)


.data
addressA: .word 5		# address with the integer value of "a"
addressB: .word 5		# address with the integer value of "b"
addressC: .word 2		# address with the integer value of "c"
addressD: .space 4	# address with reserved space for "d"