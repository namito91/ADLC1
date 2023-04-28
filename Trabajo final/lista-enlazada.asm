.data 0x10010000

slist:   .word 0      # inicializado a null 
numbers: .word 1,2,3  # lista de enteros


.text

main:
la  $s0, numbers
li  $s1, 3

loop:
lw  $a0, ($s0)
jal newnode
addi $s0, $s0, 4
addi $s1, $s1, -1
bnez $s1, loop

exit:
li   $v0, 10              # terminate program run and
syscall 
 

# void newnode(int number)
newnode: 

move $t0, $a0   # preserva arg 1
li   $v0, 9
li   $a0, 8
syscall         # sbrk 8 bytes long (se agrega un nodo (dos palabras) en memoria)

sw   $t0, ($v0) # guarda el arg en new node
lw   $t1, slist
beq  $t1, $0, first  # ? si la lista es vacia
sw   $t1, 4($v0)     # inserta la direcc del nodo anterior,en la 2da palabra del nodo
sw   $v0, slist      # actualiza la lista (slist apunta ahora a la primer palabra del nodo insertado)
jr   $ra


first:
sw  $0 , 4($v0)   # segunda palabra del nodo inicializada a null(no apunta a ninguna direcc)
sw  $v0, slist    # apunta la lista a new node(primer nodo insertado)
jr $ra




