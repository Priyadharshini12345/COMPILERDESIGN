%{

#include<stdio.h>
                                                                                                                                                                        
#define SIZE 200
                                                                                                                                                                        
int mainflag=0;
                                                                                                                                                                        
char vartype[SIZE][SIZE];
                                                                                                                                                                        
char output[SIZE][SIZE];
                                                                                                                                                                        
int j=0,print=0,k=0,val=0,count=1,q=0,o=0,p=0,format=0,typefound=0,inp=0;
                                                                                                                                                                        
char mainvar[SIZE][SIZE];
                                                                                                                                                                        
char inputarr[SIZE][SIZE];
                                                                                                                                                                        
%}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
"int main()" {
        mainflag=1;
}
                                                                                                                                                                        
"printf(" {
                                                                                                                                                                        
        print=1;
                                                                                                                                                                        
        strcpy(output[j],"cout<<");
                                                                                                                                                                        
}
                                                                                                                                                                        
"scanf(" {
                                                                                                                                                                        
        inp=1;
         strcpy(inputarr[o],"cin>>");
}
                                                                                                                                                                        
"%d"|"%c"|"%s"|"%f"|"%ld"|"%lf" {
                                                                                                                                                                        
//format specifiers
        format=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
\" {
                                                                                                                                                                        
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
"]"|";"|"{"|"return"|"}"|"," {
                                                                                                                                                                        
        //keywords
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
[0-9]+ {
                                                                                                                                                                        
        char ch2=']';
                                                                                                                                                                        
        val=atof(yytext);                                                                                                                                               
                                                                                                                                                                        
        if(mainflag==1 && val!=0 && val!=1){
                                                                                                                                                                        
                sprintf(mainvar[p],"%s%d%c",mainvar[p],val,ch2);
                                                                                                                                                                        
                val=0;
                
                  p++;                                                                                                                                                    
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
"int"|"char"|"double"|"float" {
                                                                                                                                                                        
        if(mainflag==1)
                                                                                                                                                                        
                strcpy(mainvar[p],yytext);                                                                                                                              
                                                                                                                                                                        
        typefound=1;
                                                                                                                                                                        
}
                                                                                                                                                                        
[a-zA-Z]+\[ {
                                                                                                                                                                        
        if(typefound==1){
                                                                                                                                                                        
                if(mainflag==1){
                                                                                                                                                                        
                        int size=strlen(mainvar[p]);
                                                                                                                                                                        
                        mainvar[p][size]=' ';
                                                                                                                                                                        
                        strcat(mainvar[p],yytext);
                                                                                                                                                                        
                }                                                                                                                                                       
                                                                                                                                                                        
                typefound=0;
                                                                                                                                                                        
        }                                                                                                                                                               
}
                                                                                                                                                                        
[a-zA-Z]+ {

	 if(typefound==1){
                                                                                                                                                                        
                if(mainflag==1){
                                                                                                                                                                        
                        int size=strlen(mainvar[p]);
                                                                                                                                                                        
                        mainvar[p][size]=' ';
                                                                                                                                                                        
                        strcat(mainvar[p],yytext);                                                                                                                      
                                                                                                                                                                        
                        p++;                                                                                                                                            
                                                                                                                                                                        
                }                                                                                                                                                       
                                                                                                                                                                        
                typefound=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(print==1){
                                                                                                                                                                        
               int size=strlen(output[j]);
                                                                                                                                                                        
                if(count!=1)
                                                                                                                                                                        
                output[j][size]=' ';
                                                                                                                                                                        
                if(format!=1)
                                                                                                                                                                        
                        strcat(output[j],"\"");
                                                                                                                                                                        
                strcat(output[j],yytext);                                                                                                                               
                                                                                                                                                                        
                count++;                                                                                                                                                
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        if(inp==1){

	 strcat(inputarr[o],yytext);                                                                                                                             
                                                                                                                                                                        
                strcat(inputarr[o],";");
                                                                                                                                                                        
                o++;                                                                                                                                                    
                                                                                                                                                                        
                inp=0;
                                                                                                                                                                        
                format=0;
                                                                                                                                                                        
        }                                                                                                                                                               
}
                                                                                                                                                                        
                                                                                                                                                                        
"\n" {
                                                                                                                                                                        
        int i;
                                                                                                                                                                        
        printf("\n\nC++ CONVERSION:\n");
                                                                                                                                                                        
        printf("int main(){ \n");
                                                                                                                                                                        
        for(i=0;i<p;i++)
                                                                                                                                                                        
                printf("\t%s;\n",mainvar[i]);
                                                                                                                                                                        
        for(i=0;i<o;i++)
                                                                                                                                                                        
                printf("\t%s\n",inputarr[i]);
                                                                                                                                                                        
        for(i=0;i<j;i++)
                                                                                                                                                                        
                printf("\t%s\n",output[i]);
                                                                                                                                                                        
        printf("\treturn 0;\n");
                                                                                                                                                                        
        printf("}\n\n");
        
         return 0;
                                                                                                                                                                        
}
                                                                                                                                                                        
"(" {
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
")" {
                                                                                                                                                                        
        if(print==1){
                                                                                                                                                                        
                if(format!=1)
                                                                                                                                                                        
                        strcat(output[j],"\";");
                                                                                                                                                                        
                else
                        strcat(output[j],";");
                                                                                                                                                                        
                j++;                                                                                                                                                    
                                                                                                                                                                        
                print=0;
                                                                                                                                                                        
                count=1;
                                                                                                                                                                        
                format=0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
                                                                                                                                                                        
}
                                                                                                                                                                        
",&" {
                                                                                                                                                                        
}

                                                                                                                                                                        
%%
                                                                                                                                                                        
int yywrap(void){ return 0 ; }
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        printf("Enter the c snippet\n");
                                                                                                                                                                        
        yylex();                                                                                                                                                        
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}
                                                                                                           