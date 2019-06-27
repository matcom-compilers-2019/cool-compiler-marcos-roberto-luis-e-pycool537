import time

# Counter for labels in mips


# An array with the tuples (instruction, args_count, return_type)
valid_instructions = ["assign", "plus", "minus", "star", "div", "get", "set",
                      "get_index", "set_index", "allocate", "array", "type_of",
                      "label", "goto", "goto_if", "static_call", "dynamic_call",
                      "arg", "return", "load", "length", "concat", "prefix",

                      "substring", "to_str", "read", "print", "not", "parent_of"]


pusha = 'subu $sp, $sp, 4\n' + \
        'sw $ra, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $a0, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $a1, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $a2, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $a3, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $t0, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $t1, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $t2, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $t3, ($sp)\n' + \
        'subu $sp, $sp, 4\n' + \
        'sw $t4, ($sp)\n'


popa = 'lw $t4, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $t3, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $t2, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $t1, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $t0, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $a3, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $a2, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $a1, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $a0, ($sp)\n' + \
       'addu $sp, $sp, 4\n' + \
       'lw $ra, ($sp)\n' + \
       'addu $sp, $sp, 4\n'


class CILNode:
    pass


class CILProgramNode(CILNode):
    def __init__(self, dot_types: list, dot_data: list, functions: list, inheritance):
        """
        Initializer of the CILProgramNode class.

        :param dot_types:
            Dictionary with names as keys and a list of COOL class features as value
        :param dot_data:
            A list of the tuples (data_name, data_value)
        :param functions:
            The list of the CILClassNodes resulting from the visitor
        """
        super(CILProgramNode, self).__init__()
        self.dot_types = dot_types
        self.dot_data = dot_data
        self.functions = functions
        self.inheritance = inheritance

    def inheritance_table_code(self):
        result = "inheritance_table: .word 0,"
        for parents_class_tag in self.inheritance[1:]:
            result += ", " + str(parents_class_tag)
        result += '\n'
        return result

    @property
    def main_size(self):
        for t in self.dot_types:
            if t.name == "Main":
                return t.object_length

    def code(self):
        ans = '.data\n'
        ans += 'empty_string: .asciiz ""\n'
        ans += 'null_reference: .asciiz "Null reference exception!!!"\n'
        ans += 'zero_division: .asciiz "Division by zero! Are you insane?"\n'
        ans += 'main_prototype: .word 1, 3, Main_dispatch_table\n'
        ans += self.inheritance_table_code()
        for t in self.dot_types:
            ans += t.code(ans)
        for data in self.dot_data:
            ans += data.code()
        ans += '.text\n'
        ans += '.globl main\n'
        ans += '.ent main\n'
        ans += 'main:\n'

        # StaticCall to init_Main
        ans += pusha
        ans += 'jal ' + 'init_Main' + '\n'
        ans += popa

        ans += pusha
        # Push main instance
        ans += 'subu $sp, $sp, 4\n'

        ans += 'sw $v0, ($sp)\n'

        ans += 'jal def_Main_main\n'
        ans += 'addu, $sp, $sp, 4\n'
        ans += popa
        ans += 'li $v0, 10\n'
        ans += 'syscall\n'
        ans += '.end main\n'
        for function in self.functions:
            ans += function.code()
        return ans


class CILTypeNode(CILNode):
    def __init__(self, name: str, class_tag: int, attributes: list, methods: list):
        super(CILTypeNode, self).__init__()
        self.name = name
        self.class_tag = class_tag
        self.attributes = attributes
        self.methods = methods
        self.attrs_count = len(self.attributes)
        self.methods_count = len(self.methods)
        self.object_length = 3 + self.attrs_count

    def get_attr_index(self, attr_name):
        for f in self.attributes:
            if f.name == attr_name:
                return f.attr_index

    def class_dispatch_table(self, previous):
        result = self.name + "_dispatch_table: .word "
        method_strings = []
        for i in range(len(self.methods)):
            method_strings.append(self.methods[i].name)
            if i == 0:
                result += self.methods[i].name + "_ptr"
                result += ", " + str(self.methods[i].function_name)
            else:
                result += ", " + self.methods[i].name + "_ptr"
                result += ", " + str(self.methods[i].function_name)
        result += '\n'
        for i in range(len(method_strings)):
            if (method_strings[i] + "_ptr: .asciiz " + '"' + method_strings[i] + '"\n') not in previous:
                result += method_strings[i] + "_ptr: .asciiz " + '"' + method_strings[i] + '"\n'
        return result

    def code(self, previous):
        ans = ''
        ans += self.class_dispatch_table(previous)
        return ans

    def __repr__(self):
        return "type " + self.name + ":" + str(self.class_tag)


