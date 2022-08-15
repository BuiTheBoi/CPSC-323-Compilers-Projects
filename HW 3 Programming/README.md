# CPSC 323 - HW 3

### Description

This program is a calculator recognizes a valid arithmetic expression consisting of four-function assignment
statements. When running this program, the user must type in artihmetic expressions for the program to calculate
and output. Lex file `lexical_analyzer.l` serves to create regular expressions to be assed into the YACC file `parser_source.y`
to serve as the parser to do the calculations based on the tokens it was given. If valid, it will give you the answer based on
your artihmetic expression.

### Instructions to Run File:

You can run the bash file:

```
sh run.sh
```

The bash file runs the following commands for you:

```
yacc parser_source.y -d
flex lexical_analyzer.l
gcc lex.yy.c y.tab.c -w
./a.out
```
