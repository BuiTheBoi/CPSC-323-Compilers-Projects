%{
   /* Definitions */
  #include<stdio.h>
  int flag=0;
%}
  
%token NUMBER
  
%left '+' '-'
  
%left '*' '/' '%'
  
%left '(' ')'
  
/* Rules - Defines our context free grammar, as it takes input from the lex file, containing 
   all regular expressions.  */
%%
  
S : E{
         printf("Result = %d\n", $$);
         return 0;
      };
 

 E : E '+' T {$$=$1+$3;}
   | E '-' T {$$=$1-$3;}
   | T       {$$=$1;}
   ;

 T : T '*' F {$$=$1*$3;}
   | T '/' F { if ($3 == 0) {
                  // Taking into account for cases when dividing by 0 - ERROR!
                  yyerror();
                  exit(0);
               }
               else {
                  $$=$1/$3;
               }
            }
   | T'%'F {$$=$1%$3;}
   | F       {$$=$1;}
   ;

 F : '(' E ')' {$$=$2;}
   | '-' F     {$$=-$2;}   // Negative numbers (Which is different than subtraction)
   | NUMBER    {$$=$1;}
   ; 
%%
  
//driver code
void main()
{
   printf("Enter the expression:\n");
  
   yyparse();
   if(flag==0) // Success - Expression accepted by parser
      printf("\nEntered arithmetic expression is Valid\n\n");
}
  
void yyerror() // Expression not accepted by parser
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}