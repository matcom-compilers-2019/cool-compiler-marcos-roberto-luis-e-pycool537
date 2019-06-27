# Este es un contexto para el validate


class Context:
    def __init__(self, parent=None):
        self.parent = parent
        self.functions = {}
        self.variables = set()
        self.children = []

    def is_defined(self, identifier: str, args: int = None):
        if args is not None:
            if identifier in self.functions:
                for i in self.functions[identifier]:
                    if len(i) == args:
                        return True
            return self.parent and identifier in self.parent.is_defined(identifier, args)
        else:
            return identifier in self.variables or \
                   (self.parent and self.parent.is_defined(identifier))

    def define(self, identifier: str, args: list = None):
        if args is not None:
            if identifier in self.functions.keys() and args not in self.functions[identifier]:
                self.functions[identifier].append(args)
                return True
            elif identifier not in self.functions.keys():
                self.functions[identifier] = [args]
                return True
            return False
        else:
            self.variables.add(identifier)
            return True

    def create_child_context(self):
        new_context = Context(self)
        self.children.append(new_context)
        return new_context
