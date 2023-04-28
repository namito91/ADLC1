# 5. Diseña un programa en ensamblador que dado un vector de enteros,
# obtenga como resultado cuántos elementos son iguales a cero. Este
# resultado se debe almacenar sobre la variable “total”. El programa deberá
# inicializar los elementos del vector en memoria, así como una variable que
# almacenará el número de elementos que tiene el vector y reservará espacio
# para la variable resultado.


.data 

vector: .word  2,4,6,0,4,7,9,0,0
total:  .space 4



.text 
main:

la $t0, vector       # t0 = vector[0] 
li $t1, 9            # t1 = cantidad de elementos = 9 
li $t2 ,0            # t2 = 0
sw  $t2 , total($0)  # total = t2
lw $t3 , total($0)   # t3 = total


while:

lw  $t4 , 0($t0)           # t4 = vector[0] = 2  (en la primer iteracion)
beq $t2 , $t1 , endwhile   # si i == 9 entonces fin
beq $t4 , 0 , suma         # si vector[i] == 0 , entonces suma una unidad a total

continuacion:
addi $t0,$t0,4
addi $t2,$t2,1

j while
    
  
suma:

addi $t3 , $t3 , 1    # total += 1
j continuacion



endwhile:
        
sw $t3 , total($0)    # guarda el contador de 0 en la variable total






