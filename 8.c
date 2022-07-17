#include<stdio.h>
void main()
{
int alloc[7][5],max[7][5],need[7][5],avail[5],finish[7];
int rsrc[5],safe[5];
int p,r,count=0,i,j,total,loopc=1,k=0;
for(i=1;i<=7;i++)
finish[i]=0;
printf("Enter the no of processes : ");
scanf("%d",&p);
printf("\n\nEnter the no of resources : ");
scanf("%d",&r);
printf("\n\nEnter the allocation for each process : ");
for(i=1;i<=p;i++)
  {
	printf("\nFor process %d: ",i);
	for(j=1;j<=r;j++)
	scanf("%d",&alloc[i][j]);
  }
printf("\n\nEnter the max claim for each process : ");
for(i=1;i<=p;i++)
{
	printf("\nFor process %d: ",i);
	for(j=1;j<=r;j++)
m 	scanf("%d",&max[i][j]);
} 
printf("\n\nEnter total no of each resource : ");
for(j=1;j<=r;j++)
scanf("%d",&rsrc[j]);
for(j=1;j<=r;j++)
{
	total=0;
	avail[j]=0;
	for(i=1;i<=p;i++)
	total+=alloc[i][j];
	avail[j]=rsrc[j]-total;
}
for(i=1;i<=p;i++)
{
	for(j=1;j<=r;j++)
	need[i][j]=max[i][j]-alloc[i][j];
}
printf("\n\nAvailable resources are : ");
for(j=1;j<=r;j++)
printf("%d ",avail[j]);
	printf("\nAllocation matrix:\tMax matrix:\tneed matrix:\n");
for(i=1;i<=p;i++)
{
	for(j=1;j<=r;j++)
	printf("%d ",alloc[i][j]);
	printf("\t\t");
for(j=1;j<=r;j++)
	printf("%d ",max[i][j]);
	printf("\t\t");
for(j=1;j<=r;j++)
	printf("%d ",need[i][j]);
	printf("\n");
}
while(loopc<p&&count!=p)
{
	++loopc;
	for(i=1;i<=p;i++)
	{
	if(finish[i]==0)
	{ 
	     for(j=1;j<=r;j++)
		{
		if(need[i][j]>avail[j])
		break;
		}
if(j==r+1)
{
	for(j=1;j<=r;j++)
	avail[j]+=alloc[i][j];
	finish[i]=1;
	++count;
	safe[k++]=i;
}
}
}
}
if(count==p)
{
printf("\nThe system is in a safe state!!\nSafe sequence: ");
for(k=0;k<p;k++)
printf("->%d",safe[k]);
}

else
printf("\nThe system is in an unsafe state!!");
}
