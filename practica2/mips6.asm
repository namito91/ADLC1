# 6. Diseña un programa en ensamblador que dado un vector de enteros “V”
# obtenga cuántos elementos de este vector están dentro del rango
# determinado por dos variables “rango1” y “rango2”. El programa deberá
# inicializar los elementos del vector en memoria, una variable que
# almacenará el número de elementos que tiene ese vector y dos variables
# donde se almacenarán los rangos. También deberá reservar espacio para la
# variable resultante.



.data

vector: .word 5,4,2,7,4,2,4,9
elem:   .word 8   # cantidad de elementos del vector
rango1: .word 2
rango2: .word 5
contador: .space 4 


.text
main:

la $t0 , vector
lw $t1 , elem($0)
lw $t2 , rango1($0)
lw $t3 , rango2($0)
li $t4 , 0
li $t5 , 0 


while:

lw $t6 , 0($t0)              # vector[0] , (en la primer iteracion)
beq $t5 , $t1 , endwhile     # si i == 8 entonces fin del bucle 
ble $t6, $t2 , continue      # si vector[i] <= rango1 entonces continue   
bge $t6, $t3 , continue      # si vector[i] >= rango2 entonces continue
 
addi $t4 ,$t4, 1    # contador += 1

continue:
addi $t0 , $t0 , 4     # vector[i+1]
addi $t5 , $t5 , 1     # i++

j while



endwhile:

sw $t4 , contador($0)    # contador = valor en $t4











