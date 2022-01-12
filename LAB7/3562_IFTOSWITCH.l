%{
#include<stdio.h>
                                                                                                                                                                        
#define MAX 1000
                                                                                                                                                                        
char type[MAX];
                                                                                                                                                                        
int datatype=0;
                                                                                                                                                                        
char var[MAX];
                                                                                                                                                                        
char cond[MAX][MAX];
                                                                                                                                                                        
int charfound=0;
                                                                                                                                                                        
int count=1;
                                                                                                                                                                        
int print=0,execst=0;
                                                                                                                                                                        
int j=0,k=0,varfound=0,equalop=0;
                                                                                                                                                                        
int condfound=0;
                                                                                                                                                                        
char ex[MAX][MAX];
                                                                                                                                                                        
char otherst[MAX];
                                                                                                                                                                        
int ip=0;
                                                                                                                                                                        
int printfound=0;
%}
                                                                                                                                                                        
%%
                                                                                                                                                                        
"char"|"int" {
                                                                                                                                                                        
        datatype=1;
                                                                                                                                                                        
        strcpy(type,yytext);    
        
}
                                                                                                                                                                        
[a-zA-Z0-9]+ {
                                                                                                                                                                        
        if(datatype==1){
                                                                                                                                                                        
                strcpy(var,yytext);                                                                                                                                     
                                                                                                                                                                        
                datatype=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(ip==1){
                                                                                                                                                                        
                strcat(otherst,yytext);                                                                                                                                 
                                                                                                                                                                        
                strcat(otherst,")");
                                                                                                                                                                        
                strcat(otherst,";");
                                                                                                                                                                        
                ip=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(equalop==1 && charfound==1 && strcmp(type,"char")==0){
                                                                                                                                                                        
                strcpy(cond[j],"\'");
                                                                                                                                                                        
                strcat(cond[j],yytext);                                                                                                                                 
                                                                                                                                                                        
                strcat(cond[j],"\'");
                                                                                                                                                                        
                j++;                                                                                                                                                    
                                                                                                                                                                        
                charfound=0;
                                                                                                                                                                        
                condfound=0;
	
	 equalop=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        else if(equalop==1 && strcmp(type,"int")==0){
                                                                                                                                                                        
                strcpy(cond[j],yytext);                                                                                                                                 
                                                                                                                                                                        
                j++;                                                                                                                                                    
                                                                                                                                                                        
                condfound=0;
                                                                                                                                                                        
                equalop=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(execst==1 && print==1){
                                                                                                                                                                        
                strcat(ex[k],yytext);                                                                                                                                   
                                                                                                                                                                        
                strcat(ex[k]," ");
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
}
                                                                                                                                                                        
";" {
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
")" {
                                                                                                                                                                        
        int i,p,index=-1;
                                                                                                                                                                        
        if(print==1){

	 for(i=0;i<strlen(ex[k]);i++){
                                                                                                                                                                        
                        if(ex[k][i]==' ')
                                                                                                                                                                        
                                index=i;                                                                                                                                
                                                                                                                                                                        
                }                                                                                                                                                       
                                                                                                                                                                        
                char str[MAX];
                                                                                                                                                                        
                if(index!=-1){
                                                                                                                                                                        
                        for(i=0,p=0;i<strlen(ex[k]);i++){
                                                                                                                                                                        
                                if(i!=index){
                                                                                                                                                                        
                                        str[p]=ex[k][i];                                                                                                                
                                                                                                                                                                        
                                        p++;                                                                                                                            
                                }                                                                                                                                       
                        }                                                                                                                                               
                                                                                                                                                                        
                }                                                                                                                                                       
                                                                                                                                                                        
                str[p]='\0';
                                                                                                                                                                        
                strcpy(ex[k],str);                                                                                                                                      
                                                                                                                                                                        
                strcat(ex[k],"\"");
                                                                                                                                                                        
                strcat(ex[k],yytext);                                                                                                                                   
                                                                                                                                                                        
                strcat(ex[k],";");
                                                                                                                                                                        
                k++;                                                                                                                                                    
                                                                                                                                                                        
                printfound=1;

                print=0;
                                                                                                                                                                        
        }                                                                                                                                                               
}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
\" {
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
"{" {
                                                                                                                                                                        
        execst=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
"}" {
                                                                                                                                                                        
        execst=0;
                                                                                                                                                                        
        if(printfound==0)
                                                                                                                                                                        
                k++;                                                                                                                                                    
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
"printf(" {
                                                                                                                                                                        
        print=1;
                                                                                                                                                                        
        strcpy(ex[k],yytext);                                                                                                                                           
                                                                                                                                                                        
        strcat(ex[k],"\"");
}
                                                                                                                                                                        
                                                                                                                                                                        
"==" {
                                                                                                                                                                        
        equalop=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
' {
                                                                                                                                                                        
        if(count%2==1)
                                                                                                                                                                        
                charfound=1;
                                                                                                                                                                        
        count++;                                                                                                                                                        
                                                                                                                                                                        
}
                                                                                                                                                                        
"\n" {
                                                                                                                                                                        
}
                                                                                                                                                                        
"if("|"else if("|"else" {
                                                                                                                                                                        
        condfound=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
"scanf(" {
                                                                                                                                                                        
        strcat(otherst,yytext);                                                                                                                                         
                                                                                                                                                                        
        ip=1;
                                                                                                                                                                        
}

"%d"|"%c" {
                                                                                                                                                                        
        strcat(otherst,"\"");
                                                                                                                                                                        
        strcat(otherst,yytext);                                                                                                                                         
                                                                                                                                                                        
        strcat(otherst,"\"");
                                                                                                                                                                        
}
                                                                                                                                                                        
","|"&" {
                                                                                                                                                                        
        strcat(otherst,yytext);                                                                                                                                         
                                                                                                                                                                        
}
                                                                                                                                                                        
%%
                                                                                                                                                                        
int yywrap(void){ return 1; }
                                                                                                                                                                        
int main(int argc,char* argv[]){
                                                                                                                                                                        
        yylex();                                                                                                                                                        
                                                                                                                                                                        
        int i,l;
                                                                                                                                                                        
        printf("\t\tIF-ELSE TO SWITCH CONVERSION\n");
                                                                                                                                                                        
        printf("%s %s;\n",type,var);
                                                                                                                                                                        
        printf("%s\n",otherst);
                                                                                                                                                                        
        printf("switch(%s){\n",var);
                                                                                                                                                                        
        for(i=0,l=0;i<j,l<k;i++,l++){
                                                                                                                                                                        
                if(strcmp(cond[i],"")==0){
		
		 printf("\tdefault:\n");
                                                                                                                                                                        
                        printf("\t\t%s\n",ex[l]);
                                                                                                                                                                        
                }                                                                                                                                                       
                else{
                                                                                                                                                                        
                        printf("\tcase %s:\n",cond[i]);
                                                                                                                                                                        
                        if(strcmp(ex[l],"")!=0)
                                                                                                                                                                        
                                printf("\t\t%s\n",ex[l]);
                                                                                                                                                                        
                        printf("\t\tbreak;\n");
                                                                                                                                                                        
                }                                                                                                                                                       
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        printf("}\n");
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}                             
                                                                                                                                        
                                                                                                                                                  