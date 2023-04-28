# 1. Diseña un programa en ensamblador que defina un vector de booleanos, V.

#    Este se implementa a partir de un vector de bytes donde cada byte sólo puede
#    tomar dos valores, 0 ó 1, para el valor cierto o falso, respectivamente. V se
#    inicializará con los siguientes valores V=[0,1,1,1,0]. El programa obtendrá otro
#    vector de booleanos, res, de tres elementos tal que
    
#     res[1]= (V[1] and V[5]),
#     res[2]= (V[2] or V[4]) ,
#     res[3]= ((V[1] or V[2]) and V[3]).



.data 

vector: .byte 0     # bit menos significativo           
        .byte 1                                       
        .byte 1
        .byte 1
        .byte 0
       
espacio: .space 3        

res: .byte 
     .byte
     .byte



.text 
main:

lb $s0 , vector($0)     # vector[1]
lb $s1 , vector+1($0)   # vector[2]
lb $s2 , vector+2($0)   # vector[3]
lb $s3 , vector+3($0)   # vector[4]
lb $s4 , vector+4($0)   # vector[5]
 

and $t0 , $s0,$s4       # res[1] = V[1] and V[5] 
sb  $t0 , res($0)

and $t0 , $s1,$s3       # res[2] = V[2] and V[4] 
sb  $t0 , res+1($0)

or  $t0 , $s0,$s1       # t0 -->> ((V[1] or V[2])
and $t1 , $t0,$s2       # t1 -->> ((V[1] or V[2]) and V[3]) 
sb  $t1 , res+2($0)     # resultado -->> res = [0,1,1]


exit:    
li $v0, 10           # program ends
syscall






