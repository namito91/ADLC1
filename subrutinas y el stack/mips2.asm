.data
suma:  .space 4
dato1: .word  20
dato2: .word  10


.text
main:

addi $sp , $sp,-4    #apilar dir. ret.
sw   $ra , 0($sp)
lw   $a0 , dato1($0)
lw   $a1 , dato2($0)
jal  subr
sw   $v0 , suma($0)
lw   $ra , 0($sp)    #desapilar dir. ret.
addi $sp , $sp,4
jr   $ra


comp:
bgt  $a0 , 0 , second
addi $v1 , $v1 , 0
j exit1

second:
bgt  $a1 , 0 , mayores
j exit1

mayores:
addi $v1 , $v1 , 1

exit1:
jr   $ra


subr:
addi $sp , $sp,-4    #apilar dir. ret.
sw   $ra , 0($sp)

jal comp

beq  $v1 , 1 , true
j exit2

true:
div   $a0,$a1
mfhi  $t0
mflo  $t1

exit2:
lw    $ra , 0($sp)    #desapilar dir. ret.
addi  $sp , $sp,4
jr    $ra



