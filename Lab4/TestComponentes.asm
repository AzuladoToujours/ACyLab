addi $s7, $zero, 8192

addi $s0, $zero, 1 

	sw $s0,  0($s7)
	addi $s7, $s7, 4 
		
addi $s1, $zero, 2

	sw $s1,  0($s7)
	addi $s7, $s7, 4 
	
add $s2, $s0, $s1 

	sw $s2,  0($s7)
	addi $s7, $s7, 4 
	
and $s3, $s0, $s0

	sw $s2,  0($s7)
	addi $s7, $s7, 4 

or $s4, $s1, $s2

	sw $s4,  0($s7)
	addi $s7, $s7, 4 
	
slt $s5, $s2, $s0	
	
	sw $s5,  0($s7)
	addi $s7, $s7, 4 
	
slt $s5, $s0, $s2

	sw $s5,  0($s7)
	addi $s7, $s7, 4 
	
nor $s6, $s2, $s1 

	sw $s6,  0($s7)
	addi $s7, $s7, 4 
	
sub $s3, $s2, $s1 

	sw $s3,  0($s7)
	addi $s7, $s7, 4 
