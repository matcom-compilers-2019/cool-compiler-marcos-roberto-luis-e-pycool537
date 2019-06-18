from contextType import ContextType

# An array with the tuples (instruction, args_count, return_type)
valid_instructions = ["assign", "plus", "minus", "star", "div", "get", "set",
                      "get_index", "set_index", "allocate", "array", "type_of",
                      "label", "goto", "goto_if", "static_call", "dynamic_call",
                      "arg", "return", "load", "length", "concat", "prefix",
                      "substring", "to_str", "read", "print", "not"]


class CILNode:
    def __init__(self, context: ContextType):
        self.context = context

    def code(self) -> str:
        pass


class CILProgramNode(CILNode):
    def __init__(self, dot_types: list, dot_data: list, functions: list, inheritance, context: ContextType):
        """
        Initializer of the CILProgramNode class.

        :param dot_types:
            Dictionary with names as keys and a list of COOL class features as value
        :param dot_data:
            A list of the tuples (data_name, data_value)
        :param functions:
            The list of the CILClassNodes resulting from the visitor
        :param context:
            The context of the program containing the predefined types and functions
        """
        super(CILProgramNode, self).__init__(context)
        self.dot_types = dot_types
        self.dot_data = dot_data
        self.functions = functions
        self.inheritance = inheritance

    def inheritance_table_code(self):
        result = "inheritance_table .word 0,"
        for parents_class_tag in self.inheritance[1:]:
            result += ", " + str(parents_class_tag)
        result += '\n'
        return result

    def code(self):
        ans = '.data\n'
        ans += 'main_prototype: .word 1, 3, main_dispatch\n'
        for t in self.dot_types:
            ans += t.code()
        for data in self.dot_data:
            ans += data.code()
        ans += '.code\n'
        for function in self.functions:
            ans += function.code()
        return ans


class CILTypeNode(CILNode):
    def __init__(self, name: str, class_tag: int, features: list, context: ContextType = ContextType()):
        super(CILTypeNode, self).__init__(context)
        self.name = name
        self.class_tag = class_tag
        self.features = features
        self.attrs_count = 0
        self.methods_count = 0
        self.get_counts()
        self.object_length = 3 + self.attrs_count

    def get_counts(self):
        for f in self.features:
            if type(f) == CILAttributeNode:
                self.attrs_count += 1
            elif type(f) == CILMethodNode:
                self.methods_count += 1

    def get_attr_index(self, attr_name):
        for f in self.features:
            if type(f) == CILAttributeNode and f.name == attr_name:
                return f.attr_index

    def class_dispatch_table(self):
        result = self.name + "_dispatch_table .word "
        methods_array = [0 for _ in range(self.methods_count)]
        for m in self.features:
            if type(m) == CILMethodNode:
                methods_array[m.function_index] = m.function_name

        for i in range(len(methods_array)):
            if i == 0:
                result += str(methods_array[i])
            else:
                result += ", " + str(methods_array[i])
        result += '\n'
        return result

    def code(self):
        ans = ''
        for feature in self.features:
            if type(feature) == CILAttributeNode:
                # Todo if we need do the attribute table finally, this is the line to do it
                pass
            elif type(feature) == CILMethodNode:
                ans += feature.code()
        return ans

    def __repr__(self):
        return "type " + self.name + ":" + str(self.class_tag)


class CILDataNode(CILNode):
    def __init__(self, vname, value, context: ContextType):
        super(CILDataNode, self).__init__(context)
        self.vname = vname
        self.value = value
        # self.data_type = t

    def code(self):
        ans = self.vname + ':' + ' ' + '.asciiz' + ' ' + self.value + '\n'
        return ans

    def __repr__(self):
        return "Data: " + self.vname + " = " + self.value

# class CILValueNode(CILNode):
#     def __init__(self, value: str, context: ContextType):
#         super(CILValueNode, self).__init__(context)
#         self.value = value


