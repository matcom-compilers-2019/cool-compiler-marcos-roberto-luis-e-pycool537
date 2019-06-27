# Generated from cool.g4 by ANTLR 4.7.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .coolParser import coolParser
else:
    from coolParser import coolParser

# This class defines a complete generic visitor for a parse tree produced by coolParser.

class coolVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by coolParser#start.
    def visitStart(self, ctx:coolParser.StartContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#class_list.
    def visitClass_list(self, ctx:coolParser.Class_listContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#end.
    def visitEnd(self, ctx:coolParser.EndContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#class_exp.
    def visitClass_exp(self, ctx:coolParser.Class_expContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#method.
    def visitMethod(self, ctx:coolParser.MethodContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#attribute.
    def visitAttribute(self, ctx:coolParser.AttributeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#formal.
    def visitFormal(self, ctx:coolParser.FormalContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#declaration.
    def visitDeclaration(self, ctx:coolParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#letIn.
    def visitLetIn(self, ctx:coolParser.LetInContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#minus.
    def visitMinus(self, ctx:coolParser.MinusContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#negation.
    def visitNegation(self, ctx:coolParser.NegationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#dispatch.
    def visitDispatch(self, ctx:coolParser.DispatchContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#while.
    def visitWhile(self, ctx:coolParser.WhileContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#division.
    def visitDivision(self, ctx:coolParser.DivisionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#newObject.
    def visitNewObject(self, ctx:coolParser.NewObjectContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#lessThan.
    def visitLessThan(self, ctx:coolParser.LessThanContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#block.
    def visitBlock(self, ctx:coolParser.BlockContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#negInteger.
    def visitNegInteger(self, ctx:coolParser.NegIntegerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#id.
    def visitId(self, ctx:coolParser.IdContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#if.
    def visitIf(self, ctx:coolParser.IfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#case.
    def visitCase(self, ctx:coolParser.CaseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#add.
    def visitAdd(self, ctx:coolParser.AddContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#star.
    def visitStar(self, ctx:coolParser.StarContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#assignment.
    def visitAssignment(self, ctx:coolParser.AssignmentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#false.
    def visitFalse(self, ctx:coolParser.FalseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#parenthesis.
    def visitParenthesis(self, ctx:coolParser.ParenthesisContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#int.
    def visitInt(self, ctx:coolParser.IntContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#call.
    def visitCall(self, ctx:coolParser.CallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#str.
    def visitStr(self, ctx:coolParser.StrContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#equal.
    def visitEqual(self, ctx:coolParser.EqualContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#isVoid.
    def visitIsVoid(self, ctx:coolParser.IsVoidContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#true.
    def visitTrue(self, ctx:coolParser.TrueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by coolParser#lessEqual.
    def visitLessEqual(self, ctx:coolParser.LessEqualContext):
        return self.visitChildren(ctx)



del coolParser