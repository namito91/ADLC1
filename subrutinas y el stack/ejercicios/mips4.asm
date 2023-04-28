# 2. Implementa una subrutina en ensamblador, tal que dado un vector de
# enteros de dimensión n obtenga el elemento (i) de dicho vector. La
# subrutina tendrá como parámetros de entrada: la dirección del vector, la
# dimensión del mismo y el índice del elemento a devolver. La subrutina
# devolverá el elemento i-ésimo. Realiza la llamada y el retorno a la
# subrutina según el convenio establecido.


.data 

vector: .word 5,6,2,1,7
n:      .word 5
i:      .word 3

 
.text
main:

la $a0 , vector
lw $a1 , n
lw $a2 , i

addi $sp , $sp , -4
sw   $ra , 0($sp)
addi $sp , $sp , -4 
sw   $a0 , 0($sp)
addi $sp , $sp , -4   
sw   $a1 , 0($sp)
addi $sp , $sp , -4
sw   $a2 , 0($sp)
addi $sp , $sp , -4
sw   $v0 , 0($sp)



jal i_esimo

ret:
addi $sp , $sp , 4
lw $ra , 0($sp)
jr $ra

            
i_esimo:      

lw   $t0 ,  0($sp)     # v0                
addi $sp , $sp , 4
lw   $t1 , 0($sp)     # i
addi $sp , $sp , 4
lw   $t2 , 0($sp)     # n
addi $sp , $sp , 4
lw   $t3 , 0($sp)     # direcc. vector

 


while:

beq  $t1 , 1 ,  end
addi $t3 , $t3 , 4
addi $t1 , $t1 , -1

j while
        
end:
lw $v0 , 0($t3)
jr $ra




