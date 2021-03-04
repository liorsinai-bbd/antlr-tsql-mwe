# Run this in the terminal first: java org.antlr.v4.Tool -Dlanguage=Python3 TSqlLexer.g4 TSqlParser.g4 
import sys

from antlr4 import InputStream, StdinStream, FileStream, CommonTokenStream, ParseTreeWalker
from TSqlLexer import TSqlLexer
from TSqlParserListener import TSqlParserListener
from TSqlParser import TSqlParser

from PrintListener import PrintListener

def main():
    input_file = 'test-scripts/' + 'SelectAll.sql'
    input_stream = FileStream(input_file)

    lexer = TSqlLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = TSqlParser(stream)
    tree = parser.tsql_file()

    print("Parsed text:\n{:s}\n".format(tree.getText()))
    
    printer = PrintListener()
    walker = ParseTreeWalker()
    walker.walk(printer, tree)

if __name__ == '__main__':
    main()