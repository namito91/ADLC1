# c) Implementa la subrutina donde los parámetros que se pasan sean
#   del mismo tipo que en el caso a) pero utilizando la pila como lugar para
#   realizar el paso de parámetros.


.data
vector:   .word  6,2,8,11,9
n:        .word  5 
elemento: .word  11
contador: .space 4


.text
main:
la $a0, vector
lw $a1, n
lw $a2, elemento

addi $sp ,$sp,-4
sw   $a0 ,0($sp)   #apilar direccion vector
addi $sp ,$sp,-4
sw   $a1 ,0($sp)   #apilar n
addi $sp ,$sp,-4
sw   $a2 ,0($sp)   #apilar elemento

addi $sp ,$sp,-4
sw   $ra ,0($sp)   #apilar $ra

jal counter

ret:
sw   $v0, contador($0)
lw   $ra, 0($sp)
addi $sp, $sp, 4
jr $ra


counter:
addi $sp ,$sp,4
lw   $a2 ,0($sp)   # desapilar elemento
addi $sp ,$sp,4
sw   $a1 ,0($sp)   # desapilar n
addi $sp ,$sp,4
sw   $a0 ,0($sp)   # desapilar direccion vector

and  $v0, $v0, $0


while:
beq  $a1 , 0 , end
lw   $t0 , 0($a0)
bne  $t0 , $a2 , else
addi $v0 , $v0 , 1

else:
addi $a0 , $a0, 4
addi $a1 , $a1, -1
j while

end:
jr $ra