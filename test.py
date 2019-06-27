from antlr4 import *
import coolLexer as lexer
import coolParser as parser
import ParsingToASTVisitor as visitor
from typeCollectorBuilder import TypeCollectorVisitor, TypeBuilderVisitor, Hierarchy, TypeHierarchy
from contextType import *
from typeCheck import TypeCheckVisitor
from cool_to_cil_visitor import CoolToCILVisitor

if __name__ == '__main__':
    input_stream = FileStream("../PyCOOL/TESTER/MIPS/Case.cl")
    l = lexer.coolLexer(input_stream)
    tok = CommonTokenStream(l)
    # print(tok.fill())
    # print(tok.get(0))
    p = parser.coolParser(tok)
    # print(tok.get(0))
    tree = p.start()
    # print(tree.toStringTree())

    cool_visitor = visitor.ParsingToASTVisitor()

    ast = cool_visitor.visit(tree)
    # print(ast)

    type_collector = TypeCollectorVisitor()
    type_builder = TypeBuilderVisitor()
    type_hierarchy = TypeHierarchy()
    hierarchy = Hierarchy()
    type_checker = TypeCheckVisitor()

    c = ContextType()

    type_collector.visit(ast, c, [])

    # print(c)

    type_builder.visit(ast, c, [])

    hierarchy.visit(ast, c, type_hierarchy)

    type_hierarchy.herency_resolve(c, 'Object')

    # print(type(ast))
    print(ast.validate(c))

    x = type_checker.visit(ast, c, [])

    print(x, c)

    # exit()
    # print(type(ast))

    cil_visitor = CoolToCILVisitor()

    result = cil_visitor.visit(ast)
    print(type(result))
    print(result)
    # print(result.code())

    with open('output.asm', 'w', encoding='utf-8') as file:
        file.write(result.code())