class CILFunctionNode(CILNode):
    def __init__(self, fname: str, findex: int, params: list, local_vars: list, instructions: list,
                 context: ContextType):
        super(CILFunctionNode, self).__init__(context)
        self.fname = fname
        self.findex = findex
        self.params = params
        self.local_vars = local_vars
        self.instructions = instructions

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
        for instruction in self.instructions:
            ans += instruction.code()
        ans += '.end ' + self.fname + '\n'
        return ans

    def __repr__(self):
        return self.fname + "(" + str(self.params) + ")"


class CILParamNode(CILNode):
    def __init__(self, name: str, context: ContextType):
        super(CILParamNode, self).__init__(context)
        self.name = name

    @property
    def local_index(self):
        return int(self.name.split('_')[-1])

    def code(self):
        local_increment = self.local_index * 4 + 8
        ans = 'subu $sp, $sp, 4\n'
        ans += 'lw $a0, ' + str(-local_increment) + '($fp)\n'
        ans += 'sw $a0, (%sp)\n'
        return ans


class CILLocalNode(CILNode):
    def __init__(self, vname: str, local_index: int, value, context: ContextType = ContextType()):
        super(CILLocalNode, self).__init__(context)
        self.vname = vname
        self.local_index = local_index
        self.value = value

    def code(self):
        pass


class CILInstructionNode(CILNode):
    def __init__(self, name: str, context: ContextType):
        super(CILInstructionNode, self).__init__(context)
        self.name = name

    def code(self):
        pass


class CILIntegerNode(CILInstructionNode):
    def __init__(self, value, context):
        super(CILIntegerNode, self).__init__("integer", context)
        self.value = value

    def code(self):
        pass


class CILAssignNode(CILInstructionNode):
    def __init__(self, dest, source, context: ContextType):
        super(CILAssignNode, self).__init__("assign", context)
        self.dest = dest
        self.source = source
        self.value = dest

    @property
    def local_dest_index(self):
        return int(self.dest.split('_')[-1])

    @property
    def local_source_index(self):
        return int(self.source.split('_')[-1])

    def code(self):
        ans = ''
        local_dest_increment = self.local_dest_index * 4 + 8
        local_source_increment = self.local_source_index * 4 + 8
        if '_' in self.dest:
            ans += 'lw $a0, ' + str(-local_source_increment) + '($fp)\n'
            ans += 'sw $a0, ' + str(-local_dest_increment) + '($fp)\n'
        else:
            ans += 'sw $a0, ' + str(self.source) + '\n'
        return ans


class CILArithmeticNode(CILInstructionNode):
    def __init__(self, left, right, value, context: ContextType):
        super(CILArithmeticNode, self).__init__("arithmetic", context)
        self.value = value
        self.left = left
        self.right = right


class CILPlusNode(CILArithmeticNode):
    def __init__(self, left, right, value, context: ContextType):
        super(CILPlusNode, self).__init__(left, right, value, context)
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
        local_left_increment = self.local_left_index * 4 + 8
        local_right_increment = self.local_right_index * 4 + 8
        local_value_increment = self.local_value_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'add $a0, $a0, $a1\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILMinusNode(CILArithmeticNode):
    def __init__(self, left, right, value, context: ContextType):
        super(CILMinusNode, self).__init__(left, right, value, context)
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
        local_left_increment = self.local_left_index * 4 + 8
        local_right_increment = self.local_right_index * 4 + 8
        local_value_increment = self.local_value_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'sub $a0, $a0, $a1\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILStarNode(CILArithmeticNode):
    def __init__(self, left, right, value, context: ContextType):
        super(CILStarNode, self).__init__(left, right, value, context)
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
        local_left_increment = self.local_left_index * 4 + 8
        local_right_increment = self.local_right_index * 4 + 8
        local_value_increment = self.local_value_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'mult $a0, $a1\n'
        ans += 'mflo $a0\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans


class CILDivNode(CILArithmeticNode):
    def __init__(self, left, right, value, context: ContextType):
        super(CILDivNode, self).__init__(left, right, value, context)
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
        local_left_increment = self.local_left_index * 4 + 8
        local_right_increment = self.local_right_index * 4 + 8
        local_value_increment = self.local_value_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-local_left_increment) + '($fp)\n'
        ans += 'lw $a1, ' + str(-local_right_increment) + '($fp)\n'
        ans += 'div $a0, $a1\n'
        ans += 'mflo $a0\n'
        ans += 'sw $a0, ' + str(-local_value_increment) + '($fp)\n'
        return ans

