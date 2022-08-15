
%{
   /* Definitions - defines all includes or externs
   of global vartiables*/
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;
%}
  
/* Rule - Defines all valid characters through regular expressions to be passed into the parser */
%%
[0-9]+ {
          yylval=atoi(yytext);
          return NUMBER;
  
       }
[\t] ;
  
[\n] return 0;
  
. return yytext[0];
  
%%
  
int yywrap()
{
 return 1;
}