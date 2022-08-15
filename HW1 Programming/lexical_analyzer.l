/* Definition section */
%{

%}

/* Rule section - Where we put all of our regular expressions based on the input*/
%%

int|while|for|cout|return     { printf("%s \t\t\t Keyword\n",yytext); }
["]([^"]|\\(.|\n))*["]        { printf("%s \t\t\t String\n", yytext); }
[a-zA-Z]+                     { printf("%s \t\t\t Identifier\n",yytext); }
\{|\}|\(|\)|[=]+|\+|<<        { printf("%s \t\t\t Operator\n", yytext); }
;|,                           { printf("%s \t\t\t Punctuation\n", yytext); }
[0-9]+                        { printf("%s \t\t\t Integer\n", yytext); }

"//".* {}
[[:space:]]|[[:space:]]+ {}

%%

/* yywrap() - wraps the above rule section */
int yywrap(){}

/* yyin - takes the file pointer 
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
/* yytext is the text in the buffer */

int main(){
       FILE *fp;

       fp = fopen("input_sourcecode.txt","r");
       yyin = fp;
  
       printf("Lexeme \t\t\t Token \n");
       printf("-------------------------------------\n");
       yylex();

       
       return 0;
}