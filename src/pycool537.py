from antlr4 import *
import coolLexer as lexer
import coolParser as parser
import ParsingToASTVisitor as visitor
from typeCollectorBuilder import TypeCollectorVisitor, TypeBuilderVisitor, Hierarchy, TypeHierarchy
from contextType import *
from typeCheck import TypeCheckVisitor
from cool_to_cil_visitor import CoolToCILVisitor
import sys

if __name__ == '__main__':
    i_file = sys.argv[1]
    o_file = "codigo_cool.asm"
    if len(sys.argv) > 2 and sys.argv[2] == "-o":
        o_file = sys.argv[3]
    input_stream = FileStream(i_file)
    l = lexer.coolLexer(input_stream)
    tok = CommonTokenStream(l)
    p = parser.coolParser(tok)
    tree = p.start()

    cool_visitor = visitor.ParsingToASTVisitor()

    ast = cool_visitor.visit(tree)

    type_collector = TypeCollectorVisitor()
    type_builder = TypeBuilderVisitor()
    type_hierarchy = TypeHierarchy()
    hierarchy = Hierarchy()
    type_checker = TypeCheckVisitor()

    c = ContextType()

    type_collector.visit(ast, c, [])

    type_builder.visit(ast, c, [])

    hierarchy.visit(ast, c, type_hierarchy)

    type_hierarchy.herency_resolve(c, 'Object')

    print(ast.validate(c))

    x = type_checker.visit(ast, c, [])

    print(x, c)

    cil_visitor = CoolToCILVisitor()

    result = cil_visitor.visit(ast)

    with open(o_file, 'w', encoding='utf-8') as file:
        file.write(result.code())
