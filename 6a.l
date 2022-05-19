%{	
		#include<stdio.h>
		int c1=0,c2=0,i=0;
%}
%%
[/][/].* {c1++;}
[/][*] {if(i==0) i++;}
[*][/] {if (i==1) i--; c2++;}
. {if(i==0) ECHO;}
%%		
void main()
{
	yyin=fopen("6atest.c","r");
	yyout=fopen("output6a.txt","w");
	yylex();
	printf("Single line comments:%d\n",c1);
	printf("Multiline comment:%d\n",c2);
	printf("Total number of comments:%d\n",c1+c2);
}
	
