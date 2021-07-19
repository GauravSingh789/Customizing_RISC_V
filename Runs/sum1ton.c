#include <stdio.h>
//using namespace std;

int main(){
	//int a=9, b=5, c, d;
	//c = a*b;
	//d=c*10;

	int i, n=200, sum=0;
	for(i=1; i<=n; ++i){
	sum+=i;	
	}
	printf("Sum of numbers from 1 to %d is %d\n",n, sum);

return 0;

}
