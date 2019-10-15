# Exercise 6
# if (x == y) go to L2
# a[1] = b - c;
# b = a[2] + c;
# c = b + c[3];
# L2: a[4] = a[6] + a[5]

# Registers
# a = $s0
# b = $s1
# c = $s2
# x = $s3
# y = $s4

# Input values - Test 1 (x == y)
# x = 1; y = 1
# a[6] = 6
# a[5] = 5

# Expected output - Test 1
# a[4] => 11

# Input values - Test 2 (x != y)
# x = 1; y = 2
# b = 4
# c = 1
# a[2] = 2
# c[3] = 3

# Expected output - Test 2
# a[1] => 3
# b => 5
# c => 8

.text
	# loading value of "x" in $s3
	la $t0, addressX
	lw $s3, 0($t0)
	
	# loading value of "y" in $s4
	la $t0, addressY
	lw $s4, 0($t0)
	
	# comparing "x" and "y": if equal, jump to "L2"
	beq $s3, $s4, L2
	
	# if not equal, the following instructions will be executed:
	
	# loading value of "b" in $s1
	la $t0, addressB
	lw $s1, 0($t0)
	
	# loading value of "c" in $s2
	la $t0, addressC
	lw $s2, 0($t0)
	
	# calculating the subtraction "b - c" and storing the result in $s0
	sub $s0, $s1, $s2
	
	# storing result in memory address of "a[1]"
	la $t0, addressA
	sw $s0, 4($t0)		# 1 * 4 = 4
	
	# loading value of "a[2]" in $s0
	la $t0, addressA
	lw $s0, 8($t0)		# 2 * 4 = 8
	
	# calculating the sum "a[2] + c" and storing the result in $s1
	add $s1, $s0, $s2
	
	# loading value of "c[3]" in $t1
	la $t0, addressC
	lw $t1, 12($t0)		# 3 * 4 = 12
	
	# calculating the sum "b + c[3]" and storing the result in $s2
	add $s2, $s1, $t1
	
L2:
	la $t0, addressA
	
	# loading value of "a[6]" in $t1
	lw $t1, 24($t0)
	
	# loading value of "a[5]" in $t2
	lw $t2, 20($t0)
	
	# calculating the sum "a[6] + a[5]" and storing the result in $s0
	add $s0, $t1, $t2
	
	# storing result in memory address of "a[4]"
	sw $s0, 16($t0)

.data
addressA: .word 0, 1, 2,	# address of the array "a"
		    3, 4, 5,
		    6
addressB: .word 4			# address with the integer value of "b"
addressC: .word 1, 1, 2, 3	# address of the array "c"
addressX: .word 1			# address with the integer value of "x"
addressY: .word 2			# address with the integer value of "y"