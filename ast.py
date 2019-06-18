# ===============================================================
# =======================AST=HIERARCHY===========================
# ===============================================================

# Todo: arreglar el proyecto

ERROR = 0
INTEGER = 1

from context import Context
from contextType import ContextType
from contextType import Type

class Node:
    """
    Represent a node of our AST
    """
    def __init__(self):
        self.context_type = ContextType()
        self.return_type = Type('Untype')
        self.dynamic_node = Type('Untype')

    def validate(self, context: Context) -> bool:
        """
        Return True if the AST is valid semanticaly
        :param context: Context to validate
        :return:
        """
        pass


class ProgramNode(Node):

    def __init__(self, class_list):
        super(Node, self).__init__()
        self.class_list = class_list
        self.context = Context()
        self.context_map = {}
        self.initialize_context()
        self.initialize_builtin_types()

    def initialize_context(self):
        # Declaring the methods of Object
        self.context.functions['abort'] = []
        self.context.functions['type_name'] = []
        self.context.functions['copy'] = []

    def initialize_builtin_types(self):
        # Delare io
        io_context = self.context.create_child_context()
        io_context.functions['in_string'] = []
        io_context.functions['in_int'] = []
        io_context.functions['out_string'] = ['x']
        io_context.functions['out_int'] = ['x']
        self.context_map['IO'] = io_context

        int_context = self.context.create_child_context()
        self.context_map['Int'] = int_context

        string_context = self.context.create_child_context()
        self.context_map['String'] = string_context

        bool_context = self.context.create_child_context()
        self.context_map['Bool'] = bool_context

        object_context = self.context.create_child_context()
        self.context_map['Object'] = object_context

        self_type_context = self.context.create_child_context()
        self.context_map['SELF_TYPE'] = self_type_context


    def __repr__(self):
        s = "Program:\n"
        for c in self.class_list:
            s += str(c) + '\n'
        return s

    def validate(self, context_attributes_herency: ContextType, context: Context = None):
        self.context_type = context_attributes_herency
        for statement in self.class_list:
            if statement.parent and statement.parent in ['Int', 'String', 'Bool']:
                if statement.parent == 'Int':
                    print('A class can not inherit from String')
                    return False
                if statement.parent == 'String':
                    print('A class can not inherit from String')
                    return False
                if statement.parent == 'Bool':
                    print('A class can not inherit from Bool')
                    return False

        for statement in self.class_list:
            # parent_statement_context = self.context if not statement.parent else self.context_map[statement.parent]
            if not statement.validate(self.context):
                return False
            self.context_map[statement.name] = self.context.children[len(self.context.children) - 1]
        return True


class ClassNode(Node):
    def __init__(self, name, parent, features):
        """
        Create a ClassNode
        :param name: The name of the class
        :param parent: The name of the parent class
        :param features: A list with the features of the class (methods and atributes)
        """
        super().__init__()
        self.name = name
        self.parent = parent
        self.features = features

    def __str__(self):
        return str(self.name)

    def validate(self, context) -> bool:
        self.inner_context = context.create_child_context()
        self.inner_context.define('self')
        for attr in self.context_type.types[self.name].attributes.keys():
            self.inner_context.define(attr)
        for feature in self.features:
            if not feature.validate(self.inner_context):
                return False
        return True


class FeatureNode(Node):
    def __init__(self):
        super().__init__()

    def validate(self, context: Context) -> bool:
        pass


class MethodNode(FeatureNode):
    def __init__(self, name, params, return_type, body):
        super().__init__()
        self.name = name
        self.params = params
        self.method_type = return_type
        self.body = body

    def validate(self, context: Context) -> bool:
        # Define a new context for this method
        self.inner_context = context.create_child_context()

        for param in self.params:
            self.inner_context.define(param.name)

        if not self.body.validate(self.inner_context):
            return False

        if not context.define(self.name, [param.name for param in self.params]):
            print('Multiple definition of method ' + self.name)
            return False

        return True


class AttributeNode(FeatureNode):
    def __init__(self, name, attr_type, init_expr):
        super(AttributeNode, self).__init__()
        self.name = name
        self.attr_type = attr_type
        self.init_expr = init_expr

    def validate(self, context: Context) -> bool:
        if self.init_expr and not self.init_expr.validate(context):
            return False
        if not context.define(self.name):
            print('Multiple definition of attribute ' + self.name)
            return False
        return True


