from coolParser import coolParser
from coolVisitor import coolVisitor
from ast import *


class ParsingToASTVisitor(coolVisitor):

    # Este es el visit que devuelve la instancia general
    def visitStart(self, ctx: coolParser.StartContext):
        return self.visit(ctx.program())

    def visitInt(self, ctx: coolParser.IntContext):
        node = IntegerNode(ctx.INT().getText())
        return node

    def visitId(self, ctx: coolParser.IdContext):
        return ObjectNode(ctx.ID().getText())

    def visitAdd(self, ctx: coolParser.AddContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return PlusNode(left, right)

    def visitAssignment(self, ctx: coolParser.AssignmentContext):
        expr = self.visit(ctx.expr())
        return AssignNode(ctx.ID().getText(), expr)

    def visitAttribute(self, ctx: coolParser.AttributeContext):
        if ctx.expr() is not None:
            expr = self.visit(ctx.expr())
            return AttributeNode(ctx.ID().getText(), ctx.TYPE().getText(), expr)
        return AttributeNode(ctx.ID().getText(), ctx.TYPE().getText(), None)

    def visitBlock(self, ctx: coolParser.BlockContext):
        expr_list = []
        for expr in ctx.expr():
            expr_list.append(self.visit(expr))
        return BlockNode(expr_list)

    def visitCall(self, ctx: coolParser.CallContext):
        instance = "self"
        method = ctx.ID().getText()
        arguments = []
        for expr in ctx.expr():
            arg = self.visit(expr)
            arguments.append(arg)
        if method == "in_string" or method == "in_int":
            return ScanNode(method)
        if method == "out_string":
            return PrintStringNode(arguments[0])
        if method == "out_int":
            return PrintIntegerNode(arguments[0])
        return DynamicDispatchNode(instance, method, arguments)

    def visitCase(self, ctx: coolParser.CaseContext):
        expr = self.visit(ctx.expr(0))
        actions = []
        for i in range(1, len(ctx.expr())):
            current_expr = self.visit(ctx.expr(i))
            action = ActionNode(ctx.ID(i - 1).getText(), ctx.TYPE(i - 1).getText(), current_expr)
            actions.append(action)
        return CaseNode(expr, actions)

    def visitClass_exp(self, ctx: coolParser.Class_expContext):
        name = ctx.TYPE(0).getText()
        parent = None
        if len(ctx.TYPE()) > 1:
            parent = ctx.TYPE(1).getText()
        features = []
        for f in ctx.feature():
            feature = self.visit(f)
            features.append(feature)
        return ClassNode(name, parent, features)

    def visitClass_list(self, ctx: coolParser.Class_listContext):
        class_list = [self.visit(ctx.class_exp())]
        program = self.visit(ctx.program())
        class_list.extend(program.class_list)
        return ProgramNode(class_list)

    def visitDeclaration(self, ctx: coolParser.DeclarationContext):
        idx_token = ctx.ID().getText()
        type_token = ctx.TYPE().getText()
        expr = None
        if ctx.expr() is not None:
            expr = self.visit(ctx.expr())
        return DeclarationNode(idx_token, type_token, expr)

    def visitDispatch(self, ctx: coolParser.DispatchContext):
        expr = self.visit(ctx.expr(0))
        method = ctx.ID().getText()
        arguments = []
        for i in range(1, len(ctx.expr())):
            arg = self.visit(ctx.expr(i))
            arguments.append(arg)
        if ctx.TYPE() is not None:
            t = ctx.TYPE().getText()
            return StaticDispatchNode(expr, t, method, arguments)
        if method == "in_string" or method == "in_int":
            return ScanNode(method)
        if method == "out_string":
            return PrintStringNode(arguments[0])
        if method == "out_int":
            return PrintIntegerNode(arguments[0])
        return DynamicDispatchNode(expr, method, arguments)

    def visitDivision(self, ctx: coolParser.DivisionContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return DivNode(left, right)

    def visitEqual(self, ctx: coolParser.EqualContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return EqualNode(left, right)

    def visitFalse(self, ctx: coolParser.FalseContext):
        return BooleanNode(ctx.FALSE().getText())

    def visitFormal(self, ctx: coolParser.FormalContext):
        return ParamNode(ctx.ID().getText(), ctx.TYPE().getText())

    def visitIf(self, ctx: coolParser.IfContext):
        predicate = self.visit(ctx.expr(0))
        then_expr = self.visit(ctx.expr(1))
        else_expr = self.visit(ctx.expr(2))
        return IfNode(predicate, then_expr, else_expr)

    def visitIsVoid(self, ctx: coolParser.IsVoidContext):
        expr = self.visit(ctx.expr())
        return IsVoidNode(expr)

    def visitLessEqual(self, ctx: coolParser.LessEqualContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return LessEqualNode(left, right)

    def visitLessThan(self, ctx: coolParser.LessThanContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return LessThanNode(left, right)

    def visitLetIn(self, ctx: coolParser.LetInContext):
        declaration = [self.visit(ctx.declaration(0))]
        for i in range(1, len(ctx.declaration())):
            dec = self.visit(ctx.declaration(i))
            declaration.append(dec)
        expr = self.visit(ctx.expr())
        return LetInNode(None, declaration, expr)

    def visitMethod(self, ctx: coolParser.MethodContext):
        name = ctx.ID().getText()
        formal_params = [self.visit(ctx.formal(i)) for i in range(len(ctx.formal()))]
        type_return = ctx.TYPE().getText()
        expr = self.visit(ctx.expr())
        return MethodNode(name, formal_params, type_return, expr)

    def visitMinus(self, ctx: coolParser.MinusContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return MinusNode(left, right)

    def visitNegation(self, ctx: coolParser.NegationContext):
        expr = self.visit(ctx.expr())
        return BooleanNegation(expr)

    def visitNewObject(self, ctx: coolParser.NewObjectContext):
        return NewObjectNode(ctx.TYPE().getText())

    def visitParenthesis(self, ctx: coolParser.ParenthesisContext):
        return self.visit(ctx.expr())

    # def visitSingle_class(self, ctx: coolParser.Single_classContext):
    #    return self.visit(ctx.class_exp())

    def visitStar(self, ctx: coolParser.StarContext):
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        return StarNode(left, right)

    def visitStr(self, ctx: coolParser.StrContext):
        return StringNode(ctx.STR().getText())

    def visitTrue(self, ctx: coolParser.TrueContext):
        return BooleanNode(ctx.TRUE())

    def visitWhile(self, ctx: coolParser.WhileContext):
        predicate = self.visit(ctx.expr(0))
        expr = self.visit(ctx.expr(1))
        return WhileNode(predicate, expr)

    def visitNegInteger(self, ctx: coolParser.NegIntegerContext):
        return IntegerNegation(self.visit(ctx.expr()))

    def visitEnd(self, ctx: coolParser.EndContext):
        return ProgramNode([])
