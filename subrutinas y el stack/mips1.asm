# .text
# main:

# li   $t0, 10
# li   $t1, 13        #inicializar reg. t0,$t1
# addi $sp, $sp, -4   #actualizar el sp
# sw   $t0, 0($sp)    #apilar t0
# addi $sp, $sp, -4   #actualizar el sp
# sw   $t1, 0($sp)    #apilar t1

# addi $t0 ,$t0 , 5
# addi $t1 ,$t1 , 3

# lw   $t2 , 0($sp)   # pop
# addi $sp , $sp, 4   # ajusta el indice de la pila en $sp
# lw   $t3 , 0($sp)
# addi $sp , $sp, 4


# -----------------------------------------------------------

.data
intro:  .asciiz "ingresa una cadena"
cadena: .space 10


.text 
main:

li  $v0 , 4        # imprime cadena
la  $a0 , intro          
syscall

li  $v0 , 8        # service 8 is read string
la  $a0 , cadena   # load desired value into argument register $a0, using pseudo-op
li  $a1 , 10       # load desired string length
syscall

lb $t0 , cadena($0)
lb $t1 , cadena+1($0)
lb $t2 , cadena+2($0)
lb $t3 , cadena+3($0)
lb $t4 , cadena+4($0)
lb $t5 , cadena+5($0)
lb $t6 , cadena+6($0)
lb $t7 , cadena+7($0)
lb $t8 , cadena+8($0)
lb $t9 , cadena+9($0)


# push
addi $sp, $sp, -4   #actualizar el sp
sw   $t0, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t1, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t2, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t3, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t4, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t5, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t6, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t7, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t8, 0($sp)    #apilar t0

addi $sp, $sp, -4   #actualizar el sp
sw   $t9, 0($sp)    #apilar t0


# pop
addi $sp, $sp, 4   #actualizar el sp
lw   $t0, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t1, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t2, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t3, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t4, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t5, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t6, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t7, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t8, 0($sp)    #desapilar t0

addi $sp, $sp, 4   #actualizar el sp
lw   $t9, 0($sp)    #desapilar t0


# main end
li $v0,10
syscall












