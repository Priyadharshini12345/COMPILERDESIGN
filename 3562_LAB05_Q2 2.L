%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<string.h>                                                                                                                                                      
int i = 0, flag = 1, val = 0, isParan = 0, j, isFunDec = 0, isParam = 0, k = 0;                                                                                         
struct symTable{                                                                                                                                                        
        char symbol[100];                                                                                                                                               
        char type[100];                                                                                                                                                 
        int size;                                                                                                                                                       
};                                                                                                                                                                      
struct symTable s[10],p[10];                                                                                                                                            
int dtSize(char *t);                                                                                                                                                    
%}                                                                                                                                                                      
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
[a-z]? {                                                                                                                                                                
        if(isParan){                                                                                                                                                    
                if(flag)                                                                                                                                                
                        strcat(s[i].type,yytext);                                                                                                                       
                else                                                                                                                                                    
                        strcat(s[i].symbol,yytext);                                                                                                                     
        }                                                                                                                                                               
        else if(isFunDec){                                                                                                                                              
                if(flag){                                                                                                                                               
                        if(isParam)                                                                                                                                     
                                strcat(p[k].type,yytext);                                                                                                               
                        else                                                                                                                                            
                                strcat(s[i].type,yytext);                                                                                                               
                }                                                                                                                                                       
                else{                                                                                                                                                   
                        if(isParam)                                                                                                                                     
                                strcat(p[k].symbol,yytext);                                                                                                             
                        else                                                                                                                                            
                                strcat(s[i].symbol,yytext);                                                                                                             
                }                                                                                                                                                       
        }                                                                                                                                                               
}                                                                                                                                                                       
                                                                                                                                                                        
[0-9]+ {                                                                                                                                                                
        val = atof(yytext);                                                                                                                                             
}                                                                                                                                                                       
                                                                                                                                                                        
[{\}\>\(\)] {                                                                                                                                                           
        if(yytext[0] == '{') isParan = 1;                                                                                                                               
        else if(yytext[0] == '}'){                                                                                                                                      
                return 0;                                                                                                                                               
        }                                                                                                                                                               
        else if(yytext[0] == '>') isFunDec = 1;                                                                                                                         
        else if(yytext[0] == '(') isParam = 1, flag = 1;                                                                                                                
        else if(yytext[0] == ')') isFunDec = 0, s[i].size = dtSize(s[i].type);                                                                                          
}                                                                                                                                                                       
                                                                                                                                                                        
" " {                                                                                                                                                                   
        if(isParan || isFunDec)                                                                                                                                         
                flag = 0;                                                                                                                                               
}                                                                                                                                                                       
                                                                                                                                                                        
[;\,] {                                                                                                                                                                 
        if(isParan){                                                                                                                                                    
        if(val == 0 || val ==1)                                                                                                                                         
                s[i].size = dtSize(s[i].type);                                                                                                                          
        else                                                                                                                                                            
                s[i].size = val*dtSize(s[i].type);                                                                                                                      
        val = 0;                                                                                                                                                        
        flag = 1;                                                                                                                                                       
        i++;                                                                                                                                                            
        }                                                                                                                                                               
        else if((yytext[0] == ',' || yytext[0] == ';') && isParam){                                                                                                     
                if(yytext[0] == ';') isParam = 0, i++;                                                                                                                  
                flag = 1;                                                                                                                                               
                p[k].size = dtSize(p[k].type);                                                                                                                          
                k++;                                                                                                                                                    
        }                                                                                                                                                               
}                                                                                                                                                                       
                                                                                                                                                                        
"\n"                                                                                                                                                                    
.                                                                                                                                                                       
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
int yywrap(){}                                                                                                                                                          
                                                                                                                                                                        
int main(int argc, char* argv[]){                                                                                                                                       
        if(argc>1){                                                                                                                                                     
                FILE* fp = fopen(argv[1],"r");                                                                                                                          
                if(fp)                                                                                                                                                  
                        yyin = fp;                                                                                                                                      
        }                                                                                                                                                               
        yylex();                                                                                                                                                        
        printf("Symbol table:-\nSymbol\tType\tSize\n");                                                                                                                 
        for(j = 0;j<i;j++){                                                                                                                                             
                printf("%s\t%s\t%d\n",s[j].symbol,s[j].type,s[j].size);                                                                                                 
        }                                                                                                                                                               
        printf("Function Parameters symbol table:-\nSymbol\tType\tSize\n");                                                                                             
        for(j = 0;j<k;j++){                                                                                                                                             
                printf("%s\t%s\t%d\n",p[j].symbol,p[j].type,p[j].size);                                                                                                 
        }                                                                                                                                                               
        return 0;                                                                                                                                                       
}                                                                                                                                                                       
                                                                                                                                                                        
int dtSize(char *t){                                                                                                                                                    
        if(strcmp(t,"int") == 0 || strcmp(t,"float") == 0)                                                                                                              
                return 4;                                                                                                                                               
        else if(strcmp(t,"char") == 0)                                                                                                                                  
                return 1;                                                                                                                                               
        else if(strcmp(t,"double") == 0)                                                                                                                                
                return 8;                                                                                                                                               
        return 0;                                                                                                                                                       
}