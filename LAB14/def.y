%{                                                                                                                                                                      
                                                                                                                                                                        
        #include<stdio.h>                                                                                                                                               
                                                                                                                                                                        
        #include<string.h>                                                                                                                                              
                                                                                                                                                                        
        #include<stdlib.h>                                                                                                                                              
                                                                                                                                                                        
        int yylex();                                                                                                                                                    
                                                                                                                                                                        
        void yyerror(){                                                                                                                                                 
                                                                                                                                                                        
                printf("Invalid function definition!\n\n");                                                                                                             
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
%}                                                                                                                                                                      
                                                                                                                                                                        
/*Associativity rules*/                                                                                                                                                 
                                                                                                                                                                        
%token ID NUM TYPE RETURN                                                                                                                                               
                                                                                                                                                                        
%right '='                                                                                                                                                              
                                                                                                                                                                        
%left '+' '-'                                                                                                                                                           
                                                                                                                                                                        
%left '*' '/'                                                                                                                                                           
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
/*Grammer rules*/                                                                                                                                                       
                                                                                                                                                                        
S: TYPE ' ' ID '(' PARAM ')' '{' BODY '}' { printf("Valid function definition!\n\n"); return 0; }                                                                       
                                                                                                                                                                        
                                                                                                                                                                        
PARAM: PARAM ',' PARAM                                                                                                                                                  
                                                                                                                                                                        
     | TYPE ' ' ID                                                                                                                                                      
                                                                                                                                                                        
     | ;                                                                                                                                                                
                                                                                                                                                                        
                                                                                                                                                                        
BODY: BODY BODY                                                                                                                                                         
                                                                                                                                                                        
    | E ';'                                                                                                                                                             
                                                                                                                                                                        
    | TYPE ' ' ID ';'                                                                                                                                                   
                                                                                                                                                                        
    | RETURN ' ' E';'                                                                                                                                                   
                                                                                                                                                                        
    | ;                                                                                                                                                                 
                                                                                                                                                                        
                                                                                                                                                                        
E: ID '=' E                                                                                                                                                             

 | E '+' E                                                                                                                                                              
                                                                                                                                                                        
 | E '-' E                                                                                                                                                              
                                                                                                                                                                        
 | E '*' E                                                                                                                                                              
                                                                                                                                                                        
 | E '/' E                                                                                                                                                              
                                                                                                                                                                        
 | TYPE ' ' ID '=' E                                                                                                                                                    
                                                                                                                                                                        
 | TYPE ' ' ID '=' '\'' ID '\''                                                                                                                                         
                                                                                                                                                                        
 | NUM                                                                                                                                                                  
                                                                                                                                                                        
 | NUM '.' NUM                                                                                                                                                          
                                                                                                                                                                        
 | ID                                                                                                                                                                   
                                                                                                                                                                        
 | '\'' ID '\''                                                                                                                                                         

 |;                                                                                                                                                                     
                                                                                                                                                                        
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
int yywrap(void) { return 1; }                                                                                                                                          
                                                                                                                                                                        
int main(){                                                                                                                                                             
                                                                                                                                                                        
        printf("Enter function definition:\n\n");                                                                                                                       
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;                                                                                                                                                       
                                                                                                                                                                        
}                                      