# 5. Diseña un programa ensamblador que defina, en el espacio de datos, la siguiente
#    cadena de caracteres: “Esto es un problema” utilizando
#      a) .ascii
#      b) .byte
#      c) .word


.data

string1:  .ascii  "otsE se nu  borpamel"
          .align  2
          
string2:  .byte   0x6f,0x74,0x73,0x45,   # Esto
		  0x20,0x73,0x65,0x20,   # es
		  0x6e,0x75,0x20,0x00,   # un
		  0x62,0x6f,0x72,0x70,   # prob
		  0x61,0x6d,0x65,0x6c    # lema
          .align  2  
           
string3:  .word   0x4573746f             # Esto
   	  .word	  0x20657320             # es
	  .word	  0x20756e20             # un
	  .word   0x70726f62             # prob
	  .word	  0x6c656d61             # lema
	                             