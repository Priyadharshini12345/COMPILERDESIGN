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
                                                                                                                                                                        
({alpha})({alpha}|({digit}))*"["{digit}"]" { return ARR; }
                                                                                                                                                                        
"void " { return VOID; }
                                                                                                                                                                        
"int " { return INT; }
                                                                                                                                                                        
"char " { return CHAR; }
                                                                                                                                                                        
"float " { return FLOAT; }
                                                                                                                                                                        
"double " { return DOUBLE; }
                                                                                                                                                                        
"long int " { return LONG_INT; }

                                                                                                                                                                        
"main()" { return MAIN; }
                                                                                                                                                                        
"&" { return AMPERSAND; }
                                                                                                                                                                        
"printf" { return PRINTF; }
                                                                                                                                                                        
"scanf" { return SCANF; }
                                                                                                                                                                        
"\"%d\"" { return INT_VAL; }
                                                                                                                                                                        
"\"%f\"" { return FLOAT_VAL; }
                                                                                                                                                                        
"\"%lf\"" { return DOUBLE_VAL; }
                                                                                                                                                                        
"\"%c\"" { return CHAR_VAL; }
                                                                                                                                                                        
"\"%s\"" { return STRING; }
                                                                                                                                                                        
"\"%ld\"" { return LONG_INT_VAL; }
                                                                                                                                                                        
{alpha}({alpha}|{digit})* { return ID; }
                                                                                                                                                                        
. { return yytext[0]; }
                                                                                                                                                                        
%%