class CILDataNode(CILNode):
    def __init__(self, vname, value):
        super(CILDataNode, self).__init__()
        self.vname = vname
        self.value = value
        # self.data_type = t

    def code(self):
        ans = self.vname + ':' + ' ' + '.asciiz' + ' ' + self.value + '\n'
        return ans

    def __repr__(self):
        return 'Data: ' + self.vname + ' = ' + self.value


class CILFunctionNode(CILNode):
    def __init__(self, fname: str, findex: int, params: list, local_vars: list, instructions: list):
        super(CILFunctionNode, self).__init__()
        self.fname = fname
        self.findex = findex
        self.params = params
        self.local_vars = local_vars
        self.instructions = instructions

    @staticmethod
    def local_index(local_name):
        return int(local_name.split('_')[-1])

    def code(self):
        ans = ''
        ans += '.globl ' + self.fname + '\n'
        ans += '.ent ' + self.fname + '\n'
        ans += self.fname + ':\n'
        ans += 'subu $sp, $sp, 4\n'
        ans += 'sw $fp, ($sp)\n'
        ans += 'addu $fp, $sp, 4\n'
        ans += 'subu $sp, $sp, 4\n'
        ans += 'sw $ra, ($sp)\n'
        for local in self.local_vars:
            ans += 'subu $sp, $sp, 4\n'
            ans += 'sw $zero, ($sp)\n'
        for instruction in self.instructions:
            ans += instruction.code()
        ans += '.end ' + self.fname + '\n'
        return ans

    def __repr__(self):
        return self.fname + "(" + str(self.params) + ")"


class CILLocalNode(CILNode):
    def __init__(self, vname: str, local_index: int, value):
        super(CILLocalNode, self).__init__()
        self.vname = vname
        self.local_index = local_index
        self.value = value

    def code(self):
        pass


class CILInstructionNode(CILNode):
    def __init__(self, name: str):
        super(CILInstructionNode, self).__init__()
        self.name = name

    def code(self):
        pass


class CILValueNode(CILInstructionNode):
    def __init__(self, value: str, number: str):
        super(CILValueNode, self).__init__("value")
        self.value = value
        self.number = number

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    # TODO
    def code(self):
        ans = ''
        local_dest_increment = self.local_value_index * 4 + 12
        ans += 'li $a0, ' + str(self.number) + '\n'
        ans += 'sw $a0, ' + str(-local_dest_increment) + '($fp)\n'
        return ans


class CILIntegerNode(CILInstructionNode):
    def __init__(self, value):
        super(CILIntegerNode, self).__init__("integer")
        self.value = value

    def code(self):
        pass


