# 15. Cambia el valor de los bits 3,7,9 del entero 0xff0f1235 almacenado en
#     memoria a partir de la dirección 0x10000000, sin modificar el resto.


.data 0x10000000

entero: .word 0xff0f1235      # 1111 1111 0000 1111 0001 0010 0011 0101
			      # 1111 1111 0000 1111 0001 0011 0111 0001	
			      # FF0F1371
.text 

main:

la $t0 , 0x10000000
la $t1 , 0x10000001

li $t2 , 0x71
li $t3 , 0x13

sb $t2 , entero($0)
sb $t3 , entero+1($0)