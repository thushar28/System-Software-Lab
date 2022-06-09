%{
	#include "y.tab.h"
%}
%%
a  {return A;}
b  {return B;}
"\n"  {return ENTER;}
. {printf("\nInvalid input");exit(0);}
%%		
