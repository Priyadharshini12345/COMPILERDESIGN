%{
        #include <stdio.h>
        #include <stdlib.h>
        #include "y.tab.h"
        #include <string.h>
        int yylex();
        extern char* yytext;
        extern FILE* yyin;                                                                                                                                              
        void yyerror(char*);                                                                                                                                            
        int i;                                                                                                                                                          
        char op[100];                                                                                                                                                   
%}                                                                                                                                                                      
                                                                                                                                                                        
%token IF NOT GOTO ID NUM                                                                                                                                               
                                                                                                                                                                        
%%                                                                                                                                                                      
S       :BODY {return 0;}                                                                                                                                               
BODY    :STMT {printf("\n");}                                                                                                                                           
        |STMT {printf("\n");} BODY                                                                                                                                      
STMT    :LABEL ':' {printf(":");}                                                                                                                                       
        |COND                                                                                                                                                           
        |UNCOND                                                                                                                                                         
        |EXP                                                                                                                                                            
COND    :IF {printf("if ");} LABEL GOTO {printf(" goto ");} LABEL                                                                                                       
        |IF NOT {printf("if NOT ");} LABEL GOTO {printf(" goto ");} LABEL                                                                                               
UNCOND  :GOTO {printf("goto ");} LABEL                                                                                                                                  
EXP     :LABEL '=' {printf("%s",yytext);} RHS                                                                                                                           
RHS     :OP '>' OP {printf("%s",yytext);}                                                                                                                               
        |OP '<' OP {printf("%s",yytext);}                                                                                                                               
        |OP '<''=' OP {printf("%s",yytext);}                                                                                                                            
        |OP '>''=' OP {printf("%s",yytext);}                                                                                                                            
        |OP '*''*' NUM {printf("%s",op); for(i=1;i<$4;i++) printf("*%s",op);}                                                                                           
        |OP '*' NUM { if($3 == 1) printf("%s",op); else if($3 == 0) printf("0"); else printf("%s * %d",op,$3);}                                                         
        |OP '/' NUM { if($3 == 1) printf("%s",op); else printf("%s / %d",op,$3);}                                                                                       
        |OP '+' NUM { if($3 == 0) printf("%s",op); else printf("%s + %d",op,$3);}                                                                                       
        |OP '-' NUM { if($3 == 0) printf("%s",op); else printf("%s - %d",op,$3);}                                                                                       
        |OP '%' OP {printf("%s",yytext);}                                                                                                                               
        |OP {printf("%s",op);}                                                                                                                                          
LABEL   :ID {printf("%s",yytext);}                                                                                                                                      
OP      :ID {strcpy(op,yytext);}                                                                                                                                        
        |NUM{strcpy(op,yytext);}                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
int main()                                                                                                                                                              
{                                                                                                                                                                       
        FILE *fp = fopen("input.txt","r");                                                                                                                              
        yyin = fp;                                                                                                                                                      
        yyparse();                                                                                                                                                      
}                                                                                                                                                                       
                                                                                                                                                                        
void yyerror(char *s)                                                                                                                                                   
{                                                                                                                                                                       
        printf("Invalid\n");                                                                                                                                            
}                                 