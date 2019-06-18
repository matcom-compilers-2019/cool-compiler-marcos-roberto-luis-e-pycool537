import ast
import visitor


class DeclarationDictVisitor:
    def __init__(self, node: ast.ProgramNode):
        self.methodsDict = {"IO": {"in_string": None,
                                   "in_int": None,
                                   "out_string": None,
                                   "out_int": None},
                            "Object": {"abort": None,
                                       "type_name": None,
                                       "copy": None},
                            "String": {"length": None,
                                       "concat": None,
                                       "substr": None},
                            "Int": {},
                            "Bool": {}}
        self.attrsDict = {"IO": {},
                          "Object": {},
                          "String": {},
                          "Int": {},
                          "Bool": {}}
        for c in node.class_list:
            self.visit_class(c)

    def visit_class(self, node: ast.ClassNode):
        self.methodsDict[node.name] = {}
        self.attrsDict[node.name] = {}
        for f in node.features:
            if type(f) == ast.AttributeNode:
                self.visit_attr(f, node.name)
            elif type(f) == ast.MethodNode:
                self.visit_method(f, node.name)

    def visit_attr(self, node: ast.AttributeNode, class_name):
        self.attrsDict[class_name][node.name] = node.init_expr

    def visit_method(self, node: ast.MethodNode, class_name):
        self.methodsDict[class_name][node.name] = node.body
