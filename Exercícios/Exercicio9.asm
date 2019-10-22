# Exercise 9
# while(save[i] == k) {
#   i += 1;
# }

# Registers
# save = $s0
# i = $s1
# k = $s2
# save[i] = $s3

# Input values
# save = {5, 5, 5, 4, 3}
# i = 0
# k = 5

.text
	# loading the address of "save"
	la $s0, addressSave

	# loading values to "i" and "k"
	li $s1, 0		# i = 0
	li $s2, 5		# k = 5
	
	# ---------------------------------------- #
	
loop:
	# calculating the address of "save[i]" and storing in $t0
	add $t0, $s1, $s1		# 2i
	add $t0, $t0, $t0		# 4i
	add $t0, $t0, $s0		# 4i + save
	
	# loading value of "save[i]"
	lw $s3, 0($t0)
	
	bne $s3, $s2, exit
	
	addi $s1, $s1, 1
	
	j loop
	
exit:
	li $v0, 10
	syscall

.data
addressSave: .word 5, 5, 5, 4, 3