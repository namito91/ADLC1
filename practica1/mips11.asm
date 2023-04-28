# 11. Diseña un programa en ensamblador que inicialice cuatro bytes a partir de la
#     posición 0x10010002 a los siguientes valores 0x10, 0x20, 0x30, 0x40, y reserve
#     espacio para una palabra a partir de la dirección 0x1001010. El programa
#     transferirá los cuatro bytes contenidos a partir de la posición 0x10010002 a la
#     dirección 0x1001010.


.data 0x10010002

bytes:   .byte 0x10,0x20,0x30,0x40
espacio: .space 4
palabra: .word

.text

main:

lb $s0 , bytes($0)
lb $s1 , bytes+1($0)
lb $s2 , bytes+2($0)
lb $s3 , bytes+3($0)

la $t1 , palabra

sb $s0 , 0($t1)
sb $s1 , 1($t1)
sb $s2 , 2($t1)
sb $s3 , 3($t1)



