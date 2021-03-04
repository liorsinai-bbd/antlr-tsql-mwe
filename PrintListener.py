from antlr4 import *

def get_class_name(instance):
    return instance.__class__.__name__

class PrintListener(ParseTreeListener):
    def enterEveryRule(self, ctx: ParserRuleContext):
        padding = "--" * (ctx.depth() -1)
        #text = ctx.getText()
        #text = text.replace('\n', '<NEWLINE>')
        ctx_class = get_class_name(ctx)
        print(padding, ctx_class, ctx.getChildCount())

    def visitTerminal(self, node: TerminalNode):
        node_class = get_class_name(node)
        text = node.getText()
        padding = "--" * (node.getParent().depth())
        print(padding , node_class, text)


