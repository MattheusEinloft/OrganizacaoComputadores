# Exercise 8
# g = h + a[i]

# Registers
# g = $s0
# h = $s1
# a = $s2
# i = $s3

.text
	# setting values to "h" and "i"
	li $s1, 5		# h = 5
	li $s3, 2		# i = 2
	
	# loading the address of "a"
	la $s2, addressA
	
	# ---------------------------------------- #

	# calculating the address of "a[i]" and storing in $t0
	add $t0, $s3, $s3		# i + i = 2i
	add $t0, $t0, $t0		# 2i + 2i = 4i
	add $t0, $t0, $s2		# 4i + a
	
	# loading the value of "a[i]" in $t1
	lw $t1, 0($t0)
	
	# calculating the sum (h + a[i]) and storing the result in "g" ($s0)
	add $s0, $s1, $t1
	
.data
addressA: .word 0, 1, 2, 3