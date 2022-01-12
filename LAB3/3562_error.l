%{
#include<stdio.h>
%}

%%
[\t][int]{3} {
                unput('t'); unput('n'); unput('i'); }
                                                                                                                                                                        
[\t][char]{4} {
                unput('r'); unput('a'); unput('h'); unput('c'); }
                                                                                                                                                                        
[\t][void]{4} {
                unput('d'); unput('i'); unput('o'); unput('v'); }
                                                                                                                                                                        
[\t][float]{5} {
                unput('t'); unput('a'); unput('o'); unput('l'); unput('f'); }
                                                                                                                                                                        
[\t][double]{6} {
                unput('e'); unput('l'); unput('b'); unput('u'); unput('o'); unput('d'); }
                                                                                                                                                                        
%%
                                                                                                                                                                        
int yywrap(void) { return 1; }
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        char file[100];
                                                                                                                                                                        
        printf("Enter file to read\n");
        scanf("%s",file);
                                                                                                                                                                        
        FILE* fp1,*fp2;
                                                                                                                                                                        
        fp1=fopen(file,"rw");
                                                                                                                                                                        
        yyin=fp1;                                                                                                                                                       
                                                                                                                                                                        
        fp2=fopen("output.txt","w");
                                                                                                                                                                         
        yyout=fp2;                                                                                                                                                      
                                                                                                                                                                        
        yylex();                                                                                                                                                        
                                                                                                                                                                        
        fclose(fp1);                                                                                                                                                    
                                                                                                                                                                        
        fclose(fp2);                                                                                                                                                    
                                                                                                                                                                        
        return 0;
}