%{
#include<stdio.h>

int id=0,dig=0,op=0,key=0;
extern FILE *yyin;
%}
%token ID DIG OP KEY
%%
input:KEY input{key++;}
|ID input{id++;}

|DIG input{dig++;}

|OP input{op++;}



|ID{id++;}
|DIG{dig++;}
|OP{op++;}
|KEY{key++;}
; 
%%
void main()
{
	yyin=fopen("sample.txt","r");
	yyparse();
	printf("Id count is %d\n",id);
	printf("Digit count is %d\n",dig);
	printf("Operator count is %d\n",op);
	printf("Keyword count is %d\n",key);
}
int yyerror(){
	printf("Invalid input");
	return 0;
}
