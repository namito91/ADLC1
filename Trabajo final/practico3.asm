.data
 
slist:     .word  0    # slist: puntero usado por las funciones smalloc y sfree
cclist:    .word  0    # cclist: apunta a la lista de categorías
wclist:    .word  0    # wclist: apunta a la categoría seleccionada en curso				
schedv:    .space 32   # scheduler vector (guarda las direcc de las funciones primitivas)
# bloquecat: .word  0    # puntero al bloque "string" de categorias
# bloqueobj: .word  0    # puntero al bloque "string" de objetos

menu:
  .ascii "\nColecciones de objetos categorizados\n"
  .ascii "====================================\n"
  .ascii "1-Nueva categoria\n"
  .ascii "2-Siguiente categoria\n"
  .ascii "3-Categoria anterior\n"
  .ascii "4-Listar categorias\n"
  .ascii "5-Borrar categoria actual\n"
  .ascii "6-Anexar objeto a la categoria actual\n"
  .ascii "7-Listar objetos de la categoria\n"
  .ascii "8-Borrar objeto de la categoria\n"
  .ascii "0-Salir\n"
  .asciiz "Ingrese la opcion deseada: "


error:    .asciiz "Error: "
return:   .asciiz "\n"
catName:  .asciiz "\nIngrese el nombre de una categoria: "
selCat:   .asciiz "\nSe ha seleccionado la categoria:"
idObj:    .asciiz "\nIngrese el ID del objeto a eliminar: "
objName:  .asciiz "\nIngrese el nombre de un objeto: "
success:  .asciiz "La operación se realizo con exito\n\n"
actual:   .asciiz "> "


.text
main:

la  $t0, schedv        # initialization scheduler vector (guarda las direcc de las primitivas)

la  $t1, newcategory
sw  $t1, 0($t0)

la  $t1, nextcategory
sw  $t1, 4($t0)

la  $t1, prevcategory
sw  $t1, 8($t0)

la  $t1, listcategories
sw  $t1, 12($t0)

la  $t1, delcategory
sw  $t1, 16($t0)
 

inicio:

# imprime el menu de opciones
la $a0, menu           
li $v0, 4 
syscall

# input integer
li $v0 , 5
syscall

move $t2, $v0
 
beq $t2, 0 , exit
beq $t2, 1 , newcategory
beq $t2, 2 , nextcategory
beq $t2, 3 , prevcategory
beq $t2, 4 , listcategories
beq $t2, 5 , delcategory
beq $t2, 6 , newobject
beq $t2, 7 , listobjects
beq $t2, 8 , delobject

blt $t2, $0 , else   # si la opcion ingresada es menor a 0 o mayor a 8 ,salta a la etiqueta "else"
bgt $t2, 8 , else

 


# ----------------------------------------------------------

# 1er word( ptr al ultimo nodo si es el primer nodo o ptr al nodo antecesor ),
# 2da word( ptr a su lista de objetos ),
# 3er word( ptr a bloque de strings ),
# 4to word( ptr a sucesor o ptr al primer nodo ) 
newcategory:

addiu $sp, $sp, -4
sw    $ra, 4($sp)

la    $a0, catName    # input category name
jal   getblock

move  $a2, $v0        # $a2 = *char to category name (el string ingresado por el usuario, retornado por la funcion "getBlock")
la    $a0, cclist     # $a0 = list , cclist apunta a la lista de categorías  
li    $a1, 0          # $a1 = NULL
jal   addnode         

lw    $t0, wclist     #
bnez  $t0, newcategory_end
sw    $v0, wclist             # update working list if was NULL


newcategory_end:

li    $v0, 0          # return success
lw    $ra, 4($sp)     		
addiu $sp, $sp, 4
j     inicio




# ----------------------------------------------------------

# Esto se hace con dos opciones en el menú: pasar a
# la categoría siguiente o a la anterior respecto a la actual.
nextcategory:

addiu $sp, $sp, -4
sw    $ra, 4($sp)

lw $a0 , wclist

beqz $a0 , error201  # la lista esta vacia ? 

la $t0 , ($a0)    # se carga el nodo seleccionado actual CARGAR ACAA LA DIRECC DEL NODOOO, ESTUVE DOS HORAS! lw -> la                      
lw $t1 , 12($t0)  # siguiente nodo

beq $t0 , $t1 , error202  # hay un solo nodo ?

