%{
                                                                                                                                                                        
        #include<stdio.h>
                                                                                                                                                                        
        #include<stdlib.h>
                                                                                                                                                                        
        int yylex();
                                                                                                                                                                        
        FILE* yyin;
                                                                                                                                                                        
        char filename[200];
                                                                                                                                                                        
        void yyerror(){
                                                                                                                                                                        
                fprintf(stderr,"INVALID SWITCH CASE. SYNTAX ERROR\n\n");
                                                                                                                                                                        
        }
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%token INT CHAR SWITCH CASE BREAK NUM ID DEFAULT
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
S :  declaration expr { printf("\n\nVALID SWITCH CASE. PARSE TREE GENERATED\n\n"); return 0; };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
declaration: datatype var';' { printf("declaration->datatype var ';'\n"); };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
datatype: INT { printf("datatype->INT\n"); }
                                                                                                                                                                        
        | CHAR { printf("datatype->CHAR\n"); };
expr: SWITCH'('E')''{'case DEFAULT':'';'BREAK';''}' { printf("expr-> SWITCH'('E')''{'case DEFAULT':'';'BREAK';''}'\n"); }
                                                                                                                                                                        
   | SWITCH'('E')''{'case DEFAULT':' ';' '}' { printf("expr-> SWITCH'('E')''{'case DEFAULT':' ';' '}'\n"); }
                                                                                                                                                                        
   | SWITCH'('E')''{'case'}' { printf("expr-> SWITCH'('E')''{'case'}'\n"); };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
case: CASE ' ' NUM':' ';' BREAK ';' { printf("case->CASE ' ' NUM':' ';' BREAK ';'\n"); }
                                                                                                                                                                        
    | CASE ' ' '\'' ID '\'' ':' ';' BREAK ';' { printf("case-> CASE ' ' '\'' ID '\'' ':' ';' BREAK ';'\n"); }
                                                                                                                                                                        
    | case case { printf("case->case case\n"); }
                                                                                                                                                                        
    | ;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
var: ID { printf("var->ID\n"); }
                                                                                                                                                                        
 | ID '=' NUM { printf("var->ID = NUM\n"); }
                                                                                                                                                                        
 | ID '=' '\'' ID '\''{ printf("var->ID='ID'\n"); };
                                                                                                                                                                        
                                                                                                                                                                        
E: ID { printf("E->ID\n"); }
                                                                                                                                                                        
 | NUM { printf("E->NUM\n"); };
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%

                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        FILE* fp;
                                                                                                                                                                        
        printf("Enter filename\n\n");
                                                                                                                                                                        
        scanf("%s",filename);
                                                                                                                                                                        
        fp=fopen(filename,"r");
                                                                                                                                                                        
        printf("\nPARSE TREE: \n");
                                                                                                                                                                        
        if(fp!=NULL){
                                                                                                                                                                        
                yyin=fp;                                                                                                                                                
                yyparse();                                                                                                                                              
        }
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
}