# class CILFeatureNode(CILNode):
#     def __init__(self, attr_or_method: bool, name: str, t: str, context: ContextType):
#         super(CILFeatureNode, self).__init__(context)
#         self.attr_or_method = attr_or_method
#         self.name = name
#         self.t = t


class CILAttributeNode(CILNode):
    def __init__(self, name: str, attr_index: int):
        super(CILAttributeNode, self).__init__(ContextType())
        self.name = name
        self.attr_index = attr_index

    def code(self) -> str:
        pass

    def __repr__(self):
        return "attribute " + self.name + ":" + str(self.attr_index)


class CILMethodNode(CILNode):
    def __init__(self, name: str, function_name: str, function_index: int):
        super(CILMethodNode, self).__init__(ContextType())
        self.name = name
        self.function_name = function_name
        self.function_index = function_index

    def code(self) -> str:
        pass

    def __repr__(self):
        return "method " + self.name + ": " + str(self.function_index)


class CILGetAttribNode(CILInstructionNode):
    def __init__(self, instance_name, instance_type, attr_index, value, context: ContextType):
        super(CILGetAttribNode, self).__init__("get", context)
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

    # Todo Verificar si es string y hacer un nuevo allocate para copiar la variable por valor
    # Todo Revisar bien despues que la pasadera por la memoria este bien hecha
    def code(self):
        instance_increment = self.instance_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-instance_increment) + '($fp)\n'
        attr_increment = self.attr_index * 4 + 12
        ans += 'lw $a1' + str(-attr_increment) + '($a0)\n'
        value_increment = self.value_index * 4 + 8
        ans += 'sw $a1, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILSetAttribNode(CILInstructionNode):
    def __init__(self, instance_name, instance_type, attr_index, value, context: ContextType):
        super(CILSetAttribNode, self).__init__("set", context)
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

    # Todo Verificar si es string y hacer un nuevo allocate para copiar la variable por valor
    # Todo Revisar bien despues que la pasadera por la memoria este bien hecha
    def code(self):
        instance_increment = self.instance_index * 4 + 8
        ans = ''
        ans += 'lw $a0, ' + str(-instance_increment) + '($fp)\n'
        value_increment = self.value_index * 4 + 8
        ans += 'lw $a1' + str(-value_increment) + '($fp)\n'
        attr_increment = self.attr_index * 4 + 12
        ans += 'sw $a1, ' + str(-attr_increment) + '($a0)\n'
        return ans


class CILGetIndexNode(CILInstructionNode):
    def __init__(self, array_name, index, context: ContextType):
        super(CILGetIndexNode, self).__init__("get_index", context)
        self.array_name = array_name
        self.index = index


class CILSetIndexNode(CILInstructionNode):
    def __init__(self, array_name, index, value, context: ContextType):
        super(CILSetIndexNode, self).__init__("set_index", context)
        self.array_name = array_name
        self.index = index
        self.value = value

    def code(self):
        pass


class CILIsVoidNode(CILInstructionNode):
    def __init__(self, instance, value, context: ContextType):
        super(CILIsVoidNode, self).__init__("is_void", context)
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
        instance_increment = self.instance_index * 4 + 8
        ans += 'lw $a1, ' + str(-instance_increment) + '($fp)\n'
        ans += 'li $a0, 1\n'
        ans += 'li $a0, 0\n'
        ans += 'beq $a1, $zero, isVoid\n'
        ans += 'isVoid:\n'
        value_increment = self.value_index * 4 + 8
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILAllocateNode(CILInstructionNode):
    def __init__(self, allocate_size, value: str, context: ContextType):
        super(CILAllocateNode, self).__init__("allocate", context)
        self.allocate_size = allocate_size * 4
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        value_increment = self.value_index * 4 + 8
        ans = ''
        ans += 'li $a0, ' + str(self.allocate_size) + '\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'sw $v0, ' + str(-value_increment) + '($fp)'
        return ans


class CILArrayNode(CILInstructionNode):
    def __init__(self, length, context: ContextType):
        super(CILArrayNode, self).__init__("array", context)
        self.length = length


