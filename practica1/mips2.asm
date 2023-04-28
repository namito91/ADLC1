# 2. Diseña un programa ensamblador que reserva espacio para dos vectores A y B de
#    20 palabras cada uno a partir de la dirección 0x10000000.

.data 0x10000000

vector_A: 
	.word 1
 	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9
	.word 10
	.word 11
	.word 12
	.word 13
	.word 14
	.word 15
	.word 16
	.word 17
	.word 18
	.word 19
	.word 20

vector_B:
	.word 21
	.word 22
	.word 23
	.word 24
	.word 25
	.word 26
	.word 27
	.word 28
	.word 29
	.word 30
	.word 31
	.word 32
	.word 33
	.word 34
	.word 35
	.word 36
	.word 37
	.word 38
	.word 39
	.word 40
	