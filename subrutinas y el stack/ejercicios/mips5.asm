# 3. Implementa una subrutina en ensamblador, tal que dada una matriz de
#    enteros de dimensión n x m, almacenada por filas, obtenga el elemento (i,j)
#    de dicha matriz. La subrutina tendrá como parámetros de entrada: la
#    dirección de la matriz, las dimensiones de la misma y los índices del
#    elemento a devolver. La subrutina devolverá el elemento (i,j). Realiza la
#    llamada y el retorno a la subrutina según el convenio establecido.


.data 

matrix:   .word 13,1,6
          .word 4,2,8         

ij:       .word 5


indicei:  .word 2 
indicej:  .word 3

elemento: .space 4


.text
main:

la $a0 , matrix
lw $a1 , ij
lw $a2 , indicei
lw $a3 , indicej


addi $sp , $sp , -4
sw   $ra , 0($sp)

addi $sp , $sp , -4
sw   $a0 , 0($sp)
addi $sp , $sp , -4
sw   $a1 , 0($sp)
addi $sp , $sp , -4
sw   $a2 , 0($sp)
addi $sp , $sp , -4
sw   $a3 , 0($sp)

and  $v0, $v0, $0      


jal ij_esimo


ret:
sw   $v0 , elemento($0)
lw   $ra , 0($sp)
addi $sp , $sp , 4
jr $ra


ij_esimo:
lw   $t3 , 0($sp)    # indicej
addi $sp , $sp , 4   
lw   $t2 , 0($sp)    # indicei
addi $sp , $sp , 4
lw   $t1 , 0($sp)    # ij
addi $sp , $sp , 4
lw   $t0 , 0($sp)    # direcc matriz
addi $sp , $sp , 4

addi $t4 , $t4 , 0    # contador

add  $t2 , $t2 , $t3  # suma de i j , da posicion a buscar

bgt  $t2 , $t1 , end    # indice  a buscar: fuera de rango    

    
for:
beq  $t4 , $t2 , endf   #  contador == [i,j] ??  
addi $t0 , $t0 , 4      #  matriz[i++]
addi $t4 , $t4 , 1      #  contador++

j for


endf:
lw  $v0 , 0($t0) 
 
end:
jr $ra
































           
