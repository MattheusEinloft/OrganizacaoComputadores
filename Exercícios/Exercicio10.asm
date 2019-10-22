# Exercise 10
# switch(i) {
#   case 0:
#     a[i] = a[i] - 1;
#     break;
#   case 1:
#     a[i] = a[i] + 1;
#     break;
#   case 2:
#     a[i] = a[i] - 10;
#     break;
# };

# Registers
# 0 = $t0
# 1 = $t1
# 2 = $t2

# i = $s0
# a = $s1

# Input values
# a = {0, 1, 2}
# i = 1

.text
	# loading integer values
	li $t0, 0
	li $t1, 1
	li $t2, 2
	
	# loading input values
	la $s1, addressA
	li $s0, 1		# i = 1
	
	# ---------------------------------------- #
	
	beq $s0, $t0, L0
	
	beq $s0, $t1, L1
	
	beq $s0, $t2, L2
	
	j exit
	
L0:
	# loading address of a[i] in $t3
	add $t3, $s0, $s0		# 2i
	add $t3, $t3, $t3		# 4i
	add $t3, $t3, $s1		# 4i + a
	
	# loading value of a[i] in $t4
	lw $t4, 0($t3)		# a[i]
	
	# calculating the subtraction (a[i] - 1) and storing the result in a[i] ($t4)
	subi $t4, $t4, 1
	
	# storing result in memory address of a[i]
	sw $t4, 0($t3)
	
	j exit
	
L1:
	# loading address of a[i] in $t3
	add $t3, $s0, $s0		# 2i
	add $t3, $t3, $t3		# 4i
	add $t3, $t3, $s1		# 4i + a
	
	# loading value of a[i] in $t4
	lw $t4, 0($t3)		# a[i]
	
	# calculating the sum (a[i] + 1) and storing the result in a[i] ($t4)
	addi $t4, $t4, 1
	
	# storing result in memory address of a[i]
	sw $t4, 0($t3)
	
	j exit
	
L2:
	# loading address of a[i] in $t3
	add $t3, $s0, $s0		# 2i
	add $t3, $t3, $t3		# 4i
	add $t3, $t3, $s1		# 4i + a
	
	# loading value of a[i] in $t4
	lw $t4, 0($t3)		# a[i]
	
	# calculating the subtraction (a[i] - 10) and storing the result in a[i] ($t4)
	subi $t4, $t4, 10
	
	# storing result in memory address of a[i]
	sw $t4, 0($t3)
	
	j exit
	
	
exit:
	li $v0, 10
	syscall
	

.data
addressA: .word 0, 1, 2