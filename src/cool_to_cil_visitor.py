from cil_ast import *
import ast
import visitor
import pre_visitor


class CoolToCILVisitor:
    instruction_nodes = {
        "assign": CILAssignNode,
        "plus": CILPlusNode,
        "minus": CILMinusNode,
        "star": CILStarNode,
        "div": CILDivNode,
        "get": CILGetAttribNode,
        "set": CILSetAttribNode,
        "get_index": CILGetIndexNode,
        "set_index": CILSetIndexNode,
        "allocate": CILAllocateNode,
        "array": CILArrayNode,
        "type_of": CILTypeOfNode,
        "label": CILLabelNode,
        "goto": CILGotoNode,
        "goto_if": CILGotoIfNode,
        "static_call": CILStaticCallNode,
        "dynamic_call": CILDynamicCallNode,
        "arg": CILArgNode,
        "return": CILReturnNode,
        "load": CILLoadNode,
        "length": CILLengthNode,
        "concat": CILConcatNode,
        "substring": CILSubstringNode,
        "str": CILToStrNode,
        "read_int": CILReadIntegerNode,
        "read_string": CILReadStringNode,
        "print_int": CILPrintIntegerNode,
        "print_string": CILPrintStringNode,
        "not": CILBooleanNegation,
        "copy": CILCopyNode
    }

    def __init__(self):
        self.local_vars_count = 0
        self.dot_types = [CILTypeNode("Void", 0, [], [])]
        self.dot_data = []
        self.local_vars = []
        self.instructions = []
        self.curr_func_name = ""
        self.current_class = ""
        self.func_count = 0
        self.label_count = 0
        self.declaredAttributesInCLass = {}
        self.declaredMethodsInClass = {}
        self.names_of_values = {}
        self.class_tag = 0
        # self.inheritances[0] = Void
        # self.inheritances[1] = Object
        # self.inheritances[2] = Int
        # self.inheritances[3] = Bool
        # self.inheritances[4] = String
        # self.inheritances[5] = IO
        self.inheritances = [0, 0, 1, 1, 1, 1]

    # region Utils
    def get_variable_name(self, name: str):
        result = str(self.current_class) + "_" + str(self.curr_func_name) + "_" + name
        return result

    def get_label_name(self, name):
        label = "label_" + self.current_class + "_" + self.curr_func_name + "_" + name + "_" + str(self.label_count)
        self.label_count += 1
        return label

    def def_internal_var(self, name: str):
        self.local_vars.append(name)
        local_node = CILLocalNode(name, self.local_vars_count, None)
        self.local_vars_count += 1
        return local_node

    def set_data(self, value):
        name = self.get_variable_name("data_" + str(len(self.dot_data)))
        node = CILDataNode(name, value)
        self.dot_data.append(node)
        return node

    def search_definition_class(self, feature_name, class_name, parents):
        for method in self.declaredMethodsInClass[class_name]:
            if method == feature_name:
                return class_name

        for attribute in self.declaredAttributesInCLass[class_name]:
            if attribute == feature_name:
                return class_name

        if len(parents) > 0:
            return self.search_definition_class(feature_name, parents[0], parents[1:])
        else:
            return None

    def get_type_name(self, n):
        for t in self.dot_types:
            if n == t.class_tag:
                return t.name

    def define_object_type(self):
        methods = []
        # region init_Object
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        functions = []
        self.func_count = 0
        method_count = 0
        self.current_class = "Object"
        self.curr_func_name = "abort"

        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance_var = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_var = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(1), str(4), "Object_dispatch_table",
                                                 instance_var.vname))
        self.instructions.append(CILValueNode(value_var.vname, str(0)))
        self.instructions.append(CILSetAttribNode(instance_var.vname, 2, 0, value_var.vname))
        self.instructions.append(CILReturnNode(instance_var.vname))
        methods.append(CILMethodNode("init_Object", "init_Object", method_count))
        method_count += 1
        functions.append(CILFunctionNode("init_Object", self.func_count, [], self.local_vars, self.instructions))
        self.func_count += 1
        # endregion
        # region abort
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        self.curr_func_name = "abort"
        # abort_return = self.def_internal_var('abort_' + str(len(self.local_vars)))
        error_message = self.set_data('"Abort()"')
        self.instructions.append(CILAbortNode(error_message.vname))
        functions.append(CILFunctionNode('def_Object_abort', self.func_count, [], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        methods.append(CILMethodNode('abort', 'def_Object_abort', method_count))
        method_count += 1
        self.curr_func_name = ""
        # endregion
        # region type_name
        self.curr_func_name = "type_name"
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        type_name = self.get_variable_name('type_name_' + str(len(self.local_vars)))
        type_local = self.def_internal_var(type_name)
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILTypeOfNode(local_0.vname, type_local.vname))
        name = self.get_variable_name("int_instance_" + str(self.local_vars_count))
        instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, "2", "4", "Int_dispatch_table", instance.vname))
        self.instructions.append(CILSetAttribNode(instance.vname, 2, 0, type_local.vname))
        self.instructions.append(CILReturnNode(instance.vname))
        functions.append(CILFunctionNode('def_Object_type_name', self.func_count, [local_0.vname], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        methods.append(CILMethodNode('type_name', 'def_Object_type_name', method_count))
        method_count += 1
        # endregion
        # region copy
        self.curr_func_name = "copy"
        self.local_vars = []
        self.local_vars_count = 0
        instance_name = self.get_variable_name("instance_" + str(len(self.local_vars)))
        instance_local = self.def_internal_var(instance_name)
        result = self.get_variable_name("result_" + str(len(self.local_vars)))
        result_local = self.def_internal_var(result)
        self.instructions.append(CILArgNode(instance_local.vname, 0))
        self.instructions.append(CILCopyNode(instance_local.vname, result_local.vname))
        self.instructions.append(CILReturnNode(result_local.vname))
        functions.append(CILFunctionNode('def_Object_copy', method_count, [instance_local.vname], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        methods.append(CILMethodNode('copy', 'def_Object_copy', method_count))
        method_count += 1
        # endregion
        self.class_tag = self.get_class_tag("Object")
        return functions

    def define_int_type(self):
        methods = []
        self.class_tag = self.get_class_tag("Int")
        self.current_class = "Int"
        self.curr_func_name = "init_Int"
        self.instructions = []
        self.local_vars = []
        self.local_vars_count = 0
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance_var = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_var = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(2), str(4), "Int_dispatch_table",
                                                 instance_var.vname))
        self.instructions.append(CILValueNode(value_var.vname, str(0)))
        self.instructions.append(CILSetAttribNode(instance_var.vname, 2, 0, value_var.vname))
        self.instructions.append(CILReturnNode(instance_var.vname))
        methods.append(CILMethodNode("init_Int", "init_Int", 0))
        methods.append(CILMethodNode("abort", "def_Object_abort", 1))
        methods.append(CILMethodNode("type_name", "def_Object_type_name", 2))
        methods.append(CILMethodNode("copy", "def_Object_copy", 3))
        return [CILFunctionNode("init_Int", 0, [], self.local_vars, self.instructions)]

    def define_bool_type(self):
        self.current_class = "Bool"
        self.curr_func_name = "init_Bool"
        self.class_tag = self.get_class_tag("Bool")
        self.instructions = []
        self.local_vars = []
        self.local_vars_count = 0
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance_local = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_local = self.def_internal_var(name)
        self.instructions.append(CILValueNode(value_local.vname, str(0)))
        self.instructions.append(CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", instance_local.vname))
        self.instructions.append(CILSetAttribNode(instance_local.vname, 3, 0, value_local.vname))
        self.instructions.append(CILReturnNode(instance_local.vname))
        return [CILFunctionNode("init_Bool", 0, [], self.local_vars, self.instructions)]

    def define_string_type(self):
        self.class_tag = self.get_class_tag("String")
        functions = []

        # region init_string
        self.current_class = "String"
        self.curr_func_name = "init_String"
        self.func_count = 0
        self.instructions = []
        self.local_vars = []
        self.local_vars_count = 0
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance_local = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_local = self.def_internal_var(name)
        self.instructions.append(CILLoadNode("empty_string", value_local.vname))
        self.instructions.append(CILAllocateNode(4, str(4), str(4), "String_dispatch_table", instance_local.vname))
        self.instructions.append(CILSetAttribNode(instance_local.vname, 4, 0, value_local.vname))
        self.instructions.append(CILReturnNode(instance_local.vname))
        functions.append(CILFunctionNode("init_String", 0, [], self.local_vars, self.instructions))
        self.func_count += 1
        # endregion
        # region length
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        self.current_class = "String"
        length_return = self.def_internal_var('length_string_' + str(len(self.local_vars)))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILGetAttribNode(local_0.vname, 4, 0, local_0.vname))
        self.instructions.append(CILLengthNode(local_0.vname, length_return.vname))
        name = self.get_variable_name("string_instance_" + str(self.local_vars_count))
        string_instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(2), str(4), "Int_dispatch_table", string_instance.vname))
        self.instructions.append(CILSetAttribNode(string_instance.vname, 4, 0, length_return.vname))
        self.instructions.append(CILReturnNode(string_instance.vname))
        functions.append(CILFunctionNode('def_String_length', self.func_count, [local_0.vname], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        # endregion
        # region concat
        self.curr_func_name = "concat"
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        concat_return = self.def_internal_var('concat_string_' + str(self.local_vars_count))
        name_1 = self.get_variable_name("concat_second_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        name_len_1 = self.get_variable_name("concat_second_length_" + str(self.local_vars_count))
        local_len_1 = self.def_internal_var(name_len_1)
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_len_0 = self.get_variable_name("self_len_" + str(self.local_vars_count))
        local_len_0 = self.def_internal_var(name_len_0)
        name = self.get_variable_name("string_instance_" + str(self.local_vars_count))
        local_string_instance = self.def_internal_var(name)
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILArgNode(local_1.vname, 1))
        self.instructions.append(CILGetAttribNode(local_0.vname, 4, 0, local_0.vname))
        self.instructions.append(CILGetAttribNode(local_1.vname, 4, 0, local_1.vname))
        self.instructions.append(CILLengthNode(local_0.vname, local_len_0.vname))
        self.instructions.append(CILLengthNode(local_1.vname, local_len_1.vname))
        self.instructions.append(CILConcatNode(local_0.vname, local_1.vname, local_len_0.vname,
                                               local_len_1.vname, concat_return.vname))
        self.instructions.append(CILAllocateNode(4, str(4), str(4), "String_dispatch_table",
                                                 local_string_instance.vname))
        self.instructions.append(CILSetAttribNode(local_string_instance.vname, 4, 0, concat_return.vname))
        self.instructions.append(CILReturnNode(local_string_instance.vname))
        functions.append(CILFunctionNode('def_String_concat', self.func_count, [local_0.vname, local_1.vname],
                                         self.local_vars, self.instructions))
        self.func_count += 1
        # endregion
        # region substr
        self.curr_func_name = "substr"
        self.local_vars = []
        self.instructions = []
        self.local_vars_count = 0
        substr_return = self.def_internal_var('substr_value_' + str(len(self.local_vars)))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("index_substr_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        name_2 = self.get_variable_name("length_substr_" + str(self.local_vars_count))
        local_2 = self.def_internal_var(name_2)
        self.instructions.append(CILArgNode(local_2.vname, 2))
        self.instructions.append(CILArgNode(local_1.vname, 1))
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILGetAttribNode(local_0.vname, 4, 0, local_0.vname))
        self.instructions.append(CILGetAttribNode(local_1.vname, 4, 0, local_1.vname))
        self.instructions.append(CILGetAttribNode(local_2.vname, 4, 0, local_2.vname))
        self.instructions.append(CILSubstringNode(local_0.vname, local_1.vname, local_2.vname, substr_return.vname))
        name = self.get_variable_name("string_instance_" + str(self.local_vars_count))
        instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(4), str(4), "String_dispatch_table", instance.vname))
        self.instructions.append(CILSetAttribNode(instance.vname, 4, 0, substr_return.vname))
        self.instructions.append(CILReturnNode(instance.vname))
        functions.append(CILFunctionNode('def_String_substr', self.func_count,
                                         [local_0.vname, local_1.vname, local_2.vname],
                                         self.local_vars, self.instructions))
        self.func_count += 1
        # endregion

        self.current_class = ""
        return functions

    def define_io_type(self):
        functions = []
        self.current_class = "IO"
        self.class_tag = self.get_class_tag("IO")

        # region init_IO
        self.curr_func_name = "init_IO"
        self.instructions = []
        self.local_vars = []
        self.local_vars_count = 0
        self.func_count = 0
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(5), str(4), "IO_dispatch_table", instance.vname))
        self.instructions.append(CILReturnNode(instance.vname))
        functions.append(CILFunctionNode(self.curr_func_name, self.func_count, [], self.local_vars, self.instructions))
        # endregion
        # region in_string
        self.curr_func_name = "in_string"
        self.local_vars = []
        self.instructions = []
        in_string_value = self.def_internal_var(self.get_variable_name('in_string_value_' + str(len(self.local_vars))))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        local_1 = self.def_internal_var(self.get_variable_name("0_number_" + str(self.local_vars_count)))
        local_2 = self.def_internal_var(self.get_variable_name("length_" + str(self.local_vars_count)))
        local_3 = self.def_internal_var(self.get_variable_name("1_number_" + str(self.local_vars_count)))
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILReadStringNode(in_string_value.vname))
        self.instructions.append(CILValueNode(local_1.vname, "0"))
        # self.instructions.append(CILLengthNode(in_string_value.vname, local_2.vname))
        # self.instructions.append(CILValueNode(local_3.vname, "1"))
        # self.instructions.append(CILMinusNode(local_2.vname, local_3.vname, local_2.vname))
        self.instructions.append(CILSubstringNode(in_string_value.vname, local_1.vname,
                                                  local_2.vname, in_string_value.vname))
        self.instructions.append(CILReturnNode(local_0.vname))
        functions.append(CILFunctionNode('def_IO_in_string', self.func_count, [local_0.vname], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        # endregion
        # region in_int
        self.curr_func_name = "in_int"
        self.local_vars = []
        self.instructions = []
        in_int_value = self.def_internal_var(self.get_variable_name('in_int_value_' + str(len(self.local_vars))))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILReadIntegerNode(in_int_value.vname))
        self.instructions.append(CILReturnNode(in_int_value.vname))
        functions.append(CILFunctionNode('def_IO_in_int', self.func_count, [local_0.vname],
                                         self.local_vars, self.instructions))
        self.func_count += 1
        # endregion
        # region out_string
        self.curr_func_name = "out_string"
        self.local_vars = []
        self.instructions = []
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("text_string_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        self.instructions.append(CILArgNode(local_1.vname, 1))
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILGetAttribNode(local_1.vname, 4, 0, local_1.vname))
        self.instructions.append(CILPrintStringNode(local_1.vname))
        self.instructions.append(CILReturnNode(local_0.vname))
        functions.append(CILFunctionNode('def_IO_out_string', self.func_count, [name_0, name_1],
                                         self.local_vars, self.instructions))
        self.func_count += 1
        # endregion
        # region out_int
        self.curr_func_name = "out_int"
        self.local_vars = []
        self.instructions = []
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("text_int_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        self.instructions.append(CILArgNode(local_1.vname, 1))
        self.instructions.append(CILArgNode(local_0.vname, 0))
        self.instructions.append(CILPrintStringNode(local_1.vname))
        self.instructions.append(CILReturnNode(local_0.vname))
        functions.append(CILFunctionNode('def_IO_out_int', self.func_count, [name_0, name_1], self.local_vars,
                                         self.instructions))
        self.func_count += 1
        # endregion

        return functions

    def get_class_tag(self, name):
        for t in self.dot_types:
            if name == t.name:
                return t.class_tag

    def get_type_node(self, type_name):
        for t in self.dot_types:
            if t.name == type_name:
                return t

    def set_type_node(self, node: CILTypeNode):
        for i in range(len(self.dot_types)):
            if self.dot_types[i].name == node.name:
                self.dot_types[i] = node

    def refill_by_inheritance(self, node: ast.ClassNode):
        if node.parent is None:
            return
        t = self.get_type_node(node.name)
        parent_type_node = self.get_type_node(node.parent)
        for attr in parent_type_node.attributes:
            t.attributes.append(attr)
        for method in parent_type_node.methods:
            t.methods.append(method)
        self.set_type_node(t)

    # endregion

    # region Visitors
    @visitor.on('node')
    def visit(self, node):
        pass

    @visitor.when(ast.ProgramNode)
    def visit(self, node: ast.ProgramNode):
        pre_visit = pre_visitor.DeclarationDictVisitor(node)
        self.declaredAttributesInCLass = pre_visit.attrsDict
        self.declaredMethodsInClass = pre_visit.methodsDict
        self.dot_types = pre_visit.dot_types
        functions = []

        functions.extend(self.define_object_type())
        functions.extend(self.define_int_type())
        functions.extend(self.define_bool_type())
        functions.extend(self.define_string_type())
        functions.extend(self.define_io_type())

        for n in node.class_list:
            functions.extend(self.visit(n))

        return CILProgramNode(self.dot_types, self.dot_data, functions, self.inheritances)

    @visitor.when(ast.ClassNode)
    def visit(self, node: ast.ClassNode):
        self.instructions = []
        self.local_vars = []
        self.current_class = node.name
        self.func_count = 0
        method_index = 0
        self.local_vars_count = 0
        self.class_tag = self.get_class_tag(node.name)

        self.refill_by_inheritance(node)

        if self.class_tag - len(self.inheritances) + 1 > 0:
            for i in range(self.class_tag - len(self.inheritances) + 1):
                self.inheritances.append(0)
        if node.parent is not None:
            parent_tag = self.get_class_tag(node.parent)
            self.inheritances[self.class_tag] = parent_tag
        else:
            self.inheritances[self.class_tag] = 1

        # region inicializando el init
        self.curr_func_name = "init_" + self.current_class
        instance_name = self.get_variable_name("instance_" + str(self.local_vars_count))
        instance_local = self.def_internal_var(instance_name)
        self.instructions.append(CILAllocateNode(3 + len(node.context_type.types[node.name].attributes),
                                                 str(self.class_tag),
                                                 str(3 + len(node.context_type.types[node.name].attributes)),
                                                 node.name + "_dispatch_table", instance_local.vname))
        # endregion

        t = node.context_type.getType(node.name)

        # region Atributos de la clase
        for i, attribute in enumerate(node.context_type.types[node.name].attributes):
            def_class = self.search_definition_class(attribute, node.name, node.context_type.parentsOfType(t)[1:])
            expr = self.declaredAttributesInCLass[def_class][attribute]

            if expr is not None:
                # develops the code for the expresion
                self.instructions.append(CILSetAttribNode(instance_local.vname, self.class_tag, i,
                                                          self.visit(expr).vname))
            else:
                # instantiates a default instance
                attr_instance_name = self.get_variable_name("attr_instance_" + str(self.local_vars_count))
                attr_instance_local = self.def_internal_var(attr_instance_name)
                ta = node.context_type.getTypeFor(attribute).name
                if ta == "Int" or ta == "String" or ta == "Bool":
                    # special case of the built-in types with default initialitation
                    self.instructions.append(CILPushaNode())
                    self.instructions.append(CILStaticCallNode("init_" + ta, instance_local.vname,
                                                               attr_instance_local.vname, 0))
                    self.instructions.append(CILPopaNode())
                    self.instructions.append(CILSetAttribNode(instance_local.vname, self.class_tag, i,
                                                              attr_instance_local.vname))
                else:
                    # the initialization of the other classes
                    value_node_name = self.get_variable_name("value_void_" + str(self.local_vars_count))
                    value_node = self.def_internal_var(value_node_name)
                    self.instructions.append(CILValueNode(value_node.vname, "0"))
                    self.instructions.append(CILSetAttribNode(instance_local.vname, self.class_tag,
                                                              i, value_node.vname))

        self.instructions.append(CILReturnNode(instance_local.vname))

        functions = [CILFunctionNode("init_" + node.name, self.func_count, [],  # init_params,
                                     self.local_vars, self.instructions)]
        self.func_count += 1
        # endregion

        # region Metodos de clase
        for method in node.context_type.types[node.name].methods:
            self.local_vars = []
            self.instructions = []
            self.names_of_values = {}
            self.curr_func_name = method
            self.local_vars_count = 0

            def_class = self.search_definition_class(method, node.name, node.context_type.parentsOfType(t)[1:])
            method_node = CILMethodNode(method, "def_" + def_class + "_" + method, method_index)
            method_index += 1

            if def_class == node.name:
                expr = self.declaredMethodsInClass[def_class][method]

                self_name = self.get_variable_name("self_" + str(self.local_vars_count))
                self_local = self.def_internal_var(self_name)
                params = [self_name]
                self.instructions.append(CILArgNode(self_local.vname, 0))
                for arg in node.context_type.types[node.name].methods[method].arguments:
                    arg_name = self.get_variable_name("arg_" + str(self.local_vars_count))
                    arg_local = self.def_internal_var(arg_name)
                    self.instructions.append(CILArgNode(arg_local.vname, len(params)))
                    params.append(arg_local.vname)
                    self.names_of_values[arg.name] = [arg_local.vname]

                return_method = self.visit(expr)
                self.instructions.append(CILReturnNode(return_method.vname))

                functions.append(
                    CILFunctionNode(method_node.function_name, self.func_count, params, self.local_vars,
                                    self.instructions))
                self.func_count += 1

        # endregion

        return functions

    @visitor.when(ast.BlockNode)
    def visit(self, node: ast.BlockNode):
        name = self.get_variable_name("block" + "_" + str(self.local_vars_count))
        block_value = self.def_internal_var(name)
        bv = None
        for exp in node.expr_list:
            bv = self.visit(exp)
        self.instructions.append(CILAssignNode(block_value.vname, bv.vname))
        return block_value

    @visitor.when(ast.AssignNode)
    def visit(self, node: ast.AssignNode):
        if node.idx_token in self.names_of_values.keys():
            name = self.names_of_values[node.idx_token][len(self.names_of_values[node.idx_token]) - 1]
        else:
            name = self.get_variable_name(node.idx_token + "_" + str(self.local_vars_count))
        return_value = self.def_internal_var(name)
        t = node.context_type.getTypeFor(node.idx_token).name
        if t in ['Int', 'Bool']:
            self.instructions.append(CILCopyNode(self.visit(node.expr).vname, return_value.vname))
        elif t == 'String':
            expr_assign = self.visit(node.expr)
            self.instructions.append(CILCopyNode(expr_assign.vname, return_value.vname))
            attr_string = self.get_variable_name(node.idx_token + '_attr_string_' + str(self.local_vars_count))
            attr_value = self.def_internal_var(attr_string)
            self.instructions.append(CILGetAttribNode(expr_assign.vname, 4, 0, attr_value.vname))
            lo_index = self.get_variable_name(node.idx_token + '_lo_index_' + str(self.local_vars_count))
            lo_value = self.def_internal_var(lo_index)
            hi_index = self.get_variable_name(node.idx_token + '_hi_index_' + str(self.local_vars_count))
            hi_value = self.def_internal_var(hi_index)
            self.instructions.append(CILValueNode(lo_value.vname, '0'))
            self.instructions.append(CILLengthNode(attr_value.vname, hi_value.vname))
            temp_string = self.get_variable_name(node.idx_token + '_temp_string_' + str(self.local_vars_count))
            temp_value = self.def_internal_var(temp_string)
            self.instructions.append(CILSubstringNode(attr_value.vname, lo_value.vname, hi_value.vname,
                                                      temp_value.vname))
            self.instructions.append(CILSetAttribNode(return_value.vname, 4, 0, temp_value.vname))
        else:
            self.instructions.append(CILAssignNode(return_value.vname, self.visit(node.expr).vname))

        if node.idx_token in self.names_of_values:
            self.instructions.append(CILAssignNode(self.names_of_values[node.idx_token][-1], return_value.vname))
        else:
            attr_index = 0
            for t in self.dot_types:
                if t.class_tag == self.class_tag:
                    for attr in t.attributes:
                        if attr.name == node.idx_token:
                            attr_index = attr.attr_index
            self.instructions.append(CILSetAttribNode(self.current_class + "_" + self.curr_func_name +
                                                      "_self_0", self.class_tag, attr_index, return_value.vname))

        return return_value

    @visitor.when(ast.DeclarationNode)
    def visit(self, node: ast.DeclarationNode):
        n = node.idx_token
        if n not in self.names_of_values.keys():
            self.names_of_values[n] = []
        name = self.get_variable_name(node.idx_token + "_" + str(self.local_vars_count))
        name_value = self.def_internal_var(name)
        self.names_of_values[n].append(name)
        if node.expr is not None:
            value = self.visit(node.expr)
            if node.type_token in ['Int', 'Bool']:
                self.instructions.append(CILCopyNode(self.visit(node.expr).vname, name_value.vname))
            elif node.type_token == 'String':
                expr_assign = self.visit(node.expr)
                self.instructions.append(CILCopyNode(expr_assign.vname, name_value.vname))
                attr_string = self.get_variable_name(node.idx_token + '_attr_string_' + str(self.local_vars_count))
                attr_value = self.def_internal_var(attr_string)
                self.instructions.append(CILGetAttribNode(expr_assign.vname, 4, 0, attr_value.vname))
                lo_index = self.get_variable_name(node.idx_token + '_lo_index_' + str(self.local_vars_count))
                lo_value = self.def_internal_var(lo_index)
                hi_index = self.get_variable_name(node.idx_token + '_hi_index_' + str(self.local_vars_count))
                hi_value = self.def_internal_var(hi_index)
                self.instructions.append(CILValueNode(lo_value.vname, '0'))
                self.instructions.append(CILLengthNode(attr_value.vname, hi_value.vname))
                temp_string = self.get_variable_name(node.idx_token + '_temp_string_' + str(self.local_vars_count))
                temp_value = self.def_internal_var(temp_string)
                self.instructions.append(
                    CILSubstringNode(attr_value.vname, lo_value.vname, hi_value.vname, temp_value.vname))
                self.instructions.append(CILSetAttribNode(name_value.vname, 4, 0, temp_value.vname))
            else:
                self.instructions.append(CILAssignNode(name, value.vname))

        else:
            if node.type_token in ['String', 'Int', 'Bool']:
                self.instructions.append(CILPushaNode())
                self.instructions.append(CILStaticCallNode("init_" + node.type_token,
                                                           name_value.vname, name_value.vname, 0))
                self.instructions.append(CILPopaNode())
        return name_value

    @visitor.when(ast.BooleanNegation)
    def visit(self, node: ast.BooleanNegation):
        expr = self.visit(node.expr)
        name = self.get_variable_name("bool_neg_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        self.instructions.append(CILGetAttribNode(expr.vname, 3, 0, expr.vname))
        self.instructions.append(CILValueNode(local_node.vname, "1"))
        self.instructions.append(CILMinusNode(local_node.vname, expr.vname, local_node.vname))
        self.instructions.append(CILAllocateNode(4, "3", "4", "Bool_dispatch_table", expr.vname))
        self.instructions.append(CILSetAttribNode(expr.vname, 3, 0, local_node.vname))
        return expr

    @visitor.when(ast.IfNode)
    def visit(self, node: ast.IfNode):
        name = self.get_variable_name("if_result_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)

        predicate = self.visit(node.predicate)
        if_label = self.get_label_name("if")
        fi_label = self.get_label_name("fi")

        self.instructions.append(CILGetAttribNode(predicate.vname, 3, 0, predicate.vname))

        goto_node = CILGotoIfNode(predicate.vname, if_label)
        self.instructions.append(goto_node)

        else_value = self.visit(node.else_expr)
        self.instructions.append(CILAssignNode(local_node.vname, else_value.vname))

        self.instructions.append(CILGotoNode(fi_label))
        self.instructions.append(CILLabelNode(if_label))

        then_value = self.visit(node.then_expr)
        self.instructions.append(CILAssignNode(local_node.vname, then_value.vname))
        self.instructions.append(CILLabelNode(fi_label))

        return local_node

    @visitor.when(ast.IsVoidNode)
    def visit(self, node: ast.IsVoidNode):
        name = self.get_variable_name("is_void_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        name = self.get_variable_name("is_void_instance_" + str(self.local_vars_count))
        local_instance = self.def_internal_var(name)
        self.instructions.append(CILIsVoidNode(self.visit(node.expr).vname, local_node.vname))
        self.instructions.append(CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_instance.vname))
        self.instructions.append(CILSetAttribNode(local_instance.vname, 3, 0, local_node.vname))
        return local_instance

    @visitor.when(ast.EqualNode)
    def visit(self, node: ast.EqualNode):
        name = self.get_variable_name("equal_equal_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_left = self.visit(node.left)
        local_right = self.visit(node.right)
        if node.left.return_type in ["Int", "Bool"]:
            self.instructions.append(CILGetAttribNode(local_left.vname, 2, 0, local_left.vname))
            self.instructions.append(CILGetAttribNode(local_right.vname, 2, 0, local_right.vname))
            self.instructions.append(CILMinusNode(local_left.vname, local_right.vname, local_node.vname))
            self.instructions.append(CILEqualNode(local_node.vname, local_node.vname))
            name = self.get_variable_name("bool_instance_" + str(self.local_vars_count))
            local_bool_instance = self.def_internal_var(name)
            self.instructions.append(
                CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_bool_instance.vname))
            self.instructions.append(CILSetAttribNode(local_bool_instance.vname, 3, 0, local_node.vname))

        elif node.left.return_type == "String":
            self.instructions.append(CILGetAttribNode(local_left.vname, 4, 0, local_left.vname))
            self.instructions.append(CILGetAttribNode(local_right.vname, 4, 0, local_right.vname))
            self.instructions.append(CILStringCmp(local_left.vname, local_right.vname, local_node.vname))
            name = self.get_variable_name("bool_instance_" + str(self.local_vars_count))
            local_bool_instance = self.def_internal_var(name)
            self.instructions.append(
                CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_bool_instance.vname))
            self.instructions.append(CILSetAttribNode(local_bool_instance.vname, 3, 0, local_node.vname))

        else:
            self.instructions.append(CILMinusNode(local_left.vname, local_right.vname, local_node.vname))

            name = self.get_variable_name("bool_instance_" + str(self.local_vars_count))
            local_bool_instance = self.def_internal_var(name)
            self.instructions.append(
                CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_bool_instance.vname))
            self.instructions.append(CILSetAttribNode(local_bool_instance.vname, 3, 0, local_node.vname))
            self.instructions.append(CILBooleanNegation(local_bool_instance.vname))

        return local_bool_instance

    @visitor.when(ast.LessEqualNode)
    def visit(self, node: ast.LessEqualNode):
        name = self.get_variable_name("less_equal_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_left = self.visit(node.left)
        local_right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(local_left.vname, 2, 0, local_left.vname))
        self.instructions.append(CILGetAttribNode(local_right.vname, 2, 0, local_right.vname))
        self.instructions.append(CILMinusNode(local_left.vname, local_right.vname, local_node.vname))
        # local_node.value = self.visit(ast.MinusNode(node.left, node.right))
        self.instructions.append(CILLessEqualNode(local_node.vname, local_node.vname))
        name = self.get_variable_name("bool_instance_" + str(self.local_vars_count))
        local_bool_instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_bool_instance.vname))
        self.instructions.append(CILSetAttribNode(local_bool_instance.vname, 3, 0, local_node.vname))
        return local_bool_instance

    @visitor.when(ast.LessThanNode)
    def visit(self, node: ast.LessThanNode):
        name = self.get_variable_name("less_than_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_left = self.visit(node.left)
        local_right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(local_left.vname, 2, 0, local_left.vname))
        self.instructions.append(CILGetAttribNode(local_right.vname, 2, 0, local_right.vname))
        self.instructions.append(CILMinusNode(local_left.vname, local_right.vname, local_node.vname))
        # local_node.value = self.visit(ast.MinusNode(node.left, node.right))
        self.instructions.append(CILLessNode(local_node.vname, local_node.vname))
        name = self.get_variable_name("bool_instance_" + str(self.local_vars_count))
        local_bool_instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(3), str(4), "Bool_dispatch_table", local_bool_instance.vname))
        self.instructions.append(CILSetAttribNode(local_bool_instance.vname, 3, 0, local_node.vname))
        return local_bool_instance

    @visitor.when(ast.PlusNode)
    def visit(self, node: ast.PlusNode):
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(left.vname, 2, 0, left.vname))
        self.instructions.append(CILGetAttribNode(right.vname, 2, 0, right.vname))
        plus_node = CILPlusNode(left.vname, right.vname, value_node.vname)
        self.instructions.append(plus_node)
        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Int", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILSetAttribNode(local_node.vname, 2, 0, value_node.vname))
        # local_node.value = plus_node.value
        return local_node

    @visitor.when(ast.MinusNode)
    def visit(self, node: ast.MinusNode):
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(left.vname, 2, 0, left.vname))
        self.instructions.append(CILGetAttribNode(right.vname, 2, 0, right.vname))
        minus_node = CILMinusNode(left.vname, right.vname, value_node.vname)
        self.instructions.append(minus_node)
        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Int", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILSetAttribNode(local_node.vname, 2, 0, value_node.vname))
        return local_node

    @visitor.when(ast.StarNode)
    def visit(self, node: ast.StarNode):
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(left.vname, 2, 0, left.vname))
        self.instructions.append(CILGetAttribNode(right.vname, 2, 0, right.vname))
        star_node = CILStarNode(left.vname, right.vname, value_node.vname)
        self.instructions.append(star_node)
        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Int", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILSetAttribNode(local_node.vname, 2, 0, value_node.vname))
        # local_node.value = star_node.value
        return local_node

    @visitor.when(ast.DivNode)
    def visit(self, node: ast.DivNode):
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        self.instructions.append(CILGetAttribNode(left.vname, 2, 0, left.vname))
        self.instructions.append(CILGetAttribNode(right.vname, 2, 0, right.vname))
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_0_node = self.def_internal_var(name)
        self.instructions.append(CILEqualNode(right.vname, local_0_node.vname))
        label_name = self.get_label_name("zero_division")
        self.instructions.append(CILGotoIfNode(local_0_node.vname, label_name))
        div_node = CILDivNode(left.vname, right.vname, value_node.vname)
        self.instructions.append(div_node)
        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Int", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILSetAttribNode(local_node.vname, 2, 0, value_node.vname))
        exit_label = self.get_label_name("exit_div")
        self.instructions.append(CILGotoNode(exit_label))
        self.instructions.append(CILLabelNode(label_name))
        self.instructions.append(CILAbortNode("zero_division"))
        self.instructions.append(CILLabelNode(exit_label))
        # local_node.value = div_node.value
        return local_node

    @visitor.when(ast.BooleanNode)
    def visit(self, node: ast.BooleanNode):
        name = self.get_variable_name("boolean_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)

        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Bool", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILValueNode(value_node.vname,
                                              "0" if node.boolean_token == "false" else "1"))
        self.instructions.append(CILSetAttribNode(local_node.vname, 3, 0, value_node.vname))
        return local_node

    @visitor.when(ast.IntegerNode)
    def visit(self, node: ast.IntegerNode):
        name = self.get_variable_name("integer_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        value_node = self.def_internal_var(name)
        # self.instructions.append(CILAllocateNode(4, str(2), str(4), "Int_dispatch_table",
        #                                          local_node.vname))
        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_Int", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILValueNode(value_node.vname, node.integer_token))
        self.instructions.append(CILSetAttribNode(local_node.vname, 2, 0, value_node.vname))

        return local_node

    @visitor.when(ast.StringNode)
    def visit(self, node: ast.StringNode):
        name = self.get_variable_name("string_" + str(self.local_vars_count))
        load_node = self.def_internal_var(name)
        data_node = self.set_data(node.string_token)

        name = self.get_variable_name("string_instance_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)

        self.instructions.append(CILPushaNode())
        self.instructions.append(CILStaticCallNode("init_String", local_node.vname, local_node.vname, 0))
        self.instructions.append(CILPopaNode())
        self.instructions.append(CILLoadNode(data_node.vname, load_node.vname))
        self.instructions.append(CILSetAttribNode(local_node.vname, 4, 0, load_node.vname))
        return local_node

    @visitor.when(ast.IntegerNegation)
    def visit(self, node: ast.IntegerNegation):
        expr = self.visit(node.value)
        name = self.get_variable_name("neg_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        self.instructions.append(CILGetAttribNode(expr.vname, 2, 0, expr.vname))
        self.instructions.append(CILValueNode(local_node.vname, "0"))
        dif = CILMinusNode(local_node.vname, expr.vname, local_node.vname)
        self.instructions.append(dif)
        name = self.get_variable_name("neg_instance_" + str(self.local_vars_count))
        local_int_instance = self.def_internal_var(name)
        self.instructions.append(CILAllocateNode(4, str(2), str(4), "Int_dispatch_table", local_int_instance.vname))
        self.instructions.append(CILSetAttribNode(local_int_instance.vname, 2, 0, local_node.vname))
        return local_int_instance

    @visitor.when(ast.StaticDispatchNode)
    def visit(self, node: ast.StaticDispatchNode):
        instance = self.visit(node.instance)
        params = []
        for p in node.arguments:
            params.append(self.visit(p))
        self.instructions.append(CILPushaNode())
        params.reverse()
        for p in params:
            self.instructions.append(CILParamNode(p.vname))
        self.instructions.append(CILParamNode(instance.vname))
        dtype = node.dispatch_type
        if node.dispatch_type == 'SELF_TYPE':
            dtype = self.current_class
        name = 'def_' + dtype + '_' + node.method
        return_name = self.get_variable_name('call_dispatch_' + str(self.local_vars_count))
        return_local = self.def_internal_var(return_name)
        self.instructions.append(CILStaticCallNode(name, instance.vname, return_local.vname,
                                                   len(params) + 1))
        self.instructions.append(CILPopaNode())
        return return_local

    @visitor.when(ast.DynamicDispatchNode)
    def visit(self, node: ast.DynamicDispatchNode):
        instance = self.current_class + "_" + self.curr_func_name + "_self_0"
        if node.instance != 'self':
            instance = self.visit(node.instance).vname
        name = self.get_variable_name("is_void_" + str(self.local_vars_count))
        is_void = self.def_internal_var(name)
        jump_label = self.get_label_name("not_valid_dispatch_jump")

        self.instructions.append(CILIsVoidNode(instance, is_void.vname))
        self.instructions.append(CILGotoIfNode(is_void.vname, jump_label))
        arguments = []
        for arg in node.arguments:
            arguments.append(self.visit(arg))
        arguments.reverse()
        self.instructions.append(CILPushaNode())
        for arg in arguments:
            self.instructions.append(CILParamNode(arg.vname))
        self.instructions.append(CILParamNode(instance))
        name = self.get_variable_name('dynamic_dispatch_' + str(self.local_vars_count))
        return_local = self.def_internal_var(name)

        data_node = self.set_data('"' + node.method + '"')
        name = self.get_variable_name('funct_name_' + str(self.local_vars_count))
        method_string = self.def_internal_var(name)
        self.instructions.append(CILLoadNode(data_node.vname, method_string.vname))

        # self.instructions.append(CILTypeOfNode(instance, type_of_return.vname))
        self.instructions.append(CILDynamicCallNode(method_string.vname, instance,
                                                    return_local.vname, len(arguments) + 1))
        self.instructions.append(CILPopaNode())
        end_label = self.get_label_name("end_dispatch_label")
        self.instructions.append(CILGotoNode(end_label))
        self.instructions.append(CILLabelNode(jump_label))

        self.instructions.append(CILAbortNode("null_reference"))
        self.instructions.append(CILLabelNode(end_label))
        return return_local

    @visitor.when(ast.ParamNode)
    def visit(self, node: ast.ParamNode):
        if node.name not in self.names_of_values.keys():
            self.names_of_values[node.name] = []
        self.names_of_values[node.name].append(node.name)
        name = self.get_variable_name(node.name + "_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        self.instructions.append(CILArgNode(local_node.vname, None))
        return local_node

    @visitor.when(ast.ScanNode)
    def visit(self, node: ast.ScanNode):
        name = self.get_variable_name("read_" + str(self.local_vars_count))
        local_var = self.def_internal_var(name)
        name = self.get_variable_name("read_instance_" + str(self.local_vars_count))
        local_instance = self.def_internal_var(name)
        if node.method == 'in_string':
            read_node = CILReadStringNode(local_var.vname)
            self.instructions.append(read_node)
            self.instructions.append(CILAllocateNode(4, str(4), str(4), "String_dispatch_table", local_instance.vname))
            self.instructions.append(CILSetAttribNode(local_instance.vname, 4, 0, local_var.vname))
        else:
            read_node = CILReadIntegerNode(local_var.vname)
            self.instructions.append(read_node)
            self.instructions.append(CILAllocateNode(4, str(2), str(4), "Int_dispatch_table", local_instance.vname))
            self.instructions.append(CILSetAttribNode(local_instance.vname, 4, 0, local_var.vname))
        return local_instance

    @visitor.when(ast.WhileNode)
    def visit(self, node: ast.WhileNode):
        label0 = self.get_label_name("while_" + str(self.label_count))
        label1 = self.get_label_name("loop_" + str(self.label_count))
        label2 = self.get_label_name("pool_" + str(self.label_count))
        self.label_count += 1
        self.instructions.append(CILLabelNode(label0))
        cond_value = self.visit(node.predicate)
        self.instructions.append(CILGetAttribNode(cond_value.vname, 3, 0, cond_value.vname))
        self.instructions.append(CILGotoIfNode(cond_value.vname, label1))
        self.instructions.append(CILGotoNode(label2))
        self.instructions.append(CILLabelNode(label1))
        # while_value = self.visit(node.expr)
        self.visit(node.expr)
        self.instructions.append(CILGotoNode(label0))
        self.instructions.append(CILLabelNode(label2))
        obj_instance_name = self.get_variable_name("while_object_void_" + str(self.local_vars_count))
        obj_instance = self.def_internal_var(obj_instance_name)
        self.instructions.append(CILAllocateNode(4, str(1), str(4), "Object_dispatch_table", obj_instance.vname))
        return obj_instance

    @visitor.when(ast.NewObjectNode)
    def visit(self, node: ast.NewObjectNode):
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        size = (len(node.context_type.types[node.type_new_object].attributes) + 3) * 4
        class_tag = self.get_class_tag(node.type_new_object)
        self.instructions.append(CILAllocateNode(size, str(class_tag), str(size),
                                                 node.type_new_object + "_dispatch_table",
                                                 local_node.vname))
        self.instructions.append(CILStaticCallNode("init_" + node.type_new_object, local_node.vname,
                                                   local_node.vname, 0))
        return local_node

    @visitor.when(ast.ObjectNode)
    def visit(self, node: ast.ObjectNode):
        name = self.get_variable_name("object_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        if node.name == "self":
            self.instructions.append(CILAssignNode(local_node.vname,
                                                   self.current_class + "_" + self.curr_func_name + "_self_0"))
        elif node.name in self.names_of_values:
            local_value = self.names_of_values[node.name][-1]
            self.instructions.append(CILAssignNode(local_node.vname, local_value))
        else:
            t = self.dot_types[self.class_tag-1]
            attr_index = t.get_attr_index(node.name)
            # self.instructions.append(CILGetAttribNode("self", self.class_tag, attr_index, local_node))
            self.instructions.append(CILGetAttribNode(self.current_class + "_" + self.curr_func_name +
                                                      "_self_0", self.class_tag, attr_index, local_node.vname))
        return local_node

    @visitor.when(ast.PrintIntegerNode)
    def visit(self, node: ast.PrintIntegerNode):
        local_str_node = self.visit(node.expr)
        self.instructions.append(CILGetAttribNode(local_str_node.vname, 4, 0, local_str_node.vname))
        self.instructions.append(CILPrintIntegerNode(local_str_node.vname))
        self.instructions.append(CILAssignNode(local_str_node.vname,
                                               self.current_class + "_" + self.curr_func_name + "_self_0"))
        return local_str_node

    @visitor.when(ast.PrintStringNode)
    def visit(self, node: ast.PrintStringNode):
        local_str_node = self.visit(node.string_token)
        # name = self.get_variable_name("string_" + str(self.local_vars_count))
        # local_str_node = self.def_internal_var(name)
        self.instructions.append(CILGetAttribNode(local_str_node.vname, 4, 0, local_str_node.vname))
        self.instructions.append(CILPrintStringNode(local_str_node.vname))
        self.instructions.append(CILAssignNode(local_str_node.vname,
                                               self.current_class + "_" + self.curr_func_name + "_self_0"))
        return local_str_node

    @visitor.when(ast.CaseNode)
    def visit(self, node: ast.CaseNode):
        expr_local = self.visit(node.expr)
        name = self.get_variable_name("object_type_" + str(self.local_vars_count))
        object_type_local = self.def_internal_var(name)
        name = self.get_variable_name("case_expr_type_" + str(self.local_vars_count))
        expr_type = self.def_internal_var(name)

        self.instructions.append(CILTypeOfNode(expr_local.vname, expr_type.vname))
        y_name = self.get_variable_name("case_y_" + str(self.local_vars_count))
        y_type = self.def_internal_var(y_name)

        self.instructions.append(CILValueNode(y_type.vname, "1"))
        # self.instructions.append(CILAssignNode(, "1"))  # Asignando el tipo de Object
        dest_name = self.get_variable_name("case_dest_expr_" + str(self.local_vars_count))
        dest_local = self.def_internal_var(dest_name)

        self.instructions.append(CILValueNode(dest_local.vname, "0"))
        # self.instructions.append(CILAssignNode(dest_local.vname, "0"))  # Void

        # if_label_1 = self.get_label_name("Next")
        expr_i_label = self.get_label_name("expr_0")

        expr_labels = [expr_i_label]

        for i in range(len(node.actions)):
            name = self.get_variable_name("t_action_value_" + str(i) + "_" + str(self.local_vars_count))
            action_i_var_local = self.def_internal_var(name)
            self.instructions.append(CILPushaNode())
            self.instructions.append(CILStaticCallNode("init_" + node.actions[i].action_type, action_i_var_local.vname,
                                                       action_i_var_local.vname, 0))
            self.instructions.append(CILPopaNode())

            name = self.get_variable_name("t_action_" + str(i) + "_" + str(self.local_vars_count))
            action_i_local = self.def_internal_var(name)

            self.instructions.append(CILTypeOfNode(action_i_var_local.vname, action_i_local.vname))
            name = self.get_variable_name("temp_" + str(self.local_vars_count))
            temp = self.def_internal_var(name)

            # self.instructions.append(CILGetAttribNode(expr_type.vname, 2, 0, expr_type.vname))
            self.instructions.append(CILAssignNode(temp.vname, expr_type.vname))
            label_name = self.get_label_name("Next_" + str(i))
            self.instructions.append(CILLabelNode(label_name))
            name = self.get_variable_name("sub_result_" + str(self.local_vars_count))
            sub_result = self.def_internal_var(name)

            self.instructions.append(CILMinusNode(expr_type.vname, action_i_local.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            # self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_1))
            # self.instructions.append(CILGotoNode(expr_i_label))
            self.instructions.append(CILGotoIfNode(sub_result.vname, expr_i_label))
            # self.instructions.append(CILLabelNode(if_label_1))
            self.instructions.append(CILMinusNode(temp.vname, object_type_local.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            if_label_2 = self.get_label_name("action_" + str(i+1))
            expr_labels.append(if_label_2)

            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_2))
            self.instructions.append(CILMinusNode(temp.vname, y_type.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_2))

            # self.instructions.append(CILLabelNode(other_inherits_label))
            # self.instructions.append(CILParamNode(temp.vname))
            parent_local = self.get_variable_name("parent_" + str(self.local_vars_count))
            parent_local = self.def_internal_var(parent_local)
            self.instructions.append(CILParentOfNode(temp.vname, parent_local.vname))

            self.instructions.append(CILMinusNode(temp.vname, action_i_local.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            self.instructions.append(CILGotoIfNode(sub_result.vname, label_name))

            other_inherits_label = self.get_label_name("other_inherits")
            self.instructions.append(CILLabelNode(other_inherits_label))

            self.instructions.append(CILParentOfNode(temp.vname, temp.vname))

            # self.instructions.append(CILMinusNode(y_type.vname, temp.vname, sub_result.vname))
            # self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))

            # if_label_1 = self.get_label_name("checkIfIsObject")
            # self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_1))

            self.instructions.append(CILMinusNode(object_type_local.vname, temp.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_2))

            self.instructions.append(CILMinusNode(y_type.vname, temp.vname, sub_result.vname))
            self.instructions.append(CILEqualNode(sub_result.vname, sub_result.vname))
            self.instructions.append(CILMinusNode(object_type_local.vname, sub_result.vname, sub_result.vname))
            self.instructions.append(CILGotoIfNode(sub_result.vname, other_inherits_label))

            self.instructions.append(CILAssignNode(y_type.vname, action_i_local.vname))

            self.instructions.append(CILLoadNode(dest_local.vname, expr_i_label))

            if i < len(node.actions) - 1:
                self.instructions.append(CILStackGotoNode(dest_local.vname))
            else:
                # expr_i_label = self.get_label_name("expr_" + str(i + 1))
                # expr_labels.append(expr_i_label)
                self.instructions.append(CILGotoNode(expr_i_label))

            # self.instructions.append(CILLabelNode(if_label_1))
            # self.instructions.append(CILMinusNode(object_type_local.vname, temp.vname, sub_result.vname))
            # self.instructions.append(CILGotoIfNode(sub_result.vname, other_inherits_label))

            if i < len(node.actions) - 1:
                self.instructions.append(CILStackGotoNode(dest_local.vname))
            else:
                expr_i_label = self.get_label_name("expr_" + str(i + 1))
                self.instructions.append(CILGotoNode(expr_i_label))

        finish_label = self.get_label_name("finish")
        for i in range(len(node.actions)):
            # expr_i_label = self.get_label_name("expr_" + str(i))
            self.instructions.append(CILLabelNode(expr_labels[i]))
            name = self.get_variable_name("action_" + str(i) + "_var_" + str(self.local_vars_count))
            action_i_var_local = self.def_internal_var(name)
            if node.actions[i].action_type in ['Int', 'Bool']:
                # self.instructions.append(CILGetAttribNode(expr_local.vname, 2, 0, expr_local.vname))
                self.instructions.append(CILCopyNode(expr_local.vname, action_i_var_local.vname))
            elif node.actions[i].action_type == 'String':
                self.instructions.append(CILCopyNode(expr_local.vname, action_i_var_local.vname))
                attr_string = self.get_variable_name('attr_string_' + str(self.local_vars_count))
                attr_value = self.def_internal_var(attr_string)
                self.instructions.append(CILGetAttribNode(action_i_var_local.vname, 4, 0, attr_value.vname))
                lo_index = self.get_variable_name('lo_index_' + str(self.local_vars_count))
                lo_value = self.def_internal_var(lo_index)
                hi_index = self.get_variable_name('hi_index_' + str(self.local_vars_count))
                hi_value = self.def_internal_var(hi_index)
                self.instructions.append(CILValueNode(lo_value.vname, '0'))
                self.instructions.append(CILLengthNode(attr_value.vname, hi_value.vname))
                temp_string = self.get_variable_name('temp_string_' + str(self.local_vars_count))
                temp_value = self.def_internal_var(temp_string)
                self.instructions.append(
                    CILSubstringNode(attr_value.vname, lo_value.vname, hi_value.vname, temp_value.vname))
                self.instructions.append(CILSetAttribNode(expr_local.vname, 4, 0, temp_value.vname))
            else:
                self.instructions.append(CILAssignNode(action_i_var_local.vname, expr_local.vname))
            case_result = self.visit(node.actions[i].body)
            self.instructions.append(CILGotoNode(finish_label))
        self.instructions.append(CILLabelNode(finish_label))
        # self.instructions.append(CILReturnNode(case_result.vname))

        return case_result

    @visitor.when(ast.LetInNode)
    def visit(self, node: ast.LetInNode):
        self.curr_func_name += '_let'
        current_vars_declared = []

        for declaration in node.declaration_list:
            self.visit(declaration)
            current_vars_declared.append(declaration.idx_token)

        self.curr_func_name = self.curr_func_name[:-4]

        body_value = self.visit(node.expr)
        name = self.get_variable_name('let_' + str(self.local_vars_count))
        name_return = self.def_internal_var(name)

        for name in current_vars_declared:
            self.names_of_values[name].pop()
            if len(self.names_of_values[name]) == 0:
                self.names_of_values.pop(name)

        self.instructions.append(CILAssignNode(name_return.vname, body_value.vname))
        local_node = CILLocalNode(name_return.vname, self.local_vars_count, body_value)
        self.local_vars_count += 1
        return local_node

    # endregion
