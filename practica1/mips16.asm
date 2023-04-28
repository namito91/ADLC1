# 16. Multiplica el número 0x1237, almacenado en memoria a partir de la dirección
#     0x10000000, por 32 (25 ) sin utilizar las instrucciones de multiplicación ni las 
#     pseudoinstrucciones de multiplicación.


.data 0x10000000

numero: 0x1237

.text

main:

lw $t0 , numero($0)

sll $t1 , $t0 , 5      # sll multiplica el numero por 2^5 (32)