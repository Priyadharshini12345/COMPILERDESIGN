%{
                                                                                                                                                                        
        #include <string.h>
                                                                                                                                                                        
        int init = 0, cond = 0, step = 0, buff_flag = 0;
                                                                                                                                                                        
        int init_size = 0, cond_size = 0, step_size = 0;
                                                                                                                                                                        
        int sccount = 0, close_flag = 0, paran_flag = 1;
                                                                                                                                                                        
        char init_buffer[20], cond_buffer[20], step_buffer[20], buffer[200];
                                                                                                                                                                        
%}
                                                                                                                                                                        
%option noyywrap
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
"for(" {
                                                                                                                                                                        
        printf("for found");
                                                                                                                                                                        
        init = 1;
                                                                                                                                                                        
        buffer[0] = '\0';
                                                                                                                                                                        
}
                                                                                                                                                                        
; {
                                                                                                                                                                        
        sccount++;                                                                                                                                                      
                                                                                                                                                                        
        if(sccount == 1) {
                                                                                                                                                                        
                init = 0;
                                                                                                                                                                        
                cond = 1;
                            }                                                                                                                                                               
                                                                                                                                                                        
        else if(sccount == 2) {
                                                                                                                                                                        
                cond = 0;
                                                                                                                                                                        
                step = 1;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        else
                                                                                                                                                                        
                strcat(buffer, ";");
                                                                                                                                                                        
}
                                                                                                                                                                        
")" {
                                                                                                                                                                        
        if(paran_flag == 1) {
                                                                                                                                                                        
                step = 0;
                                                                                                                                                                        
                buff_flag = 1;
                                                                                                                                                                        
                paran_flag = 0;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        else
                                                                                                                                                                        
                REJECT;                                                                                                                                                 
                                                                                                                                                                        
}
                    "{" {
                                                                                                                                                                        
        close_flag++;                                                                                                                                                   
                                                                                                                                                                        
        if(close_flag > 1)
                                                                                                                                                                        
                REJECT;                                                                                                                                                 
                                                                                                                                                                        
}
                                                                                                                                                                        
"}" {
                                                                                                                                                                        
        close_flag--;                                                                                                                                                   
                                                                                                                                                                        
        if(close_flag == 0) {
                                                                                                                                                                        
                strcat(buffer, step_buffer);                                                                                                                            
                                                                                                                                                                        
                strcat(buffer, ";");
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
        else
                                                                                                                                                                        
                REJECT;                                                                                                                                                 
                                                                                                                                                                        
}
                                                                                                                                                                        
. {
                                                                                                                                                                        
        if(init)
                                                                                                                                                                        
                strcat(init_buffer, yytext);                                                                                                                            
                                                                                                                                                                        
        else if(cond)
 	
	strcat(cond_buffer, yytext);                                                                                                                            
                                                                                                                                                                        
        else if(step)
                                                                                                                                                                        
                strcat(step_buffer, yytext);                                                                                                                            
                                                                                                                                                                        
        else if(buff_flag)
                                                                                                                                                                        
                strcat(buffer, yytext);                                                                                                                                 
                                                                                                                                                                        
        else {
                                                                                                                                                                        
                printf("ERROR!\n");
                                                                                                                                                                        
                return -1;
                                                                                                                                                                        
        }                                                                                                                                                               
                                                                                                                                                                        
}
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
%%
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        yylex();                                                                                                                                                        
                                                                                                                                                                        
        printf("%s;\nwhile(%s)\n{%s}\n", init_buffer, cond_buffer, buffer);
                                                                                                                                                                        
        printf("\n");
                                                                                                                                                                        
        return 0;
                                                                                                                                                                        
}               