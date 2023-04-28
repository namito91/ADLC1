# 13. Diseña un programa ensamblador que divida los enteros 18,-1215 almacenados
#     a partir de la dirección 0x10000000 entre el número 5 y que a partir de la
#     dirección 0x10010000 almacene el cociente de dichas divisiones.


.data 0x10000000 , 0x10010000

entero1:  .word 18  
entero2:  .word -1215

.text 

main: li $t0 , 5              # transferir la memoria : 
      la $t1 , 0x10010000     # guarda la direccion de memoria 
                              
      lw $t2 , entero1($0)
      lw $t3 , entero2($0)
      div $t2,$t0
      mfhi $t0   # resto
      mflo $t2   # cociente    
      sw $t2 ,0($t1)         # almaceno el cociente en la direccion que contiene $t1 + 0 bytes
      
      li $t0 , 5             # recupero el valor 5 en $t0
      
      div $t3,$t0
      mfhi $t0   # resto
      mflo $t3   # cociente    
      sw $t3 ,4($t1)        # almaceno el cociente en la direccion que contiene $t1 + 4 bytes
  
      