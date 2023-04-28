# 6.  Sabiendo que un entero se almacena en un word, diseña un programa ensamblador
#     que defina en la memoria de datos la matriz A de enteros definida como

#     1 2 3
#     4 5 6
#     7 8 9

#  a partir de la dirección 0x10010000 suponiendo que:
#     a) La matriz A se almacena por filas.
#     b) La matriz A se almacena por columnas.

.data 0x10010000

matriz_A_F:  
	   .word 1
           .word 2
           .word 3
           .space 20 
           .word 4
           .word 5
           .word 6
           .space 20
           .word 7
           .word 8
           .word 9
           .space 20

matriz_A_C:  
	   .word 1
           .word 4
           .word 7 
           .space 20
           .word 2
           .word 5
           .word 8
           .space 20
           .word 7
           .word 8
           .word 9          
           .space 20
