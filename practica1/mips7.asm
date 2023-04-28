# 7. Diseña un programa ensamblador que defina el vector de enteros V=(10, 20, 25,
#    500, 3) en la memoria de datos a partir de la dirección 0x10000000 y cargue todos
#    sus componentes en los registros $s0 - $s4.

.data 0x10000000

vector: .word 10
	.word 20
	.word 25
	.word 500
	.word 3

	
.text 

lb $s0 , vector($0)      # vector+4 accede 4 bytes hacia arriba de la direccion de vector
lb $s1 , vector+4($0)
lb $s2 , vector+8($0)
lh $s3 , vector+12($0)	 # no se puede representar el numero decimal 500 usando un byte , sino media palabra ( o una palabra entera )
lb $s4 , vector+16($0)
lb $s5 , vector+20($0)