class CILTypeOfNode(CILInstructionNode):
    def __init__(self, instance_name, value, context: ContextType):
        super(CILTypeOfNode, self).__init__("type_of", context)
        self.instance_name = instance_name
        self.value = value

    @property
    def value_index(self):
        return int(self.instance_name.split('_')[-1])

    # TODO No me queda claro que esten bien
    def code(self):
        ans = ''
        ans += 'la $a0, ' + self.value + '\n'
        ans += 'lw $a0, ($a0)\n'
        ans += 'sw $a0, ' + str(-(self.value_index * 4 + 8)) + '($fp)\n'
        return ans


class CILLabelNode(CILInstructionNode):
    def __init__(self, label_name, context: ContextType):
        super(CILLabelNode, self).__init__("label", context)
        self.label_name = label_name

    def code(self):
        return self.label_name + ':\n'


class CILGotoNode(CILInstructionNode):
    def __init__(self, label_to_jump, context: ContextType):
        super(CILGotoNode, self).__init__("goto", context)
        self.label_to_jump = label_to_jump

    def code(self):
        return "j " + self.label_to_jump + '\n'


class CILGotoIfNode(CILInstructionNode):
    def __init__(self, predicate_name, if_label, context: ContextType):
        super(CILGotoIfNode, self).__init__("goto_if", context)
        self.predicate_name = predicate_name
        self.if_label = if_label

    @property
    def predicate_value(self):
        return int(self.predicate_name.split('_')[-1])

    def code(self):
        ans = ''
        ans += 'la $a0, ' + str(-(self.predicate_value * 4 + 8)) + '($fp)\n'
        ans += 'bne $a0, $zero, ' + self.if_label + '\n'
        return ans


class CILStaticCallNode(CILInstructionNode):
    def __init__(self, func_name: str, value, context: ContextType):
        super(CILStaticCallNode, self).__init__("static_call", context)
        self.func_name = func_name
        self.value = value


class CILDynamicCallNode(CILInstructionNode):
    def __init__(self, func_name: str, instance: str = "", value: str = "",
                 context: ContextType = ContextType()):
        super(CILDynamicCallNode, self).__init__("dynamic_call", context)
        self.func_name = func_name
        self.instance = instance
        self.value = value


# class CILCaseNode(CILInstructionNode):
#     def __init__(self, expr, actions, result, context: ContextType = ContextType()):
#         super(CILCaseNode, self).__init__("case", context)
#         self.expr = expr
#         self.actions = actions
#         self.result = result


# class CILActionNode(CILInstructionNode):
#     def __init__(self, ):


class CILArgNode(CILInstructionNode):
    def __init__(self, arg_name, arg_index, context: ContextType):
        super(CILArgNode, self).__init__("arg", context)
        self.arg_name = arg_name
        self.arg_index = arg_index

    @property
    def arg_name_index(self):
        return int(self.arg_name.split('_')[-1])

    def code(self):
        ans = ''
        ans += 'lw $a0, ' + str(self.arg_index * 4) + '\n'
        ans += 'sw $a0, ' + str(-(self.arg_name_index * 4 + 8)) + '($fp)\n'
        return ans


class CILReturnNode(CILInstructionNode):
    def __init__(self, value=None, context: ContextType = ContextType()):
        super(CILReturnNode, self).__init__("return", context)
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ""
        ans += "la $a0, " + str(-(self.value_index * 4 + 8)) + '($fp)\n'
        ans += "move $v0, $a0\n"
        ans += 'lw $fp, 4($fp)\n'
        ans += 'move $sp, $fp\n'
        ans += 'subu $a0, $sp, 4\n'
        ans += 'lw $fp, ($a0)\n'
        ans += 'subu $a0, $sp, 8\n'
        ans += 'lw $ra, ($a0)\n'
        ans += "jr $ra\n"
        return ans


class CILLoadNode(CILInstructionNode):
    def __init__(self, msg, value, context: ContextType):
        super(CILLoadNode, self).__init__("load", context)
        self.msg = msg
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        ans = ""
        ans += "la $a0, " + self.msg + "\n"
        ans += "sw $a0, " + str(-(self.value_index * 4 + 8)) + "($fp)\n"
        return ans


