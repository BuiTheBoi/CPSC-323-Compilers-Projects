## CPSC 323 Assignment 1 Coding

This program uses Flex, which serves as a lexical analyzer for a mock
C++ program found in input_sourcecode.txt. This program generates
a column to identify the lexemes and another column to identify tokens.

### How To Run Program

To run this program, type in the following commands into your terminal:

```
lex lexical_analyzer.l

gcc lex.yy.c

./a.out > output.txt
```

To view your output, open up the output.txt file.
