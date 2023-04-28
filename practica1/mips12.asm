# 12. Diseña un programa ensamblador que defina el vector de enteros de dos
#     elementos V=(10,20) en la memoria de datos a partir de la dirección
#     0x10000000 y almacene su suma a partir de la dirección donde acaba el vector.


.data 0x10000000

vector: .word 10,20


.text 

main: lw $t0 , vector($0) 	
      lw $t1 , vector+4($0)	
      add $t2 , $t0 , $t1
      sw $t2 , vector+8($0)   # dos posiciones hacia adelante en la memoria
      
      