class CILLengthNode(CILInstructionNode):
    def __init__(self, instance_name, value, context: ContextType):
        super(CILLengthNode, self).__init__("length", context)
        self.instance_name = instance_name
        self.value = value


class CILConcatNode(CILInstructionNode):
    def __init__(self, str1, str2, value, context: ContextType):
        super(CILConcatNode, self).__init__("concat", context)
        self.str1 = str1
        self.str2 = str2
        self.value = value


class CILPrefixNode(CILInstructionNode):
    def __init__(self, smaller_instance, bigger_instance, context: ContextType):
        super(CILPrefixNode, self).__init__("prefix", context)
        self.smaller_instance = smaller_instance
        self.bigger_instance = bigger_instance


class CILSubstringNode(CILInstructionNode):
    def __init__(self, text, index, length, value, context: ContextType):
        super(CILSubstringNode, self).__init__("substring", context)
        self.text = text
        self.index = index
        self.length = length
        self.value = value


class CILToStrNode(CILInstructionNode):
    def __init__(self, ivalue, value, context: ContextType):
        super(CILToStrNode, self).__init__("to_str", context)
        self.value = value
        self.ivalue = ivalue


class CILReadIntegerNode(CILInstructionNode):
    def __init__(self, value, context: ContextType):
        super(CILReadIntegerNode, self).__init__("read_int", context)
        self.value = value


class CILReadStringNode(CILInstructionNode):
    def __init__(self, value, context: ContextType):
        super(CILReadStringNode, self).__init__("read_str", context)
        self.value = value

    @property
    def value_index(self):
        return int(self.value.split('_')[-1])

    def code(self):
        value_increment = self.value_index * 4 + 8
        ans = ''
        ans += 'li $a0, 50\n'
        ans += 'li $v0, 9\n'
        ans += 'syscall\n'
        ans += 'li $a1, 50\n'
        ans += 'syscall\n'
        ans += 'sw $a0, ' + str(-value_increment) + '($fp)\n'
        return ans


class CILPrintIntegerNode(CILInstructionNode):
    def __init__(self, int_addr, context: ContextType):
        super(CILPrintIntegerNode, self).__init__("print_int", context)
        self.int_addr = int_addr

    @property
    def int_addr_index(self):
        return int(self.int_addr.split('_')[-1])

    def code(self):
        int_addr_index = self.int_addr_index * 4 + 8
        ans = 'lw $a0, ' + str(-int_addr_index) + '($fp)\n'
        ans += 'li $v0, 1\n'
        ans += 'syscall\n'


class CILPrintStringNode(CILInstructionNode):
    def __init__(self, str_addr, context: ContextType):
        super(CILPrintStringNode, self).__init__("print_str", context)
        self.str_addr = str_addr

    def code(self):
        ans = ''
        ans += 'la $a0, ' + self.str_addr + '\n'
        ans += 'li $v0, 4\n'
        ans += 'syscall\n'
        return ans


class CILBooleanNegation(CILInstructionNode):
    def __init__(self, expr, context: ContextType):
        super(CILBooleanNegation, self).__init__("not", context)
        self.expr = expr

    @property
    def expr_index(self):
        return int(self.expr.split('_')[-1])

    def code(self):
        ans = ''
        expr_increment = self.expr_index * 4 + 8
        ans += 'lw $a0, ' + str(-expr_increment) + '($fp)\n'
        ans += 'li $a1, 1\n'
        ans += 'sub $a0, $a1, $a0\n'
        ans += 'sw $a0, ' + str(-expr_increment) + '($fp)\n'
        return ans


# TODO: Tengo que terminar el abort
class CILAbortNode(CILInstructionNode):
    def __inti__(self, error_message, value, context: ContextType):
        super(CILAbortNode, self).__init__("abort", context)
        self.error_mesage = error_message
        self.value = value

    def code(self):
        ans = ''
        ans += 'la $a0, ' + self.error_mesage + '\n'
        ans += 'li $v0, 4\n'
        ans += 'syscall\n'
        ans += 'li $v0, 10\n'
        ans += 'syscall\n'
        return ans
