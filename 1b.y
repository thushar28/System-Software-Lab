%{
	#include<stdio.h>
	//#include<stdlib.h>
	//int yyerror();
	//int yylex();
%}
%token  NUM ENTER
%left '+' '-'
%left '*' '/'
%%
input:  expr ENTER{printf("Result is %d\n",$$); exit(0);}
expr: expr '+'expr{$$=$1+$3;}
|expr '-' expr{$$=$1-$3;}
|expr '*' expr{$$=$1*$3;}
|expr '/' expr{if($3==0){printf("divide by zero error");exit (0);}else $$=$1/$3;}
|NUM{$$=$1;};
%%			 
void main()
{
	printf("Enter the Expression");
	yyparse();
}
int yyerror()
{
	printf("Invalid expression\n");
	exit(0);
}		
