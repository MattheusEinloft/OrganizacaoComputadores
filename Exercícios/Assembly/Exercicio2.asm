# Exercise 2
# b = a + c

# Registers
# a = $s0
# b = $s1
# c = $s2

# Input values
# a = 1
# c = 2

# Expected output
# b => 3

.text
	# loading value of "a" in $s0
	la $t0, addressA
	lw $s0, 0($t0)
	
	# loading value of "c" in $s2
	la $t0, addressC
	lw $s2, 0($t0)
	
	# calculating the sum "a + c" and storing the result in $s1
	add $s1, $s0, $s2
	
	# storing result in the memory address of "b"
	la $t0, addressB
	sw $s1, 0($t0)
	

.data
addressA: .word 1		# address with the integer value of "a"
addressB: .space 4	# address with reserved space for "b"
addressC: .word 2		# address with the integer value of "c"