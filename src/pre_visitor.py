import ast
from cil_ast import CILTypeNode, CILAttributeNode, CILMethodNode


class DeclarationDictVisitor:
    def __init__(self, node: ast.ProgramNode):
        self.methodsLists = {
            "Object": [
                CILMethodNode("init_Object", "init_Object", 0),
                CILMethodNode("abort", "def_Object_abort", 1),
                CILMethodNode("type_name", "def_Object_type_name", 2),
                CILMethodNode("copy", "def_Object_copy", 3)],

            "Int": [CILMethodNode("init_Int", "init_Int", 0)],

            "Bool": [CILMethodNode("init_Bool", "init_Bool", 0)],

            "String": [
                CILMethodNode("init_String", "init_String", 0),
                CILMethodNode("length", "def_String_length", 1),
                CILMethodNode("concat", "def_String_concat", 2),
                CILMethodNode("substr", "def_String_substr", 3)],

            "IO": [
                CILMethodNode("init_IO", "init_IO", 0),
                CILMethodNode("in_string", "def_IO_in_string", 1),
                CILMethodNode("in_int", "def_IO_in_int", 2),
                CILMethodNode("out_string", "def_IO_out_string", 3),
                CILMethodNode("out_int", "def_IO_out_int", 4)]
        }
        self.methodsDict = {
            "Object": {"abort": None,
                       "type_name": None,
                       "copy": None},
            "IO": {"in_string": None,
                   "in_int": None,
                   "out_string": None,
                   "out_int": None},
            "String": {"length": None,
                       "concat": None,
                       "substr": None},
            "Int": {},
            "Bool": {}
        }
        self.attrsList = {
            "Object": [],
            "Int": [],
            "Bool": [],
            "String": [],
            "IO": []
        }
        self.attrsDict = {
            "IO": {},
            "Object": {},
            "String": {},
            "Int": {},
            "Bool": {}
        }
        self.dot_types = [
            CILTypeNode("Object", 1, self.attrsList["Object"], self.methodsLists["Object"]),
            CILTypeNode("Int", 2, self.attrsList["Int"], self.methodsLists["Int"]),
            CILTypeNode("Bool", 3, self.attrsList["Bool"], self.methodsLists["Bool"]),
            CILTypeNode("String", 4, self.attrsList["String"], self.methodsLists["String"]),
            CILTypeNode("IO", 5, self.attrsList["IO"], self.methodsLists["IO"])
        ]
        self.class_tag = 6
        for c in node.class_list:
            self.visit_class(c)

    def visit_class(self, node: ast.ClassNode):
        self.methodsDict[node.name] = {}
        self.attrsDict[node.name] = {}
        self.attrsList[node.name] = []
        self.methodsLists[node.name] = []
        for f in node.features:
            if type(f) == ast.AttributeNode:
                self.visit_attr(f, node.name)
            elif type(f) == ast.MethodNode:
                self.visit_method(f, node.name)
        self.dot_types.append(CILTypeNode(node.name, self.class_tag,
                                          self.attrsList[node.name], self.methodsLists[node.name]))
        self.class_tag += 1

    def visit_attr(self, node: ast.AttributeNode, class_name):
        self.attrsDict[class_name][node.name] = node.init_expr
        self.attrsList[class_name].append(CILAttributeNode(node.name, len(self.attrsList[class_name])))

    def visit_method(self, node: ast.MethodNode, class_name):
        self.methodsDict[class_name][node.name] = node.body
        self.methodsLists[class_name].append(CILMethodNode(node.name,
                                                           "def_" + class_name + "_" + node.name,
                                                           len(self.methodsLists[class_name])))
