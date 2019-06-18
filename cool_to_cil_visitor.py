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
        "prefix": CILPrefixNode,
        "substring": CILSubstringNode,
        "str": CILToStrNode,
        "read_int": CILReadIntegerNode,
        "read_string": CILReadStringNode,
        "print_int": CILPrintIntegerNode,
        "print_string": CILPrintStringNode,
        "not": CILBooleanNegation
    }

    def __init__(self):
        self.local_vars_count = 0
        self.dot_types = [CILTypeNode("Void", 0, [])]
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
        self.class_tag = 1
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
        label = self.curr_func_name + "_" + name + "_" + str(self.label_count) + "_label"
        self.label_count += 1
        return label

    def def_internal_var(self, name: str):
        self.local_vars.append(name)
        local_node = CILLocalNode(name, self.local_vars_count, None)
        self.local_vars_count += 1
        return local_node

    def set_data(self, value):
        name = self.get_variable_name("data_" + str(len(self.dot_data)))
        node = CILDataNode(name, value, ContextType())
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

    def define_object_type(self):
        methods = []
        # region abort
        self.local_vars = []
        self.instructions = []
        functions = []
        self.func_count = 0
        method_count = 0
        self.current_class = "Object"
        self.curr_func_name = "abort"
        abort_return = self.def_internal_var('abort_' + str(len(self.local_vars)))
        error_message = self.set_data("Abort()")
        self.instructions.append(CILAbortNode(error_message.vname, abort_return.vname))
        functions.append(CILFunctionNode('def_Object_abort', self.func_count, [], self.local_vars,
                                         self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('abort', 'def_Object_abort', method_count))
        method_count += 1
        self.curr_func_name = ""
        # endregion
        # region type_name
        self.local_vars = []
        self.instructions = []
        type_name = self.def_internal_var('type_name_' + str(len(self.local_vars)))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILTypeOfNode(local_0.vname, type_name, ContextType()))
        self.instructions.append(CILReturnNode(type_name.vname, ContextType()))
        functions.append(CILFunctionNode('def_Object_type_name', self.func_count, [local_0.vname], self.local_vars,
                                         self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('type_name', 'def_Object_type_name', method_count))
        method_count += 1
        # endregion
        # region copy
        self.local_vars = []
        self.instructions = []
        # TODO
        # endregion
        self.dot_types.append(CILTypeNode("Object", self.class_tag, methods))  # ['Object'] = methods
        self.class_tag += 1
        # self.declaredMethodsInClass["Object"] = methods
        return functions

    def define_int_type(self):
        features = [CILMethodNode("abort", "def_Object_abort", 0),
                    CILMethodNode("type_name", "def_Object_type_name", 1),
                    CILMethodNode("copy", "def_Object_copy", 2)]

        self.dot_types.append(CILTypeNode("Int", self.class_tag, features))  # ['Int'] = []
        # self.declaredMethodsInClass["Int"] = []
        self.class_tag += 1
        return []

    def define_bool_type(self):
        features = [CILMethodNode("abort", "def_Object_abort", 0),
                    CILMethodNode("type_name", "def_Object_type_name", 1),
                    CILMethodNode("copy", "def_Object_copy", 2)]

        self.dot_types.append(CILTypeNode("Bool", self.class_tag, features))  # ['Bool'] = []
        self.class_tag += 1
        # self.declaredMethodsInClass["Bool"] = []
        return []

    def define_string_type(self):
        methods = [CILMethodNode("abort", "def_Object_abort", 0),
                   CILMethodNode("type_name", "def_Object_type_name", 1),
                   CILMethodNode("copy", "def_Object_copy", 2)]
        method_count = 3
        # region length
        self.local_vars = []
        self.instructions = []
        functions = []
        self.func_count = 0
        self.current_class = "String"
        length_return = self.def_internal_var('length_string_' + str(len(self.local_vars)))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILLengthNode(local_0.vname, length_return.vname, ContextType()))
        self.instructions.append(CILReturnNode(length_return.vname, ContextType()))
        functions.append(CILFunctionNode('def_String_length', self.func_count, [local_0.vname], self.local_vars,
                                         self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('length', 'def_String_length', method_count))
        method_count += 1
        # endregion
        # region concat
        self.local_vars = []
        self.instructions = []
        concat_return = self.def_internal_var('concat_string_' + str(len(self.local_vars)))
        name_1 = self.get_variable_name("concat_second_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_1.vname, 1, ContextType()))
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILConcatNode(local_0.vname, local_1.vname, concat_return.vname, ContextType()))
        self.instructions.append(CILReturnNode(concat_return.vname, ContextType()))
        functions.append(CILFunctionNode('def_String_concat', self.func_count, [local_0.vname, local_1.vname],
                                         self.local_vars, self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('concat', 'def_String_concat', method_count))
        method_count += 1
        # endregion
        # region substr
        self.local_vars = []
        self.instructions = []
        substr_return = self.def_internal_var('substr_value_' + str(len(self.local_vars)))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("index_substr_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        name_2 = self.get_variable_name("length_substr_" + str(self.local_vars_count))
        local_2 = self.def_internal_var(name_2)
        self.instructions.append(CILArgNode(local_2.vname, 2, ContextType()))
        self.instructions.append(CILArgNode(local_1.vname, 1, ContextType()))
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILSubstringNode(local_0.vname, local_1.vname, local_2.vname, substr_return.vname,
                                                  ContextType()))
        self.instructions.append(CILReturnNode(substr_return.vname, ContextType()))
        functions.append(CILFunctionNode('def_String_substr', self.func_count,
                                         [local_0.vname, local_1.vname, local_2.vname],
                                         self.local_vars, self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('substr', 'def_String_substr', method_count))
        method_count += 1
        # endregion
        self.dot_types.append(CILTypeNode("String", self.class_tag, methods))  # ['String'] = methods
        self.class_tag += 1
        # self.declaredMethodsInClass["String"] = methods
        self.current_class = ""
        return functions

    def define_io_type(self):
        methods = []
        method_count = 0
        # region in_string
        functions = []
        self.func_count = 0
        self.local_vars = []
        self.instructions = []
        in_string_value = self.def_internal_var(self.get_variable_name('in_string_value_' + str(len(self.local_vars))))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILReadStringNode(in_string_value.vname, ContextType()))
        self.instructions.append(CILReturnNode(in_string_value.vname, ContextType()))
        functions.append(CILFunctionNode('def_IO_in_string', self.func_count, ['self'], self.local_vars,
                                         self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('in_string', 'def_IO_in_string', method_count))
        method_count += 1
        # endregion
        # region in_int
        self.local_vars = []
        self.instructions = []
        in_int_value = self.def_internal_var(self.get_variable_name('in_int_value_' + str(len(self.local_vars))))
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILReadStringNode(in_int_value.vname, ContextType()))
        self.instructions.append(CILReturnNode(in_int_value.vname, ContextType()))
        functions.append(CILFunctionNode('def_IO_in_int', self.func_count, ['self'], self.local_vars, self.instructions,
                                         ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('in_int', 'def_IO_in_int', method_count))
        method_count += 1
        # endregion
        # region out_string
        self.local_vars = []
        self.instructions = []
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("text_string_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        self.instructions.append(CILArgNode(local_1.vname, 1, ContextType()))
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILPrintStringNode(local_1.vname, ContextType()))
        self.instructions.append(CILReturnNode(local_0.vname, ContextType()))
        functions.append(CILFunctionNode('def_String_out_string', self.func_count, [name_0, name_1],
                                         self.local_vars, self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('out_string', 'def_String_out_string', method_count))
        method_count += 1
        # endregion
        # region out_int
        self.local_vars = []
        self.instructions = []
        name_0 = self.get_variable_name("self_" + str(self.local_vars_count))
        local_0 = self.def_internal_var(name_0)
        name_1 = self.get_variable_name("text_int_" + str(self.local_vars_count))
        local_1 = self.def_internal_var(name_1)
        self.instructions.append(CILArgNode(local_1.vname, 1, ContextType()))
        self.instructions.append(CILArgNode(local_0.vname, 0, ContextType()))
        self.instructions.append(CILPrintStringNode(local_1.vname, ContextType()))
        self.instructions.append(CILReturnNode(local_0.vname, ContextType()))
        functions.append(CILFunctionNode('def_String_out_int', self.func_count, [name_0, name_1], self.local_vars,
                                         self.instructions, ContextType()))
        self.func_count += 1
        methods.append(CILMethodNode('out_int', 'def_String_out_int', method_count))
        # endregion
        self.dot_types.append(CILTypeNode("IO", self.class_tag, methods))  # ['IO'] = methods
        self.class_tag += 1
        return functions

    def get_class_tag(self, name):
        for t in self.dot_types:
            if name == t.name:
                return t.class_tag

    # def get_object_size(self, name):
        # for t in self.dot_types:
        #     if name == t.name:
        #         return t.object_length
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
        functions = []

        functions.extend(self.define_object_type())
        functions.extend(self.define_io_type())
        functions.extend(self.define_bool_type())
        functions.extend(self.define_int_type())
        functions.extend(self.define_string_type())

        for n in node.class_list:
            functions.extend(self.visit(n))

        return CILProgramNode(self.dot_types, self.dot_data, functions, self.inheritances, node.context_type)

    @visitor.when(ast.ClassNode)
    def visit(self, node: ast.ClassNode):
        features = []
        # init_params = []
        instructions = []
        self.local_vars = []
        self.current_class = node.name
        self.func_count = 0
        method_index = 0
        attr_index = 0

        t = node.context_type.getType(node.name)
        parents = node.context_type.parentsOfType(t)[1:]
        if len(parents):
            if self.class_tag - len(self.inheritances) + 1 > 0:
                for i in range(self.class_tag - len(self.inheritances) + 1):
                    self.inheritances.append(0)
            for i in self.dot_types:
                if i.name == parents[0] and parents[0] != 0:
                    self.inheritances[self.class_tag] = i.class_tag
                elif i.name == parents[0]:
                    self.inheritances[self.class_tag] = 1
        # region Atributos de la clase
        for attribute in node.context_type.types[node.name].attributes:
            def_class = self.search_definition_class(attribute, node.name,
                                                     node.context_type.parentsOfType(t)[1:])
            expr = self.declaredAttributesInCLass[def_class][attribute]

            class_tag = self.def_internal_var("class_tag_value_0")
            instructions.append(CILAssignNode(class_tag.vname, str(self.class_tag), node.context_type))
            object_length = self.def_internal_var("object_length_value_1")
            instructions.append(CILAssignNode(object_length.vname, str(self.class_tag), node.context_type))
            self.local_vars_count = 2

            if expr is not None:
                instructions.append(CILAssignNode(attribute, self.visit(expr).vname, node.context_type))
            features.append(CILAttributeNode(attribute, attr_index))
            attr_index += 1

        functions = [CILFunctionNode("init_" + node.name, self.func_count, [],  # init_params,
                                     self.local_vars, instructions, node.context_type)]
        self.func_count += 1

        self.dot_types.append(CILTypeNode(node.name, self.class_tag, features, node.context_type))
        # endregion

        # region Metodos de clase
        for method in node.context_type.types[node.name].methods:
            self.local_vars = []
            self.instructions = []
            self.names_of_values = {}
            self.curr_func_name = method
            self.local_vars_count = 0

            def_class = self.search_definition_class(method, node.name,
                                                     node.context_type.parentsOfType(t)[1:])
            method_node = CILMethodNode(method, "def_" + def_class + "_" + method, method_index)
            method_index += 1
            features.append(method_node)

            if def_class == node.name:
                expr = self.declaredMethodsInClass[def_class][method]

                params = ['self']
                for param in node.context_type.types[node.name].methods[method].arguments:
                    self.instructions.append(CILArgNode(param.name, len(params), node.context_type))
                    params.append(param.name)

                return_method = self.visit(expr)
                self.instructions.append(CILReturnNode(return_method.vname, node.context_type))

                functions.append(
                    CILFunctionNode(method_node.function_name, self.func_count, params, self.local_vars,
                                    self.instructions, node.context_type))
                self.func_count += 1
        self.dot_types[-1].features = features
        # self.dot_types.append(CILTypeNode(node.name, self.class_tag, features, node.context_type))

        self.class_tag += 1
        # endregion

        return functions

    @visitor.when(ast.BlockNode)
    def visit(self, node: ast.BlockNode):
        name = self.get_variable_name("block")
        block_value = self.def_internal_var(name + "_" + str(self.local_vars_count))
        bv = None
        for exp in node.expr_list:
            bv = self.visit(exp)
        self.instructions.append(CILAssignNode(block_value, bv.vname, node.context_type))
        return block_value

    @visitor.when(ast.AssignNode)
    def visit(self, node: ast.AssignNode):
        name = self.get_variable_name(node.idx_token + "_" + str(self.local_vars_count))
        return_value = self.def_internal_var(name)
        if node.idx_token in self.names_of_values.keys():
            name = self.names_of_values[node.idx_token][len(self.names_of_values[node.idx_token]) - 1]
        assign_node = CILAssignNode(name, self.visit(node.expr).vname, node.context_type)

        self.instructions.append(assign_node)
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
            decl_node = CILAssignNode(name, value.vname, node.context_type)
            self.instructions.append(decl_node)
        return name_value

    @visitor.when(ast.BooleanNegation)
    def visit(self, node: ast.BooleanNegation):
        name = self.get_variable_name("bool_neg_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_node.value = CILBooleanNegation(self.visit(node.value), node.context_type)
        return local_node

    @visitor.when(ast.IfNode)
    def visit(self, node: ast.IfNode):
        name = self.get_variable_name("if_result_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)

        predicate = self.visit(node.predicate)
        if_label = self.get_label_name("if")
        fi_label = self.get_label_name("fi")

        goto_node = CILGotoIfNode(predicate.vname, if_label, node.context_type)
        self.instructions.append(goto_node)

        else_value = self.visit(node.else_expr)
        self.instructions.append(CILAssignNode(local_node.vname, else_value.vname, node.context_type))

        self.instructions.append(CILGotoNode(fi_label, node.context_type))
        self.instructions.append(CILLabelNode(if_label, node.context_type))

        then_value = self.visit(node.then_expr)
        self.instructions.append(CILAssignNode(local_node.vname, then_value.vname, node.context_type))
        self.instructions.append(CILLabelNode(fi_label, node.context_type))
        return local_node

    @visitor.when(ast.IsVoidNode)
    def visit(self, node: ast.IsVoidNode):
        name = self.get_variable_name("is_void_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        self.instructions.append(CILIsVoidNode(self.visit(node.expr), local_node.vname, node.context_type))
        return local_node

    # TODO: Redefinir esto para comparación de direcciones de memoria
    @visitor.when(ast.EqualNode)
    def visit(self, node: ast.EqualNode):
        name = self.get_variable_name("equal_equal_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_node.value = self.visit(ast.MinusNode(node.left, node.right))
        return local_node

    @visitor.when(ast.LessEqualNode)
    def visit(self, node: ast.LessEqualNode):
        name = self.get_variable_name("less_equal_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_node.value = self.visit(ast.MinusNode(node.left, node.right))
        return local_node

    @visitor.when(ast.LessThanNode)
    def visit(self, node: ast.LessThanNode):
        name = self.get_variable_name("less_than_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        local_node.value = self.visit(ast.MinusNode(node.left, node.right))
        return local_node

    @visitor.when(ast.PlusNode)
    def visit(self, node: ast.PlusNode):
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        plus_node = CILPlusNode(left, right, name, node.context_type)
        self.instructions.append(plus_node)
        local_node.value = plus_node.value
        return local_node

    @visitor.when(ast.MinusNode)
    def visit(self, node: ast.MinusNode):
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        minus_node = CILMinusNode(left, right, name, node.context_type)
        self.instructions.append(minus_node)
        local_node.value = minus_node.value
        return local_node

    @visitor.when(ast.StarNode)
    def visit(self, node: ast.StarNode):
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        star_node = CILStarNode(left, right, name, node.context_type)
        self.instructions.append(star_node)
        local_node.value = star_node.value
        return local_node

    @visitor.when(ast.DivNode)
    def visit(self, node: ast.DivNode):
        name = self.get_variable_name("var_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        left = self.visit(node.left)
        right = self.visit(node.right)
        div_node = CILDivNode(left, right, name, node.context_type)
        self.instructions.append(div_node)
        local_node.value = div_node.value
        return local_node

    @visitor.when(ast.BooleanNode)
    def visit(self, node: ast.BooleanNode):
        name = self.get_variable_name("boolean_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        self.instructions.append(CILAssignNode(name, "0" if node.boolean_token == "false" else "1", node.context_type))
        return local_node

    @visitor.when(ast.IntegerNode)
    def visit(self, node: ast.IntegerNode):
        name = self.get_variable_name("value_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        integer_node = CILIntegerNode(node.integer_token, node.context_type)
        self.instructions.append(CILAssignNode(name, integer_node.value, node.context_type))
        return local_node

    @visitor.when(ast.StringNode)
    def visit(self, node: ast.StringNode):
        name = self.get_variable_name("string_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        data_node = self.set_data(node.string_token)
        load = CILLoadNode(data_node.vname, local_node.vname, node.context_type)
        self.instructions.append(load)
        return local_node

    @visitor.when(ast.IntegerNegation)
    def visit(self, node: ast.IntegerNegation):
        expr = self.visit(node.value)
        name = self.get_variable_name("neg_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        dif = CILMinusNode("0", expr, name, node.context_type)
        self.instructions.append(dif)
        return local_node

    @visitor.when(ast.StaticDispatchNode)
    def visit(self, node: ast.StaticDispatchNode):
        instance = self.visit(node.instance)
        params = []
        for p in node.arguments:
            params.append(self.visit(p))
        for p in params:
            self.instructions.append(CILParamNode(p.vname, node.context_type))
        self.instructions.append(CILParamNode(instance.vname, node.context_type))
        dtype = node.dispatch_type
        if node.dispatch_type == 'SELF_TYPE':
            dtype = self.current_class
        name = 'def_' + dtype + '_' + node.method
        return_local = self.def_internal_var('call_dispatch_' + str(self.local_vars_count))
        self.instructions.append(CILStaticCallNode(name, return_local, node.context_type))
        return return_local

    @visitor.when(ast.DynamicDispatchNode)
    def visit(self, node: ast.DynamicDispatchNode):
        instance = 'self'
        if node.instance != 'self':
            instance = self.visit(node.instance).vname
        arguments = []
        for arg in node.arguments:
            arguments.append(self.visit(arg))
        for arg in arguments:
            self.instructions.append(CILParamNode(arg.vname, node.context_type))
        self.instructions.append(CILParamNode(instance, node.context_type))
        name = self.get_variable_name('dynamic_dispatch_' + str(self.local_vars_count))
        return_local = self.def_internal_var(name)
        if node.instance == 'self':
            self.instructions.append(CILDynamicCallNode(node.method, instance, return_local.vname, node.context_type))
        else:
            name = self.get_variable_name('type_of_' + str(self.local_vars_count))
            type_of_return = self.def_internal_var(name)
            self.instructions.append(CILTypeOfNode(instance, type_of_return, node.context_type))
            self.instructions.append(CILDynamicCallNode(node.method, type_of_return.vname,
                                                        return_local.vname, node.context_type))
        return return_local

    @visitor.when(ast.ParamNode)
    def visit(self, node: ast.ParamNode):
        if node.name not in self.names_of_values.keys():
            self.names_of_values[node.name] = []
        self.names_of_values[node.name].append(node.name)
        name = self.get_variable_name(node.name + "_" + str(self.local_vars_count))
        self.local_vars_count += 1
        local_node = self.def_internal_var(name)
        self.instructions.append(CILArgNode(local_node.vname, None, node.context_type))
        return local_node

    @visitor.when(ast.ScanNode)
    def visit(self, node: ast.ScanNode):
        name = self.get_variable_name("read_"+str(self.local_vars_count))
        local_var = self.def_internal_var(name)
        if node.method == 'in_string':
            read_node = CILReadStringNode(name, node.context_type)
        else:
            read_node = CILReadIntegerNode(name, node.context_type)
        self.instructions.append(read_node)
        return local_var

    @visitor.when(ast.WhileNode)
    def visit(self, node: ast.WhileNode):
        label0 = self.get_label_name("while_" + str(self.label_count))
        label1 = self.get_label_name("loop_" + str(self.label_count))
        label2 = self.get_label_name("pool_" + str(self.label_count))
        self.label_count += 1
        self.instructions.append(CILLabelNode(label0, node.context_type))
        cond_value = self.visit(node.predicate)
        self.instructions.append(CILGotoIfNode(cond_value.vname, label1, node.context_type))
        self.instructions.append(CILGotoNode(label2, node.context_type))
        self.instructions.append(CILLabelNode(label1, node.context_type))
        while_value = self.visit(node.expr)
        self.instructions.append(CILGotoNode(label0, node.context_type))
        self.instructions.append(CILLabelNode(label2, node.context_type))
        return while_value

    @visitor.when(ast.NewObjectNode)
    def visit(self, node: ast.NewObjectNode):
        name = self.get_variable_name("instance_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        size = (len(node.context_type.types[node.type_new_object].attributes) + 3) * 4
        self.instructions.append(CILAllocateNode(size, local_node.vname, node.context_type))
        self.instructions.append(CILStaticCallNode("init_" + node.type_new_object, name, node.context_type))
        return local_node

    @visitor.when(ast.ObjectNode)
    def visit(self, node: ast.ObjectNode):
        name = self.get_variable_name("object_" + str(self.local_vars_count))
        local_node = self.def_internal_var(name)
        if node.name in self.names_of_values:
            local_value = self.names_of_values[node.name][-1]
            self.instructions.append(CILAssignNode(local_node.vname, local_value, node.context_type))
        else:
            t = self.dot_types[self.class_tag]
            attr_index = t.get_attr_index(node.name)
            self.instructions.append(CILGetAttribNode("self", self.class_tag, attr_index, local_node,
                                                      node.context_type))
        return local_node

    @visitor.when(ast.PrintIntegerNode)
    def visit(self, node: ast.PrintIntegerNode):
        local_str_node = self.visit(node.expr)
        self.instructions.append(CILPrintIntegerNode(local_str_node.vname, node.context_type))
        return local_str_node

    @visitor.when(ast.PrintStringNode)
    def visit(self, node: ast.PrintStringNode):
        local_str_node = self.visit(node.string_token)
        self.instructions.append(CILPrintStringNode(local_str_node.vname, node.context_type))
        return local_str_node

    @visitor.when(ast.CaseNode)
    def visit(self, node: ast.CaseNode):
        expr_local = self.visit(node.expr)
        name = self.get_variable_name("object_type_" + str(self.local_vars_count))
        object_type_local = self.def_internal_var(name)
        name = self.get_variable_name("case_expr_type_" + str(self.local_vars_count))
        expr_type = self.def_internal_var(name)

        self.instructions.append(CILTypeOfNode(expr_local.vname, expr_type.vname, node.context_type))
        y_name = self.get_variable_name("case_y_" + str(self.local_vars_count))
        y_type = self.def_internal_var(y_name)
        self.local_vars_count += 1

        self.instructions.append(CILAssignNode(y_type.vname, "1", node.context_type))  # Asignando el tipo de Object
        dest_name = self.get_variable_name("case_dest_expr_" + str(self.local_vars_count))
        dest_local = self.def_internal_var(dest_name)

        self.instructions.append(CILAssignNode(dest_local.vname, "0", node.context_type))  # Void

        if_label_1 = self.get_label_name("Next")
        expr_i_label = self.get_label_name("expr_0")

        for i in range(len(node.actions)):
            name = self.get_variable_name("t_action_value_" + str(i) + "_" + str(self.local_vars_count))
            action_i_var_local = self.def_internal_var(name)

            self.instructions.append(CILStaticCallNode("init_" + node.actions[i].action_type, action_i_var_local.vname,
                                                       node.context_type))

            name = self.get_variable_name("t_action_" + str(i) + "_" + str(self.local_vars_count))
            action_i_local = self.def_internal_var(name)

            self.instructions.append(CILTypeOfNode(action_i_var_local.vname, action_i_local.vname, node.context_type))
            name = self.get_variable_name("temp_" + str(self.local_vars_count))
            temp = self.def_internal_var(name)

            self.instructions.append(CILAssignNode(temp.vname, expr_type.vname, node.context_type))
            name = self.get_variable_name("sub_result_" + str(self.local_vars_count))
            sub_result = self.def_internal_var(name)

            self.instructions.append(CILMinusNode(expr_type.vname, action_i_local.vname, sub_result.vname,
                                                  node.context_type))

            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_1, node.context_type))
            self.instructions.append(CILGotoNode(expr_i_label, node.context_type))
            self.instructions.append(CILLabelNode(if_label_1, node.context_type))
            self.instructions.append(CILMinusNode(temp.vname, object_type_local.vname, sub_result.vname,
                                                  node.context_type))

            if_label_2 = self.get_label_name("action_" + str(i+1))

            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_2, node.context_type))
            self.instructions.append(CILMinusNode(temp.vname, y_type.vname, sub_result.vname, node.context_type))
            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_2, node.context_type))
            other_inherits_label = self.get_label_name("other_inherits")
            self.instructions.append(CILLabelNode(other_inherits_label, node.context_type))
            # TODO: Remember than this function I'm calling needs to be done in MIPS!!!
            self.instructions.append(CILParamNode(temp.vname, node.context_type))
            self.instructions.append(CILStaticCallNode("parent_of", temp.vname, node.context_type))

            self.instructions.append(CILMinusNode(y_type.vname, temp.vname, sub_result.vname, node.context_type))
            if_label_1 = self.get_label_name("checkIfIsObject")
            self.instructions.append(CILGotoIfNode(sub_result.vname, if_label_1, node.context_type))

            self.instructions.append(CILAssignNode(y_type.vname, action_i_local.vname, node.context_type))

            self.instructions.append(CILAssignNode(dest_local.vname, expr_i_label, node.context_type))

            if i < len(node.actions) - 1:
                expr_i_label = self.get_label_name("expr_" + str(i+1))
                self.instructions.append(CILGotoNode(expr_i_label, node.context_type))
            else:
                # TODO: Check this!!! This should not be right, something should be wrong here...
                self.instructions.append(CILGotoNode(dest_local.vname, node.context_type))

            self.instructions.append(CILLabelNode(if_label_1, node.context_type))
            self.instructions.append(CILMinusNode(object_type_local.vname, temp.vname, sub_result.vname,
                                                  node.context_type))
            self.instructions.append(CILGotoIfNode(sub_result.vname, other_inherits_label, node.context_type))

            if i < len(node.actions) - 1:
                expr_i_label = self.get_label_name("expr_" + str(i+1))
                self.instructions.append(CILGotoNode(expr_i_label, node.context_type))
            else:
                # TODO: Check this!!! This should not be right, something should be wrong here...
                self.instructions.append(CILGotoNode(dest_local.vname, node.context_type))

        finish_label = self.get_label_name("finish")
        for i in range(len(node.actions)):
            expr_i_label = self.get_label_name("expr_" + str(i))
            self.instructions.append(CILLabelNode(expr_i_label, node.context_type))
            name = self.get_variable_name("action_" + str(i) + "_var")
            action_i_var_local = self.def_internal_var(name)
            self.instructions.append(CILAssignNode(action_i_var_local.vname, expr_local.vname, node.context_type))
            case_result = self.visit(node.actions[i].body)
            self.instructions.append(CILGotoNode(finish_label, node.context_type))
        self.instructions.append(CILLabelNode(finish_label, node.context_type))
        self.instructions.append(CILReturnNode(case_result.vname))

        # expr = self.visit(node.expr)
        # actions = []
        # for act in node.actions:
        #     actions.append(self.visit(act))
        # name = self.get_variable_name("case_result_" + str(self.local_vars_count))
        # local_node = self.def_internal_var(name)
        # self.instructions.append(CILCaseNode(expr, actions, local_node.vname, node.context_type))
        # return local_node

    # @visitor.when(ast.ActionNode)
    # def visit(self, node: ast.ActionNode):
    #     local_instance = self.visit(ast.NewObjectNode(node.action_type))
    #     self.names_of_values[node.name].append(local_instance.vname)
    #     local_node = self.visit(node.body)
    #     return local_node

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

        self.instructions.append(CILAssignNode(name_return.vname, body_value.vname, node.context_type))
        local_node = CILLocalNode(name_return.vname, self.local_vars_count, body_value, node.context_type)
        self.local_vars_count += 1
        return local_node

    # endregion
