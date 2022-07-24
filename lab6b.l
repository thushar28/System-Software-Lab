%{
#include "y.tab.h"
#include<stdio.h>
extern int yylval;
%}

%%

void|int|float|printf|scanf|if|else|while|for|do|char|main {printf("\nkeyword is %s",yytext);return KEY;}
[a-zA-Z]* {printf("\nIdentifier is %s",yytext);return ID;}
[0-9]+ {yylval=atoi(yytext);printf("\nDigit is %d",yylval);return DIG;}
[+|-|*|<|>|=|%|/]* {printf("\nOperator is %s",yytext);return OP;}

. ;
%%

