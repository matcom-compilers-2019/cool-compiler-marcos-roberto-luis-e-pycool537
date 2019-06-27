.data
empty_string: .asciiz ""
null_reference: .asciiz "Null reference exception!!!"
zero_division: .asciiz "Division by zero! Are you insane?"
main_prototype: .word 1, 3, Main_dispatch_table
inheritance_table: .word 0,, 0, 1, 1, 1, 1, 5, 6, 6, 5
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
List_dispatch_table: .word isNil_ptr, def_List_isNil, cons_ptr, def_List_cons, car_ptr, def_List_car, cdr_ptr, def_List_cdr, rev_ptr, def_List_rev, sort_ptr, def_List_sort, insert_ptr, def_List_insert, rcons_ptr, def_List_rcons, print_list_ptr, def_List_print_list, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
isNil_ptr: .asciiz "isNil"
cons_ptr: .asciiz "cons"
car_ptr: .asciiz "car"
cdr_ptr: .asciiz "cdr"
rev_ptr: .asciiz "rev"
sort_ptr: .asciiz "sort"
insert_ptr: .asciiz "insert"
rcons_ptr: .asciiz "rcons"
print_list_ptr: .asciiz "print_list"
Cons_dispatch_table: .word isNil_ptr, def_Cons_isNil, init_ptr, def_Cons_init, car_ptr, def_Cons_car, cdr_ptr, def_Cons_cdr, rev_ptr, def_Cons_rev, sort_ptr, def_Cons_sort, insert_ptr, def_Cons_insert, rcons_ptr, def_Cons_rcons, print_list_ptr, def_Cons_print_list, isNil_ptr, def_List_isNil, cons_ptr, def_List_cons, car_ptr, def_List_car, cdr_ptr, def_List_cdr, rev_ptr, def_List_rev, sort_ptr, def_List_sort, insert_ptr, def_List_insert, rcons_ptr, def_List_rcons, print_list_ptr, def_List_print_list, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
init_ptr: .asciiz "init"
Nil_dispatch_table: .word isNil_ptr, def_Nil_isNil, rev_ptr, def_Nil_rev, sort_ptr, def_Nil_sort, insert_ptr, def_Nil_insert, rcons_ptr, def_Nil_rcons, print_list_ptr, def_Nil_print_list, isNil_ptr, def_List_isNil, cons_ptr, def_List_cons, car_ptr, def_List_car, cdr_ptr, def_List_cdr, rev_ptr, def_List_rev, sort_ptr, def_List_sort, insert_ptr, def_List_insert, rcons_ptr, def_List_rcons, print_list_ptr, def_List_print_list, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
Main_dispatch_table: .word iota_ptr, def_Main_iota, main_ptr, def_Main_main, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
iota_ptr: .asciiz "iota"
main_ptr: .asciiz "main"
Object_abort_data_0: .asciiz "Abort()"
List_isNil_data_1: .asciiz "abort"
List_cons_data_2: .asciiz "init"
List_car_data_3: .asciiz "abort"
List_cdr_data_4: .asciiz "abort"
List_rev_data_5: .asciiz "cdr"
List_sort_data_6: .asciiz "cdr"
List_insert_data_7: .asciiz "cdr"
List_rcons_data_8: .asciiz "cdr"
List_print_list_data_9: .asciiz "abort"
Cons_rev_data_10: .asciiz "rev"
Cons_rev_data_11: .asciiz "rcons"
Cons_sort_data_12: .asciiz "sort"
Cons_sort_data_13: .asciiz "insert"
Cons_insert_data_14: .asciiz "insert"
Cons_insert_data_15: .asciiz "init"
Cons_insert_data_16: .asciiz "init"
Cons_rcons_data_17: .asciiz "rcons"
Cons_rcons_data_18: .asciiz "init"
Cons_print_list_data_19: .asciiz "\n"
Cons_print_list_data_20: .asciiz "print_list"
Nil_insert_data_21: .asciiz "rcons"
Nil_rcons_data_22: .asciiz "init"
Main_iota_data_23: .asciiz "init"
Main_main_data_24: .asciiz "How many numbers to sort?"
Main_main_data_25: .asciiz "iota"
Main_main_data_26: .asciiz "rev"
Main_main_data_27: .asciiz "sort"
Main_main_data_28: .asciiz "print_list"
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
loop15616447460057485:
lw $t2, ($a1)
beq $t1, $a0, brake15616447460058575
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616447460057485
brake15616447460058575:
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
loop15616447460060604:
lw $t2, ($a1)
beq $t1, $a0, brake15616447460061386
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616447460060604
brake15616447460061386:
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
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15616447460064385:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616447460065188
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616447460064385
brakeLengthLoop15616447460065188:
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
lengthLoop15616447460067503:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop1561644746006855
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616447460067503
brakeLengthLoop1561644746006855:
sw $a0, -28($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15616447460073845:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616447460074823
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616447460073845
brakeLengthLoop15616447460074823:
sw $a0, -20($fp)
lw $a1, -24($fp)
lw $a0, -28($fp)
lw $t0, -20($fp)
add $a0, $a0, $t0
li $v0, 9
syscall
move $t0, $v0
loop15616447460076213:
lb $t2, ($a1)
beq $t2, $zero, brake15616447460077083
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop15616447460076213
brake15616447460077083:
lw $a1, -16($fp)
loop21561644746007793:
lb $t2, ($a1)
beq $t2, $zero, brake215616447460078697
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop21561644746007793
brake215616447460078697:
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
loop15616447460081482:
lb $t2, ($a1)
beq $t2, $zero, brake1561644746008228
beq $t1, $a0, brake1561644746008228
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616447460081482
brake1561644746008228:
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
.globl init_List
.ent init_List
init_List:
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
la $a0, List_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end init_List
.globl def_List_isNil
.ent def_List_isNil
def_List_isNil:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460088847
li $a0, 0
isVoid15616447460088847:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_List_isNil_not_valid_dispatch_jump_0
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_isNil_data_1
sw $a0, -28($fp)
lw $a3, -12($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460091047:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460091834:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse156164474600926
beqz $t1, returnTrue15616447460093358
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460091834
j returnTrue15616447460093358
returnFalse156164474600926:
li $a0, 0
returnTrue15616447460093358:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460091047
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_List_isNil_end_dispatch_label_1
label_List_isNil_not_valid_dispatch_jump_0:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_isNil_end_dispatch_label_1:
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
jal init_Bool
sw $v0, -32($fp)
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
li $a0, 1
sw $a0, -36($fp)
lw $a0, -32($fp)
lw $a1, -36($fp)
sw $a1, 12($a0)
lw $a0, -32($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_isNil
.globl def_List_cons
.ent def_List_cons
def_List_cons:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -24($fp)
jal init_Cons
sw $v0, -24($fp)
addu $sp, $sp, 0
lw $a0, -24($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $a0, -20($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a1, -28($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746009652
li $a0, 0
isVoid1561644746009652:
sw $a0, -32($fp)
lw $a0, -32($fp)
bne $a0, $zero, label_List_cons_not_valid_dispatch_jump_2
lw $a0, -16($fp)
sw $a0, -36($fp)
sw $a0, -36($fp)
lw $a0, -12($fp)
sw $a0, -40($fp)
sw $a0, -40($fp)
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
lw $a0, -40($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -36($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -28($fp)
sw $a0, ($sp)
la $a0, List_cons_data_2
sw $a0, -48($fp)
lw $a3, -28($fp)
lw $t4, -48($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746009813:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460098903:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460099664
beqz $t1, returnTrue1561644746010042
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460098903
j returnTrue1561644746010042
returnFalse15616447460099664:
li $a0, 0
returnTrue1561644746010042:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746009813
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -44($fp)
addu $sp, $sp, 12
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
j label_List_cons_end_dispatch_label_3
label_List_cons_not_valid_dispatch_jump_2:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_cons_end_dispatch_label_3:
lw $a0, -44($fp)
sw $a0, -52($fp)
sw $a0, -52($fp)
lw $v0, -52($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_cons
.globl def_List_car
.ent def_List_car
def_List_car:
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
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460101993
li $a0, 0
isVoid15616447460101993:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_List_car_not_valid_dispatch_jump_4
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_car_data_3
sw $a0, -28($fp)
lw $a3, -12($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460103219:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460103989:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561644746010475
beqz $t1, returnTrue15616447460105505
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460103989
j returnTrue15616447460105505
returnFalse1561644746010475:
li $a0, 0
returnTrue15616447460105505:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460103219
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_List_car_end_dispatch_label_5
label_List_car_not_valid_dispatch_jump_4:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_car_end_dispatch_label_5:
li $a0, 48
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 12
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -32($fp)
jal init_Int
sw $v0, -32($fp)
addu $sp, $sp, 0
lw $a0, -32($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_car
.globl def_List_cdr
.ent def_List_cdr
def_List_cdr:
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
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746010726
li $a0, 0
isVoid1561644746010726:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_List_cdr_not_valid_dispatch_jump_6
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_cdr_data_4
sw $a0, -28($fp)
lw $a3, -12($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746010847:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561644746010924:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460110002
beqz $t1, returnTrue15616447460110757
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561644746010924
j returnTrue15616447460110757
returnFalse15616447460110002:
li $a0, 0
returnTrue15616447460110757:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746010847
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_List_cdr_end_dispatch_label_7
label_List_cdr_not_valid_dispatch_jump_6:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_cdr_end_dispatch_label_7:
li $a0, 48
li $v0, 9
syscall
li $a0, 6
sw $a0, ($v0)
li $a0, 12
sw $a0, 4($v0)
la $a0, List_dispatch_table
sw $a0, 8($v0)
sw $v0, -32($fp)
jal init_List
sw $v0, -32($fp)
addu $sp, $sp, 0
lw $a0, -32($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_cdr
.globl def_List_rev
.ent def_List_rev
def_List_rev:
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
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460112405
li $a0, 0
isVoid15616447460112405:
sw $a0, -16($fp)
lw $a0, -16($fp)
bne $a0, $zero, label_List_rev_not_valid_dispatch_jump_8
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_rev_data_5
sw $a0, -24($fp)
lw $a3, -12($fp)
lw $t4, -24($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460113618:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460114386:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460115147
beqz $t1, returnTrue156164474601159
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460114386
j returnTrue156164474601159
returnFalse15616447460115147:
li $a0, 0
returnTrue156164474601159:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460113618
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -20($fp)
addu $sp, $sp, 4
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
j label_List_rev_end_dispatch_label_9
label_List_rev_not_valid_dispatch_jump_8:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_rev_end_dispatch_label_9:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_rev
.globl def_List_sort
.ent def_List_sort
def_List_sort:
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
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460117302
li $a0, 0
isVoid15616447460117302:
sw $a0, -16($fp)
lw $a0, -16($fp)
bne $a0, $zero, label_List_sort_not_valid_dispatch_jump_10
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_sort_data_6
sw $a0, -24($fp)
lw $a3, -12($fp)
lw $t4, -24($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460118508:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460119278:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460120041
beqz $t1, returnTrue156164474601208
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460119278
j returnTrue156164474601208
returnFalse15616447460120041:
li $a0, 0
returnTrue156164474601208:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460118508
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -20($fp)
addu $sp, $sp, 4
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
j label_List_sort_end_dispatch_label_11
label_List_sort_not_valid_dispatch_jump_10:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_sort_end_dispatch_label_11:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_sort
.globl def_List_insert
.ent def_List_insert
def_List_insert:
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
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460122302
li $a0, 0
isVoid15616447460122302:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_List_insert_not_valid_dispatch_jump_12
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_insert_data_7
sw $a0, -28($fp)
lw $a3, -12($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460123508:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561644746012428:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561644746012504
beqz $t1, returnTrue15616447460125797
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561644746012428
j returnTrue15616447460125797
returnFalse1561644746012504:
li $a0, 0
returnTrue15616447460125797:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460123508
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_List_insert_end_dispatch_label_13
label_List_insert_not_valid_dispatch_jump_12:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_insert_end_dispatch_label_13:
lw $v0, -24($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_insert
.globl def_List_rcons
.ent def_List_rcons
def_List_rcons:
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
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460127273
li $a0, 0
isVoid15616447460127273:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_List_rcons_not_valid_dispatch_jump_14
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_rcons_data_8
sw $a0, -28($fp)
lw $a3, -12($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460128484:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460129256:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460130017
beqz $t1, returnTrue15616447460130775
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460129256
j returnTrue15616447460130775
returnFalse15616447460130017:
li $a0, 0
returnTrue15616447460130775:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460128484
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_List_rcons_end_dispatch_label_15
label_List_rcons_not_valid_dispatch_jump_14:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_rcons_end_dispatch_label_15:
lw $v0, -24($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_rcons
.globl def_List_print_list
.ent def_List_print_list
def_List_print_list:
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
sw $a0, -12($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746013209
li $a0, 0
isVoid1561644746013209:
sw $a0, -16($fp)
lw $a0, -16($fp)
bne $a0, $zero, label_List_print_list_not_valid_dispatch_jump_16
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, List_print_list_data_9
sw $a0, -24($fp)
lw $a3, -12($fp)
lw $t4, -24($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460133302:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460134103:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460134869
beqz $t1, returnTrue15616447460135627
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460134103
j returnTrue15616447460135627
returnFalse15616447460134869:
li $a0, 0
returnTrue15616447460135627:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460133302
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -20($fp)
addu $sp, $sp, 4
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
j label_List_print_list_end_dispatch_label_17
label_List_print_list_not_valid_dispatch_jump_16:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_List_print_list_end_dispatch_label_17:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_List_print_list
.globl init_Cons
.ent init_Cons
init_Cons:
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
li $a0, 7
sw $a0, ($v0)
li $a0, 5
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
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
jal init_Int
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
.end init_Cons
.globl def_Cons_isNil
.ent def_Cons_isNil
def_Cons_isNil:
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
jal init_Bool
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
li $a0, 0
sw $a0, -20($fp)
lw $a0, -16($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_isNil
.globl def_Cons_init
.ent def_Cons_init
def_Cons_init:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, 8($fp)
sw $a0, -20($fp)
lw $a0, -16($fp)
sw $a0, -32($fp)
sw $a0, -32($fp)
lw $a1, -32($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616447460138888:
lw $t2, ($a1)
beq $t1, $a0, brake15616447460139656
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616447460138888
brake15616447460139656:
sw $v0, -28($fp)
lw $a0, -12($fp)
lw $a1, -28($fp)
sw $a1, 12($a0)
lw $a0, -20($fp)
sw $a0, -40($fp)
sw $a0, -40($fp)
lw $a0, -40($fp)
sw $a0, -36($fp)
sw $a0, -36($fp)
lw $a0, -12($fp)
lw $a1, -36($fp)
sw $a1, 16($a0)
lw $a0, -12($fp)
sw $a0, -44($fp)
sw $a0, -44($fp)
lw $a0, -44($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
lw $v0, -24($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_init
.globl def_Cons_car
.ent def_Cons_car
def_Cons_car:
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
sw $a0, -12($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_car
.globl def_Cons_cdr
.ent def_Cons_cdr
def_Cons_cdr:
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
sw $a0, -12($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_cdr
.globl def_Cons_rev
.ent def_Cons_rev
def_Cons_rev:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -16($fp)
lw $a1, -16($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460142574
li $a0, 0
isVoid15616447460142574:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_Cons_rev_not_valid_dispatch_jump_18
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
lw $a0, -16($fp)
sw $a0, ($sp)
la $a0, Cons_rev_data_10
sw $a0, -28($fp)
lw $a3, -16($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460143924:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460144708:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460145478
beqz $t1, returnTrue1561644746014624
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460144708
j returnTrue1561644746014624
returnFalse15616447460145478:
li $a0, 0
returnTrue1561644746014624:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460143924
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_Cons_rev_end_dispatch_label_19
label_Cons_rev_not_valid_dispatch_jump_18:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_rev_end_dispatch_label_19:
lw $a1, -24($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460148182
li $a0, 0
isVoid15616447460148182:
sw $a0, -32($fp)
lw $a0, -32($fp)
bne $a0, $zero, label_Cons_rev_not_valid_dispatch_jump_20
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
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
lw $a0, -36($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -24($fp)
sw $a0, ($sp)
la $a0, Cons_rev_data_11
sw $a0, -44($fp)
lw $a3, -24($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746015047:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460151298:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460152702
beqz $t1, returnTrue1561644746015401
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460151298
j returnTrue1561644746015401
returnFalse15616447460152702:
li $a0, 0
returnTrue1561644746015401:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746015047
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -40($fp)
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
j label_Cons_rev_end_dispatch_label_21
label_Cons_rev_not_valid_dispatch_jump_20:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_rev_end_dispatch_label_21:
lw $v0, -40($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_rev
.globl def_Cons_sort
.ent def_Cons_sort
def_Cons_sort:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -16($fp)
lw $a1, -16($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460157235
li $a0, 0
isVoid15616447460157235:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_Cons_sort_not_valid_dispatch_jump_22
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
lw $a0, -16($fp)
sw $a0, ($sp)
la $a0, Cons_sort_data_12
sw $a0, -28($fp)
lw $a3, -16($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460159268:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460160093:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561644746016087
beqz $t1, returnTrue15616447460161638
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460160093
j returnTrue15616447460161638
returnFalse1561644746016087:
li $a0, 0
returnTrue15616447460161638:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460159268
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -24($fp)
addu $sp, $sp, 4
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
j label_Cons_sort_end_dispatch_label_23
label_Cons_sort_not_valid_dispatch_jump_22:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_sort_end_dispatch_label_23:
lw $a1, -24($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460163724
li $a0, 0
isVoid15616447460163724:
sw $a0, -32($fp)
lw $a0, -32($fp)
bne $a0, $zero, label_Cons_sort_not_valid_dispatch_jump_24
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
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
lw $a0, -36($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -24($fp)
sw $a0, ($sp)
la $a0, Cons_sort_data_13
sw $a0, -44($fp)
lw $a3, -24($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460165398:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460166216:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460169485
beqz $t1, returnTrue15616447460170317
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460166216
j returnTrue15616447460170317
returnFalse15616447460169485:
li $a0, 0
returnTrue15616447460170317:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460165398
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -40($fp)
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
j label_Cons_sort_end_dispatch_label_25
label_Cons_sort_not_valid_dispatch_jump_24:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_sort_end_dispatch_label_25:
lw $v0, -40($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_sort
.globl def_Cons_insert
.ent def_Cons_insert
def_Cons_insert:
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
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -32($fp)
lw $a0, -28($fp)
lw $a1, 12($a0)
sw $a1, -28($fp)
lw $a0, -32($fp)
lw $a1, 12($a0)
sw $a1, -32($fp)
lw $a0, -28($fp)
lw $a1, -32($fp)
sub $a0, $a0, $a1
sw $a0, -24($fp)
lw $a1, -24($fp)
li $a0, 1
bltz $a1, returnTrue15616447460173607
li $a0, 0
returnTrue15616447460173607:
sw $a0, -24($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -36($fp)
lw $a0, -36($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -36($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
lw $a0, -36($fp)
bne $a0, $zero, label_Cons_insert_if_26
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -40($fp)
jal init_Cons
sw $v0, -40($fp)
addu $sp, $sp, 0
lw $a1, -40($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460175254
li $a0, 0
isVoid15616447460175254:
sw $a0, -44($fp)
lw $a0, -44($fp)
bne $a0, $zero, label_Cons_insert_not_valid_dispatch_jump_28
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -48($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -52($fp)
lw $a1, -52($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460176556
li $a0, 0
isVoid15616447460176556:
sw $a0, -56($fp)
lw $a0, -56($fp)
bne $a0, $zero, label_Cons_insert_not_valid_dispatch_jump_29
lw $a0, -16($fp)
sw $a0, -60($fp)
sw $a0, -60($fp)
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
lw $a0, -52($fp)
sw $a0, ($sp)
la $a0, Cons_insert_data_14
sw $a0, -68($fp)
lw $a3, -52($fp)
lw $t4, -68($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460178037:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460178826:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460179625
beqz $t1, returnTrue15616447460180414
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460178826
j returnTrue15616447460180414
returnFalse15616447460179625:
li $a0, 0
returnTrue15616447460180414:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460178037
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
j label_Cons_insert_end_dispatch_label_30
label_Cons_insert_not_valid_dispatch_jump_29:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_insert_end_dispatch_label_30:
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
lw $a0, -64($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -48($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -40($fp)
sw $a0, ($sp)
la $a0, Cons_insert_data_15
sw $a0, -76($fp)
lw $a3, -40($fp)
lw $t4, -76($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746018235:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460183148:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460183935
beqz $t1, returnTrue15616447460184717
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460183148
j returnTrue15616447460184717
returnFalse15616447460183935:
li $a0, 0
returnTrue15616447460184717:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746018235
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -72($fp)
addu $sp, $sp, 12
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
j label_Cons_insert_end_dispatch_label_31
label_Cons_insert_not_valid_dispatch_jump_28:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_insert_end_dispatch_label_31:
lw $a0, -72($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
j label_Cons_insert_fi_27
label_Cons_insert_if_26:
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -80($fp)
jal init_Cons
sw $v0, -80($fp)
addu $sp, $sp, 0
lw $a1, -80($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460186255
li $a0, 0
isVoid15616447460186255:
sw $a0, -84($fp)
lw $a0, -84($fp)
bne $a0, $zero, label_Cons_insert_not_valid_dispatch_jump_32
lw $a0, -16($fp)
sw $a0, -88($fp)
sw $a0, -88($fp)
lw $a0, -12($fp)
sw $a0, -92($fp)
sw $a0, -92($fp)
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
lw $a0, -92($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -88($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -80($fp)
sw $a0, ($sp)
la $a0, Cons_insert_data_16
sw $a0, -100($fp)
lw $a3, -80($fp)
lw $t4, -100($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460187967:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460188768:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460189552
beqz $t1, returnTrue15616447460190346
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460188768
j returnTrue15616447460190346
returnFalse15616447460189552:
li $a0, 0
returnTrue15616447460190346:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460187967
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -96($fp)
addu $sp, $sp, 12
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
j label_Cons_insert_end_dispatch_label_33
label_Cons_insert_not_valid_dispatch_jump_32:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_insert_end_dispatch_label_33:
lw $a0, -96($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
label_Cons_insert_fi_27:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_insert
.globl def_Cons_rcons
.ent def_Cons_rcons
def_Cons_rcons:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -20($fp)
jal init_Cons
sw $v0, -20($fp)
addu $sp, $sp, 0
lw $a1, -20($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460193388
li $a0, 0
isVoid15616447460193388:
sw $a0, -24($fp)
lw $a0, -24($fp)
bne $a0, $zero, label_Cons_rcons_not_valid_dispatch_jump_34
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -28($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -32($fp)
lw $a1, -32($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746019475
li $a0, 0
isVoid1561644746019475:
sw $a0, -36($fp)
lw $a0, -36($fp)
bne $a0, $zero, label_Cons_rcons_not_valid_dispatch_jump_35
lw $a0, -16($fp)
sw $a0, -40($fp)
sw $a0, -40($fp)
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
lw $a0, -40($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -32($fp)
sw $a0, ($sp)
la $a0, Cons_rcons_data_17
sw $a0, -48($fp)
lw $a3, -32($fp)
lw $t4, -48($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460196247:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460197048:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460197837
beqz $t1, returnTrue15616447460198617
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460197048
j returnTrue15616447460198617
returnFalse15616447460197837:
li $a0, 0
returnTrue15616447460198617:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460196247
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -44($fp)
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
j label_Cons_rcons_end_dispatch_label_36
label_Cons_rcons_not_valid_dispatch_jump_35:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_rcons_end_dispatch_label_36:
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
lw $a0, -44($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -28($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -20($fp)
sw $a0, ($sp)
la $a0, Cons_rcons_data_18
sw $a0, -56($fp)
lw $a3, -20($fp)
lw $t4, -56($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746020014:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460200944:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561644746020173
beqz $t1, returnTrue1561644746020251
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460200944
j returnTrue1561644746020251
returnFalse1561644746020173:
li $a0, 0
returnTrue1561644746020251:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746020014
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -52($fp)
addu $sp, $sp, 12
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
j label_Cons_rcons_end_dispatch_label_37
label_Cons_rcons_not_valid_dispatch_jump_34:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_rcons_end_dispatch_label_37:
lw $v0, -52($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_rcons
.globl def_Cons_print_list
.ent def_Cons_print_list
def_Cons_print_list:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -20($fp)
lw $a0, -20($fp)
lw $a1, 12($a0)
sw $a1, -20($fp)
lw $a0, -20($fp)
li $v0, 1
syscall
lw $a0, -12($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
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
sw $v0, -28($fp)
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
la $a0, Cons_print_list_data_19
sw $a0, -24($fp)
lw $a0, -28($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -28($fp)
lw $a1, 12($a0)
sw $a1, -28($fp)
lw $a0, -28($fp)
li $v0, 4
syscall
lw $a0, -12($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a0, -12($fp)
lw $a1, 16($a0)
sw $a1, -32($fp)
lw $a1, -32($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746020564
li $a0, 0
isVoid1561644746020564:
sw $a0, -36($fp)
lw $a0, -36($fp)
bne $a0, $zero, label_Cons_print_list_not_valid_dispatch_jump_38
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
lw $a0, -32($fp)
sw $a0, ($sp)
la $a0, Cons_print_list_data_20
sw $a0, -44($fp)
lw $a3, -32($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746020702:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460207844:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561644746020865
beqz $t1, returnTrue15616447460209436
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460207844
j returnTrue15616447460209436
returnFalse1561644746020865:
li $a0, 0
returnTrue15616447460209436:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746020702
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -40($fp)
addu $sp, $sp, 4
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
j label_Cons_print_list_end_dispatch_label_39
label_Cons_print_list_not_valid_dispatch_jump_38:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Cons_print_list_end_dispatch_label_39:
lw $a0, -40($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Cons_print_list
.globl init_Nil
.ent init_Nil
init_Nil:
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
li $a0, 8
sw $a0, ($v0)
li $a0, 3
sw $a0, 4($v0)
la $a0, Nil_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end init_Nil
.globl def_Nil_isNil
.ent def_Nil_isNil
def_Nil_isNil:
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
jal init_Bool
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
li $a0, 1
sw $a0, -20($fp)
lw $a0, -16($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_isNil
.globl def_Nil_rev
.ent def_Nil_rev
def_Nil_rev:
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
sw $a0, -12($fp)
lw $a0, -12($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_rev
.globl def_Nil_sort
.ent def_Nil_sort
def_Nil_sort:
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
sw $a0, -12($fp)
lw $a0, -12($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_sort
.globl def_Nil_insert
.ent def_Nil_insert
def_Nil_insert:
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
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746021365
li $a0, 0
isVoid1561644746021365:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_Nil_insert_not_valid_dispatch_jump_40
lw $a0, -16($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
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
lw $a0, -24($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, Nil_insert_data_21
sw $a0, -32($fp)
lw $a3, -12($fp)
lw $t4, -32($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460215194:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460216033:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460216837
beqz $t1, returnTrue15616447460217636
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460216033
j returnTrue15616447460217636
returnFalse15616447460216837:
li $a0, 0
returnTrue15616447460217636:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460215194
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -28($fp)
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
j label_Nil_insert_end_dispatch_label_41
label_Nil_insert_not_valid_dispatch_jump_40:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Nil_insert_end_dispatch_label_41:
lw $v0, -28($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_insert
.globl def_Nil_rcons
.ent def_Nil_rcons
def_Nil_rcons:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -20($fp)
jal init_Cons
sw $v0, -20($fp)
addu $sp, $sp, 0
lw $a1, -20($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460219772
li $a0, 0
isVoid15616447460219772:
sw $a0, -24($fp)
lw $a0, -24($fp)
bne $a0, $zero, label_Nil_rcons_not_valid_dispatch_jump_42
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a0, -12($fp)
sw $a0, -32($fp)
sw $a0, -32($fp)
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
lw $a0, -32($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -28($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -20($fp)
sw $a0, ($sp)
la $a0, Nil_rcons_data_22
sw $a0, -40($fp)
lw $a3, -20($fp)
lw $t4, -40($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746022171:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460222585:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse156164474602234
beqz $t1, returnTrue15616447460224187
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460222585
j returnTrue15616447460224187
returnFalse156164474602234:
li $a0, 0
returnTrue15616447460224187:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746022171
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -36($fp)
addu $sp, $sp, 12
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
j label_Nil_rcons_end_dispatch_label_43
label_Nil_rcons_not_valid_dispatch_jump_42:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Nil_rcons_end_dispatch_label_43:
lw $v0, -36($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_rcons
.globl def_Nil_print_list
.ent def_Nil_print_list
def_Nil_print_list:
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
jal init_Bool
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
li $a0, 1
sw $a0, -20($fp)
lw $a0, -16($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Nil_print_list
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
li $a0, 16
li $v0, 9
syscall
li $a0, 9
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Main_dispatch_table
sw $a0, 8($v0)
sw $v0, -12($fp)
li $a0, 0
sw $a0, -20($fp)
lw $a0, -12($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end init_Main
.globl def_Main_iota
.ent def_Main_iota
def_Main_iota:
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
lw $a0, 4($fp)
sw $a0, -16($fp)
li $a0, 48
li $v0, 9
syscall
li $a0, 8
sw $a0, ($v0)
li $a0, 12
sw $a0, 4($v0)
la $a0, Nil_dispatch_table
sw $a0, 8($v0)
sw $v0, -28($fp)
jal init_Nil
sw $v0, -28($fp)
addu $sp, $sp, 0
lw $a0, -28($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
lw $a0, -12($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
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
jal init_Int
sw $v0, -36($fp)
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
li $a0, 0
sw $a0, -40($fp)
lw $a0, -36($fp)
lw $a1, -40($fp)
sw $a1, 12($a0)
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
jal init_Int
sw $v0, -44($fp)
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
li $a0, 0
sw $a0, -48($fp)
lw $a0, -44($fp)
lw $a1, -48($fp)
sw $a1, 12($a0)
lw $a1, -44($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616447460229144:
lw $t2, ($a1)
beq $t1, $a0, brake15616447460230088
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616447460229144
brake15616447460230088:
sw $v0, -32($fp)
label_Main_iota_while_44_44:
lw $a0, -32($fp)
sw $a0, -56($fp)
sw $a0, -56($fp)
lw $a0, -16($fp)
sw $a0, -60($fp)
sw $a0, -60($fp)
lw $a0, -56($fp)
lw $a1, 12($a0)
sw $a1, -56($fp)
lw $a0, -60($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
lw $a0, -56($fp)
lw $a1, -60($fp)
sub $a0, $a0, $a1
sw $a0, -52($fp)
lw $a1, -52($fp)
li $a0, 1
bltz $a1, returnTrue1561644746023208
li $a0, 0
returnTrue1561644746023208:
sw $a0, -52($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -64($fp)
lw $a0, -64($fp)
lw $a1, -52($fp)
sw $a1, 12($a0)
lw $a0, -64($fp)
lw $a1, 12($a0)
sw $a1, -64($fp)
lw $a0, -64($fp)
bne $a0, $zero, label_Main_iota_loop_45_45
j label_Main_iota_pool_46_46
label_Main_iota_loop_45_45:
li $a0, 80
li $v0, 9
syscall
li $a0, 7
sw $a0, ($v0)
li $a0, 20
sw $a0, 4($v0)
la $a0, Cons_dispatch_table
sw $a0, 8($v0)
sw $v0, -76($fp)
jal init_Cons
sw $v0, -76($fp)
addu $sp, $sp, 0
lw $a1, -76($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460234041
li $a0, 0
isVoid15616447460234041:
sw $a0, -80($fp)
lw $a0, -80($fp)
bne $a0, $zero, label_Main_iota_not_valid_dispatch_jump_48
lw $a0, -32($fp)
sw $a0, -84($fp)
sw $a0, -84($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -88($fp)
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
lw $a0, -88($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -84($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -76($fp)
sw $a0, ($sp)
la $a0, Main_iota_data_23
sw $a0, -96($fp)
lw $a3, -76($fp)
lw $t4, -96($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561644746023876:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561644746024162:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460244553
beqz $t1, returnTrue1561644746024752
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561644746024162
j returnTrue1561644746024752
returnFalse15616447460244553:
li $a0, 0
returnTrue1561644746024752:
add $t0, $t0, 8
beqz $a0, tableLoop1561644746023876
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -92($fp)
addu $sp, $sp, 12
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
j label_Main_iota_end_dispatch_label_49
label_Main_iota_not_valid_dispatch_jump_48:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_iota_end_dispatch_label_49:
lw $a0, -92($fp)
sw $a0, -72($fp)
sw $a0, -72($fp)
lw $a0, -12($fp)
lw $a1, -72($fp)
sw $a1, 12($a0)
lw $a0, -32($fp)
sw $a0, -112($fp)
sw $a0, -112($fp)
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
jal init_Int
sw $v0, -116($fp)
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
li $a0, 1
sw $a0, -120($fp)
lw $a0, -116($fp)
lw $a1, -120($fp)
sw $a1, 12($a0)
lw $a0, -112($fp)
lw $a1, 12($a0)
sw $a1, -112($fp)
lw $a0, -116($fp)
lw $a1, 12($a0)
sw $a1, -116($fp)
lw $a0, -112($fp)
lw $a1, -116($fp)
add $a0, $a0, $a1
sw $a0, -104($fp)
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
jal init_Int
sw $v0, -108($fp)
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
lw $a0, -108($fp)
lw $a1, -104($fp)
sw $a1, 12($a0)
lw $a1, -108($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616447460251997:
lw $t2, ($a1)
beq $t1, $a0, brake15616447460252855
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616447460251997
brake15616447460252855:
sw $v0, -32($fp)
lw $a0, -32($fp)
sw $a0, -32($fp)
sw $a0, -32($fp)
lw $a0, -32($fp)
sw $a0, -68($fp)
sw $a0, -68($fp)
j label_Main_iota_while_44_44
label_Main_iota_pool_46_46:
li $a0, 16
li $v0, 9
syscall
li $a0, 1
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Object_dispatch_table
sw $a0, 8($v0)
sw $v0, -124($fp)
lw $a0, -124($fp)
sw $a0, -128($fp)
sw $a0, -128($fp)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -136($fp)
lw $a0, -136($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.end def_Main_iota
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
subu $sp, $sp, 4
sw $zero, ($sp)
subu $sp, $sp, 4
sw $zero, ($sp)
lw $a0, 0($fp)
sw $a0, -12($fp)
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
sw $v0, -24($fp)
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
la $a0, Main_main_data_24
sw $a0, -20($fp)
lw $a0, -24($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $a0, -24($fp)
lw $a1, 12($a0)
sw $a1, -24($fp)
lw $a0, -24($fp)
li $v0, 4
syscall
lw $a0, -12($fp)
sw $a0, -24($fp)
sw $a0, -24($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746025694
li $a0, 0
isVoid1561644746025694:
sw $a0, -28($fp)
lw $a0, -28($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_50
li $v0, 5
syscall
sw $v0, -32($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 2
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Int_dispatch_table
sw $a0, 8($v0)
sw $v0, -36($fp)
lw $a0, -36($fp)
lw $a1, -32($fp)
sw $a1, 12($a0)
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
lw $a0, -36($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, Main_main_data_25
sw $a0, -44($fp)
lw $a3, -12($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460258973:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561644746025982:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460260623
beqz $t1, returnTrue15616447460261412
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561644746025982
j returnTrue15616447460261412
returnFalse15616447460260623:
li $a0, 0
returnTrue15616447460261412:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460258973
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -40($fp)
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
j label_Main_main_end_dispatch_label_51
label_Main_main_not_valid_dispatch_jump_50:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_51:
lw $a1, -40($fp)
li $a0, 1
beq $a1, $zero, isVoid15616447460262783
li $a0, 0
isVoid15616447460262783:
sw $a0, -48($fp)
lw $a0, -48($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_52
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
lw $a0, -40($fp)
sw $a0, ($sp)
la $a0, Main_main_data_26
sw $a0, -56($fp)
lw $a3, -40($fp)
lw $t4, -56($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460264206:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460265026:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460265825
beqz $t1, returnTrue15616447460266612
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460265026
j returnTrue15616447460266612
returnFalse15616447460265825:
li $a0, 0
returnTrue15616447460266612:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460264206
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -52($fp)
addu $sp, $sp, 4
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
j label_Main_main_end_dispatch_label_53
label_Main_main_not_valid_dispatch_jump_52:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_53:
lw $a1, -52($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746026782
li $a0, 0
isVoid1561644746026782:
sw $a0, -60($fp)
lw $a0, -60($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_54
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
lw $a0, -52($fp)
sw $a0, ($sp)
la $a0, Main_main_data_27
sw $a0, -68($fp)
lw $a3, -52($fp)
lw $t4, -68($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460269146:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460269954:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460270746
beqz $t1, returnTrue15616447460271537
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460269954
j returnTrue15616447460271537
returnFalse15616447460270746:
li $a0, 0
returnTrue15616447460271537:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460269146
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -64($fp)
addu $sp, $sp, 4
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
j label_Main_main_end_dispatch_label_55
label_Main_main_not_valid_dispatch_jump_54:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_55:
lw $a1, -64($fp)
li $a0, 1
beq $a1, $zero, isVoid1561644746027274
li $a0, 0
isVoid1561644746027274:
sw $a0, -72($fp)
lw $a0, -72($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_56
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
lw $a0, -64($fp)
sw $a0, ($sp)
la $a0, Main_main_data_28
sw $a0, -80($fp)
lw $a3, -64($fp)
lw $t4, -80($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616447460274093:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616447460274916:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616447460275714
beqz $t1, returnTrue15616447460276496
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616447460274916
j returnTrue15616447460276496
returnFalse15616447460275714:
li $a0, 0
returnTrue15616447460276496:
add $t0, $t0, 8
beqz $a0, tableLoop15616447460274093
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -76($fp)
addu $sp, $sp, 4
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
j label_Main_main_end_dispatch_label_57
label_Main_main_not_valid_dispatch_jump_56:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_57:
lw $a0, -76($fp)
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
