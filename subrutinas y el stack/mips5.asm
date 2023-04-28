# Cuestión 8.16: Modifica el código anterior para que los parámetros de entrada
# a la subrutina se pasen por valor mediante la pila 
# el de salida se pase también a través de la pila pero por referencia.


.data

rango1: .word  10
rango2: .word  50
dato:   .word  12
res:    .space 1


.text
main:

addi $sp,$sp,-4
sw   $ra,0($sp)      #apilar ra

lw   $a0,rango1($0)      #a0 = rango1
lw   $a1,rango2($0)      #a1 = rango2
lw   $a2,dato($0)        #a2 = dato
la   $a3,res             #a3 = direccion de res

 
addi $sp,$sp,-4          # pasaje de los datos a la pila
sw   $a3,0($sp)

addi $sp,$sp,-4
sw   $a2,0($sp)

addi $sp,$sp,-4
sw   $a1,0($sp)

addi $sp,$sp,-4
sw   $a0,0($sp)


jal  subr            #saltar a subr

sb   $v0,res($0)     #res = v0

lw   $ra,0($sp)
add  $sp,$sp,4       #desapilar ra
jr   $ra             #terminar ejecucion programa


subr:

lw   $t0 , 0($sp)    # se carga rango1 (por valor)
add  $sp,$sp,4       # se devuelve espacio al stack
    
lw   $t1 , 0($sp)    # se carga rango2 (por valor)
add  $sp,$sp,4       # se devuelve espacio al stack
 
lw   $t2 , 0($sp)    # se carga dato (por valor)
add  $sp,$sp,4       # se devuelve espacio al stack 

lw   $t3 , 0($sp)    # res , se carga la direccion de memoria en t3 (por referencia)
lw   $v0 , ($t3)     # se pasa el contenido de la direccion en t3, a $v0
add  $sp,$sp,4       # se devuelve espacio al stack

blt $t2,$t0,sino   #Si a2 < a0 saltar a sino
bgt $t2,$t1,sino   #si a2 > a1 saltar a sino

entonces: 
addi $v0, $0,1     #v0=1
j finsi            #saltar a finsi

sino:
add $v0,$0,$0      #v0=0

finsi:
jr $ra             #retornar
