.data
Vector: .word 100, 1, 2, 3, 4, 5, 101, 6, 7, 8, 9, 10, 102, 11, 12, 13, 14, 15, 103, 16, 17, 18, 19, 20, 104
mayoresFila: .space 100
menoresFila: .space 100



.text

addi $s0, $zero,5 #n
addi $t0, $zero, 0 #offset
addi $t1, $t1 ,0 # Contador i
addi $t8, $t8,0 #Contador aumentaFila
la $a0, Vector	#Carga del vector precargado en $a0
addi $t2, $t2, 0 #Mayor 
lw $t7, ($a0) #Menor
la $s1,mayoresFila #Carga del vector de mayoresFila en $s1
la $s2,menoresFila #Carga del vector de mayoresFila en $s2
addi $s3, $s3, 1

revisarFilas: 
beq $t1, $s0, aumentaFila 	#Si i es igual a n, salga
add $t3, $t0, $a0 		#calcular posicion de lectura offset+posicion inicial del vector
lw $t4, 0($t3)			#Carga del número alojado en la dirección $a0 en $t3 (Vector[i])
slt $t5, $t2, $t4		#Sí Mayor es menor al Vector[i] ($t2 < $t4)
slt $t9, $t4, $t7		#Sí Vector[i] es menor al Menor ($t4 < $t7)
beq $t5, $s3, cambiarMayor	#Sí $t5 es 1, cambiar mayor.
beq $t9, $s3, cambiarMenor

seguirCiclo:
addi $t0, $t0,4 		#Actualizar posicion de Offset
addi $t1, $t1,1 		#Actualizar i.
j revisarFilas

cambiarMayor:
addi $t2, $t4, 0	#Cambiar a Mayor($t2) por el valor actual($t4)
j seguirCiclo

cambiarMenor:
addi $t7, $t4, 0	#Cambiar a Menor($t7) por el valor actual($t4)
j seguirCiclo


aumentaFila:
sw $t2, ($s1)		#Llevarle el valor del mayor que está en $t2 al vector mayoresFila alojado en $s1
addi $s1,$s1,4 		#Avanzar en el vector mayoresFila
sw $t7, ($s2)		#Llevarle el valor del menor que está en $t7 al vector menoresFila alojado en $s2
addi $s2,$s2,4 		#Avanzar en el vector menoresFila
addi $t8, $t8, 1	#Aumenta la llamada de aumentaFila
beq $t8, $s0, final	#Si aumentaFila fue llamado cinco veces, dirijase a mayorColumna
addi $t1, $zero ,0 	#Reiniciar contador
addi $t2, $zero, 0 	#Reiniciar mayor
lw $t7, 4($t3)		#Colocar menor en la primera posición de la siguiente fila
j revisarFilas


final:
