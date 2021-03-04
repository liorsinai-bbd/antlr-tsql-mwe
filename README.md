ANTLR4 Minimum Working Example
==================

Prerequisites
------------
Install ANTRL. This can be downloaded from [www.antlr.org/download.html](https://www.antlr.org/download.html).

The path to this file should be added as an environment variable e.g. C:\Program Files\Java\libs\antlr-4.9.1-complete.jar. 

The Python 3 runtime target for ANTLR. Install with pip with:
```
pip install antlr4-python3-runtime
```

Getting started 
------------

In a terminal run:
```
 java org.antlr.v4.Tool -Dlanguage=Python3 TSqlLexer.g4 TSqlParser.g4 
```

In the IDE, run `main.py`.

VS Code: Launch Configuration
------------
If using VSCode, uncomment the Grammar launch configuration and comment the Python launch configuration to launch grammar debugging mode.

Relevant files
--------------

* `TSqlLexer.g4` and `TSqlPaser.g4`: lexer grammar and parser grammar definitions respectively, edited from [github.com/antlr/grammars-v4/tree/master/sql/tsql](https://github.com/antlr/grammars-v4/tree/master/sql/tsql).
* `test-scripts/*`: SQL test scripts.
* `main.py`: a basic Python script to parse an SQL file, and walk and print the resulting parse tree.
* `PrintListener.py`: a basic listener to print nodes during the walk.

