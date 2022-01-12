#include<string.h>
char stop[20][20],normal[20][20],i=0,j=0;                                                                                                                   
char list[110][30]={"he","him","his","himself","she","her","hers","herself","it","its","itself","they","them","their","theirs","themselves","what","which","who","whom",
"this","that","these","those","am","is","are","was","were","be","been","being","have",
"has","had","having","do","does","did","doing","a","an","the","and","but","if","or","because","as","until","while","of","at","by","for","with","about","against","betwee
n","into","through","during","before","after","above","below","to"
"if","or","because","as","until","while","of","at","by","for","further"
,"then","once","here","there","when","where","why","how","all","any","both","each","few","more","most","other","some","such","no","nor","not","only","own","same","so","
than","too","very","can","will","just","should"};
                                                                                                                                                                        
void check(char* string);
void printwords();
%}
                                                                                                                                                                        
%%
[a-zA-Z0-9]+ {check(yytext); }
[ ] { }
\n {printwords(); return 0; }
%%
                                                                                                                                                                        
int yywrap() {return 1; }
                                                                                                                                                                        
int main(){
        printf("Enter string: \n");
        yylex();                                                                                                                                                        
        return 0;
}
                                                                                                                                                                        
void check(char* str){
        int k;
        for(k=0;k<110;k++){
                if(strcmp(list[k],str)==0){
                        strcpy(stop[i++],str);                                                                                                                          
                        return;
        }                                                                                                                                                               
        }                   
  strcpy(normal[j++],str);                                                                                                                                        
}
                                                                                                                                                                        
void printwords(){
        int k;
        printf("Stop words:\n");
        for(k=0;k<i;k++)
                printf("%s\t", stop[k]);
        printf("\n");
        printf("Other words:\n");
        for(k=0;k<j;k++)
                printf("%s\t",normal[k]);
        printf("\n");
}