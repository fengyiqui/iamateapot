#include<stdio.h>
class A
{
public:
	void fA(){printf("i am a teapot\n");}
public:
	int iamateapot;
};
int main()
{
	/*char n =127;
	printf("n=%d\n",n);
	n ++;
	printf("n=%d\n",n);
	n++ ;
	printf("n=%d\n",n);*/
	char n = 0;
	for(int i = 0;i<=256;++i)
	{
		n = (char)i;
		printf("n=%d,%d\n",n,i);
	}
	A *pA = new A;
	pA->fA();
	pA->iamateapot = 10;
	return 0;

#define SIZE 10
		for(int i=0;i<SIZE; ++i)
		{
			printf("%d\n",i);
		}
#undef SIZE
#define SIZE 30
}
void in f()
{
    printf("hi");
}
