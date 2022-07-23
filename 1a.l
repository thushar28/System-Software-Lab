%{
	#include<stdio.h>
	int identifiers=0,operators=0,braces=0,alpha=0,spaces=0;
%}
%%
[a-zA-Z] {alpha++;printf("\n Alphabet"); ECHO;}
[0-9]* {identifiers++;printf("\n Identifiers"); ECHO;}
[*|+] {operators++;printf("\nOperators:");ECHO;}
"(" {braces++;}
")" {braces--;}
[""]  {spaces++;}
.|\n {;}
%%
void main()
{
	printf("Enter the expression:");
	yylex();
	if((braces==0)&&(operators==identifiers-1&&alpha==0&&spaces==0))
	{
		printf("\n Valid expression");
		printf("\n Number of operators:%d",operators);
		printf("\n Number of identifiers:%d",identifiers);
	}
	else
	{
		printf("\n Invalid Expression");
	}	
	printf("\n");
}
	
