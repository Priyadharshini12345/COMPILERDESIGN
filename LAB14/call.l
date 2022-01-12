%{                                                                                                                                                                      
        #include<stdio.h>                                                                                                                                               
                                                                                                                                                                        
        #include<stdlib.h>                                                                                                                                              
                                                                                                                                                                        
        #include<string.h>                                                                                                                                              
                                                                                                                                                                        
        #include "y.tab.h"                                                                                                                                              
                                                                                                                                                                        
%}                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
alpha [a-zA-Z]                                                                                                                                                          
                                                                                                                                                                        
digit [0-9]+                                                                                                                                                            
                                                                                                                                                                        
                                                                                                                                                                        
%%                                                                                                                                                                      
                                                                                                                                                                        
[\n\t] ;                                                                                                                                                                
                                                                                                                                                                        
int|char|float|double { return TYPE; }                                                                                                                                  
                                                                                                                                                                        
{digit} { return NUM; }                                                                                                                                                 
                                                                                                                                                                        
{alpha}({alpha}|{digit})* { return ID; }                                                                                                                                
                                                                                                                                                                        
. return yytext[0];                                                                                                                                                     
                                                                                                                                                                        
%%                              