%{
#include<stdio.h>
int vcount=0;
int ccount=0;
%}
                                                                                                                                                                        
%%
[a|i|e|o|u|E|A|I|O|U] {vcount++;}
[a-zA-Z ^(a|e|i|o|u|A|E|I|O|U)] {ccount++; }
%%
                                                                                                                                                                        
int yywrap(void) { return 1; }
                                                                                                                                                                        
int main(){
        printf("Enter the string:\t");
        yylex();                                                                                                                                                        
        printf("No. of Vowels :%d\n",vcount);
        printf("\n");
        return 0;
}              