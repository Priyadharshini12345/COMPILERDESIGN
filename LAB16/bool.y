%token ID NUM                                                                                                                                                           
                                                                                                                                                                        
%right '='                                                                                                                                                              
                                                                                                                                                                        
%left '+' '-'                                                                                                                                                           
                                                                                                                                                                        
%left '*' '/'                                                                                                                                                           
                                                                                                                                                                        
%left UMINUS                                                                                                                                                            
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
S : E { printf("\n"); return 0; }                                                                                                                                       
                                                                                                                                                                        
  ;                                                                                                                                                                     
                                                                                                                                                                        
E :V '='{push();} E{codegen_assign();}                                                                                                                                  
                                                                                                                                                                        
| E '|' { push(); } '|' { push(); } E { codegen(); }                                                                                                                    
                                                                                                                                                                        
|E '&' { push(); } '&' { push(); } '!' { push(); } E { codegen_umin(); codegen(); }                                                                                     
                                                                                                                                                                        
| E '&' { push(); } '&' { push(); } E { codegen(); }                                                                                                                    
                                                                                                                                                                        
| E1 '&'{push();} '&' { push(); } E1 { codegen(); }                                                                                                                     
                                                                                                                                                                        
| E1 '|' { push(); } '|' { push(); } E1 { codegen(); }                                                                                                                  
                                                                                                                                                                        
| E1 '^' { push(); } E1 { codegen(); }                                                                                                                                  
                                                                                                                                                                        
| '(' E ')'                                                                                                                                                             
                                                                                                                                                                        
| '!' { push(); } '(' E { codegen_umin(); } ')'                                                                                                                         
                                                                                                                                                                        
| E1                                                                                                                                                                    
                                                                                                                                                                        
| V                                                                                                                                                                     
                                                                                                                                                                        
| NUM{push();}                                                                                                                                                          
                                                                                                                                                                        
  ;                                                                                                                                                                     
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
E1: V '+' { push(); } V { codegen(); }                                                                                                                                  
                                                                                                                                                                        
| V '-' { push(); } V { codegen(); }                                                                                                                                    
                                                                                                                                                                        
| V '*' { push(); } V { codegen(); }                                                                                                                                    
                                                                                                                                                                        
| V '/' { push(); } V { codegen(); }                                                                                                                                    

| V '>' { push(); } V { codegen(); }                                                                                                                                    
                                                                                                                                                                        
| V '<' { push(); } V { codegen(); }                                                                                                                                    
                                                                                                                                                                        
| '(' E1 ')'                                                                                                                                                            
                                                                                                                                                                        
| '!' {push(); } '(' E1 ')' { codegen_umin(); }                                                                                                                         
                                                                                                                                                                        
| NUM { push(); }                                                                                                                                                       
                                                                                                                                                                        
| V;                                                                                                                                                                    
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
V : ID {push();}                                                                                                                                                        
                                                                                                                                                                        
| '!' {push(); } ID {push(); }                                                                                                                                          
                                                                                                                                                                        
| NUM { push(); }                                                                                                                                                       
  ;                                                                                                                                                                     
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
#include "lex.yy.c"                                                                                                                                                     
                                                                                                                                                                        
char st[100][10];                                                                                                                                                       
                                                                                                                                                                        
int top=0;                                                                                                                                                              
                                                                                                                                                                        
char i_[2]="0";                                                                                                                                                         
                                                                                                                                                                        
char temp[2]="t";                                                                                                                                                       
                                                                                                                                                                        
int lnum=1;                                                                                                                                                             
                                                                                                                                                                        
int start=1;                                                                                                                                                            
                                                                                                                                                                        
void yyerror(){ printf("Error\n"); }                                                                                                                                    
                                                                                                                                                                        
int yywrap(){ return 1; }                                                                                                                                               
                                                                                                                                                                        
void main(){                                                                                                                                                            
                                                                                                                                                                        
         printf("Enter the expression : ");                                                                                                                             
                                                                                                                                                                        
         yyparse();                                                                                                                                                     
                                                                                                                                                                        
 }                                                                                                                                                                      
                                                                                                                                                                        
void push(){                                                                                                                                                            
                                                                                                                                                                        
         strcpy(st[++top],yytext);                                                                                                                                      
                                                                                                                                                                        
 }                                                                                                                                                                      
                                                                                                                                                                        
void codegen(){                                                                                                                                                         
                                                                                                                                                                        
         strcpy(temp,"t");                                                                                                                                              
                                                                                                                                                                        
         strcat(temp,i_);                                                                                                                                               
                                                                                                                                                                        
/*       if(strcmp(st[top-1],"!")==0){                                                                                                                                  

                printf("\t%s = %s %s %s %s %s\n",temp,st[top-4],st[top-3],st[top-2],st[top-1],st[top]);                                                                 
                                                                                                                                                                        
                top-=4;                                                                                                                                                 
*///    }                                                                                                                                                               
                                                                                                                                                                        
         if(strcmp(st[top-2],"!")==0 || (strcmp(st[top-2],"&")==0 && strcmp(st[top-1],"&")==0) || (strcmp(st[top-2],"|")==0 && strcmp(st[top-1],"|")==0)){              
                                                                                                                                                                        
                printf("\t%s = %s %s %s %s\n",temp,st[top-3],st[top-2],st[top-1],st[top]);                                                                              
                                                                                                                                                                        
                top-=3;                                                                                                                                                 
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        else{                                                                                                                                                           
                                                                                                                                                                        
         printf("\t%s = %s %s %s\n",temp,st[top-2],st[top-1],st[top]);                                                                                                  
                                                                                                                                                                        
         top-=2;                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        strcpy(st[top],temp);                                                                                                                                           
                                                                                                                                                                        
        i_[0]++;                                                                                                                                                        
                                                                                                                                                                        
 }                                                                                                                                                                      
                                                                                                                                                                        
void codegen_umin(){                                                                                                                                                    


         strcpy(temp,"t");                                                                                                                                              


         strcat(temp,i_);                                                                                                                                               



         printf("\t%s = !%s\n",temp,st[top]);                                                                                                                           


         top--;                                                                                                                                                         



         strcpy(st[top],temp);                                                                                                                                          

                                                                                                                                                                        
         i_[0]++;                                                                                                                                                       

}                                                                                                                                                                       
                                                                                                                                                                        
void codegen_assign(){                                                                                                                                                  
                                                                                                                                                                        
        printf("\t%s = %s\n",st[top-2],st[top]);                                                                                                                        
                                                                                                                                                                        
         top-=2;                                                                                                                                                        
}                                                                                                                                                                       
                                          