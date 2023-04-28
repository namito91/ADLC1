# 1. Implementa una subrutina en ensamblador que calcule cuántos elementos
# de un vector de enteros de dimensión n son iguales a un elemento dado:

# a) Implementa la subrutina de forma que todos los parámetros que
#   se le pasan sean por valor excepto aquéllos que obligatoriamente se
#   deban pasar por referencia, y a través de registros.

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
sw   $ra ,0($sp)   #apilar $ra

jal counter

ret:
sw   $v0, contador($0)
lw   $ra, 0($sp)
addi $sp, $sp, 4
jr $ra


counter:
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






