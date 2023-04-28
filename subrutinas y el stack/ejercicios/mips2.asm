# b) Implementa la subrutina de forma que todos los parámetros se
#    pasen por referencia y a través de registros.

.data
vector:   .word  6,2,8,11,9
n:        .word  5 
elemento: .word  11
contador: .space 4
 
 
.text
main:
la $a0, vector
la $a1, n
la $a2, elemento

addi $sp ,$sp,-4
sw   $ra ,0($sp)   #apilar $ra

jal counter
 
ret:
sw   $v0, contador($0)
lw   $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

  
counter:
# lw   $t0, ($a0)    # direccion del vector
lw   $t1, ($a1)    # direccion del dato "tamaño"
lw   $t2, ($a2)    # direccion del elemento a comparar
and  $v0, $v0, $0  


while:
beq  $t1 , 0 , end
lw   $t3 , 0($a0)
bne  $t3 , $t2 , else
addi $v0 , $v0 , 1

else:
addi $a0 , $a0, 4
addi $t1 , $t1, -1
j while

end:
jr $ra


