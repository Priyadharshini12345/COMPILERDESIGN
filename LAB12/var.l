%option noyywrap

%{
                                                                                                                                                                        
        #include<stdio.h>
                                                                                                                                                                        
        #include<stdlib.h>
                                                                                                                                                                        
        #include<string.h>
                                                                                                                                                                        
        #include"y.tab.h"
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
alpha [a-zA-Z]
                                                                                                                                                                        
digit [0-9]+
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
[\n\t] ;
                                                                                                                                                                        
"int " { return INT; }
                                                                                                                                                                        
"char " { return CHAR; }
                                                                                                                                                                        
"float " { return FLOAT; }
                                                                                                                                                                        
"double " { return DOUBLE; }
                                                                                                                                                                        
"long int " { return LONG_INT; }
                                                                                                                                                                        
({alpha})({alpha}|{digit})*"["{digit}"]" { return ARR; }
                                                                                                                                                                        
({alpha})({alpha}|{digit})* { return ID; }
                                                                                                                                                                       
{digit} { return NUM; }
                                                                                                                                                                        
. { return yytext[0]; }
                                                                                                                                                                        
%%
      