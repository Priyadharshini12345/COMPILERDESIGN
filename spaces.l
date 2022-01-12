%{
#include"stdio.h"
int sc_count=0;
int ch_count=0;
%}
                                                                                                                                                                        
%%
([ ])+ {sc_count++; }
. {ch_count++;}
%%
                                                                                                                                                                        
int yywrap(void){ return 1; }
                                                                                                                                                                        
int main(){
        printf("Enter the string:\n");
        yylex();                                                                                                                                                        
        printf("Number of blank spaces: %d\n",sc_count);
        printf("\n");
        return 0;
}      