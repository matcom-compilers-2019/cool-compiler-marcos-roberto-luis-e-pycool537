.data
empty_string: .asciiz ""
null_reference: .asciiz "Null reference exception!!!"
zero_division: .asciiz "Division by zero! Are you insane?"
main_prototype: .word 1, 3, Main_dispatch_table
inheritance_table: .word 0,, 0, 1, 1, 1, 1, 5
Object_dispatch_table: .word init_Object_ptr, init_Object, abort_ptr, def_Object_abort, type_name_ptr, def_Object_type_name, copy_ptr, def_Object_copy
init_Object_ptr: .asciiz "init_Object"
abort_ptr: .asciiz "abort"
type_name_ptr: .asciiz "type_name"
copy_ptr: .asciiz "copy"
Int_dispatch_table: .word init_Int_ptr, init_Int
init_Int_ptr: .asciiz "init_Int"
Bool_dispatch_table: .word init_Bool_ptr, init_Bool
init_Bool_ptr: .asciiz "init_Bool"
String_dispatch_table: .word init_String_ptr, init_String, length_ptr, def_String_length, concat_ptr, def_String_concat, substr_ptr, def_String_substr
init_String_ptr: .asciiz "init_String"
length_ptr: .asciiz "length"
concat_ptr: .asciiz "concat"
substr_ptr: .asciiz "substr"
IO_dispatch_table: .word init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
init_IO_ptr: .asciiz "init_IO"
in_string_ptr: .asciiz "in_string"
in_int_ptr: .asciiz "in_int"
out_string_ptr: .asciiz "out_string"
out_int_ptr: .asciiz "out_int"
Main_dispatch_table: .word main_ptr, def_Main_main, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
main_ptr: .asciiz "main"
Object_abort_data_0: .asciiz "Abort()"
Main_main_data_1: .asciiz "Hello, World!\n"
.text
.globl main
main:
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $a0, ($sp)
subu $sp, $sp, 4
sw $a1, ($sp)
subu $sp, $sp, 4
sw $a2, ($sp)
subu $sp, $sp, 4
sw $a3, ($sp)
subu $sp, $sp, 4
sw $t0, ($sp)
subu $sp, $sp, 4
sw $t1, ($sp)
subu $sp, $sp, 4
sw $t2, ($sp)
subu $sp, $sp, 4
sw $t3, ($sp)
subu $sp, $sp, 4
sw $t4, ($sp)
jal init_Main
lw $t4, ($sp)
addu $sp, $sp, 4
lw $t3, ($sp)
addu $sp, $sp, 4
lw $t2, ($sp)
addu $sp, $sp, 4
lw $t1, ($sp)
addu $sp, $sp, 4
lw $t0, ($sp)
addu $sp, $sp, 4
lw $a3, ($sp)
addu $sp, $sp, 4
lw $a2, ($sp)
addu $sp, $sp, 4
lw $a1, ($sp)
addu $sp, $sp, 4
lw $a0, ($sp)
addu $sp, $sp, 4
lw $ra, ($sp)
addu $sp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $a0, ($sp)
subu $sp, $sp, 4
sw $a1, ($sp)
subu $sp, $sp, 4
sw $a2, ($sp)
subu $sp, $sp, 4
sw $a3, ($sp)
subu $sp, $sp, 4
sw $t0, ($sp)
subu $sp, $sp, 4
sw $t1, ($sp)
subu $sp, $sp, 4
sw $t2, ($sp)
subu $sp, $sp, 4
sw $t3, ($sp)
subu $sp, $sp, 4
sw $t4, ($sp)
subu $sp, $sp, 4
sw $v0, ($sp)
jal def_Main_main
addu, $sp, $sp, 4
lw $t4, ($sp)
addu $sp, $sp, 4
lw $t3, ($sp)
addu $sp, $sp, 4
lw $t2, ($sp)
addu $sp, $sp, 4
lw $t1, ($sp)
addu $sp, $sp, 4
lw $t0, ($sp)
addu $sp, $sp, 4
lw $a3, ($sp)
addu $sp, $sp, 4
lw $a2, ($sp)
addu $sp, $sp, 4
lw $a1, ($sp)
addu $sp, $sp, 4
lw $a0, ($sp)
addu $sp, $sp, 4
lw $ra, ($sp)
addu $sp, $sp, 4
li $v0, 10
syscall

