# 4. Diseña un programa en ensamblador que almacene en memoria los 5
# enteros siguientes (dato1=2, dato2=10, dato3=50, dato4=70, dato5=34) y
# que reserve 1 palabra para almacenar el resultado, (variable res).
# Implementa en ensamblador del R2000 un programa que almacene en la
# variable res un 1 si dato5 está en alguno de los intervalos formados por
# dato1 y dato2 o dato3 y dato4. Se almacenará un cero en caso contrario.



.data 

dato1: .word 2
dato2: .word 10
dato3: .word 50
dato4: .word 70
dato5: .word 34
res:   .space 4
 

.text
main:

lw $t0, dato1($0)
lw $t1, dato2($0)
lw $t2, dato3($0)
lw $t3, dato4($0)
lw $t4, dato5($0)


# dato5 > dato1 && dato5 < dato2 
blt $t4, $t0 , else   # si dato5 es menor a dato1 , saltar a else
bgt $t4, $t1 , else   # si dato5 es mayor a dato2 , saltar a else   

blt $t4, $t2 , else   # si dato5 es menor a dato3 , saltar a else
bgt $t4, $t4 , else   # si dato5 es mayor a dato4 , saltar a else   



then:
li $t5, 1
sw $t5 , res($0)
j end


else:
li $t5, 0
sw $t5 , res($0)                        
          
                    
end:                              
                                                  
# ( se va a cargar 0 en res , por que dato5 > dato1 pero no es menor a dato2 )
      
      
      
      
      