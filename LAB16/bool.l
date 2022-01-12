/*CONVERT BOOLEAN EXPRESSION TO THREE ADDRESS CODE*/                                                                                                                    
%{                                                                                                                                                                      
                                                                                                                                                                        
        #include<stdio.h>                                                                                                                                               
        #include<stdlib.h>                                                                                                                                              
                                                                                                                                                                        
%}                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
ALPHA [A-Za-z]                                                                                                                                                          
                                                                                                                                                                        
DIGIT [0-9]                                                                                                                                                             
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
{ALPHA}({ALPHA}|{DIGIT})*    return ID;                                                                                                                                 
                                                                                                                                                                        
{DIGIT}+             {yylval=atoi(yytext); return NUM;}                                                                                                                 
                                                                                                                                                                        
[ \t]                 ;                                                                                                                                                 
                                                                                                                                                                        
\n                yyterminate();                                                                                                                                        
                                                                                                                                                                        
.                 return yytext[0];                                                                                                                                     
                                                                                                                                                                        
%%                             