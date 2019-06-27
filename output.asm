.data
empty_string: .asciiz ""
null_reference: .asciiz "Null reference exception!!!"
zero_division: .asciiz "Division by zero! Are you insane?"
main_prototype: .word 1, 3, Main_dispatch_table
inheritance_table: .word 0,, 0, 1, 1, 1, 1, 5, 1
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
CellularAutomaton_dispatch_table: .word init_ptr, def_CellularAutomaton_init, print_ptr, def_CellularAutomaton_print, num_cells_ptr, def_CellularAutomaton_num_cells, cell_ptr, def_CellularAutomaton_cell, cell_left_neighbor_ptr, def_CellularAutomaton_cell_left_neighbor, cell_right_neighbor_ptr, def_CellularAutomaton_cell_right_neighbor, cell_at_next_evolution_ptr, def_CellularAutomaton_cell_at_next_evolution, evolve_ptr, def_CellularAutomaton_evolve, init_IO_ptr, init_IO, in_string_ptr, def_IO_in_string, in_int_ptr, def_IO_in_int, out_string_ptr, def_IO_out_string, out_int_ptr, def_IO_out_int
init_ptr: .asciiz "init"
print_ptr: .asciiz "print"
num_cells_ptr: .asciiz "num_cells"
cell_ptr: .asciiz "cell"
cell_left_neighbor_ptr: .asciiz "cell_left_neighbor"
cell_right_neighbor_ptr: .asciiz "cell_right_neighbor"
cell_at_next_evolution_ptr: .asciiz "cell_at_next_evolution"
evolve_ptr: .asciiz "evolve"
Main_dispatch_table: .word main_ptr, def_Main_main, init_Object_ptr, init_Object, abort_ptr, def_Object_abort, type_name_ptr, def_Object_type_name, copy_ptr, def_Object_copy
main_ptr: .asciiz "main"
Object_abort_data_0: .asciiz "Abort()"
CellularAutomaton_print_data_1: .asciiz "\n"
CellularAutomaton_print_data_2: .asciiz "concat"
CellularAutomaton_num_cells_data_3: .asciiz "length"
CellularAutomaton_cell_data_4: .asciiz "substr"
CellularAutomaton_cell_left_neighbor_data_5: .asciiz "cell"
CellularAutomaton_cell_left_neighbor_data_6: .asciiz "num_cells"
CellularAutomaton_cell_left_neighbor_data_7: .asciiz "cell"
CellularAutomaton_cell_right_neighbor_data_8: .asciiz "num_cells"
CellularAutomaton_cell_right_neighbor_data_9: .asciiz "cell"
CellularAutomaton_cell_right_neighbor_data_10: .asciiz "cell"
CellularAutomaton_cell_at_next_evolution_data_11: .asciiz "cell"
CellularAutomaton_cell_at_next_evolution_data_12: .asciiz "X"
CellularAutomaton_cell_at_next_evolution_data_13: .asciiz "cell_left_neighbor"
CellularAutomaton_cell_at_next_evolution_data_14: .asciiz "X"
CellularAutomaton_cell_at_next_evolution_data_15: .asciiz "cell_right_neighbor"
CellularAutomaton_cell_at_next_evolution_data_16: .asciiz "X"
CellularAutomaton_cell_at_next_evolution_data_17: .asciiz "."
CellularAutomaton_cell_at_next_evolution_data_18: .asciiz "X"
CellularAutomaton_evolve_let_data_19: .asciiz "num_cells"
CellularAutomaton_evolve_let_data_20: .asciiz "num_cells"
CellularAutomaton_evolve_data_21: .asciiz "cell_at_next_evolution"
CellularAutomaton_evolve_data_22: .asciiz "concat"
Main_main_data_23: .asciiz "         X         "
Main_main_data_24: .asciiz "init"
Main_main_data_25: .asciiz "print"
Main_main_data_26: .asciiz "evolve"
Main_main_data_27: .asciiz "print"
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
loop15616501972236707:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972237794
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972236707
brake15616501972237794:
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
loop15616501972239559:
lw $t2, ($a1)
beq $t1, $a0, brake1561650197224033
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972239559
brake1561650197224033:
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
lengthLoop1561650197224315:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972243938
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561650197224315
brakeLengthLoop15616501972243938:
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
lengthLoop15616501972260222:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972261064
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616501972260222
brakeLengthLoop15616501972261064:
sw $a0, -28($fp)
lw $a1, -16($fp)
li $a0, 0
lengthLoop15616501972262218:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972263005
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616501972262218
brakeLengthLoop15616501972263005:
sw $a0, -20($fp)
lw $a1, -24($fp)
lw $a0, -28($fp)
lw $t0, -20($fp)
add $a0, $a0, $t0
li $v0, 9
syscall
move $t0, $v0
loop15616501972264273:
lb $t2, ($a1)
beq $t2, $zero, brake15616501972265117
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop15616501972264273
brake15616501972265117:
lw $a1, -16($fp)
loop215616501972265954:
lb $t2, ($a1)
beq $t2, $zero, brake215616501972266753
sb $t2,($t0)
add $a1, $a1, 1
add $t0, $t0, 1
j loop215616501972265954
brake215616501972266753:
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
loop15616501972269447:
lb $t2, ($a1)
beq $t2, $zero, brake1561650197227023
beq $t1, $a0, brake1561650197227023
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616501972269447
brake1561650197227023:
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
.globl init_CellularAutomaton
init_CellularAutomaton:
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
li $a0, 6
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, CellularAutomaton_dispatch_table
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
lw $v0, -12($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_init
def_CellularAutomaton_init:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
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
loop15616501972274456:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972275238
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972274456
brake15616501972275238:
sw $v0, -24($fp)
lw $a0, -28($fp)
lw $a1, 12($a0)
sw $a1, -32($fp)
li $a0, 0
sw $a0, -36($fp)
lw $a1, -32($fp)
li $a0, 0
lengthLoop1561650197227641:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972277184
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop1561650197227641
brakeLengthLoop15616501972277184:
sw $a0, -40($fp)
lw $a1, -32($fp)
lw $t0, -36($fp)
add $a1, $a1, $t0
lw $a0, -40($fp)
add $a0, $a0, 1
li $v0, 9
syscall
sub $a0, $a0, 1
move $t0, $v0
li $t1, 0
loop15616501972278266:
lb $t2, ($a1)
beq $t2, $zero, brake15616501972279038
beq $t1, $a0, brake15616501972279038
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616501972278266
brake15616501972279038:
sb $zero, ($t0)
sw $v0, -44($fp)
lw $a0, -24($fp)
lw $a1, -44($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
sw $a0, -48($fp)
sw $a0, -48($fp)
lw $a0, -48($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_print
def_CellularAutomaton_print:
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
lw $a1, -20($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972281103
li $a0, 0
isVoid15616501972281103:
sw $a0, -24($fp)
lw $a0, -24($fp)
bne $a0, $zero, label_CellularAutomaton_print_not_valid_dispatch_jump_0
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
la $a0, CellularAutomaton_print_data_1
sw $a0, -28($fp)
lw $a0, -32($fp)
lw $a1, -28($fp)
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
lw $a0, -32($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -20($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_print_data_2
sw $a0, -40($fp)
lw $a3, -20($fp)
lw $t4, -40($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972282844:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197228363:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972284398
beqz $t1, returnTrue15616501972285168
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197228363
j returnTrue15616501972285168
returnFalse15616501972284398:
li $a0, 0
returnTrue15616501972285168:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972282844
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -36($fp)
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
j label_CellularAutomaton_print_end_dispatch_label_1
label_CellularAutomaton_print_not_valid_dispatch_jump_0:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_print_end_dispatch_label_1:
lw $a0, -36($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
lw $a0, -36($fp)
li $v0, 4
syscall
lw $a0, -12($fp)
sw $a0, -36($fp)
sw $a0, -36($fp)
lw $a0, -12($fp)
sw $a0, -44($fp)
sw $a0, -44($fp)
lw $a0, -44($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_num_cells
def_CellularAutomaton_num_cells:
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
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -16($fp)
lw $a1, -16($fp)
li $a0, 1
beq $a1, $zero, isVoid1561650197228732
li $a0, 0
isVoid1561650197228732:
sw $a0, -20($fp)
lw $a0, -20($fp)
bne $a0, $zero, label_CellularAutomaton_num_cells_not_valid_dispatch_jump_2
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
la $a0, CellularAutomaton_num_cells_data_3
sw $a0, -28($fp)
lw $a3, -16($fp)
lw $t4, -28($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561650197228859:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972289371:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972290146
beqz $t1, returnTrue1561650197229091
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972289371
j returnTrue1561650197229091
returnFalse15616501972290146:
li $a0, 0
returnTrue1561650197229091:
add $t0, $t0, 8
beqz $a0, tableLoop1561650197228859
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
j label_CellularAutomaton_num_cells_end_dispatch_label_3
label_CellularAutomaton_num_cells_not_valid_dispatch_jump_2:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_num_cells_end_dispatch_label_3:
lw $v0, -24($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_cell
def_CellularAutomaton_cell:
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
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -20($fp)
lw $a1, -20($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972292507
li $a0, 0
isVoid15616501972292507:
sw $a0, -24($fp)
lw $a0, -24($fp)
bne $a0, $zero, label_CellularAutomaton_cell_not_valid_dispatch_jump_4
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
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
la $a0, CellularAutomaton_cell_data_4
sw $a0, -44($fp)
lw $a3, -20($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972294672:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197229545:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972296212
beqz $t1, returnTrue1561650197229697
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197229545
j returnTrue1561650197229697
returnFalse15616501972296212:
li $a0, 0
returnTrue1561650197229697:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972294672
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -40($fp)
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
j label_CellularAutomaton_cell_end_dispatch_label_5
label_CellularAutomaton_cell_not_valid_dispatch_jump_4:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_end_dispatch_label_5:
lw $v0, -40($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_cell_left_neighbor
def_CellularAutomaton_cell_left_neighbor:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
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
li $a0, 0
sw $a0, -36($fp)
lw $a0, -32($fp)
lw $a1, -36($fp)
sw $a1, 12($a0)
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
beqz $a1, returnTrue15616501972299535
li $a0, 0
returnTrue15616501972299535:
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
sw $v0, -40($fp)
lw $a0, -40($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -40($fp)
lw $a1, 12($a0)
sw $a1, -40($fp)
lw $a0, -40($fp)
bne $a0, $zero, label_CellularAutomaton_cell_left_neighbor_if_6
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972300992
li $a0, 0
isVoid15616501972300992:
sw $a0, -44($fp)
lw $a0, -44($fp)
bne $a0, $zero, label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_8
lw $a0, -16($fp)
sw $a0, -56($fp)
sw $a0, -56($fp)
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
sw $v0, -60($fp)
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
sw $a0, -64($fp)
lw $a0, -60($fp)
lw $a1, -64($fp)
sw $a1, 12($a0)
lw $a0, -56($fp)
lw $a1, 12($a0)
sw $a1, -56($fp)
lw $a0, -60($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
lw $a0, -56($fp)
lw $a1, -60($fp)
sub $a0, $a0, $a1
sw $a0, -48($fp)
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
sw $v0, -52($fp)
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
lw $a0, -52($fp)
lw $a1, -48($fp)
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
lw $a0, -52($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_left_neighbor_data_5
sw $a0, -72($fp)
lw $a3, -12($fp)
lw $t4, -72($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972303493:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197230427:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561650197230503
beqz $t1, returnTrue15616501972305784
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197230427
j returnTrue15616501972305784
returnFalse1561650197230503:
li $a0, 0
returnTrue15616501972305784:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972303493
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -68($fp)
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
j label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_9
label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_8:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_9:
lw $a0, -68($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
j label_CellularAutomaton_cell_left_neighbor_fi_7
label_CellularAutomaton_cell_left_neighbor_if_6:
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972307203
li $a0, 0
isVoid15616501972307203:
sw $a0, -76($fp)
lw $a0, -76($fp)
bne $a0, $zero, label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_10
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972308202
li $a0, 0
isVoid15616501972308202:
sw $a0, -88($fp)
lw $a0, -88($fp)
bne $a0, $zero, label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_11
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
la $a0, CellularAutomaton_cell_left_neighbor_data_6
sw $a0, -96($fp)
lw $a3, -12($fp)
lw $t4, -96($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop1561650197230942:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972310188:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972310946
beqz $t1, returnTrue15616501972311761
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972310188
j returnTrue15616501972311761
returnFalse15616501972310946:
li $a0, 0
returnTrue15616501972311761:
add $t0, $t0, 8
beqz $a0, tableLoop1561650197230942
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -92($fp)
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
j label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_12
label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_11:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_12:
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
sw $v0, -100($fp)
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
sw $a0, -104($fp)
lw $a0, -100($fp)
lw $a1, -104($fp)
sw $a1, 12($a0)
lw $a0, -92($fp)
lw $a1, 12($a0)
sw $a1, -92($fp)
lw $a0, -100($fp)
lw $a1, 12($a0)
sw $a1, -100($fp)
lw $a0, -92($fp)
lw $a1, -100($fp)
sub $a0, $a0, $a1
sw $a0, -80($fp)
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
sw $v0, -84($fp)
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
lw $a0, -84($fp)
lw $a1, -80($fp)
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
lw $a0, -84($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_left_neighbor_data_7
sw $a0, -112($fp)
lw $a3, -12($fp)
lw $t4, -112($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972314718:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972315576:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972316418
beqz $t1, returnTrue15616501972317252
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972315576
j returnTrue15616501972317252
returnFalse15616501972316418:
li $a0, 0
returnTrue15616501972317252:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972314718
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -108($fp)
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
j label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_13
label_CellularAutomaton_cell_left_neighbor_not_valid_dispatch_jump_10:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_left_neighbor_end_dispatch_label_13:
lw $a0, -108($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
label_CellularAutomaton_cell_left_neighbor_fi_7:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_cell_right_neighbor
def_CellularAutomaton_cell_right_neighbor:
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
lw $a0, 0($fp)
sw $a0, -12($fp)
lw $a0, 4($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -28($fp)
sw $a0, -28($fp)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972321053
li $a0, 0
isVoid15616501972321053:
sw $a0, -40($fp)
lw $a0, -40($fp)
bne $a0, $zero, label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_14
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
la $a0, CellularAutomaton_cell_right_neighbor_data_8
sw $a0, -48($fp)
lw $a3, -12($fp)
lw $t4, -48($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972322686:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197232356:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972324414
beqz $t1, returnTrue1561650197232528
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197232356
j returnTrue1561650197232528
returnFalse15616501972324414:
li $a0, 0
returnTrue1561650197232528:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972322686
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -44($fp)
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
j label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_15
label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_14:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_15:
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
sw $v0, -52($fp)
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
sw $a0, -56($fp)
lw $a0, -52($fp)
lw $a1, -56($fp)
sw $a1, 12($a0)
lw $a0, -44($fp)
lw $a1, 12($a0)
sw $a1, -44($fp)
lw $a0, -52($fp)
lw $a1, 12($a0)
sw $a1, -52($fp)
lw $a0, -44($fp)
lw $a1, -52($fp)
sub $a0, $a0, $a1
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
lw $a0, -36($fp)
lw $a1, -32($fp)
sw $a1, 12($a0)
lw $a0, -28($fp)
lw $a1, 12($a0)
sw $a1, -28($fp)
lw $a0, -36($fp)
lw $a1, 12($a0)
sw $a1, -36($fp)
lw $a0, -28($fp)
lw $a1, -36($fp)
sub $a0, $a0, $a1
sw $a0, -24($fp)
lw $a1, -24($fp)
li $a0, 1
beqz $a1, returnTrue1561650197233348
li $a0, 0
returnTrue1561650197233348:
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
sw $v0, -60($fp)
lw $a0, -60($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -60($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
lw $a0, -60($fp)
bne $a0, $zero, label_CellularAutomaton_cell_right_neighbor_if_16
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561650197233595
li $a0, 0
isVoid1561650197233595:
sw $a0, -64($fp)
lw $a0, -64($fp)
bne $a0, $zero, label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_18
lw $a0, -16($fp)
sw $a0, -76($fp)
sw $a0, -76($fp)
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
sw $v0, -80($fp)
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
sw $a0, -84($fp)
lw $a0, -80($fp)
lw $a1, -84($fp)
sw $a1, 12($a0)
lw $a0, -76($fp)
lw $a1, 12($a0)
sw $a1, -76($fp)
lw $a0, -80($fp)
lw $a1, 12($a0)
sw $a1, -80($fp)
lw $a0, -76($fp)
lw $a1, -80($fp)
add $a0, $a0, $a1
sw $a0, -68($fp)
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
sw $v0, -72($fp)
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
lw $a0, -72($fp)
lw $a1, -68($fp)
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
lw $a0, -72($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_right_neighbor_data_9
sw $a0, -92($fp)
lw $a3, -12($fp)
lw $t4, -92($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972339692:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197234539:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972346282
beqz $t1, returnTrue156165019723471
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197234539
j returnTrue156165019723471
returnFalse15616501972346282:
li $a0, 0
returnTrue156165019723471:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972339692
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -88($fp)
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
j label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_19
label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_18:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_19:
lw $a0, -88($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
j label_CellularAutomaton_cell_right_neighbor_fi_17
label_CellularAutomaton_cell_right_neighbor_if_16:
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972349079
li $a0, 0
isVoid15616501972349079:
sw $a0, -96($fp)
lw $a0, -96($fp)
bne $a0, $zero, label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_20
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
sw $v0, -100($fp)
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
sw $a0, -104($fp)
lw $a0, -100($fp)
lw $a1, -104($fp)
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
lw $a0, -100($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_right_neighbor_data_10
sw $a0, -112($fp)
lw $a3, -12($fp)
lw $t4, -112($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972351239:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972352068:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561650197235288
beqz $t1, returnTrue15616501972353683
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972352068
j returnTrue15616501972353683
returnFalse1561650197235288:
li $a0, 0
returnTrue15616501972353683:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972351239
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -108($fp)
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
j label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_21
label_CellularAutomaton_cell_right_neighbor_not_valid_dispatch_jump_20:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_right_neighbor_end_dispatch_label_21:
lw $a0, -108($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
label_CellularAutomaton_cell_right_neighbor_fi_17:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_cell_at_next_evolution
def_CellularAutomaton_cell_at_next_evolution:
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
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972356517
li $a0, 0
isVoid15616501972356517:
sw $a0, -52($fp)
lw $a0, -52($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_22
lw $a0, -16($fp)
sw $a0, -56($fp)
sw $a0, -56($fp)
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
lw $a0, -56($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_at_next_evolution_data_11
sw $a0, -64($fp)
lw $a3, -12($fp)
lw $t4, -64($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972358685:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197235959:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse156165019723604
beqz $t1, returnTrue15616501972361197
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197235959
j returnTrue15616501972361197
returnFalse156165019723604:
li $a0, 0
returnTrue15616501972361197:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972358685
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -60($fp)
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
j label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_23
label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_22:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_23:
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
sw $v0, -72($fp)
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
la $a0, CellularAutomaton_cell_at_next_evolution_data_12
sw $a0, -68($fp)
lw $a0, -72($fp)
lw $a1, -68($fp)
sw $a1, 12($a0)
lw $a0, -60($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
lw $a0, -72($fp)
lw $a1, 12($a0)
sw $a1, -72($fp)
lw $a1, -60($fp)
lw $a2, -72($fp)
li $a0, 1
compareLoop15616501972364035:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972364862
beqz $t1, returnTrue15616501972365649
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972364035
j returnTrue15616501972365649
returnFalse15616501972364862:
li $a0, 0
returnTrue15616501972365649:
sw $a0, -48($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -76($fp)
lw $a0, -76($fp)
lw $a1, -48($fp)
sw $a1, 12($a0)
lw $a0, -76($fp)
lw $a1, 12($a0)
sw $a1, -76($fp)
lw $a0, -76($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_if_24
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
sw $v0, -80($fp)
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
sw $a0, -84($fp)
lw $a0, -80($fp)
lw $a1, -84($fp)
sw $a1, 12($a0)
lw $a0, -80($fp)
sw $a0, -44($fp)
sw $a0, -44($fp)
j label_CellularAutomaton_cell_at_next_evolution_fi_25
label_CellularAutomaton_cell_at_next_evolution_if_24:
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
sw $v0, -88($fp)
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
sw $a0, -92($fp)
lw $a0, -88($fp)
lw $a1, -92($fp)
sw $a1, 12($a0)
lw $a0, -88($fp)
sw $a0, -44($fp)
sw $a0, -44($fp)
label_CellularAutomaton_cell_at_next_evolution_fi_25:
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid1561650197236965
li $a0, 0
isVoid1561650197236965:
sw $a0, -104($fp)
lw $a0, -104($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_26
lw $a0, -16($fp)
sw $a0, -108($fp)
sw $a0, -108($fp)
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
lw $a0, -108($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_at_next_evolution_data_13
sw $a0, -116($fp)
lw $a3, -12($fp)
lw $t4, -116($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972371368:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197237219:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972373
beqz $t1, returnTrue15616501972373796
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197237219
j returnTrue15616501972373796
returnFalse15616501972373:
li $a0, 0
returnTrue15616501972373796:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972371368
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -112($fp)
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
j label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_27
label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_26:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_27:
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
sw $v0, -124($fp)
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
la $a0, CellularAutomaton_cell_at_next_evolution_data_14
sw $a0, -120($fp)
lw $a0, -124($fp)
lw $a1, -120($fp)
sw $a1, 12($a0)
lw $a0, -112($fp)
lw $a1, 12($a0)
sw $a1, -112($fp)
lw $a0, -124($fp)
lw $a1, 12($a0)
sw $a1, -124($fp)
lw $a1, -112($fp)
lw $a2, -124($fp)
li $a0, 1
compareLoop156165019723762:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972377012
beqz $t1, returnTrue15616501972377813
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop156165019723762
j returnTrue15616501972377813
returnFalse15616501972377012:
li $a0, 0
returnTrue15616501972377813:
sw $a0, -100($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -128($fp)
lw $a0, -128($fp)
lw $a1, -100($fp)
sw $a1, 12($a0)
lw $a0, -128($fp)
lw $a1, 12($a0)
sw $a1, -128($fp)
lw $a0, -128($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_if_28
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
sw $v0, -132($fp)
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
sw $a0, -136($fp)
lw $a0, -132($fp)
lw $a1, -136($fp)
sw $a1, 12($a0)
lw $a0, -132($fp)
sw $a0, -96($fp)
sw $a0, -96($fp)
j label_CellularAutomaton_cell_at_next_evolution_fi_29
label_CellularAutomaton_cell_at_next_evolution_if_28:
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
sw $v0, -140($fp)
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
sw $a0, -144($fp)
lw $a0, -140($fp)
lw $a1, -144($fp)
sw $a1, 12($a0)
lw $a0, -140($fp)
sw $a0, -96($fp)
sw $a0, -96($fp)
label_CellularAutomaton_cell_at_next_evolution_fi_29:
lw $a0, -44($fp)
lw $a1, 12($a0)
sw $a1, -44($fp)
lw $a0, -96($fp)
lw $a1, 12($a0)
sw $a1, -96($fp)
lw $a0, -44($fp)
lw $a1, -96($fp)
add $a0, $a0, $a1
sw $a0, -36($fp)
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
sw $v0, -40($fp)
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
lw $a0, -40($fp)
lw $a1, -36($fp)
sw $a1, 12($a0)
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972381501
li $a0, 0
isVoid15616501972381501:
sw $a0, -156($fp)
lw $a0, -156($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_30
lw $a0, -16($fp)
sw $a0, -160($fp)
sw $a0, -160($fp)
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
lw $a0, -160($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_cell_at_next_evolution_data_15
sw $a0, -168($fp)
lw $a3, -12($fp)
lw $t4, -168($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972383173:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197238399:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972384803
beqz $t1, returnTrue15616501972385602
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197238399
j returnTrue15616501972385602
returnFalse15616501972384803:
li $a0, 0
returnTrue15616501972385602:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972383173
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -164($fp)
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
j label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_31
label_CellularAutomaton_cell_at_next_evolution_not_valid_dispatch_jump_30:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_cell_at_next_evolution_end_dispatch_label_31:
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
sw $v0, -176($fp)
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
la $a0, CellularAutomaton_cell_at_next_evolution_data_16
sw $a0, -172($fp)
lw $a0, -176($fp)
lw $a1, -172($fp)
sw $a1, 12($a0)
lw $a0, -164($fp)
lw $a1, 12($a0)
sw $a1, -164($fp)
lw $a0, -176($fp)
lw $a1, 12($a0)
sw $a1, -176($fp)
lw $a1, -164($fp)
lw $a2, -176($fp)
li $a0, 1
compareLoop1561650197238758:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972388387
beqz $t1, returnTrue1561650197238919
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197238758
j returnTrue1561650197238919
returnFalse15616501972388387:
li $a0, 0
returnTrue1561650197238919:
sw $a0, -152($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -180($fp)
lw $a0, -180($fp)
lw $a1, -152($fp)
sw $a1, 12($a0)
lw $a0, -180($fp)
lw $a1, 12($a0)
sw $a1, -180($fp)
lw $a0, -180($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_if_32
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
sw $v0, -184($fp)
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
sw $a0, -188($fp)
lw $a0, -184($fp)
lw $a1, -188($fp)
sw $a1, 12($a0)
lw $a0, -184($fp)
sw $a0, -148($fp)
sw $a0, -148($fp)
j label_CellularAutomaton_cell_at_next_evolution_fi_33
label_CellularAutomaton_cell_at_next_evolution_if_32:
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
sw $v0, -192($fp)
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
sw $a0, -196($fp)
lw $a0, -192($fp)
lw $a1, -196($fp)
sw $a1, 12($a0)
lw $a0, -192($fp)
sw $a0, -148($fp)
sw $a0, -148($fp)
label_CellularAutomaton_cell_at_next_evolution_fi_33:
lw $a0, -40($fp)
lw $a1, 12($a0)
sw $a1, -40($fp)
lw $a0, -148($fp)
lw $a1, 12($a0)
sw $a1, -148($fp)
lw $a0, -40($fp)
lw $a1, -148($fp)
add $a0, $a0, $a1
sw $a0, -28($fp)
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
lw $a0, -32($fp)
lw $a1, -28($fp)
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
sw $v0, -200($fp)
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
sw $a0, -204($fp)
lw $a0, -200($fp)
lw $a1, -204($fp)
sw $a1, 12($a0)
lw $a0, -32($fp)
lw $a1, 12($a0)
sw $a1, -32($fp)
lw $a0, -200($fp)
lw $a1, 12($a0)
sw $a1, -200($fp)
lw $a0, -32($fp)
lw $a1, -200($fp)
sub $a0, $a0, $a1
sw $a0, -24($fp)
lw $a1, -24($fp)
li $a0, 1
beqz $a1, returnTrue15616501972393744
li $a0, 0
returnTrue15616501972393744:
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
sw $v0, -208($fp)
lw $a0, -208($fp)
lw $a1, -24($fp)
sw $a1, 12($a0)
lw $a0, -208($fp)
lw $a1, 12($a0)
sw $a1, -208($fp)
lw $a0, -208($fp)
bne $a0, $zero, label_CellularAutomaton_cell_at_next_evolution_if_34
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
sw $v0, -216($fp)
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
la $a0, CellularAutomaton_cell_at_next_evolution_data_17
sw $a0, -212($fp)
lw $a0, -216($fp)
lw $a1, -212($fp)
sw $a1, 12($a0)
lw $a0, -216($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
j label_CellularAutomaton_cell_at_next_evolution_fi_35
label_CellularAutomaton_cell_at_next_evolution_if_34:
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
sw $v0, -224($fp)
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
la $a0, CellularAutomaton_cell_at_next_evolution_data_18
sw $a0, -220($fp)
lw $a0, -224($fp)
lw $a1, -220($fp)
sw $a1, 12($a0)
lw $a0, -224($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
label_CellularAutomaton_cell_at_next_evolution_fi_35:
lw $v0, -20($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
.globl def_CellularAutomaton_evolve
def_CellularAutomaton_evolve:
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
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972397363
li $a0, 0
isVoid15616501972397363:
sw $a0, -24($fp)
lw $a0, -24($fp)
bne $a0, $zero, label_CellularAutomaton_evolve_let_not_valid_dispatch_jump_36
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
la $a0, CellularAutomaton_evolve_let_data_19
sw $a0, -32($fp)
lw $a3, -12($fp)
lw $t4, -32($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972398732:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972399552:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972400358
beqz $t1, returnTrue15616501972401156
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972399552
j returnTrue15616501972401156
returnFalse15616501972400358:
li $a0, 0
returnTrue15616501972401156:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972398732
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -28($fp)
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
j label_CellularAutomaton_evolve_let_end_dispatch_label_37
label_CellularAutomaton_evolve_let_not_valid_dispatch_jump_36:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_evolve_let_end_dispatch_label_37:
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972402368
li $a0, 0
isVoid15616501972402368:
sw $a0, -36($fp)
lw $a0, -36($fp)
bne $a0, $zero, label_CellularAutomaton_evolve_let_not_valid_dispatch_jump_38
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
la $a0, CellularAutomaton_evolve_let_data_20
sw $a0, -44($fp)
lw $a3, -12($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972403724:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972404544:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972405348
beqz $t1, returnTrue1561650197240615
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972404544
j returnTrue1561650197240615
returnFalse15616501972405348:
li $a0, 0
returnTrue1561650197240615:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972403724
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
j label_CellularAutomaton_evolve_let_end_dispatch_label_39
label_CellularAutomaton_evolve_let_not_valid_dispatch_jump_38:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_evolve_let_end_dispatch_label_39:
lw $a1, -40($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972407403:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972408214
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972407403
brake15616501972408214:
sw $v0, -20($fp)
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
sw $v0, -48($fp)
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
label_CellularAutomaton_evolve_while_40_40:
lw $a0, -16($fp)
sw $a0, -60($fp)
sw $a0, -60($fp)
lw $a0, -20($fp)
sw $a0, -64($fp)
sw $a0, -64($fp)
lw $a0, -60($fp)
lw $a1, 12($a0)
sw $a1, -60($fp)
lw $a0, -64($fp)
lw $a1, 12($a0)
sw $a1, -64($fp)
lw $a0, -60($fp)
lw $a1, -64($fp)
sub $a0, $a0, $a1
sw $a0, -56($fp)
lw $a1, -56($fp)
li $a0, 1
bltz $a1, returnTrue15616501972410214
li $a0, 0
returnTrue15616501972410214:
sw $a0, -56($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -68($fp)
lw $a0, -68($fp)
lw $a1, -56($fp)
sw $a1, 12($a0)
lw $a0, -68($fp)
lw $a1, 12($a0)
sw $a1, -68($fp)
lw $a0, -68($fp)
bne $a0, $zero, label_CellularAutomaton_evolve_loop_41_41
j label_CellularAutomaton_evolve_pool_42_42
label_CellularAutomaton_evolve_loop_41_41:
lw $a0, -48($fp)
sw $a0, -80($fp)
sw $a0, -80($fp)
lw $a1, -80($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972412007
li $a0, 0
isVoid15616501972412007:
sw $a0, -84($fp)
lw $a0, -84($fp)
bne $a0, $zero, label_CellularAutomaton_evolve_not_valid_dispatch_jump_44
lw $a1, -12($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972413104
li $a0, 0
isVoid15616501972413104:
sw $a0, -88($fp)
lw $a0, -88($fp)
bne $a0, $zero, label_CellularAutomaton_evolve_not_valid_dispatch_jump_45
lw $a0, -16($fp)
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
lw $a0, -12($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_evolve_data_21
sw $a0, -100($fp)
lw $a3, -12($fp)
lw $t4, -100($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972415054:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972415879:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972416692
beqz $t1, returnTrue1561650197241749
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972415879
j returnTrue1561650197241749
returnFalse15616501972416692:
li $a0, 0
returnTrue1561650197241749:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972415054
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -96($fp)
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
j label_CellularAutomaton_evolve_end_dispatch_label_46
label_CellularAutomaton_evolve_not_valid_dispatch_jump_45:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_evolve_end_dispatch_label_46:
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
lw $a0, -96($fp)
sw $a0, ($sp)
subu $sp, $sp, 4
lw $a0, -80($fp)
sw $a0, ($sp)
la $a0, CellularAutomaton_evolve_data_22
sw $a0, -108($fp)
lw $a3, -80($fp)
lw $t4, -108($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972419028:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197242195:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse1561650197242331
beqz $t1, returnTrue15616501972424157
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197242195
j returnTrue15616501972424157
returnFalse1561650197242331:
li $a0, 0
returnTrue15616501972424157:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972419028
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -104($fp)
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
j label_CellularAutomaton_evolve_end_dispatch_label_47
label_CellularAutomaton_evolve_not_valid_dispatch_jump_44:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_CellularAutomaton_evolve_end_dispatch_label_47:
lw $a1, -104($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972432098:
lw $t2, ($a1)
beq $t1, $a0, brake1561650197243298
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972432098
brake1561650197243298:
sw $v0, -48($fp)
lw $a0, -104($fp)
lw $a1, 12($a0)
sw $a1, -112($fp)
li $a0, 0
sw $a0, -116($fp)
lw $a1, -112($fp)
li $a0, 0
lengthLoop15616501972434356:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972435236
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616501972434356
brakeLengthLoop15616501972435236:
sw $a0, -120($fp)
lw $a1, -112($fp)
lw $t0, -116($fp)
add $a1, $a1, $t0
lw $a0, -120($fp)
add $a0, $a0, 1
li $v0, 9
syscall
sub $a0, $a0, 1
move $t0, $v0
li $t1, 0
loop15616501972436707:
lb $t2, ($a1)
beq $t2, $zero, brake1561650197243762
beq $t1, $a0, brake1561650197243762
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616501972436707
brake1561650197243762:
sb $zero, ($t0)
sw $v0, -124($fp)
lw $a0, -48($fp)
lw $a1, -124($fp)
sw $a1, 12($a0)
lw $a0, -48($fp)
sw $a0, -48($fp)
sw $a0, -48($fp)
lw $a0, -16($fp)
sw $a0, -140($fp)
sw $a0, -140($fp)
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
sw $v0, -144($fp)
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
sw $a0, -148($fp)
lw $a0, -144($fp)
lw $a1, -148($fp)
sw $a1, 12($a0)
lw $a0, -140($fp)
lw $a1, 12($a0)
sw $a1, -140($fp)
lw $a0, -144($fp)
lw $a1, 12($a0)
sw $a1, -144($fp)
lw $a0, -140($fp)
lw $a1, -144($fp)
add $a0, $a0, $a1
sw $a0, -132($fp)
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
sw $v0, -136($fp)
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
lw $a0, -136($fp)
lw $a1, -132($fp)
sw $a1, 12($a0)
lw $a1, -136($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972441175:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972442088
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972441175
brake15616501972442088:
sw $v0, -16($fp)
lw $a0, -16($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $a0, -16($fp)
sw $a0, -72($fp)
sw $a0, -72($fp)
j label_CellularAutomaton_evolve_while_40_40
label_CellularAutomaton_evolve_pool_42_42:
li $a0, 16
li $v0, 9
syscall
li $a0, 1
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Object_dispatch_table
sw $a0, 8($v0)
sw $v0, -152($fp)
lw $a0, -48($fp)
sw $a0, -160($fp)
sw $a0, -160($fp)
lw $a1, -160($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972444234:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972445138
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972444234
brake15616501972445138:
sw $v0, -156($fp)
lw $a0, -160($fp)
lw $a1, 12($a0)
sw $a1, -164($fp)
li $a0, 0
sw $a0, -168($fp)
lw $a1, -164($fp)
li $a0, 0
lengthLoop15616501972446618:
lb $t2, ($a1)
beq $t2, $zero, brakeLengthLoop15616501972447536
add $a0, $a0, 1
add $a1, $a1, 1
j lengthLoop15616501972446618
brakeLengthLoop15616501972447536:
sw $a0, -172($fp)
lw $a1, -164($fp)
lw $t0, -168($fp)
add $a1, $a1, $t0
lw $a0, -172($fp)
add $a0, $a0, 1
li $v0, 9
syscall
sub $a0, $a0, 1
move $t0, $v0
li $t1, 0
loop15616501972448936:
lb $t2, ($a1)
beq $t2, $zero, brake15616501972449846
beq $t1, $a0, brake15616501972449846
sb $t2,($t0)
add $a1, $a1, 1
add $t1, $t1, 1
add $t0, $t0, 1
j loop15616501972448936
brake15616501972449846:
sb $zero, ($t0)
sw $v0, -176($fp)
lw $a0, -156($fp)
lw $a1, -176($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
lw $a1, -156($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
sw $a0, -180($fp)
sw $a0, -180($fp)
lw $a0, -180($fp)
sw $a0, -52($fp)
sw $a0, -52($fp)
lw $a0, -52($fp)
sw $a0, -184($fp)
sw $a0, -184($fp)
lw $a0, -184($fp)
sw $a0, -192($fp)
sw $a0, -192($fp)
lw $a0, -192($fp)
sw $a0, -200($fp)
sw $a0, -200($fp)
lw $v0, -200($fp)
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
li $a0, 7
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
li $a0, 64
li $v0, 9
syscall
li $a0, 6
sw $a0, ($v0)
li $a0, 16
sw $a0, 4($v0)
la $a0, CellularAutomaton_dispatch_table
sw $a0, 8($v0)
sw $v0, -24($fp)
jal init_CellularAutomaton
sw $v0, -24($fp)
addu $sp, $sp, 0
lw $a1, -24($fp)
li $a0, 1
beq $a1, $zero, isVoid1561650197245511
li $a0, 0
isVoid1561650197245511:
sw $a0, -28($fp)
lw $a0, -28($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_48
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
la $a0, Main_main_data_23
sw $a0, -32($fp)
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
lw $a0, -24($fp)
sw $a0, ($sp)
la $a0, Main_main_data_24
sw $a0, -44($fp)
lw $a3, -24($fp)
lw $t4, -44($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972457445:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972458389:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972459297
beqz $t1, returnTrue15616501972460196
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972458389
j returnTrue15616501972460196
returnFalse15616501972459297:
li $a0, 0
returnTrue15616501972460196:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972457445
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
j label_Main_main_end_dispatch_label_49
label_Main_main_not_valid_dispatch_jump_48:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_49:
lw $a0, -40($fp)
sw $a0, -20($fp)
sw $a0, -20($fp)
lw $a0, -12($fp)
lw $a1, -20($fp)
sw $a1, 12($a0)
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -48($fp)
lw $a1, -48($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972462296
li $a0, 0
isVoid15616501972462296:
sw $a0, -52($fp)
lw $a0, -52($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_50
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
lw $a0, -48($fp)
sw $a0, ($sp)
la $a0, Main_main_data_25
sw $a0, -60($fp)
lw $a3, -48($fp)
lw $t4, -60($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972463906:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972464828:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972465737
beqz $t1, returnTrue1561650197246664
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972464828
j returnTrue1561650197246664
returnFalse15616501972465737:
li $a0, 0
returnTrue1561650197246664:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972463906
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -56($fp)
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
j label_Main_main_end_dispatch_label_51
label_Main_main_not_valid_dispatch_jump_50:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_51:
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
sw $v0, -68($fp)
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
li $a0, 20
sw $a0, -72($fp)
lw $a0, -68($fp)
lw $a1, -72($fp)
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
sw $v0, -76($fp)
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
li $a0, 20
sw $a0, -80($fp)
lw $a0, -76($fp)
lw $a1, -80($fp)
sw $a1, 12($a0)
lw $a1, -76($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972469094:
lw $t2, ($a1)
beq $t1, $a0, brake15616501972469997
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972469094
brake15616501972469997:
sw $v0, -64($fp)
label_Main_main_while_52_52:
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
sw $v0, -88($fp)
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
sw $a0, -92($fp)
lw $a0, -88($fp)
lw $a1, -92($fp)
sw $a1, 12($a0)
lw $a0, -64($fp)
sw $a0, -96($fp)
sw $a0, -96($fp)
lw $a0, -88($fp)
lw $a1, 12($a0)
sw $a1, -88($fp)
lw $a0, -96($fp)
lw $a1, 12($a0)
sw $a1, -96($fp)
lw $a0, -88($fp)
lw $a1, -96($fp)
sub $a0, $a0, $a1
sw $a0, -84($fp)
lw $a1, -84($fp)
li $a0, 1
bltz $a1, returnTrue15616501972472517
li $a0, 0
returnTrue15616501972472517:
sw $a0, -84($fp)
li $a0, 16
li $v0, 9
syscall
li $a0, 3
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Bool_dispatch_table
sw $a0, 8($v0)
sw $v0, -100($fp)
lw $a0, -100($fp)
lw $a1, -84($fp)
sw $a1, 12($a0)
lw $a0, -100($fp)
lw $a1, 12($a0)
sw $a1, -100($fp)
lw $a0, -100($fp)
bne $a0, $zero, label_Main_main_loop_53_53
j label_Main_main_pool_54_54
label_Main_main_loop_53_53:
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -108($fp)
lw $a1, -108($fp)
li $a0, 1
beq $a1, $zero, isVoid15616501972474625
li $a0, 0
isVoid15616501972474625:
sw $a0, -112($fp)
lw $a0, -112($fp)
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
lw $a0, -108($fp)
sw $a0, ($sp)
la $a0, Main_main_data_26
sw $a0, -120($fp)
lw $a3, -108($fp)
lw $t4, -120($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972476232:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop1561650197247715:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972478054
beqz $t1, returnTrue15616501972478948
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop1561650197247715
j returnTrue15616501972478948
returnFalse15616501972478054:
li $a0, 0
returnTrue15616501972478948:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972476232
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -116($fp)
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
lw $a0, -12($fp)
lw $a1, 12($a0)
sw $a1, -124($fp)
lw $a1, -124($fp)
li $a0, 1
beq $a1, $zero, isVoid1561650197248054
li $a0, 0
isVoid1561650197248054:
sw $a0, -128($fp)
lw $a0, -128($fp)
bne $a0, $zero, label_Main_main_not_valid_dispatch_jump_58
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
lw $a0, -124($fp)
sw $a0, ($sp)
la $a0, Main_main_data_27
sw $a0, -136($fp)
lw $a3, -124($fp)
lw $t4, -136($fp)
lw $a3, 8($a3)
li $t0, 0
tableLoop15616501972482138:
add $t3, $a3, $t0
lw $t3, ($t3)
move $a1, $t4
move $a2, $t3
li $a0, 1
compareLoop15616501972483063:
lb $t1, ($a1)
lb $t2, ($a2)
bne $t1, $t2, returnFalse15616501972483974
beqz $t1, returnTrue15616501972484872
add $a1, $a1, 1
add $a2, $a2, 1
j compareLoop15616501972483063
j returnTrue15616501972484872
returnFalse15616501972483974:
li $a0, 0
returnTrue15616501972484872:
add $t0, $t0, 8
beqz $a0, tableLoop15616501972482138
sub $a0, $t0, 4
add $a0, $a3, $a0
lw $a0, ($a0)
jalr $a0
sw $v0, -132($fp)
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
j label_Main_main_end_dispatch_label_59
label_Main_main_not_valid_dispatch_jump_58:
la $a0, null_reference
li $v0, 4
syscall
li $v0, 10
syscall
label_Main_main_end_dispatch_label_59:
lw $a0, -64($fp)
sw $a0, -152($fp)
sw $a0, -152($fp)
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
sw $v0, -156($fp)
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
sw $a0, -160($fp)
lw $a0, -156($fp)
lw $a1, -160($fp)
sw $a1, 12($a0)
lw $a0, -152($fp)
lw $a1, 12($a0)
sw $a1, -152($fp)
lw $a0, -156($fp)
lw $a1, 12($a0)
sw $a1, -156($fp)
lw $a0, -152($fp)
lw $a1, -156($fp)
sub $a0, $a0, $a1
sw $a0, -144($fp)
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
sw $v0, -148($fp)
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
lw $a0, -148($fp)
lw $a1, -144($fp)
sw $a1, 12($a0)
lw $a1, -148($fp)
lw $a0, 4($a1)
li $a2, 4
multu $a0, $a2
mflo $a0
li $v0, 9
syscall
move $t0, $v0
li $t1, 0
lw $a0, 4($a1)
loop15616501972487967:
lw $t2, ($a1)
beq $t1, $a0, brake1561650197248887
sw $t2,($t0)
add $a1, $a1, 4
add $t0, $t0, 4
add $t1, $t1, 1
j loop15616501972487967
brake1561650197248887:
sw $v0, -64($fp)
lw $a0, -64($fp)
sw $a0, -64($fp)
sw $a0, -64($fp)
lw $a0, -64($fp)
sw $a0, -104($fp)
sw $a0, -104($fp)
j label_Main_main_while_52_52
label_Main_main_pool_54_54:
li $a0, 16
li $v0, 9
syscall
li $a0, 1
sw $a0, ($v0)
li $a0, 4
sw $a0, 4($v0)
la $a0, Object_dispatch_table
sw $a0, 8($v0)
sw $v0, -164($fp)
lw $a0, -164($fp)
sw $a0, -168($fp)
sw $a0, -168($fp)
lw $a0, -12($fp)
sw $a0, -176($fp)
sw $a0, -176($fp)
lw $a0, -176($fp)
sw $a0, -16($fp)
sw $a0, -16($fp)
lw $v0, -16($fp)
move $sp, $fp
subu $a0, $sp, 4
lw $fp, ($a0)
subu $a0, $sp, 8
lw $ra, ($a0)
jr $ra
