%{                                                                                                                                                                      
                                                                                                                                                                        
        #include<stdio.h>                                                                                                                                               
                                                                                                                                                                        
        #include<stdlib.h>                                                                                                                                              
                                                                                                                                                                        
        int yylex();                                                                                                                                                    
                                                                                                                                                                        
        void yyerror(){                                                                                                                                                 
                                                                                                                                                                        
                printf("Invalid function declaration!\n\n");                                                                                                            
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
%}                                                                                                                                                                      
                                                                                                                                                                        
%token NUM ID TYPE                                                                                                                                                      
                                                                                                                                                                        
%%                                                                                                                                                                      
/*Grammer rules*/                                                                                                                                                       
                                                                                                                                                                        
S: TYPE ' ' ID '(' PARAM ')' ';' { printf("Valid function declaration!\n\n"); return 0; }                                                                               
                                                                                                                                                                        
PARAM: PARAM ',' PARAM                                                                                                                                                  
                                                                                                                                                                        
     | TYPE ' ' ID                                                                                                                                                      

     | TYPE ',' TYPE                                                                                                                                                    
                                                                                                                                                                        
     |;                                                                                                                                                                 
                                                                                                                                                                        
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
int yywrap(void) { return 1; }                                                                                                                                          
                                                                                                                                                                        
int main(){                                                                                                                                                             
                                                                                                                                                                        
        printf("Enter function declaration:\n\n");                                                                                                                      
                                                                                                                                                                        
        yyparse();                                                                                                                                                      
                                                                                                                                                                        
        return 0;                                                                                                                                                       
                                                                                                                                                                        
}                                            