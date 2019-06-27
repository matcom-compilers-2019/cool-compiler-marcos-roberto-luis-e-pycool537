from contextType import *
import ast
import visitor

class TypeDefinerVisitor:

    @visitor.on('node')
    def visit(self, node: ast.Node, context: ContextType):
        pass

    @visitor.when(ast.ProgramNode)
    def visit(self, node: ast.ProgramNode, context: ContextType):
        for c in node.class_list:
            self.visit(c, context)

    @visitor.when(ast.ClassNode)
    def visit(self, node: ast.ClassNode, context: ContextType):
        for f in node.features:
            self.visit(f, context)

    @visitor.when(ast.FeatureNode)
    def visit(self, node: ast.FeatureNode, context: ContextType):
        pass

    @visitor.when(ast.MethodNode)
    def visit(self, node: ast.MethodNode, context: ContextType):
        for params in node.params:
            self.visit(params, context)
        self.visit(node.body, context)
        node.returnType = node.method_type

    @visitor.when(ast.AttributeNode)
    def visit(self, node: ast.AttributeNode, context: ContextType):
        if node.init_expr:
            self.visit(node.init_expr, context)
        node.returnType = node.attr_type

    @visitor.when(ast.ParamNode)
    def visit(self, node: ast.ParamNode, context: ContextType):
        node.returnType = node.param_type

    #TODO: No se como hacer este
    @visitor.when(ast.ObjectNode)
    def visit(self, node: ast.ObjectNode, context: ContextType):
        pass

    @visitor.when(ast.SelfNode)
    def visit(self, node: ast.SelfNode, context: ContextType):
        node.returnType = "SELF_TYPE"

    @visitor.when(ast.ExpressionNode)
    def visit(self, node: ast.ExpressionNode, context: ContextType):
        pass

    @visitor.when(ast.NewObjectNode)
    def visit(self, node: ast.NewObjectNode, context: ContextType):
        pass

    @visitor.when(ast.CaseNode)
    def visit(self, node: ast.CaseNode, context: ContextType):
        pass

    @visitor.when(ast.ActionNode)
    def visit(self, node: ast.ActionNode, context: ContextType):
        pass

    @visitor.when(ast.IsVoidNode)
    def visit(self, node: ast.IsVoidNode, context: ContextType):
        pass

    @visitor.when(ast.BinaryOperatorNode)
    def visit(self, node: ast.BinaryOperatorNode, context: ContextType):
        pass

    @visitor.when(ast.UnaryOperator)
    def visit(self, node: ast.UnaryOperator, context: ContextType):
        pass

    @visitor.when(ast.AtomicNode)
    def visit(self, node: ast.AtomicNode, context: ContextType):
        pass

    @visitor.when(ast.PlusNode)
    def visit(self, node: ast.PlusNode, context: ContextType):
        pass

    @visitor.when(ast.MinusNode)
    def visit(self, node: ast.MinusNode, context: ContextType):
        pass

    @visitor.when(ast.StarNode)
    def visit(self, node: ast.StarNode, context: ContextType):
        pass

    @visitor.when(ast.DivNode)
    def visit(self, node: ast.DivNode, context: ContextType):
        pass

    @visitor.when(ast.EqualNode)
    def visit(self, node: ast.EqualNode, context: ContextType):
        pass

    @visitor.when(ast.LessThanNode)
    def visit(self, node: ast.LessThanNode, context: ContextType):
        pass

    @visitor.when(ast.LessEqualNode)
    def visit(self, node: ast.LessEqualNode, context: ContextType):
        pass

    @visitor.when(ast.NegationNode)
    def visit(self, node: ast.NegationNode, context: ContextType):
        pass

    @visitor.when(ast.BooleanNegation)
    def visit(self, node: ast.BooleanNegation, context: ContextType):
        pass

    @visitor.when(ast.IntegerNegation)
    def visit(self, node: ast.IntegerNegation, context: ContextType):
        pass

    @visitor.when(ast.LetInNode)
    def visit(self, node: ast.LetInNode, context: ContextType):
        pass

    @visitor.when(ast.DeclarationNode)
    def visit(self, node: ast.DeclarationNode, context: ContextType):
        pass

    @visitor.when(ast.IfNode)
    def visit(self, node: ast.IfNode, context: ContextType):
        pass

    @visitor.when(ast.WhileNode)
    def visit(self, node: ast.WhileNode, context: ContextType):
        pass

    @visitor.when(ast.BlockNode)
    def visit(self, node: ast.BlockNode, context: ContextType):
        pass

    @visitor.when(ast.AssignNode)
    def visit(self, node: ast.AssignNode, context: ContextType):
        pass

    @visitor.when(ast.DynamicDispatchNode)
    def visit(self, node: ast.DynamicDispatchNode, context: ContextType):
        pass

    @visitor.when(ast.StaticDispatchNode)
    def visit(self, node: ast.StaticDispatchNode, context: ContextType):
        pass

    @visitor.when(ast.IntegerNode)
    def visit(self, node: ast.IntegerNode, context: ContextType):
        pass

    @visitor.when(ast.BooleanNode)
    def visit(self, node: ast.BooleanNode, context: ContextType):
        pass

    @visitor.when(ast.StringNode)
    def visit(self, node: ast.StringNode, context: ContextType):
        pass

    @visitor.when(ast.PrintIntegerNode)
    def visit(self, node: ast.PrintIntegerNode, context: ContextType):
        pass

    @visitor.when(ast.ScanNode)
    def visit(self, node: ast.ScanNode, context: ContextType):
        pass