sw $t1 , wclist  # se guarda la categoria seleccionada actual

# se imprime la categoria seleccionada
la $a0 , selCat
li $v0 , 4
syscall

la $t2 , 8($t1)

lw $a0 , ($t2) # se imprime el nombre de la cat seleccionada
li $v0 , 4
syscall

j nextcategory_end


# error 201 : no hay categorias
error201: 

la $a0 , error
li $v0 , 4
syscall

li $a0 , 201
li $v0 , 1
syscall

j nextcategory_end

# error 202 : hay solo una categoria
error202: 

la $a0 , error
li $v0 , 4
syscall

li $a0 , 202
li $v0 , 1
syscall

j nextcategory_end


nextcategory_end:

lw    $ra, 4($sp)     		
addiu $sp, $sp, 4
j     inicio




# ----------------------------------------------------------

prevcategory:

addiu $sp, $sp, -4
sw    $ra, 4($sp)

lw $a0 , wclist

beqz $a0 , error201  # la lista esta vacia ? 

la $t0 , ($a0)    # se carga el nodo seleccionado actual CARGAR ACAA LA DIRECC DEL NODOOO, ESTUVE DOS HORAS! lw -> la                      
lw $t1 , 0($t0)   # $t1 -> nodo anterior al nodo actual

beq $t0 , $t1 , error202  # hay un solo nodo ?

sw $t1 , wclist  # se guarda la categoria seleccionada actual

# se imprime la categoria seleccionada
la $a0 , selCat
li $v0 , 4
syscall

la $t2 , 8($t1)

lw $a0 , ($t2) # se imprime el nombre de la cat seleccionada
li $v0 , 4
syscall

j nextcategory_end




# ----------------------------------------------------------

listcategories: 

addiu $sp, $sp, -4
sw    $ra, 4($sp)

lw $a0 , cclist
lw $a1,  wclist

lw $t0 , ($a0)  # inicio de la lista
lw $t3 , ($a1)  # categoria actual
lw $t6 , ($a0)  # primer nodo como bandera , para comparar en el ultimo nodo de la lista circular

beqz $t0 , error203  # la lista esta vacia ?

li $t7 , 1

while:

beq $t0 , $t3 , imprimir_actual
beq $t7 , 1 , body # bandera
beq $t0 , $t6 , endwhile    

body:
lw $t1 , ($t0)
la $t2 , 8($t1)

lw $a0 , ($t2) # se imprime el nombre de la categoria
li $v0 , 4
syscall

lw $t1 , 12($t1)

lw $t0 , ($t1)

addi $t7 , $t7 , 1

j while

endwhile:
j listcategories_end


imprimir_actual:

beq $t7 , 1 , body2 # bandera
beq $t0 , $t6 , endwhile

body2:
lw $t1 , ($t0)
la $t2 , 8($t1)

la $a0 , actual # se imprime "> "
li $v0 , 4
syscall

lw $a0 , ($t2) # se imprime el nombre de la categoria actual
li $v0 , 4
syscall

lw $t1 , 12($t1)

lw $t0 , ($t1)

addi $t7 , $t7 , 1  # se actualiza la bandera

j while


error203:

la $a0 , error
li $v0 , 4
syscall

li $a0 , 203
li $v0 , 1
syscall


listcategories_end:

lw    $ra, 4($sp)     		
addiu $sp, $sp, 4
j     inicio




# ----------------------------------------------------------

delcategory:

addiu $sp, $sp, -4
sw    $ra, 4($sp)

lw $a0 , wclist  # categoria que se quiere borrar
lw $a1 , cclist  # puntero a la lista

# borrar categoria ,si hay solo una y no contiene objetos
lw $t0 , wclist 
lw $t1 , 4($t0)  # lista de objetos de la categoria

bne $t1 , $0 , delcat_object      # se verifica si el nodo tiene objetos asignados
bne $t0 , 12($a0) , delcat_object # se verifica si el nodo a borrar tiene nodos siguientes 
bne $t0 , 0($a0) , delcat_object  # se verifica si el nodo a borrar tiene nodos anteriores

sw $0 , 0($a0) # se nulifican los ptr siguiente y anterior
sw $0 , 12($a0)

jal sfree

j delcategory_end


# borrar categoria unica con objetos
delcat_object:
bne $t0 , 12($a0) , delcat_object # se verifica si el nodo a borrar tiene nodos siguientes 
bne $t0 , 0($a0) , delcat_object  # se verifica si el nodo a borrar tiene nodos anteriores


