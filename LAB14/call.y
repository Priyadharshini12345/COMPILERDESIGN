%{                                                                                                                                                                      
        #include<stdio.h>                                                                                                                                               
                                                                                                                                                                        
        #include<stdlib.h>                                                                                                                                              
                                                                                                                                                                        
        int yylex();                                                                                                                                                    
                                                                                                                                                                        
        void yyerror(){                                                                                                                                                 
                                                                                                                                                                        
                printf("\nInvalid function call!\n\n");                                                                                                                 
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
%}                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
%token NUM ID TYPE                                                                                                                                                      
                                                                                                                                                                        
%right '='                                                                                                                                                              
                                                                                                                                                                        
                                                                                                                                                                        
%%                                                                                                                                                                      
/*Grammer rules*/                                                                                                                                                       
                                                                                                                                                                        
S: EXPR { printf("\nValid function call!\n\n"); return 0; }                                                                                                             
                                                                                                                                                                        
                                                                                                                                                                        
EXPR: TYPE ' ' ID '=' ID'(' PARAM ')'                                                                                                                                   
                                                                                                                                                                        
  | ID '(' PARAM ')';                                                                                                                                                   
                                                                                                                                                                        
                                                                                                                                                                        
PARAM: PARAM ',' PARAM                                                                                                                                                  
                                                                                                                                                                        
     | NUM                                                                                                                                                              
                                                                                                                                                                        
     | NUM '.' NUM                                                                                                                                                      
                                                                                                                                                                        
     | ID                                                                                                                                                               

     | '\'' ID '\''                                                                                                                                                     
                                                                                                                                                                        
     | ;                                                                                                                                                                
                                                                                                                                                                        
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
int yywrap(void) { return 1; }                                                                                                                                          
                                                                                                                                                                        
int main(){                                                                                                                                                             
                                                                                                                                                                        
        printf("\nEnter function call:\n");                                                                                                                             
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;                                                                                                                                                       
}                                