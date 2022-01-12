%{                                                                                                                                                                      
        #include<stdio.h>                                                                                                                                               

        #include<stdlib.h>                                                                                                                                              

        #include "y.tab.h"                                                                                                                                              

%}                                                                                                                                                                      

alpha [a-zA-Z]                                                                                                                                                          
                                                                                                                                                                        
digit [0-9]+                                                                                                                                                            
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
[\n\t] ;                                                                                                                                                                
                                                                                                                                                                        
int|float|double|char|void { return TYPE; }                                                                                                                             
                                                                                                                                                                        
{alpha}({alpha}|{digit})* { return ID; }                                                                                                                                
                                                                                                                                                                        
{digit} { return NUM; }                                                                                                                                                 
                                                                                                                                                                        
. { return yytext[0]; }                                                                                                                                                 
                                                                                                                                                                        
%%                               