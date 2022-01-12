%{
                                                                                                                                                                        
        #include<stdio.h>
                                                                                                                                                                        
        #include<stdlib.h>
                                                                                                                                                                        
        int yylex();
                                                                                                                                                                        
        void yyerror(){
                                                                                                                                                                        
                fprintf(stderr,"INVALID SYNTAX\n\n");
                                                                                                                                                                        
        }
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%token NUM INT VOID FLOAT CHAR DOUBLE LONG_INT ID MAIN RETURN SCANF PRINTF INT_VAL FLOAT_VAL LONG_INT_VAL AMPERSAND DOUBLE_VAL CHAR_VAL STRING ARR
                                                                                                                                                                        
%%
                                                                                                                                                                        
S: expr { printf("VALID SYNTAX\n\n"); return 0; };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
expr: header declaration input output '}';
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
header: VOID MAIN '{';
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
declaration: datatype var';'
                                                                                                                                                                        
           | declaration declaration;

datatype: INT
                                                                                                                                                                        
        | CHAR
                                                                                                                                                                        
        | DOUBLE
                                                                                                                                                                        
        | LONG_INT
                                                                                                                                                                        
        | FLOAT;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
var: ID
                                                                                                                                                                        
   | ARR
                                                                                                                                                                        
   | ID '=' NUM
                                                                                                                                                                        
   | ID '=' '\'' ID '\'';
                                                                                                                                                                        
                                                                                                                                                                        
input: SCANF '(' INT_VAL ',' AMPERSAND ID ')' ';'
                                                                                                                                                                        
     | SCANF '(' FLOAT_VAL ',' AMPERSAND ID ')' ';'
                                                                                                                                                                        
     | SCANF '(' DOUBLE_VAL ',' AMPERSAND ID ')' ';'
                                                                                                                                                                        
     | SCANF '(' CHAR_VAL ',' AMPERSAND ID ')' ';'
                                                                                                                                                                        
     | SCANF '(' LONG_INT_VAL ',' AMPERSAND ID ')' ';'
                                                                                                                                                                        
     | SCANF '(' STRING ',' ID ')' ';'
                                                                                                                                                                        
     | input input
                                                                                                                                                                        
     |;
                                                                                                                                                                        
output: PRINTF '(' INT_VAL ',' ID ')' ';'

      | PRINTF '(' FLOAT_VAL ',' ID ')' ';'
                                                                                                                                                                        
      | PRINTF '(' DOUBLE_VAL ',' ID ')' ';'
                                                                                                                                                                        
      | PRINTF '(' CHAR_VAL ',' ID ')' ';'
                                                                                                                                                                        
      | PRINTF '(' LONG_INT_VAL ',' ID ')' ';'
                                                                                                                                                                        
      | PRINTF '(' STRING ',' ID ')' ';'
                                                                                                                                                                        
      | output output
                                                                                                                                                                        
      | ;
                                                                                                                                                                        
%%
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        printf("Enter input expression\n\n");
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}