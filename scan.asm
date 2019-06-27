.data
empty_string: .asciiz ""
main_prototype: .word 1, 3, Main_dispatch_table
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
A_dispatch_table: .word print_ptr, def_A_print, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
print_ptr: .asciiz "print"
Object_abort_data_0: .asciiz "Abort()"
Main_main_data_1: .asciiz "print"
.text
.globl main
.ent main
main:
subu $sp, $sp, 4
sw $fp, ($sp)
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
lw $fp, ($sp)
addu $sp, $sp, 4
subu $sp, $sp, 4
sw $fp, ($sp)
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
lw $fp, ($sp)
addu $sp, $sp, 4
li $v0, 10
syscall
.end main
.globl init_Object
.ent init_Object
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
.end init_Object
.globl def_Object_abort
.ent def_Object_abort
def_Object_abort:
subu $sp, $sp, 4
sw $fp, ($sp)
addu $fp, $sp, 4
subu $sp, $sp, 4
sw $ra, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
la $a0, Object_abort_data_0
li $v0, 4
syscall
li $v0, 10
syscall
.end def_Object_abort
.globl def_Object_type_name
.ent def_Object_type_name
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
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a0, ($a0)
sw $a0, -12($fp)
lw $v0, -12($fp)
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
loop15615602034595766:
lw $t2, ($a1)
beq $t1, $a0, brake1561560203459674
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15615602034595766
brake1561560203459674:
sw $v0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Object_type_name
.globl def_Object_copy
.ent def_Object_copy
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
lw $v0, -12($fp)
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
loop1561560203459821:
lw $t2, ($a1)
beq $t1, $a0, brake15615602034598968
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop1561560203459821
brake15615602034598968:
sw $v0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Object_copy
.globl init_Int
.ent init_Int
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
.end init_Int
.globl init_Bool
.ent init_Bool
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
.end init_Bool
.globl init_String
.ent init_String
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
.end init_String
.globl def_String_length
.ent def_String_length
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
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15615602034601927:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15615602034602714
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15615602034601927
brakeLengthLoop15615602034602714:
sw $a0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_String_length
.globl def_String_concat
.ent def_String_concat
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
lengthLoop156156020346058:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15615602034606624
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop156156020346058
brakeLengthLoop15615602034606624:
sw $a0, -28($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15615602034607563:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15615602034608326
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15615602034607563
brakeLengthLoop15615602034608326:
sw $a0, -20($fp)
lw $a1, -24($fp)
lw $a0, -28($fp)
lw $t0, -20($fp)
add $a0, $a0, $t0
li $v0, 9
syscall
move $t0, $v0
loop1561560203460946:
lb $t2, ($a1)
beq $t2, $zero, brake15615602034610226
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop1561560203460946
brake15615602034610226:
lw $a1, -16($fp)
loop215615602034611037:
lb $t2, ($a1)
beq $t2, $zero, brake2156156020346118
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop215615602034611037
brake2156156020346118:
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
.end def_String_concat
.globl def_String_substr
.ent def_String_substr
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
lw $a0, 8($fp)
sw $a0, -24($fp)
lw $a0, 4($fp)
sw $a0, -20($fp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a1, -16($fp)
lw $t0, -20($fp)
add $a1, $a1, $t0
lw $a0, -24($fp)
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
loop15615602034613674:
lb $t2, ($a1)
beq $t2, $zero, brake1561560203461444
beq $t1, $a0, brake1561560203461444
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15615602034613674
brake1561560203461444:
sb $zero, ($t0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_String_substr
.globl init_IO
.ent init_IO
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
.end init_IO
.globl def_IO_in_string
.ent def_IO_in_string
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
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_IO_in_string
.globl def_IO_in_int
.ent def_IO_in_int
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
sw $a0, -28($fp)
li $a0, 50
li $v0, 9
syscall
move $a0, $v0
li $a1, 50
li $v0, 8
syscall
sw $a0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_IO_in_int
.globl def_IO_out_string
.ent def_IO_out_string
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
sw $a0, -36($fp)
lw $a0, 0($fp)
sw $a0, -32($fp)
lw $a0, -36($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
lw $a0, -36($fp)
li $v0, 4
syscall
lw $v0, -32($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_IO_out_string
.globl def_IO_out_int
.ent def_IO_out_int
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
sw $a0, -44($fp)
lw $a0, 0($fp)
sw $a0, -40($fp)
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
.end def_IO_out_int
.globl init_Main
.ent init_Main
init_Main:
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
li $a0, 20
li $v0, 9
syscall
li $a0, 6
sw $a0, ($v0)
li $a0, 5
sw $a0, 4($v0)
la $a0, Main_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
subu $sp, $sp, 4
sw $fp, ($sp)
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
sw $v0, -16($fp)
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
lw $fp, ($sp)
addu $sp, $sp, 4
lw $a0, -12($fp)
lw $a1, -16($fp)
sw $a1, 12($a0)
li $a0, 0
sw $a0, -24($fp)
lw $a0, -12($fp)
lw $a1, -24($fp)
sw $a1, 16($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end init_Main
.globl def_Main_main
.ent def_Main_main
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
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -12($fp)
li $a0, 50
li $v0, 9
syscall
move $a0, $v0
li $a1, 50
li $v0, 8
syscall
sw $a0, -24($fp)
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
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a1, -28($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15615602034618948:
lw $t2, ($a1)
beq $t1, $a0, brake15615602034619725
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15615602034618948
brake15615602034619725:
sw $v0, -20($fp)
lw $a0, -28($fp)
lw $a1, 12($a0)
sw $a1, -32($fp)
li $a0, 0
sw $a0, -36($fp)
lw $a1, -32($fp)
li $a0, 0
lengthLoop1561560203462086:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop1561560203462162
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561560203462086
brakeLengthLoop1561560203462162:
sw $a0, -40($fp)
lw $a1, -32($fp)
lw $t0, -36($fp)
add $a1, $a1, $t0
lw $a0, -40($fp)
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
loop1561560203462267:
lb $t2, ($a1)
beq $t2, $zero, brake1561560203462343
beq $t1, $a0, brake1561560203462343
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop1561560203462267
brake1561560203462343:
sb $zero, ($t0)
sw $v0, -44($fp)
lw $a0, -20($fp)
lw $a1, -44($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
li $a0, 48
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 12
sw $a0, 4($v0)
la $a0, A_dispatch_table
sw $a0, 8($v0)
sw $v0, -52($fp)
jal init_A
sw $v0, -52($fp)
addu $sp, $sp, 0
lw $a0, -52($fp)
sw $a0, -48($fp)
sw $a0, -48($fp)
lw $a0, -12($fp)
lw $a1, -48($fp)
sw $a1, 16($a0)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -56($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
subu $sp, $sp, 4
sw $fp, ($sp)
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
lw $a0, -60($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -56($fp)
sw $a0, ($sp)
la $a0, Main_main_data_1
sw $a0, -68($fp)
lw $a3, -56($fp)
lw $t4, -68($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15615602034625769:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15615602034626544:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15615602034627306
beqz $t1, returnTrue15615602034628062
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15615602034626544
j returnTrue15615602034628062
returnFalse15615602034627306:
li $a0, 0
returnTrue15615602034628062:
add $t0, $t0, 8
beqz $a0, tableLoop15615602034625769
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -64($fp)
addu $sp, $sp, 8
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
lw $fp, ($sp)
addu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, -72($fp)
sw $a0, -72($fp)
lw $a0, -72($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Main_main
.globl init_A
.ent init_A
init_A:
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
li $a0, 7
sw $a0, ($v0)
li $a0, 3
sw $a0, 4($v0)
la $a0, A_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end init_A
.globl def_A_print
.ent def_A_print
def_A_print:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
lw $a0, -24($fp)
lw $a1, 12($a0)
sw $a1, -24($fp)
lw $a0, -24($fp)
li $v0, 4
syscall
lw $a0, -12($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
lw $a0, -12($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a0, -28($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_A_print
