%option noyywrap
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%{
                                                                                                                                                                        
        #include<stdio.h>

        #include<stdlib.h>
                                                                                                                                                                        
        #include "y.tab.h"
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
alpha [a-zA-Z]
                                                                                                                                                                        
digit [0-9]+
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
[\t\n] ;
                                                                                                                                                                        
"int " { return INT; }
                                                                                                                                                                        
"char " { return CHAR; }
                                                                                                                                                                        
"switch" { return SWITCH; }
                                                                                                                                                                        
"case" { return CASE; }
                                                                                                                                                                        
"break" { return BREAK; }
                                                                                                                                                                        
"default" { return DEFAULT; }
                                                                                                                                                                        
{alpha}({alpha}|{digit})* { return ID; }

{digit} { return NUM; }
                                                                                                                                                                        
. return yytext[0];
                                                                                                                                                                        
%%