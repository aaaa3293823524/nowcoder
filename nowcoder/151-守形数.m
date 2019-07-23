# 151. |守形数

## Question description


守形数是这样一种整数，它的平方的低位部分等于它本身。
比如25的平方是625，低位部分是25，因此25是一个守形数。
编一个程序，判断N是否为守形数。


## Solution

Language: **['C']**

```


#include<bits/stdc++.h>
int main(){
    int n,m;
    while(scanf("%d",&n)!=EOF){
        m=n*n;
        while(n!=0){
            if((n%10) == (m%10)){
                n/=10;m/=10;
            }
           else break;
        }
        if(n!=0) printf("No!\n");
        else printf("Yes!\n");
    }
}
```