class CILAssignNode(CILInstructionNode):
    def __init__(self, dest, source):
        super(CILAssignNode, self).__init__("assign")
        self.dest = dest
        self.source = source
        self.value = dest

    @property
    def local_dest_index(self):
        return int(self.dest.split('_')[-1])

    @property
    def local_source_index(self):
        return int(self.source.split('_')[-1])

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ''
        local_dest_increment = self.local_dest_index * 4 + 12
        local_source_increment = self.local_source_index * 4 + 12
        local_value_increment = self.local_value_index * 4 + 12
        ans += 'lw $a0, ' + str(-local_source_increment) + '($fp)\n'
        ans += 'sw $a0, ' + str(-local_dest_increment) + '($fp)\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILEqualNode(CILInstructionNode):
    def __init__(self, number, value):
        super(CILEqualNode, self).__init__("equal")
        self.number = number
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def number_index(self):
        return int(self.number.split('_')[-1])

    def code(self):
        ans = ''
        number_increment = self.number_index * 4 + 12
        ans += 'lw $a1, ' + str(-number_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        returnTrue_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beqz $a1, returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'li $a0, 0\n'
        ans += 'returnTrue' + returnTrue_time_stamp + ':\n'
        value_increment = self.value_index * 4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILLessNode(CILInstructionNode):
    def __init__(self, number, value):
        super(CILLessNode, self).__init__("less_than")
        self.number = number
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def number_index(self):
        return int(self.number.split('_')[-1])

    def code(self):
        ans = ''
        number_increment = self.number_index*4 + 12
        ans += 'lw $a1, ' + str(-number_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        returnTrue_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'bltz $a1, returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'li $a0, 0\n'
        ans += 'returnTrue' + returnTrue_time_stamp + ':\n'
        value_increment = self.value_index*4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILLessEqualNode(CILInstructionNode):
    def __init__(self, number, value):
        super(CILLessEqualNode, self).__init__("less_equal")
        self.number = number
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def number_index(self):
        return int(self.number.split('_')[-1])

    def code(self):
        ans = ''
        number_increment = self.number_index * 4 + 12
        ans += 'lw $a1, ' + str(-number_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        returnTrue_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'blez $a1, returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'li $a0, 0\n'
        ans += 'returnTrue' + returnTrue_time_stamp + ':\n'
        value_increment = self.value_index * 4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILParamNode(CILInstructionNode):
    def __init__(self, name: str):
        super(CILParamNode, self).__init__("param")
        self.name = name

    @property
    def local_index(self):
        return int(self.name.split('_')[-1])

    def code(self):
        local_increment = self.local_index * 4 + 12
        ans = 'subu $sp, $sp, 4\n'
        ans += 'lw $a0, ' + str(-local_increment) + '($fp)\n'
        ans += 'sw $a0, ($sp)\n'
        return ans


class CILArithmeticNode(CILInstructionNode):
    def __init__(self, left, right, value):
        super(CILArithmeticNode, self).__init__("arithmetic")
        self.value = value
        self.left = left
        self.right = right


class CILPlusNode(CILArithmeticNode):
    def __init__(self, left, right, value):
        super(CILPlusNode, self).__init__(left, right, value)
        self.arith_op = "+"

    @property
    def local_left_index(self):
        return int(self.left.split('_')[-1])

    @property
    def local_right_index(self):
        return int(self.right.split('_')[-1])

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        local_left_increment = self.local_left_index * 4 + 12
        local_right_increment = self.local_right_index * 4 + 12
        local_value_increment = self.local_value_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'add $a0, $a0, $a1\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILMinusNode(CILArithmeticNode):
    def __init__(self, left, right, value):
        super(CILMinusNode, self).__init__(left, right, value)
        self.arith_op = "-"

    @property
    def local_left_index(self):
        return int(self.left.split('_')[-1])

    @property
    def local_right_index(self):
        return int(self.right.split('_')[-1])

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        local_left_increment = self.local_left_index * 4 + 12
        local_right_increment = self.local_right_index * 4 + 12
        local_value_increment = self.local_value_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'sub $a0, $a0, $a1\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILStarNode(CILArithmeticNode):
    def __init__(self, left, right, value):
        super(CILStarNode, self).__init__(left, right, value)
        self.arith_op = "*"

    @property
    def local_left_index(self):
        return int(self.left.split('_')[-1])

    @property
    def local_right_index(self):
        return int(self.right.split('_')[-1])

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        local_left_increment = self.local_left_index * 4 + 12
        local_right_increment = self.local_right_index * 4 + 12
        local_value_increment = self.local_value_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'multu $a0, $a1\n'
        ans += 'mflo $a0\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILDivNode(CILArithmeticNode):
    def __init__(self, left, right, value):
        super(CILDivNode, self).__init__(left, right, value)
        self.arith_op = "/"

    @property
    def local_left_index(self):
        return int(self.left.split('_')[-1])

    @property
    def local_right_index(self):
        return int(self.right.split('_')[-1])

    @property
    def local_value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        local_left_increment = self.local_left_index * 4 + 12
        local_right_increment = self.local_right_index * 4 + 12
        local_value_increment = self.local_value_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'div $a0, $a1\n'
        ans += 'mflo $a0\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILAttributeNode(CILNode):
    def __init__(self, name: str, attr_index: int):
        super(CILAttributeNode, self).__init__()
        self.name = name
        self.attr_index = attr_index

    def code(self) -> str:
        pass

    def __repr__(self):
        return "attribute " + self.name + ":" + str(self.attr_index)


class CILMethodNode(CILNode):
    def __init__(self, name: str, function_name: str, function_index: int):
        super(CILMethodNode, self).__init__()
        self.name = name
        self.function_name = function_name
        self.function_index = function_index

    def code(self) -> str:
        pass

    def __repr__(self):
        return "method " + self.name + ": " + str(self.function_index)


class CILGetAttribNode(CILInstructionNode):
    def __init__(self, instance_name, instance_type, attr_index, value):
        super(CILGetAttribNode, self).__init__("get")
        self.instance_name = instance_name
        self.instance_type = instance_type
        self.attr_index = attr_index
        self.value = value

    @property
    def instance_index(self):
        return int(self.instance_name.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        instance_increment = self.instance_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-instance_increment) + '($fp)\n'
        attr_increment = self.attr_index * 4 + 12
        ans += 'lw $a1, ' + str(attr_increment) + '($a0)\n'
        value_increment = self.value_index * 4 + 12
        ans += 'sw $a1, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILSetAttribNode(CILInstructionNode):
    def __init__(self, instance_name, instance_type, attr_index, value):
        super(CILSetAttribNode, self).__init__("set")
        self.instance_name = instance_name
        self.instance_type = instance_type
        self.attr_index = attr_index
        self.value = value

    @property
    def instance_index(self):
        return int(self.instance_name.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        instance_increment = self.instance_index * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-instance_increment) + '($fp)\n'
        value_increment = self.value_index * 4 + 12
        ans += 'lw $a1, ' + str(-value_increment) + '($fp)\n'
        attr_increment = self.attr_index * 4 + 12
        ans += 'sw $a1, ' + str(attr_increment) + '($a0)\n'
        return ans


class CILGetIndexNode(CILInstructionNode):
    def __init__(self, array_name, index):
        super(CILGetIndexNode, self).__init__("get_index")
        self.array_name = array_name
        self.index = index


class CILSetIndexNode(CILInstructionNode):
    def __init__(self, array_name, index, value):
        super(CILSetIndexNode, self).__init__("set_index")
        self.array_name = array_name
        self.index = index
        self.value = value

    def code(self):
        pass


class CILIsVoidNode(CILInstructionNode):
    def __init__(self, instance, value):
        super(CILIsVoidNode, self).__init__("is_void")
        self.instance = instance
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def instance_index(self):
        return int(self.instance.split('_')[-1])

    def code(self):
        ans = ''
        instance_increment = self.instance_index * 4 + 12
        ans += 'lw $a1, ' + str(-instance_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        isVoid_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $a1, $zero, isVoid'  + isVoid_time_stamp + '\n'
        ans += 'li $a0, 0\n'
        ans += 'isVoid' + isVoid_time_stamp + ':\n'
        value_increment = self.value_index * 4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILAllocateNode(CILInstructionNode):
    def __init__(self, allocate_size: int, class_tag: str, object_size: str, dispatch_ptr: str,
                 value: str):
        super(CILAllocateNode, self).__init__("allocate")
        self.allocate_size = allocate_size * 4
        self.class_tag = class_tag
        self.object_size = object_size
        self.dispatch_ptr = dispatch_ptr
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        value_increment = self.value_index * 4 + 12
        ans = ''
        ans += 'li $a0, ' + str(self.allocate_size) + '\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'li $a0, ' + self.class_tag + '\n'
        ans += 'sw $a0, ' + '($v0)\n'
        ans += 'li $a0, ' + self.object_size + '\n'
        ans += 'sw $a0, ' + '4($v0)\n'
        ans += 'la $a0, ' + self.dispatch_ptr + '\n'
        ans += 'sw $a0, ' + '8($v0)\n'
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILArrayNode(CILInstructionNode):
    def __init__(self, length):
        super(CILArrayNode, self).__init__("array")
        self.length = length

    def code(self):
        pass


class CILTypeOfNode(CILInstructionNode):
    def __init__(self, instance_name, value):
        super(CILTypeOfNode, self).__init__("type_of")
        self.instance_name = instance_name
        self.value = value

    @property
    def instance_index(self):
        return int(self.instance_name.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ''
        instance_increment = self.instance_index * 4 + 12
        ans += 'lw $a0, ' + str(-instance_increment) + '($fp)' '\n'
        ans += 'lw $a0, ($a0)\n'
        ans += 'sw $a0, ' + str(-(self.value_index * 4 + 12)) + '($fp)\n'
        return ans


class CILLabelNode(CILInstructionNode):
    def __init__(self, label_name):
        super(CILLabelNode, self).__init__("label")
        self.label_name = label_name

    def code(self):
        return self.label_name + ':\n'


class CILGotoNode(CILInstructionNode):
    def __init__(self, label_to_jump):
        super(CILGotoNode, self).__init__("goto")
        self.label_to_jump = label_to_jump

    def code(self):
        return "j " + self.label_to_jump + '\n'


class CILGotoIfNode(CILInstructionNode):
    def __init__(self, predicate_name, if_label):
        super(CILGotoIfNode, self).__init__("goto_if")
        self.predicate_name = predicate_name
        self.if_label = if_label

    @property
    def predicate_value(self):
        return int(self.predicate_name.split('_')[-1])

    def code(self):
        ans = ''
        ans += 'lw $a0, ' + str(-(self.predicate_value * 4 + 12)) + '($fp)\n'
        ans += 'bne $a0, $zero, ' + self.if_label + '\n'
        return ans


class CILStackGotoNode(CILInstructionNode):
    def __init__(self, local_to_jump):
        super(CILStackGotoNode, self).__init__("goto")
        self.local_to_jump = local_to_jump

    def code(self):
        return "jr " + self.local_to_jump + "\n"


class CILPushaNode(CILInstructionNode):
    def __init__(self):
        super(CILPushaNode, self).__init__("pusha")

    def code(self):
        return pusha


class CILPopaNode(CILInstructionNode):
    def __init__(self):
        super(CILPopaNode, self).__init__("popa")

    def code(self):
        return popa


class CILStaticCallNode(CILInstructionNode):
    def __init__(self, func_name: str, instance: str, value, count: int):
        super(CILStaticCallNode, self).__init__("static_call")
        self.func_name = func_name
        self.instance = instance
        self.count = count
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ''
        ans += 'jal ' + self.func_name + '\n'
        ans += 'sw $v0, ' + str(-(self.value_index * 4 + 12)) + '($fp)\n'
        ans += 'addu $sp, $sp, ' + str(self.count * 4) + '\n'
        return ans


class CILDynamicCallNode(CILInstructionNode):
    def __init__(self, func_name: str, instance: str = "", value: str = "", count: int = 0):
        super(CILDynamicCallNode, self).__init__("dynamic_call")
        self.func_name = func_name
        self.instance = instance
        self.value = value
        self.count = count

    @property
    def instance_index(self):
        return int(self.instance.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def func_name_index(self):
        return int(self.func_name.split('_')[-1])

    def code(self):
        ans = ''
        instance_increment = self.instance_index*4 + 12
        ans += 'lw $a3, ' + str(-instance_increment) + '($fp)\n'
        func_name_increment = self.func_name_index*4 + 12
        ans += 'lw $t4, ' + str(-func_name_increment) + '($fp)\n'
        ans += 'lw $a3, 8($a3)\n'
        ans += 'li $t0, 0\n'
        tableLoop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'tableLoop' + tableLoop_time_stamp + ':\n'
        ans += 'add $t3, $a3, $t0\n'
        ans += 'lw $t3, ($t3)\n'
        ans += 'move $a1, $t4\n'
        ans += 'move $a2, $t3\n'
        ans += 'li $a0, 1\n'
        compareLoop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'compareLoop' + compareLoop_time_stamp + ':\n'
        ans += 'lb $t1, ($a1)\n'
        ans += 'lb $t2, ($a2)\n'
        returnFalse_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'bne $t1, $t2, returnFalse' + returnFalse_time_stamp + '\n'
        returnTrue_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beqz $t1, returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'add $a2, $a2, 1\n'
        ans += 'j compareLoop' + compareLoop_time_stamp + '\n'
        ans += 'j returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'returnFalse' + returnFalse_time_stamp + ':\n'
        ans += 'li $a0, 0\n'
        ans += 'returnTrue' + returnTrue_time_stamp + ':\n'
        ans += 'add $t0, $t0, 8\n'
        ans += 'beqz $a0, tableLoop' + tableLoop_time_stamp + '\n'
        ans += 'sub $a0, $t0, 4\n'
        ans += 'add $a0, $a3, $a0\n'
        ans += 'lw $a0, ($a0)\n'
        ans += 'jalr $a0\n'
        value_increment = self.value_index*4 + 12
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        ans += 'addu $sp, $sp, ' + str(self.count * 4) + '\n'
        return ans


class CILArgNode(CILInstructionNode):
    def __init__(self, arg_name, arg_index):
        super(CILArgNode, self).__init__("arg")
        self.arg_name = arg_name
        self.arg_index = arg_index

    @property
    def arg_name_index(self):
        return int(self.arg_name.split('_')[-1])

    def code(self):
        ans = ''
        ans += 'lw $a0, ' + str(self.arg_index * 4) + '($fp)\n'
        ans += 'sw $a0, ' + str(-(self.arg_name_index * 4 + 12)) + '($fp)\n'
        return ans


class CILCopyNode(CILInstructionNode):
    def __init__(self, instance, value):
        super(CILCopyNode, self).__init__("copy")
        self.instance = instance
        self.value = value

    @property
    def instance_index(self):
        return int(self.instance.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def node_id(self):
        return str(time.time()).split('.')[0] + str(time.time()).split('.')[1]

    def code(self):
        instance_increment = self.instance_index*4 + 12
        value_increment = self.value_index*4 + 12
        ans = 'lw $a1, ' + str(-instance_increment) + '($fp)\n'
        ans += 'lw $a0, 4($a1)\n'
        ans += 'li $a2, 4\n'
        ans += 'multu $a0, $a2\n'
        ans += 'mflo $a0\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'move $t0, $v0\n'
        ans += 'li $t1, 0\n'
        ans += 'lw $a0, 4($a1)\n'
        loop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'loop' + loop_time_stamp + ':' '\n'
        ans += 'lw $t2, ($a1)\n'
        brake_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $t1, $a0, brake' + brake_time_stamp + '\n'
        ans += 'sw $t2,($t0)\n'
        ans += 'add $a1, $a1, 4\n'
        ans += 'add $t0, $t0, 4\n'
        ans += 'add $t1, $t1, 1\n'
        ans += 'j loop' + loop_time_stamp + '\n'
        ans += 'brake' + brake_time_stamp + ':' + '\n'
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILReturnNode(CILInstructionNode):
    def __init__(self, value=None):
        super(CILReturnNode, self).__init__("return")
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ""
        ans += "lw $v0, " + str(-(self.value_index * 4 + 12)) + '($fp)\n'
        ans += 'move $sp, $fp\n'
        # ans += 'lw $fp, 4($fp)\n'
        ans += 'subu $a0, $sp, 4\n'
        ans += 'lw $fp, ($a0)\n'
        ans += 'subu $a0, $sp, 8\n'
        ans += 'lw $ra, ($a0)\n'
        ans += "jr $ra\n"
        return ans


class CILLoadNode(CILInstructionNode):
    def __init__(self, msg, value):
        super(CILLoadNode, self).__init__("load")
        self.msg = msg
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ""
        ans += "la $a0, " + self.msg + "\n"
        ans += "sw $a0, " + str(-(self.value_index * 4 + 12)) + "($fp)\n"
        return ans


class CILStringCmp(CILInstructionNode):
    def __init__(self, str1, str2, value):
        super(CILStringCmp, self).__init__("string_cmp")
        self.str1 = str1
        self.str2 = str2
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def str1_index(self):
        return int(self.str1.split('_')[-1])

    @property
    def str2_index(self):
        return int(self.str2.split('_')[-1])

    def code(self):
        ans = ''
        str1_increment = self.str1_index*4 + 12
        ans += 'lw $a1, ' + str(-str1_increment) + '($fp)\n'
        str2_increment = self.str2_index*4 + 12
        ans += 'lw $a2, ' + str(-str2_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        compareLoop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'compareLoop' + compareLoop_time_stamp + ':\n'
        ans += 'lb $t1, ($a1)\n'
        ans += 'lb $t2, ($a2)\n'
        returnFalse_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'bne $t1, $t2, returnFalse' + returnFalse_time_stamp + '\n'
        returnTrue_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beqz $t1, returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'add $a2, $a2, 1\n'
        ans += 'j compareLoop' + compareLoop_time_stamp + '\n'
        ans += 'j returnTrue' + returnTrue_time_stamp + '\n'
        ans += 'returnFalse' + returnFalse_time_stamp + ':\n'
        ans += 'li $a0, 0\n'
        ans += 'returnTrue' + returnTrue_time_stamp + ':\n'
        value_increment = self.value_index*4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILLengthNode(CILInstructionNode):
    def __init__(self, instance_name, value):
        super(CILLengthNode, self).__init__("length")
        self.instance_name = instance_name
        self.value = value

    @property
    def instance_name_index(self):
        return int(self.instance_name.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def node_id(self):
        return str(time.time()).split('.')[0] + str(time.time()).split('.')[1]

    def code(self):
        ans = ''
        instance_name_increment = self.instance_name_index * 4 + 12
        ans += 'lw $a1, ' + str(-instance_name_increment) + '($fp)\n'
        ans += 'li $a0, 0\n'
        lengthLoop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'lengthLoop' + lengthLoop_time_stamp + ':\n'
        ans += 'lb $t2, ($a1)\n'
        brakeLengthLoop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $t2, $zero, brakeLengthLoop' + brakeLengthLoop_time_stamp + '\n'
        ans += 'add $a0, $a0, 1\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'j lengthLoop' + lengthLoop_time_stamp + '\n'
        ans += 'brakeLengthLoop' + brakeLengthLoop_time_stamp + ':\n'
        value_increment = self.value_index * 4 + 12
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILConcatNode(CILInstructionNode):
    def __init__(self, str1, str2, len1, len2, value):
        """
        Nodo que representa la concatenación de 2 strings

        :param str1:
            Dirección de memoria donde se guarda el 1er string
        :param str2:
            Dirección de memoria donde se guarda el 2do string
        :param len1:
            Nombre de la variable local en la que se guarda el length del 1er string
        :param len2:
            Nombre de la variable local en la que se guarda el length del 2do string
        :param value:
            Nombre de la variable local en la que se guarda resultado
        """
        super(CILConcatNode, self).__init__("concat")
        self.str1 = str1
        self.str2 = str2
        self.len1 = len1
        self.len2 = len2
        self.value = value

    @property
    def str1_index(self):
        return int(self.str1.split('_')[-1])

    @property
    def str2_index(self):
        return int(self.str2.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def len1_index(self):
        return int(self.len1.split('_')[-1])

    @property
    def len2_index(self):
        return int(self.len2.split('_')[-1])

    @property
    def node_id(self):
        return str(time.time()).split('.')[0] + str(time.time()).split('.')[1]

    def code(self):
        str1_increment = self.str1_index*4 + 12
        str2_increment = self.str2_index*4 + 12
        value_increment = self.value_index*4 + 12
        len1_increment = self.len1_index*4 + 12
        len2_increment = self.len2_index*4 + 12
        ans = ''
        ans += 'lw $a1, ' + str(-str1_increment) + '($fp)\n'
        ans += 'lw $a0, ' + str(-len1_increment) + '($fp)\n'
        ans += 'lw $t0, ' + str(-len2_increment) + '($fp)\n'
        ans += 'add $a0, $a0, $t0\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'move $t0, $v0\n'
        loop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'loop' + loop_time_stamp + ':\n'
        ans += 'lb $t2, ($a1)\n'
        brake_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $t2, $zero, brake' + brake_time_stamp + '\n'
        ans += 'sb $t2,($t0)\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'add $t0, $t0, 1\n'
        ans += 'j loop' + loop_time_stamp + '\n'
        ans += 'brake' + brake_time_stamp + ':\n'
        ans += 'lw $a1, ' + str(-str2_increment) + '($fp)\n'
        loop2_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'loop2' + loop2_time_stamp + ':\n'
        ans += 'lb $t2, ($a1)\n'
        brake2_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $t2, $zero, brake2' + brake2_time_stamp + '\n'
        ans += 'sb $t2,($t0)\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'add $t0, $t0, 1\n'
        ans += 'j loop2' + loop2_time_stamp + '\n'
        ans += 'brake2' + brake2_time_stamp + ':\n'
        ans += 'sb $zero, ($t0)\n'
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILSubstringNode(CILInstructionNode):
    def __init__(self, text, index, length, value):
        super(CILSubstringNode, self).__init__("substring")
        self.text = text
        self.index = index
        self.length = length
        self.value = value

    @property
    def text_index(self):
        return int(self.text.split('_')[-1])

    @property
    def index_index(self):
        return int(self.index.split('_')[-1])

    @property
    def length_index(self):
        return int(self.length.split('_')[-1])

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    @property
    def node_id(self):
        return str(time.time()).split('.')[0] + str(time.time()).split('.')[1]

    def code(self):
        ans = ''
        text_increment = 4*self.text_index + 12
        ans += 'lw $a1, ' + str(-text_increment) + '($fp)\n'
        index_increment = 4*self.index_index + 12
        ans += 'lw $t0, ' + str(-index_increment) + '($fp)\n'
        ans += 'add $a1, $a1, $t0\n'
        length_increment = 4*self.length_index + 12
        ans += 'lw $a0, ' + str(-length_increment) + '($fp)\n'
        ans += 'add $a0, $a0, 1\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'sub $a0, $a0, 1\n'
        ans += 'move $t0, $v0\n'
        ans += 'li $t1, 0\n'
        loop_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'loop' + loop_time_stamp + ':\n'
        ans += 'lb $t2, ($a1)\n'
        brake_time_stamp = str(time.time()).split('.')[0] + str(time.time()).split('.')[1]
        time.sleep(1.e-100)
        ans += 'beq $t2, $zero, brake' + brake_time_stamp + '\n'
        ans += 'beq $t1, $a0, brake' + brake_time_stamp + '\n'
        ans += 'sb $t2,($t0)\n'
        ans += 'add $a1, $a1, 1\n'
        ans += 'add $t1, $t1, 1\n'
        ans += 'add $t0, $t0, 1\n'
        ans += 'j loop' + loop_time_stamp + '\n'
        ans += 'brake' + brake_time_stamp + ':\n'
        ans += 'sb $zero, ($t0)\n'
        value_increment = self.value_index*4 + 12
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILParentOfNode(CILInstructionNode):
    def __init__(self, instance_name, value):
        super(CILParentOfNode, self).__init__("parent_of")
        self.instance = instance_name
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = "li $a1, 4\n"
        ans += "mulu $a0, $a0, $a1\n"
        ans += "la $a1, inheritance_table\n"
        ans += "addu $a1, $a1, $a0\n"
        ans += "lw $a0, ($a1)\n"
        increment = self.value_index*4 + 12
        ans += 'sw $v0, ' + str(-increment) + '($fp)\n'
        return ans


class CILToStrNode(CILInstructionNode):
    def __init__(self, ivalue, value):
        super(CILToStrNode, self).__init__("to_str")
        self.value = value
        self.ivalue = ivalue

    def code(self):
        pass


class CILReadIntegerNode(CILInstructionNode):
    def __init__(self, value):
        super(CILReadIntegerNode, self).__init__("read_int")
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ''
        value_increment = self.value_index * 4 + 12
        ans += 'li $v0, 5\n'
        ans += 'syscall\n'
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILReadStringNode(CILInstructionNode):
    def __init__(self, value):
        super(CILReadStringNode, self).__init__("read_str")
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        value_increment = self.value_index * 4 + 12
        ans = ''
        ans += 'li $a0, 50\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'move $a0, $v0\n'
        ans += 'li $a1, 50\n'
        ans += 'li $v0, 8\n'
        ans += 'syscall\n'
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILPrintIntegerNode(CILInstructionNode):
    def __init__(self, int_addr):
        super(CILPrintIntegerNode, self).__init__("print_int")
        self.int_addr = int_addr

    @property
    def int_addr_index(self):
        return int(self.int_addr.split('_')[-1])

    def code(self):
        int_addr_index = self.int_addr_index * 4 + 12
        ans = 'lw $a0, ' + str(-int_addr_index) + '($fp)\n'
        ans += 'li $v0, 1\n'
        ans += 'syscall\n'
        return ans


class CILPrintStringNode(CILInstructionNode):
    def __init__(self, str_addr):
        super(CILPrintStringNode, self).__init__("print_str")
        self.str_addr = str_addr

    def get_str_index(self):
        return int(self.str_addr.split('_')[-1])

    def code(self):
        i = self.get_str_index() * 4 + 12
        ans = ''
        ans += 'lw $a0, ' + str(-i) + '($fp)\n'  # self.str_addr + '\n'
        ans += 'li $v0, 4\n'
        ans += 'syscall\n'
        return ans


class CILStringCopyNode(CILInstructionNode):
    def __init__(self, string_ptr, value):
        super(CILStringCopyNode, self).__init__("str_copy")
        self.string_ptr = string_ptr
        self.value = value


class CILBooleanNegation(CILInstructionNode):
    def __init__(self, expr):
        super(CILBooleanNegation, self).__init__("not")
        self.expr = expr

    @property
    def expr_index(self):
        return int(self.expr.split('_')[-1])

    def code(self):
        ans = ''
        expr_increment = self.expr_index * 4 + 12
        ans += 'lw $a0, ' + str(-expr_increment) + '($fp)\n'
        ans += 'lw $a2, 12($a0)\n'
        ans += 'li $a1, 1\n'
        ans += 'sub $a2, $a1, $a2\n'
        ans += 'sw $a2, 12($a0)\n'
        return ans


class CILAbortNode(CILInstructionNode):
    def __init__(self, error_message):  # , value):
        super(CILAbortNode, self).__init__("abort")
        self.error_message = error_message
        # self.value = value

    def code(self):
        ans = ''
        ans += 'la $a0, ' + self.error_message + '\n'
        ans += 'li $v0, 4\n'
        ans += 'syscall\n'
        ans += 'li $v0, 10\n'
        ans += 'syscall\n'
        return ans
