%{
#include<stdio.h>
#include<math.h>
        int op1,op2;
        int count=1;
        char c;
        int mul();
        int sub();
        int add();
        int divi();
        int i,res=0;
%}
                                                                                                                                                                        
%%
                                                                                                                                                                        
[0-9]+ { if(count==1) {op1=atof(yytext); count++;}  if(count==2) op2=atof(yytext); }
                                                                                                                                                                        
[+\-\*\/] {
                                                                                                                                                                        
        c=yytext[0];
}
\n {
        if(c=='+'){
                add();                                                                                                                                                  
                return 0;
        }                                                                                                                                                               
        else if(c=='-'){
                sub();                                                                                                                                                  
                return 0;
        }                                                                                                                                                               
        else if(c=='*'){
                mul();                                                                                                                                                  
                return 0;
        }                                                                                                                                                               
                                                                                                                                                                        
        else if(c=='/'){
                divi();                                                                                                                                                 
                return 0;
        }         
	 else{
                printf("Other operations not supported\n");
                return 0;
        }                                                                                                                                                               
                                                                                                                                                                        
}
%%
                                                                                                                                                                        
int add(){
                                                                                                                                                                        
        int a=op1;
        int b=op2;
                                                                                                                                                                        
        while(b!=0){
                unsigned carry=a&b;
                a=a^b;                                                                                                                                                  
                b=carry<<1;
        }                                                                                                                                                               
        printf("Operand 1=%d\n",op1);
        printf("Operand 2=%d\n",op2);
                                                                                                                                                                        
        printf("\nThe steps are:\n");
        printf("int a=op1;\nint b=op2;\n\twhile(b!=0){\n \t\tunsigned carry=a&b;\n\t\t a=a^b;\n \t\tb=carry<<1;\n\t}");
        printf("\n\nSum: %d\n",a);
                                                                                                                                                                        
        return 0;
}
                                                                                                                                                                        
int sub(){
                                                                                                                                                                        
        int a=op1;
        int b=op2;
                                                                                                                                                                        
        while(b!=0){
                int borrow=(~a)&b;
                a=a^b;                                                                                                                                                  
                b=borrow<<1;
        }                              printf("Operand 1=%d\n",op1);
        printf("Operand 2=%d\n",op2);
        printf("\nSteps are:\n");
                                                                                                                                                                        
        printf("int a=op1;\nint b=op2;\n\twhile(b!=0){\n \t\tint borrow=(~a)&b;\n\t\ta=a^b;\n\t\tb=borrow<<1;\n}\n\t");
                                                                                                                                                                        
                                                                                                                                                                        
        printf("\n\nDifference: %d\n",a);
        return 0;
}                                                                                                                                                                       
                                                                                                                                                                        
int mul(){
        unsigned int rs=0;
        unsigned int y=op2;
        unsigned int x=op1;
                                                                                                                                                                        
        while(y!=0){
                if(y & 1){
                        rs+=x;                                                                                                                                          
                }                                                                                                                                                       
                x=x<<1;
                y=y>>1;
        }                                                                                                                                                               
                                                                                                                                                                        
        printf("Operand 1= %d\n",op1);
        printf("Operand 2= %d\n",op2);
        printf("\nSteps are: \n");
                                                                                                                                                                        
        printf("unsigned int rs=0;\nunsigned int y=op2;\nunsigned int x=op1;\nwhile(y!=0){\n\tif(y&1){\n\t\t rs+=x;\n\t}\n\tx=x<<1;\n\ty=y>>1;\n}\n");
                                                                                                                                                                        
        printf("\n\nProduct: %d\n",rs);
        return 0;
}                            

int divi(){
                                                                                                                                                                        
        int i;
                                                                                                                                                                        
        for(i=0;i<=100000;i++){
                double p=pow(2,i);
                if((int)p==op2)
                        break;
        }                                                                                                                                                               
                                                                                                                                                                        
        int rs=op1>>i;
                                                                                                                                                                        
        printf("Operand 1=%d\n",op1);
        printf("Operand 2=%d\n",op2);
        printf("\nSteps are: \n");
                                                                                                                                                                        
        printf("\tfor(int i=0;i<=100000;i++){\n\t\tdouble p=pow(2,i);\n\t\tif((int)p==op2)\n\t\t\tbreak;\n\t}\n\tint rs=op1>>i;\n\n");
                                                                                                                                                                        
        printf("Quotient: %d\n\n",rs);
        return 0;
}
                                                                                                                                                                        
int yywrap(void) { return 1; }
                                                                                                                                                                        
int main(){
                                                                                                                                                                        
        printf("Enter the arithmetic expression\n");
        yylex();                                                                                                                                                        
        return 0;
}                                                                                                                                                      
