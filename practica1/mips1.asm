# 1. Dado el siguiente ejemplo de programa ensamblador:

.data
dato: .byte 3              #inicializo una posición de memoria a 3
			   	
.text
.globl main                # debe ser global

main: lw $t0,dato($0)

# Indica las etiquetas, directivas y comentarios que aparecen en el mismo.

# etiquetas :   dato: , main:
# directivas:   .data , .text , .byte
# comentarios:  #inicializo una posición de memoria a 3 , # debe ser global