class ParamNode(FeatureNode):
    def __init__(self, name, param_type):
        super(ParamNode, self).__init__()
        self.name = name
        self.param_type = param_type

    def validate(self, context: Context):
        return True


class ObjectNode(Node):
    def __init__(self, name):
        super(ObjectNode, self).__init__()
        self.name = name

    def __str__(self):
        return self.name

    def validate(self, context: Context):
        if not context.is_defined(self.name):
            print('The object ' + self.name + ' is not defined in this scope')
            return False
        return True


class SelfNode(ObjectNode):
    def __init__(self):
        super(SelfNode, self).__init__("SELF")


# TODO: Cambiar en dependencia del DynamicDispatchNode
class ExpressionNode(Node):
    def __init__(self):
        super(ExpressionNode, self).__init__()

    @property
    def get_type(self):
        pass


class NewObjectNode(ExpressionNode):
    def __init__(self, new_type):
        super(NewObjectNode, self).__init__()
        self.type_new_object = new_type

    def validate(self, context: Context):
        return True


class CaseNode(ExpressionNode):
    def __init__(self, expr, actions):
        super(CaseNode, self).__init__()
        self.expr = expr
        self.actions = actions

    def validate(self, context: Context):
        if not self.expr.validate(context):
            return False

        for action in self.actions:
            if not action.validate(context):
                return False
        return True


class ActionNode(Node):
    def __init__(self, name, action_type, body):
        super(ActionNode, self).__init__()
        self.name = name
        self.action_type = action_type
        self.body = body

    def validate(self, context: Context):
        self.inner_context = context.create_child_context()
        self.inner_context.define(self.name)
        return self.body.validate(self.inner_context)
        # TODO Tengo que ver que hacer con los names(ids)
        # TODO Ademas, no se si el action_type tiene que estar definido


class IsVoidNode(ExpressionNode):
    def __init__(self, expr: ExpressionNode):
        super(IsVoidNode, self).__init__()
        self.expr = expr

    @property
    def get_type(self):
        return 'Bool'

    def validate(self, context: Context):
        return self.expr.validate(context)


class BinaryOperatorNode(ExpressionNode):
    def __init__(self, left: ExpressionNode, right: ExpressionNode):
        super(BinaryOperatorNode, self).__init__()
        self.left = left
        self.right = right

    @property
    def get_type(self):
        return self.left.get_type

    def validate(self, context: Context):
        return self.left.validate(context) and self.right.validate(context)


class UnaryOperator(ExpressionNode):
    def __init__(self, expr: ExpressionNode):
        super(UnaryOperator, self).__init__()
        self.expr = expr

    @property
    def get_type(self):
        return self.expr.get_type

    def validate(self, context: Context):
        return self.expr.validate(context)


class AtomicNode(ExpressionNode):
    def __init__(self):
        super(AtomicNode, self).__init__()


class PlusNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(PlusNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '+'


class MinusNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super().__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '-'


class StarNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(StarNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '*'


class DivNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(DivNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '/'


class EqualNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(EqualNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '='


class LessThanNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(LessThanNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '<'


class LessEqualNode(BinaryOperatorNode):
    def __init__(self, left, right):
        super(LessEqualNode, self).__init__(left, right)
        self.left = left
        self.right = right
        self.operator = '<='


class NegationNode(UnaryOperator):
    def __init__(self, value):
        super(NegationNode, self).__init__(value)
        self.value = value


class BooleanNegation(NegationNode):
    def __init__(self, value):
        super(BooleanNegation, self).__init__(value)
        self.operator = "!"


class IntegerNegation(NegationNode):
    def __init__(self, value):
        super(IntegerNegation, self).__init__(value)
        self.operator = "~"


class LetInNode(AtomicNode):
    def __init__(self, return_type, declaration_list, expr):
        super(LetInNode, self).__init__()
        # self.instance = instance
        self.return_type = return_type
        self.declaration_list = declaration_list
        self.expr = expr

    def get_type(self):
        return self.expr.get_type

    def validate(self, context: Context):
        self.inner_context = context.create_child_context()
        for declaration in self.declaration_list:
            if not declaration.validate(self.inner_context):
                return False
        return self.expr.validate(self.inner_context)


class DeclarationNode(ExpressionNode):
    def __init__(self, idx_token, type_token, expr=None):
        super(ExpressionNode, self).__init__()
        self.idx_token = idx_token
        self.type_token = type_token
        self.expr = expr
        self.variable_info = None

    def get_type(self):
        return self.type_token

    def validate(self, context: Context):
        if self.expr is not None and not self.expr.validate(context):
            return False
        if not context.define(self.idx_token):
            print('Multiple declaration of variable with id '+ self.idx_token)
            return False
        return True


class IfNode(ExpressionNode):
    def __init__(self, predicate, then_expr, else_expr):
        super(IfNode, self).__init__()
        self.predicate = predicate
        self.then_expr = then_expr
        self.else_expr = else_expr
    # Este no se usa
    def get_type(self):
        return self.then_expr

    def validate(self, context:Context):
        if not self.predicate.validate(context):
            return False
        if not self.then_expr.validate(context):
            return False
        if not self.else_expr.validate(context):
            return False
        return True


class WhileNode(ExpressionNode):
    def __init__(self, predicate, expr):
        super(WhileNode, self).__init__()
        self.predicate = predicate
        self.expr = expr
    # Este no se usa
    def get_type(self):
        return self.expr.get_type

    def validate(self, context: Context):
        if not self.predicate.validate(context):
            return False
        if not self.expr.validate(context):
            return False
        return True


class BlockNode(AtomicNode):
    def __init__(self, expr_list):
        super(BlockNode, self).__init__()
        self.expr_list = expr_list

    def validate(self, context: Context):
        for expresion in self.expr_list:
            if not expresion.validate(context):
                return False
        return True


class AssignNode(AtomicNode):
    def __init__(self, idx_token, expr):
        super(AssignNode, self).__init__()
        self.idx_token = idx_token
        self.expr = expr
        self.variable_info = None

    def validate(self, context: Context):
        if not self.expr.validate(context):
            return False
        if not context.is_defined(self.idx_token):
            print('Variable with id ' + self.idx_token + ' is not defined')
            return False
        return True


# TODO: EYE!!!!
class DynamicDispatchNode(ExpressionNode):
    def __init__(self, instance, method, arguments):
        super(DynamicDispatchNode, self).__init__()
        self.instance = instance
        self.method = method
        self.arguments = arguments

    def validate(self, context: Context):
        if type(self.instance) != str and not self.instance.validate(context):
            # print('The instance ' + str(self.instance) + ' is not defined')
            return False
        for expresion in self.arguments:
            if not expresion.validate(context):
                return False
        return True


class StaticDispatchNode(ExpressionNode):
    def __init__(self, instance, dispatch_type, method, arguments):
        super(StaticDispatchNode, self).__init__()
        self.instance = instance
        self.dispatch_type = dispatch_type
        self.method = method
        self.arguments = arguments

    def validate(self, context: Context):
        if not self.instance.validate(context):
            # print('The instance is not defined')
            return False
        for expresion in self.arguments:
            if not expresion.validate(context):
                return False
        return True


class IntegerNode(AtomicNode):
    def __init__(self, integer_token):
        super(IntegerNode, self).__init__()
        self.integer_token = integer_token

    def validate(self, context: Context) -> bool:
        return True

class BooleanNode(AtomicNode):
    def __init__(self, boolean_token):
        super(BooleanNode, self).__init__()
        self.boolean_token = boolean_token

    def validate(self, context: Context) -> bool:
        return True

class StringNode(AtomicNode):
    def __init__(self, string_token):
        super(StringNode, self).__init__()
        self.string_token = string_token

    def validate(self, context: Context) -> bool:
        return True

class VariableNode(AtomicNode):
    def __init__(self, idx_token):
        super(VariableNode, self).__init__()
        self.idx_token = idx_token
        self.variable_info = None

    def validate(self, context: Context):
        return context.is_defined(self.idx_token)


class PrintIntegerNode(AtomicNode):
    def __init__(self, expr):
        super(PrintIntegerNode, self).__init__()
        self.expr = expr

    def validate(self, context: Context) -> bool:
        return True

class PrintStringNode(AtomicNode):
    def __init__(self, string_token):
        super(PrintStringNode, self).__init__()
        self.string_token = string_token

    def validate(self, context: Context) -> bool:
        return True

class ScanNode(AtomicNode):
    def __init__(self, method):
        self.method = method
        super(ScanNode, self).__init__()
        # TODO : Chequear si el scan node recibe ya el string a escanear

    def validate(self, context: Context) -> bool:
        return True

# ===============================================================
