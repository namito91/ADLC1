# 7. Diseña un programa en ensamblador que dado un vector de caracteres,
# contabilice cuántas veces se repite un determinado carácter en el mismo. El
# programa deberá inicializar la cadena en memoria, y ésta deberá finalizar
# con el carácter nulo. También deberá reservar espacio para la variable
# resultado.



.data

cadena: .ascii "a","b","c","d","c","\0"
caracter: .ascii "c"
contador: .word 0



.text
main:

la $t0, cadena
lb $t1, caracter($0)
lw $t2, contador($0)



while:

lb $t5, 0($t0)            # cadena [i]
beq $t5 , 0 , endwhile    # si cadena [i] == null entonces fin
beq $t5, $t1 , sumador    # si cadena [i] == "c" entonces contador++


continue:
addi $t0,$t0,1            # cadena [i+1]


j while


sumador:
addi $t2 , $t2, 1         # contador++

j continue



endwhile:
sb $t2 , contador($0)    # contador = valor en $t2 (sumador)



