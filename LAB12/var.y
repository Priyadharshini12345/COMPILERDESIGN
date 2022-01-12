%{

        #include<stdio.h>
                                                                                                                                                                        
        #include<stdlib.h>
                                                                                                                                                                        
        int yylex();
                                                                                                                                                                        
        void yyerror(){
                                                                                                                                                                        
                fprintf(stderr,"INVALID SYNTAX\n\n");
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%token NUM INT FLOAT CHAR DOUBLE LONG_INT ID ARR
                                                                                                                                                                        
%%
                                                                                                                                                                        
S: expr { printf("VALID SYNTAX\n\n"); return 0; };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
expr: declaration;
                                                                                                                                                                        
declaration: datatype var';'
                                                                                                                                                                        
datatype: INT
                                                                                                                                                                        
        | CHAR
                                                                                                                                                                        
        | DOUBLE
                                                                                                                                                                        
        | LONG_INT
                                                                                                                                                                        
        | FLOAT;

var:  ID
                                                                                                                                                                        
   | ARR
                                                                                                                                                                        
   | ID '=' NUM
  
   | ID '=' '\'' ID '\'';
                                                                                                                                                                        
%%
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        printf("Enter input expression\n\n");
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}