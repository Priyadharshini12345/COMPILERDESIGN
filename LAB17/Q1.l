%{
        #include <stdio.h>
        #include <string.h>
        #include <ctype.h>
        #include "y.tab.h"
        extern int yylval;
%}

%option noyywrap
%%
[ \t\n]                 ;
if                      return IF;
goto                    return GOTO;
NOT                     return NOT;
[a-zA-Z_][a-zA-Z0-9]*   return ID;
[0-9]+                  {
                                yylval = atoi(yytext);
                                return NUM;
                        }
.                       return yytext[0];
%%