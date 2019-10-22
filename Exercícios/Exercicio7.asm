# Exercise 7
# if ( a == b ) {
#   c = a + b;
#   a = b - c;
# }
# else {
#   b = a + c;
#   c = b - c;
# }

# Registers
# a = $s0
# b = $s1
# c = $s2

# Input values - (a == b)
# a = 5
# b = 5
# c = 2

# Expected output - (a == b)
# a = -5
# b = 5
# c = 10

# Input values - (a != b)
# a = 5
# b = 4
# c = 3

# Expected output - (a != b)
# a = 5
# b = 8
# c = 5

.text

	# setting values to "a", "b" and "c"
	li $s0, 5		# a = 5
	li $s1, 5		# b = 5
	li $s2, 2		# c = 2
	
	# ---------------------------------------- #
	
	bne $s0, $s1, else
	
	# calculating the sum (a + b) and storing in "c" ($s2)
	add $s2, $s0, $s1
	
	# calculating the subtraction (b - c) and storing in "a" ($s0)
	sub $s0, $s1, $s2
	
	j exit
	
else:
	# calculating the sum (a + c) and storing in "b" ($s1)
	add $s1, $s0, $s2
	
	# calculating the subtraction (b - c) and storing in "c" ($s2)
	sub $s2, $s1, $s2
	
exit:
	li $v0, 10
	syscall
