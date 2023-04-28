# Cuestión 8.15: Modifica el código siguiente para que los parámetros que se
# pasan a la subrutina subr, tanto los de entrada como el de salida, se pasen por
# referencia.


.data

rango1: .word  10
rango2: .word  50
dato:   .word  12
res:    .space 1


.text
main:

addi $sp,$sp,-4
sw   $ra,0($sp)      #apilar ra

la   $a0,rango1      #a0 = direccion de rango1
la   $a1,rango2      #a1 = direccion de rango2
la   $a2,dato        #a2 = direccion de dato
la   $a3,res

jal  subr            #saltar a subr

sb   $v0,res($0)     #res=v0

lw   $ra,0($sp)
add  $sp,$sp,4       #desapilar ra
jr   $ra             #terminar ejecucion programa


subr:

lw  $t0 , 0($a0)    # rango1
lw  $t1 , 0($a1)    # rango2
lw  $t2 , 0($a2)    # dato
lw  $t3 , 0($a3)    # res


blt $t2,$t0,sino   #Si a2 < a0 saltar a sino
bgt $t2,$t1,sino   #si a2 > a1 saltar a sino

entonces: 
addi $t3, $0,1     #v0=1
j finsi            #saltar a finsi

sino:
add $t3,$0,$0      #v0=0

finsi:
jr $ra             #retornar