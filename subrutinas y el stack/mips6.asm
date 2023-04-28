.data
n1:   .word  4
vec1: .word  1,0,0,2
nul1: .space 4

 
.text
# primero se inicializan los registros s0,s1,s2 y fp
main:
li $s0, 1    #iniciliza $s0
li $s1, 2    #iniciliza $s1
li $s2, 3    #iniciliza $s2
li $fp, 4    #iniciliza $fp

addi $sp ,$sp,-4
sw   $ra ,0($sp) #apilar $ra

addi $sp, $sp, -8  # reserva dos bloques de memoria de 32 bits, en el stack
lw   $t0, n1($0)
sw   $t0, 4($sp)
la   $t0, vec1
sw   $t0, 0($sp)

jal subr  #llamada a la subrutina

ret:
addi $sp, $sp, 8
sw   $v0, nul1($0)
lw   $ra, 0($sp)
addi $sp, $sp, 4
jr   $ra
 
subr:
addi $sp, $sp, -16  
sw   $fp, 12($sp)   # se guarda fp en la pila 
addi $fp, $sp, 12   # se guarda en fp ,la direccion del comienzo del bloque de activacion
sw   $s0, -4($fp)   # $s0 = int 1
sw   $s1, -8($fp)   # $s1 = int 2
sw   $s2, -12($fp)  # $s0 = int 3
lw   $s0, 4($fp)    # se lee en s0, lo que hay una posicion abajo del fp,la "direcc del vect"
lw   $s1, 8($fp)    # se lee en s1,dos pos abajo de donde apunta fp, la variable "n1"
and  $v0, $v0, $0

#bucle de cuenta de elementos nulos
bucle: 
beq  $s1, $0, finb   # si s1 = 0 saltar a finb
lw   $s2, 0($s0)     # cargar s2 = Mem(s0)
bne  $s2, $0, finsi  # si s2<>0 saltar a finsi
addi $v0, $v0, 1     # v0=s2
 
finsi: 
addi $s0, $s0, 4     # s0 = s0 + 4 ( se apunta al sig elem del vector )
addi $s1, $s1, -1    # s1 = s1 - 1 (contador del bucle, al inicio vale : 4)

j bucle    #saltar a bucle

finb:
lw   $s0, -4($fp)
lw   $s1, -8($fp)
lw   $s2, -12($fp)
addi $sp, $fp, 0    # sp apunta ahora al ultimo elem de la pila original (creada en main)
lw   $fp, 0($sp)    # fp vuelve a su valor/posicion original (?) 	 
addi $sp, $sp, 4    # se libera 1 espacio en la pila,
jr   $ra            # se retorna a main

