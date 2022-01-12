%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<string.h>                                                                                                                                                      
struct loops{                                                                                                                                                           
char init[20], cond[20], step[20], buff[300];                                                                                                                           
int isInit, isCond,isStep, isStmts, flag, cpFlag, opFlag;                                                                                                               
};                                                                                                                                                                      
struct loops l[3];                                                                                                                                                      
int i = -1, a = 67;                                                                                                                                                     
char temp;                                                                                                                                                              
%}                                                                                                                                                                      
                                                                                                                                                                        
%%                                                                                                                                                                      
"for(" {                                                                                                                                                                
        i++;                                                                                                                                                            
        l[i].isInit = 1;                                                                                                                                                
        l[i].isCond = 0, l[i].isStep = 0, l[i].isStmts = 0, l[i].flag = 0, l[i].cpFlag = 0, l[i].opFlag = 1;                                                            
}                                                                                                                                                                       
                                                                                                                                                                        
; {                                                                                                                                                                     
        l[i].flag++;                                                                                                                                                    
        if(l[i].flag == 1){                                                                                                                                             
                l[i].isInit = 0;                                                                                                                                        
                l[i].isCond = 1;                                                                                                                                        
        }                                                                                                                                                               
        else if(l[i].flag == 2){                                                                                                                                        
                l[i].isCond = 0;                                                                                                                                        
                l[i].isStep = 1;                                                                                                                                        
        }                                                                                                                                                               
        else strcat(l[i].buff,";");                                                                                                                                     
}                                                                                                                                                                       
                                                                                                                                                                        
")" {                                                                                                                                                                   
        if(l[i].opFlag == 1){                                                                                                                                           
                l[i].isStep = 0;                                                                                                                                        
                l[i].isStmts = 1;                                                                                                                                       
                l[i].opFlag = 0;                                                                                                                                        
        }                                                                                                                                                               
        else REJECT;                                                                                                                                                    
}                                                                                                                                                                       
                                                                                                                                                                        
"{" l[i].cpFlag++;                                                                                                                                                      
                                                                                                                                                                        
"}" {                                                                                                                                                                   
        l[i].cpFlag--;                                                                                                                                                  
        if(l[i].cpFlag == 0){                                                                                                                                           
                strcat(l[i].buff,"\t");                                                                                                                                 
                strcat(l[i].buff,l[i].step);                                                                                                                            
                strcat(l[i].buff,";");                                                                                                                                  
                i--;                                                                                                                                                    
                if(i<0) return 0;                                                                                                                                       
                if(i >= 0){                                                                                                                                             
                strcat(l[i].buff,l[i+1].init);                                                                                                                          
                a++;                                                                                                                                                    
                temp = a;                                                                                                                                               
                strcat(l[i].buff,";\n\t");                                                                                                                              
                strcat(l[i].buff,&temp);                                                                                                                                
                strcat(l[i].buff,":\n");                                                                                                                                
                strcat(l[i].buff,"\tif(");                                                                                                                              
                strcat(l[i].buff,l[i+1].cond);                                                                                                                          
                strcat(l[i].buff,"){");                                                                                                                                 
                strcat(l[i].buff,l[i+1].buff);                                                                                                                          
                strcat(l[i].buff,"\n\t\tGOTO ");                                                                                                                        
                strcat(l[i].buff,&temp);                                                                                                                                
                strcat(l[i].buff,";\n\t}");                                                                                                                             
                }                                                                                                                                                       
        }                                                                                                                                                               
        else REJECT;                                                                                                                                                    
}                                                                                                                                                                       
                                                                                                                                                                        
"\n" {                                                                                                                                                                  
        if(l[i].isInit) strcat(l[i].init,yytext);                                                                                                                       
        else if(l[i].isCond) strcat(l[i].cond,yytext);                                                                                                                  
        else if(l[i].isStep) strcat(l[i].step,yytext);                                                                                                                  
        else if(l[i].isStmts) strcat(l[i].buff,yytext);                                                                                                                 
}                                                                                                                                                                       
                                                                                                                                                                        
. {                                                                                                                                                                     
        if(l[i].isInit) strcat(l[i].init,yytext);                                                                                                                       
        else if(l[i].isCond) strcat(l[i].cond,yytext);                                                                                                                  
        else if(l[i].isStep) strcat(l[i].step,yytext);                                                                                                                  
        else if(l[i].isStmts) strcat(l[i].buff,yytext);                                                                                                                 
}                                                                                                                                                                       
%%                                                                                                                                                                      
                                                                                                                                                                        
int yywrap(){}                                                                                                                                                          
                                                                                                                                                                        
int main(int argc, char* argv[]){                                                                                                                                       
        if(argc>1){                                                                                                                                                     
                FILE *fp = fopen("loop.txt","r");                                                                                                                       
                if(fp)                                                                                                                                                  
                        yyin = fp;                                                                                                                                      
        }                                                                                                                                                               
        yylex();                                                                                                                                                        
        FILE *fp1 = fopen("output.txt","w");                                                                                                                            
        fprintf(fp1,"%s;\nloop:\nif(%s){%s\n\tGOTO loop;\n}\n",l[0].init,l[0].cond,l[0].buff);                                                                          
        fclose(fp1);                                                                                                                                                    
        return 0;                                                                                                                                                       
} 