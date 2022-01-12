%{
        #include <stdio.h>
        #include <stdlib.h>
        int yylex();
                                                                                                                                                                        
        void yyerror(char * s){
                fprintf(stderr,"%s\n","while syntax error\n");
        }                                                                                                                                                               
%}
                                                                                                                                                                        
%token WHILE IDENTIFIER NUMBER LE GE EQ NE AND OR INC DEC
%left OR AND
%left '<' '>' LE GE NE EQ
%left INC DEC
%left '+' '-'
%left '*' '/'
%left '!'
                                                                                                                                                                        
%%
                                                                                                                                                                        
program : expr {printf("while accepted\n\n"); return 0; };
                                                                                                                                                                        
expr : WHILE'('condn')''{' upd'}';
                                                                                                                                                                        
upd :    IDENTIFIER INC ';'
        | IDENTIFIER DEC ';'
        | INC IDENTIFIER ';'
        | DEC IDENTIFIER ';'
        | upd upd
        | ;
condn : E '<' E
        | E '>' E
        | E LE E
        | E GE E
        | E EQ E
        | E NE E
        | E AND E
        | E OR E
        | '!' E
  | NUMBER
        |;
                                                                                                                                                                        
E :     E '<' E
        | E '>' E
        | E LE E
        | E GE E
        | E EQ E
        | E NE E
        | E AND E
        | E OR E
        | '!' E
        |IDENTIFIER
        | NUMBER;
                                                                                                                                                                        
%%
int main(){
                                                                                                                                                                        
        printf("Enter while loop construct: Input expression\n\n");
        yyparse();                                                                                                                                                      
        return 0;
}