.globl init_Object
init_Object:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
li $a0, 16
li $v0, 9
syscall
li $a0, 1
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Object_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
li $a0, 0
sw $a0, -16($fp)
lw $a0, -12($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_Object_abort
def_Object_abort:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
la $a0, Object_abort_data_0
li $v0, 4
syscall
li $v0, 10
syscall

.globl def_Object_type_name
def_Object_type_name:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a0, ($a0)
sw $a0, -12($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -20($fp)
lw $a0, -20($fp)
lw $a1, -12($fp)
sw $a1, 12($a0)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a1, -12($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616595413888123:
lw $t2, ($a1)
beq $t1, $a0, brake15616595413931239
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616595413888123
brake15616595413931239:
sw $v0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_Object_copy
def_Object_copy:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a0, ($a0)
sw $a0, -12($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -20($fp)
lw $a0, -20($fp)
lw $a1, -12($fp)
sw $a1, 12($a0)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a1, -12($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop1561659541393402:
lw $t2, ($a1)
beq $t1, $a0, brake15616595413934896
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop1561659541393402
brake15616595413934896:
sw $v0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl init_Int
init_Int:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
li $a0, 16
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
li $a0, 0
sw $a0, -16($fp)
lw $a0, -12($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl init_Bool
init_Bool:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
li $a0, 0
sw $a0, -16($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $a0, -12($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl init_String
init_String:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
la $a0, empty_string
sw $a0, -16($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 4
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, String_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $a0, -12($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_String_length
def_String_length:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15616595413938088:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616595413938978
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616595413938088
brakeLengthLoop15616595413938978:
sw $a0, -12($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -20($fp)
lw $a0, -20($fp)
lw $a1, -12($fp)
sw $a1, 12($a0)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_String_concat
def_String_concat:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -24($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -24($fp)
lw $a1, 12($a0)
sw $a1, -24($fp)
lw $a0, -16($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $a1, -24($fp)
li $a0, 0
lengthLoop15616595413941007:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616595413941855
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616595413941007
brakeLengthLoop15616595413941855:
sw $a0, -28($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15616595413942926:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616595413943727
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616595413942926
brakeLengthLoop15616595413943727:
sw $a0, -20($fp)
lw $a1, -24($fp)
lw $a0, -28($fp)
lw $t0, -20($fp)
add $a0, $a0, $t0
li $v0, 9
syscall
move $t0, $v0
loop15616595413945024:
lb $t2, ($a1)
beq $t2, $zero, brake15616595413945844
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop15616595413945024
brake15616595413945844:
lw $a1, -16($fp)
loop215616595413946712:
lb $t2, ($a1)
beq $t2, $zero, brake215616595413947513
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop215616595413946712
brake215616595413947513:
sb $zero, ($t0)
sw $v0, -12($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 4
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, String_dispatch_table
sw $a0, 8($v0)
sw $v0, -32($fp)
lw $a0, -32($fp)
lw $a1, -12($fp)
sw $a1, 12($a0)
lw $v0, -32($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_String_substr
def_String_substr:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 8($fp)
sw $a0, -24($fp)
lw $a0, 4($fp)
sw $a0, -20($fp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $a0, -20($fp)
lw $a1, 12($a0)
sw $a1, -20($fp)
lw $a0, -24($fp)
lw $a1, 12($a0)
sw $a1, -24($fp)
lw $a1, -16($fp)
lw $t0, -20($fp)
add $a1, $a1, $t0
lw $a0, -24($fp)
add $a0, $a0, 1
li $v0, 9
syscall
sub $a0, $a0, 1
move $t0, $v0
li $t1, 0
loop15616595413950305:
lb $t2, ($a1)
beq $t2, $zero, brake1561659541395115
beq $t1, $a0, brake1561659541395115
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616595413950305
brake1561659541395115:
sb $zero, ($t0)
sw $v0, -12($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 4
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, String_dispatch_table
sw $a0, 8($v0)
sw $v0, -28($fp)
lw $a0, -28($fp)
lw $a1, -12($fp)
sw $a1, 12($a0)
lw $v0, -28($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl init_IO
init_IO:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
li $a0, 16
li $v0, 9
syscall
li $a0, 5
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, IO_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_IO_in_string
def_IO_in_string:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -20($fp)
li $a0, 50
li $v0, 9
syscall
move $a0, $v0
li $a1, 50
li $v0, 8
syscall
sw $a0, -12($fp)
li $a0, 0
sw $a0, -24($fp)
lw $a1, -12($fp)
li $a0, 0
lengthLoop1561659541395334:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616595413954167
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561659541395334
brakeLengthLoop15616595413954167:
sw $a0, -28($fp)
lw $a1, -12($fp)
lw $t0, -24($fp)
add $a1, $a1, $t0
lw $a0, -28($fp)
add $a0, $a0, 1
li $v0, 9
syscall
sub $a0, $a0, 1
move $t0, $v0
li $t1, 0
loop15616595413955328:
lb $t2, ($a1)
beq $t2, $zero, brake15616595413956127
beq $t1, $a0, brake15616595413956127
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616595413955328
brake15616595413956127:
sb $zero, ($t0)
sw $v0, -12($fp)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_IO_in_int
def_IO_in_int:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -36($fp)
li $v0, 5
syscall
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_IO_out_string
def_IO_out_string:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 4($fp)
sw $a0, -44($fp)
lw $a0, 0($fp)
sw $a0, -40($fp)
lw $a0, -44($fp)
lw $a1, 12($a0)
sw $a1, -44($fp)
lw $a0, -44($fp)
li $v0, 4
syscall
lw $v0, -40($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_IO_out_int
def_IO_out_int:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 4($fp)
sw $a0, -52($fp)
lw $a0, 0($fp)
sw $a0, -48($fp)
lw $a0, -52($fp)
li $v0, 4
syscall
lw $v0, -48($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl init_Main
init_Main:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
li $a0, 12
li $v0, 9
syscall
li $a0, 6
sw $a0, ($v0)
li $a0, 3
sw $a0, 4($v0)
la $a0, Main_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

.globl def_Main_main
def_Main_main:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -12($fp)
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $a0, ($sp)
subu $sp, $sp, 4
sw $a1, ($sp)
subu $sp, $sp, 4
sw $a2, ($sp)
subu $sp, $sp, 4
sw $a3, ($sp)
subu $sp, $sp, 4
sw $t0, ($sp)
subu $sp, $sp, 4
sw $t1, ($sp)
subu $sp, $sp, 4
sw $t2, ($sp)
subu $sp, $sp, 4
sw $t3, ($sp)
subu $sp, $sp, 4
sw $t4, ($sp)
jal init_String
sw $v0, -20($fp)
addu $sp, $sp, 0
lw $t4, ($sp)
addu $sp, $sp, 4
lw $t3, ($sp)
addu $sp, $sp, 4
lw $t2, ($sp)
addu $sp, $sp, 4
lw $t1, ($sp)
addu $sp, $sp, 4
lw $t0, ($sp)
addu $sp, $sp, 4
lw $a3, ($sp)
addu $sp, $sp, 4
lw $a2, ($sp)
addu $sp, $sp, 4
lw $a1, ($sp)
addu $sp, $sp, 4
lw $a0, ($sp)
addu $sp, $sp, 4
lw $ra, ($sp)
addu $sp, $sp, 4
la $a0, Main_main_data_1
sw $a0, -16($fp)
lw $a0, -20($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
lw $a0, -20($fp)
lw $a1, 12($a0)
sw $a1, -20($fp)
lw $a0, -20($fp)
li $v0, 4
syscall
lw $a0, -12($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra

