# 2. Diseña un programa en ensamblador que defina un vector de enteros, V,
#    inicializado según los siguientes valores (V=[2, -4, -6]). Y obtenga un vector
#    de booleanos, tal que cada elemento será 1 si el correspondiente elemento en el
#    vector de enteros es mayor o igual que cero y 0 en caso contrario.



.data

vector: .word  2 
        .word -4
        .word -6

boolVector: .byte
            .byte
            .byte


.text
main:

lw $s0 , vector($0)
lw $s1 , vector+4($0)
lw $s2 , vector+8($0)

sge $t0 , $s0 , $0            # uso $t0, por que es indistinto si uso otros registros, 
sb  $t0 , boolVector($0)      # en cada una de las distintas instrucciones.
sge $t0 , $s1 , $0            # los valores que importan se almacenan en la direccion de memoria
sb  $t0 , boolVector+1($0)    # del vector "boolVector", en el segmento de memoria data.
sge $t0 , $s2 , $0
sb  $t0 , boolVector+2($0)


exit:    
li $v0, 10           # program ends
syscall
