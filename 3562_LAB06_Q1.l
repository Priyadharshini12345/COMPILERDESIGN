%{
                                                                                                                                                                        
#include<stdio.h>
                                                                                                                                                                        
#define SIZE 200
                                                                                                                                                                        
int mainflag=0,found=0;
                                                                                                                                                                        
char name[SIZE];
                                                                                                                                                                        
char vartype[SIZE][SIZE];
                                                                                                                                                                        
char varname[SIZE][SIZE];
                                                                                                                                                                        
char object[SIZE][SIZE];
                                                                                                                                                                        
char arrname[SIZE];
                                                                                                                                                                        
int j=0,k=0,val=0,q=0,o=0,p=0,init=0,namefound=0,typefound=0;
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
"int main()" {
        mainflag=1;
}
                                                                                                                                                                        
                                                                                                                                                                        
"]"|"{"|"};"|"return"|"}" {
                                                                                                                                                                        
        //keywords
                                                                                                                                                                        
        if(strcmp("};",yytext)==0){
                                                                                                                                                                        
                found=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
        }                                                                                                                                                               
}
                                                                                                                                                                        
                                                                                                                                                                        
";" {
                                                                                                                                                                        
        if(mainflag==0)
                                                                                                                                                                        
                k++;                                                                                                                                                    
                                                                                                                                                                        
}
                                                                                                                                                                        
[0-9]+ {
                                                                                                                                                                        
        char ch2=']';
                                                                                                                                                                        
        val=atof(yytext);                                                                                                                                               
                                                                                                                                                                        
        if(val!=0 && val!=1){
                                                                                                                                                                        
              sprintf(varname[k],"%s%d%c",arrname,val,ch2);
                                                                                                                                                                        
              varname[k][strlen(varname[k])+1]='\0';
                                                                                                                                                                        
              val=0;
                                                                                                                                                                        
              memset(arrname,0,sizeof(arrname));
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
}
                                                                                                                                                                        
"struct" {
                found=1;
                                                                                                                                                                        
}
"int"|"char"|"double"|"float" {
                                                                                                                                                                        
        strcpy(vartype[k],yytext);                                                                                                                                      
                                                                                                                                                                        
        typefound=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
[a-zA-Z]+\[ {
                                                                                                                                                                        
        if(typefound==1){
                                                                                                                                                                        
                strcpy(arrname,yytext);
                                                                                                                                                                        
                typefound=0;
        }
                                                                                                                                                                        
}
                                                                                                                                                                        
[a-zA-Z]+ {
                                                                                                                                                                        
        if(found==1 && namefound==0)
                                                                                                                                                                        
                strcpy(name,yytext);                                                                                                                                    
                                                                                                                                                                        
        namefound=1;
                                                                                                                                                                        
        if(typefound==1){
                                                                                                                                                                        
                strcpy(varname[k],yytext);                                                                                                                              
                                                                                                                                                                        
                typefound=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
         if(mainflag==1 && init==1){
                                                                                                                                                                        
                strcpy(object[q],yytext); 

  	q++;                                                                                                                                                    
                                                                                                                                                                        
                init=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(found==1 && mainflag==1 && strcmp(name,yytext)==0){
                                                                                                                                                                        
                init=1;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
"\n" {
                                                                                                                                                                        
        int i;
                                                                                                                                                                        
        printf("\n\nC++ CONVERSION:\n");
                                                                                                                                                                        
        printf("class %s { \n",name);
                                                                                                                                                                        
        printf("\tpublic:\n");
                                                                                                                                                                        
        for(i=0;i<k;i++)
                                                                                                                                                                        
                printf("\t\t%s %s;\n",vartype[i],varname[i]);
                                                                                                                                                                        
        printf("\t\t%s(){\n",name);
                                                                                                                                                                        
        for(i=0;i<k;i++){
                                                                                                                                                                        
                if(strcmp(vartype[i],"char")!=0)
                                                                                                                                                                        
                        printf("\t\t\t%s=0;\n",varname[i]);
                else
		 printf("\t\t\t%s=\'\\0\';\n",varname[i]);
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        printf("\t\t}\n");
                                                                                                                                                                        
        printf("\t\t~%s(){\n",name);
                                                                                                                                                                        
        printf("\t\t\tcout<<\"Destructor invoked\"<<endl;\n\t\t}\n");
                                                                                                                                                                        
        printf("};\n");
                                                                                                                                                                        
        printf("int main(){ \n");
                                                                                                                                                                        
        for(i=0;i<q;i++)
                                                                                                                                                                        
                printf("\t%s %s;\n",name,object[i]);
                                                                                                                                                                        
        printf("\treturn 0;\n");
                                                                                                                                                                        
        printf("}\n\n");
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}
                                                                                                                                                                        
%%
                                                                                                                                                                        
int yywrap(void){ return 0 ; }
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        printf("Enter the c snippet\n");
                                                                                                                                                                        
        yylex();                                                                                                                                                        
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}                                                                                                                                                                       
 