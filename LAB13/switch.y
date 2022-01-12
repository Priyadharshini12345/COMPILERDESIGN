%{

                                                                                                                                                                        
        #include<stdio.h>
                                                                                                                                                                        
        #include<stdlib.h>
                                                                                                                                                                        
        int yylex();
                                                                                                                                                                        
        void yyerror(){
                                                                                                                                                                        
                fprintf(stderr,"INVALID SWITCH CASE. SYNTAX ERROR\n\n");
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%token INT CHAR SWITCH CASE BREAK NUM ID DEFAULT
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
S :  declaration expr { printf("VALID SWITCH CASE\n\n"); return 0; };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
declaration: datatype var';';
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
datatype: INT
                                                                                                                                                                        
        | CHAR;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
expr: SWITCH'('E')''{'case DEFAULT':'';'BREAK';''}'
                                                                                                                                                      1,1           Top
| SWITCH'('E')''{'case DEFAULT':' ';' '}'
                                                                                                                                                                        
   | SWITCH'('E')''{'case'}' ;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
case: CASE ' ' NUM':' ';' BREAK ';'
                                                                                                                                                                        
    | CASE ' ' '\'' ID '\'' ':' ';' BREAK ';'
                                                                                                                                                                        
    | case case
                                                                                                                                                                        
    | ;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
var: ID
                                                                                                                                                                        
 | ID '=' NUM
                                                                                                                                                                        
 | ID '=' '\'' ID '\'';
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
E: ID
                                                                                                                                                                        
 | NUM;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%

                                                                                                                                                                        
int main(){
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
        printf("Enter switch case - Input expression\n\n");
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
}