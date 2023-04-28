# 3. Diseña un programa en ensamblador que defina un vector de enteros, V,
#    inicializado a los siguientes valores V=[1, -4, -5, 2] y obtenga como resultado
#    una variable booleana que será 1 si todos los elementos de este vector son
#    menores que cero.


.data 

vector: .word   -1
        .word  -4
        .word  -5 
        .word   -2

uno:   .word 1
res: .byte

true: .asciiz  " todos los valores del vector son menores a 0"
false: .asciiz " algunos o todos los valores del vector NO son menores a 0"


.text
main:


lw $s0 , vector($0)
lw $s1 , vector+4($0)
lw $s2 , vector+8($0)
lw $s3 , vector+12($0)
lw $s4 , uno($0)

slt $t0 , $s0, $0
slt $t1 , $s1, $0
slt $t2 , $s2, $0
slt $t3 , $s3, $0

and $t0 , $t0 , $t1
and $t2 , $t2 , $t3
and $t3 , $t0 , $t2

beq $t3 , $s4 , fineval
la $a0 , false
li $v0 , 4  	
syscall


fineval:
sb $t3 , res($0)
la $a0 , true
li $v0 , 4  	
syscall


exit:    

li $v0, 10           # program ends
syscall