# borrar categoria no unica con objetos




delcategory_end:
lw    $ra, 4($sp)     		
addiu $sp, $sp, 4
j     inicio




# ----------------------------------------------------------

newobject: 
listobjects: 
delobject:


else:

la $a0, error           
li $v0, 4 
syscall
j main


exit:
li $v0, 10    # terminate program run and
syscall       # Exit 




# ----------------------------------------------------------

# node* addnode(list, node*)
# a0: list address
# a1: NULL if category, node address if object
# v0: node address added
addnode:

addi $sp, $sp, -8
sw   $ra, 8($sp)
sw   $a0, 4($sp)  # a0 ,caller saved convention
jal  smalloc

# set node content
sw   $a1, 4($v0)  # (ptr al 2do word del nodo (lista de objetos))
sw   $a2, 8($v0)  # se carga la direcc del string ingresado , en el 3er word del nodo
lw   $a0, 4($sp)  # a0 tiene la direcc de la lista de categorias
lw   $t0, ($a0)   # first node address
beqz $t0, addnode_empty_list

addnode_to_end:
lw   $t1, ($t0)   # last node address
 
# update prev and next pointers of new node
sw  $t1, 0($v0)   # puntero al nodo anterior
sw  $t0, 12($v0)  # puntero al nodo sig    

# update prev and first node to new node 
sw  $v0, 12($t1)  # 
sw  $v0, 0($t0)   # 
j   addnode_exit

addnode_empty_list:
sw  $v0, ($a0)    # se carga la direcc del nuevo bloque creado por smalloc, en $a0
sw  $v0, 0($v0)   # direcc del nodo anterior ,es el mismo nodo
sw  $v0, 12($v0)  # direcc del nodo siguiente ,es el mismo nodo

addnode_exit:
lw   $ra, 8($sp)
addi $sp, $sp, 8
jr   $ra




# ----------------------------------------------------------

# delnode(node*, list)
# a0: node address to delete
# a1: list address where node is deleted
delnode:

addi $sp, $sp, -8
sw   $ra, 8($sp)
sw   $a0, 4($sp)
lw   $a0, 8($a0)    # get block address (tercer campo del nodo,apunta a un bloque de strings)
 
jal  sfree          # free block

lw   $a0, 4($sp)    # restore argument a0
lw   $t0, 12($a0)   # get address to next node of a0 node
 
beq  $a0, $t0, delnode_point_self

lw   $t1, 0($a0)   # get address to prev node
sw   $t1, 0($t0)    
sw   $t0, 12($t1)  # set next node of prev node
lw   $t1, 0($a1)   # get address to first node again

bne  $a0, $t1, delnode_exit  # verifica si el nodo selecc es el primero de la lista

sw   $t0, ($a1)    # list point to next node

j delnode_exit

delnode_point_self:
sw $zero, ($a1)   # only one node

delnode_exit:
jal  sfree
lw   $ra, 8($sp)
addi $sp, $sp, 8
jr   $ra




# ----------------------------------------------------------

# a0: msg to ask
# v0: block address allocated with string
getblock:

addi $sp, $sp, -4
sw   $ra, 4($sp)

li   $v0, 4      # se imprime string almacenado en $a0 ( "catName" )
syscall	

jal  smalloc

move $a0, $v0    # se guarda el nuevo bloque de memoria creado por smalloc,en $a0 
li   $a1, 16
li   $v0, 8      # se lee un string ingresado por el usario,y se almacena en $a0
syscall

move $v0, $a0     # $v0 ,contiene valor del string ingresado ,   
lw   $ra, 4($sp)  # la funcion retorna el string ingresado por el usuario , en $v0
addi $sp, $sp, 4
jr   $ra




# ----------------------------------------------------------

# memory management functions

smalloc:
lw   $t0, slist
beqz $t0, sbrk

move $v0, $t0

lw $t0, 12($t0)
sw $t0, slist
jr $ra

sbrk:
li $a0, 16 # node size fixed 4 words
li $v0, 9
syscall # return node address in v0
jr $ra

sfree: # crea una lista enlazada con nodos que se van eliminando
lw  $t0, slist
sw  $t0, 12($a0) 
sw  $a0, slist # $a0 node address in unused list
jr  $ra







