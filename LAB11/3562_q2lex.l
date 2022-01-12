%option noyywrap

%{
        #include <stdio.h>
        #include <stdlib.h>
        #include "y.tab.h"
%}
                                                                                                                                                                        
alpha [a-zA-Z]
digit [0-9]+
                                                                                                                                                                        
%%
                                                                                                                                                                        
[ \t\n] ;
"while" {return WHILE;}
{alpha}({alpha}|{digit})* { return IDENTIFIER;}
{digit} {return NUMBER;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NE;}
"&&" {return AND;}
"||" { return OR;}
"++" { return INC;}
"--" { return DEC;}
. { return yytext[0];}
%%