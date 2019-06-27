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
loop15616492387121408:
lw $t2, ($a1)
beq $t1, $a0, brake15616492387122662
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616492387121408
brake15616492387122662:
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
loop15616492387125082:
lw $t2, ($a1)
beq $t1, $a0, brake15616492387125921
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616492387125082
brake15616492387125921:
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
lengthLoop15616492387128818:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616492387129626
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616492387128818
brakeLengthLoop15616492387129626:
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
lengthLoop1561649238713162:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616492387132397
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561649238713162
brakeLengthLoop15616492387132397:
sw $a0, -28($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop1561649238713334:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616492387134292
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561649238713334
brakeLengthLoop15616492387134292:
sw $a0, -20($fp)
lw $a1, -24($fp)
lw $a0, -28($fp)
lw $t0, -20($fp)
add $a0, $a0, $t0
li $v0, 9
syscall
move $t0, $v0
loop1561649238713548:
lb $t2, ($a1)
beq $t2, $zero, brake15616492387136252
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop1561649238713548
brake15616492387136252:
lw $a1, -16($fp)
loop215616492387137065:
lb $t2, ($a1)
beq $t2, $zero, brake215616492387137837
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop215616492387137065
brake215616492387137837:
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
loop15616492387140813:
lb $t2, ($a1)
beq $t2, $zero, brake15616492387141614
beq $t1, $a0, brake15616492387141614
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616492387140813
brake15616492387141614:
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
.globl init_List
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
.globl def_List_isNil
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
beq $a1, $zero, isVoid15616492387157757
li $a0, 0
isVoid15616492387157757:
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
tableLoop15616492387159283:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238716006:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387160823
beqz $t1, returnTrue15616492387161584
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238716006
j returnTrue15616492387161584
returnFalse15616492387160823:
li $a0, 0
returnTrue15616492387161584:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387159283
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
.globl def_List_cons
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
beq $a1, $zero, isVoid15616492387164485
li $a0, 0
isVoid15616492387164485:
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
tableLoop15616492387166088:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387166858:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387167618
beqz $t1, returnTrue15616492387168374
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387166858
j returnTrue15616492387168374
returnFalse15616492387167618:
li $a0, 0
returnTrue15616492387168374:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387166088
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
.globl def_List_car
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
beq $a1, $zero, isVoid15616492387169995
li $a0, 0
isVoid15616492387169995:
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
tableLoop15616492387171245:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238717202:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238717278
beqz $t1, returnTrue15616492387173545
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238717202
j returnTrue15616492387173545
returnFalse1561649238717278:
li $a0, 0
returnTrue15616492387173545:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387171245
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
.globl def_List_cdr
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
beq $a1, $zero, isVoid15616492387175128
li $a0, 0
isVoid15616492387175128:
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
tableLoop15616492387176352:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238717712:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387177877
beqz $t1, returnTrue15616492387178628
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238717712
j returnTrue15616492387178628
returnFalse15616492387177877:
li $a0, 0
returnTrue15616492387178628:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387176352
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
.globl def_List_rev
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
beq $a1, $zero, isVoid15616492387180355
li $a0, 0
isVoid15616492387180355:
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
tableLoop15616492387181551:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387182324:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387183084
beqz $t1, returnTrue15616492387183847
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387182324
j returnTrue15616492387183847
returnFalse15616492387183084:
li $a0, 0
returnTrue15616492387183847:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387181551
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
.globl def_List_sort
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
beq $a1, $zero, isVoid15616492387185152
li $a0, 0
isVoid15616492387185152:
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
tableLoop1561649238718635:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387187119:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238718788
beqz $t1, returnTrue15616492387188632
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387187119
j returnTrue15616492387188632
returnFalse1561649238718788:
li $a0, 0
returnTrue15616492387188632:
add $t0, $t0, 8
beqz $a0, tableLoop1561649238718635
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
.globl def_List_insert
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
beq $a1, $zero, isVoid15616492387190096
li $a0, 0
isVoid15616492387190096:
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
tableLoop15616492387191293:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387192063:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387192826
beqz $t1, returnTrue1561649238719358
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387192063
j returnTrue1561649238719358
returnFalse15616492387192826:
li $a0, 0
returnTrue1561649238719358:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387191293
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
.globl def_List_rcons
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
beq $a1, $zero, isVoid1561649238719495
li $a0, 0
isVoid1561649238719495:
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
tableLoop15616492387196152:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387196925:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238719768
beqz $t1, returnTrue15616492387198436
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387196925
j returnTrue15616492387198436
returnFalse1561649238719768:
li $a0, 0
returnTrue15616492387198436:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387196152
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
.globl def_List_print_list
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
beq $a1, $zero, isVoid15616492387200344
li $a0, 0
isVoid15616492387200344:
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
tableLoop15616492387201562:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387202334:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387203097
beqz $t1, returnTrue15616492387203853
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387202334
j returnTrue15616492387203853
returnFalse15616492387203097:
li $a0, 0
returnTrue15616492387203853:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387201562
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
.globl init_Cons
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
.globl def_Cons_isNil
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
.globl def_Cons_init
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
loop15616492387206929:
lw $t2, ($a1)
beq $t1, $a0, brake15616492387207696
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616492387206929
brake15616492387207696:
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
.globl def_Cons_car
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
.globl def_Cons_cdr
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
.globl def_Cons_rev
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
beq $a1, $zero, isVoid1561649238721039
li $a0, 0
isVoid1561649238721039:
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
tableLoop1561649238721158:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238721235:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387213106
beqz $t1, returnTrue15616492387214034
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238721235
j returnTrue15616492387214034
returnFalse15616492387213106:
li $a0, 0
returnTrue15616492387214034:
add $t0, $t0, 8
beqz $a0, tableLoop1561649238721158
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
beq $a1, $zero, isVoid15616492387215111
li $a0, 0
isVoid15616492387215111:
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
tableLoop15616492387217224:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387218046:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387218828
beqz $t1, returnTrue15616492387219608
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387218046
j returnTrue15616492387219608
returnFalse15616492387218828:
li $a0, 0
returnTrue15616492387219608:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387217224
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
.globl def_Cons_sort
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
beq $a1, $zero, isVoid15616492387221704
li $a0, 0
isVoid15616492387221704:
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
tableLoop15616492387223122:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387223938:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387224748
beqz $t1, returnTrue1561649238722557
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387223938
j returnTrue1561649238722557
returnFalse15616492387224748:
li $a0, 0
returnTrue1561649238722557:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387223122
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
beq $a1, $zero, isVoid15616492387226949
li $a0, 0
isVoid15616492387226949:
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
tableLoop15616492387228825:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238722985:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387230659
beqz $t1, returnTrue15616492387231503
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238722985
j returnTrue15616492387231503
returnFalse15616492387230659:
li $a0, 0
returnTrue15616492387231503:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387228825
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
.globl def_Cons_insert
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
bltz $a1, returnTrue15616492387234375
li $a0, 0
returnTrue15616492387234375:
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
beq $a1, $zero, isVoid15616492387236142
li $a0, 0
isVoid15616492387236142:
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
beq $a1, $zero, isVoid15616492387237675
li $a0, 0
isVoid15616492387237675:
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
tableLoop15616492387239244:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387243204:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387244031
beqz $t1, returnTrue1561649238724481
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387243204
j returnTrue1561649238724481
returnFalse15616492387244031:
li $a0, 0
returnTrue1561649238724481:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387239244
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
tableLoop15616492387246687:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387247472:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387248247
beqz $t1, returnTrue15616492387249017
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387247472
j returnTrue15616492387249017
returnFalse15616492387248247:
li $a0, 0
returnTrue15616492387249017:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387246687
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
beq $a1, $zero, isVoid15616492387250657
li $a0, 0
isVoid15616492387250657:
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
tableLoop156164923872525:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387253296:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387254372
beqz $t1, returnTrue15616492387255151
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387253296
j returnTrue15616492387255151
returnFalse15616492387254372:
li $a0, 0
returnTrue15616492387255151:
add $t0, $t0, 8
beqz $a0, tableLoop156164923872525
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
.globl def_Cons_rcons
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
beq $a1, $zero, isVoid15616492387258012
li $a0, 0
isVoid15616492387258012:
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
beq $a1, $zero, isVoid15616492387259302
li $a0, 0
isVoid15616492387259302:
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
tableLoop1561649238726071:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238726148:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387262244
beqz $t1, returnTrue15616492387263
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238726148
j returnTrue15616492387263
returnFalse15616492387262244:
li $a0, 0
returnTrue15616492387263:
add $t0, $t0, 8
beqz $a0, tableLoop1561649238726071
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
tableLoop15616492387264426:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387265198:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238726596
beqz $t1, returnTrue15616492387266715
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387265198
j returnTrue15616492387266715
returnFalse1561649238726596:
li $a0, 0
returnTrue15616492387266715:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387264426
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
.globl def_Cons_print_list
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
beq $a1, $zero, isVoid15616492387269874
li $a0, 0
isVoid15616492387269874:
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
tableLoop15616492387271202:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238727202:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387272828
beqz $t1, returnTrue15616492387279432
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238727202
j returnTrue15616492387279432
returnFalse15616492387272828:
li $a0, 0
returnTrue15616492387279432:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387271202
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
.globl init_Nil
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
.globl def_Nil_isNil
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
.globl def_Nil_rev
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
.globl def_Nil_sort
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
.globl def_Nil_insert
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
beq $a1, $zero, isVoid15616492387283998
li $a0, 0
isVoid15616492387283998:
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
tableLoop15616492387286181:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387287016:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238728783
beqz $t1, returnTrue15616492387288642
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387287016
j returnTrue15616492387288642
returnFalse1561649238728783:
li $a0, 0
returnTrue15616492387288642:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387286181
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
.globl def_Nil_rcons
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
beq $a1, $zero, isVoid15616492387290592
li $a0, 0
isVoid15616492387290592:
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
tableLoop15616492387292383:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387293203:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238729427
beqz $t1, returnTrue15616492387295074
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387293203
j returnTrue15616492387295074
returnFalse1561649238729427:
li $a0, 0
returnTrue15616492387295074:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387292383
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
.globl def_Nil_print_list
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
.globl init_Main
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
.globl def_Main_iota
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
loop15616492387299557:
lw $t2, ($a1)
beq $t1, $a0, brake1561649238730038
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616492387299557
brake1561649238730038:
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
bltz $a1, returnTrue15616492387302215
li $a0, 0
returnTrue15616492387302215:
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
beq $a1, $zero, isVoid15616492387304003
li $a0, 0
isVoid15616492387304003:
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
tableLoop15616492387305849:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238730667:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387307477
beqz $t1, returnTrue15616492387308273
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238730667
j returnTrue15616492387308273
returnFalse15616492387307477:
li $a0, 0
returnTrue15616492387308273:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387305849
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
loop15616492387311282:
lw $t2, ($a1)
beq $t1, $a0, brake156164923873121
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616492387311282
brake156164923873121:
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
beq $a1, $zero, isVoid15616492387315571
li $a0, 0
isVoid15616492387315571:
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
tableLoop15616492387317405:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387318223:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387319033
beqz $t1, returnTrue15616492387319834
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387318223
j returnTrue15616492387319834
returnFalse15616492387319033:
li $a0, 0
returnTrue15616492387319834:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387317405
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
beq $a1, $zero, isVoid15616492387330256
li $a0, 0
isVoid15616492387330256:
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
tableLoop15616492387331748:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387332582:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616492387333477
beqz $t1, returnTrue15616492387334192
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387332582
j returnTrue15616492387334192
returnFalse15616492387333477:
li $a0, 0
returnTrue15616492387334192:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387331748
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
beq $a1, $zero, isVoid15616492387335432
li $a0, 0
isVoid15616492387335432:
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
tableLoop15616492387336764:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616492387337587:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse156164923873384
beqz $t1, returnTrue156164923873392
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616492387337587
j returnTrue156164923873392
returnFalse156164923873384:
li $a0, 0
returnTrue156164923873392:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387336764
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
beq $a1, $zero, isVoid15616492387340364
li $a0, 0
isVoid15616492387340364:
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
tableLoop15616492387341695:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561649238734252:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561649238734333
beqz $t1, returnTrue15616492387344174
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561649238734252
j returnTrue15616492387344174
returnFalse1561649238734333:
li $a0, 0
returnTrue15616492387344174:
add $t0, $t0, 8
beqz $a0, tableLoop15616492387341695
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
