# 9. Diseña un programa ensamblador que, dada la palabra 0x10203040 almacenada en
#    una posición de memoria, la reorganice en otra posición, invirtiendo el orden de
#    sus bytes.


.data 

palabra:  .word 0x10203040
espacio:  .space 4

.text
                  
lb $s0 , palabra($0)
lb $s1 , palabra+1($0)
lb $s2 , palabra+2($0)
lb $s3 , palabra+3($0)

sb $s3 , espacio($0)
sb $s2 , espacio+1($0)
sb $s1 , espacio+2($0)
sb $s0 , espacio+3($0)