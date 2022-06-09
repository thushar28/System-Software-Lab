%{
#include<stdio.h>
%}
%token A B ENTER
%%
stmt:s ENTER{printf("valid grammer");exit(0);}
s: A s1 B| B 
s1: ; 
| A s1
;
%%
void main()
{
	printf("enter the string\n");
	yyparse();
}
int yyerror()
{
printf("Invalid Expression\n");
}
