# 164. |买房子

## Question description


    某程序员开始工作，年薪N万，他希望在中关村公馆买一套60平米的房子，现在价格是200万，假设房子价格以每年百分之K增长，并且该程序员未来年薪不变，且不吃不喝，不用交税，每年所得N万全都积攒起来，问第几年能够买下这套房子（第一年房价200万，收入N万）


## Solution

Language: **['C']**

```


#include<iostream>
using namespace std;
int main(){
    int n,k;
    while(cin>>n>>k){
        int total=200;
        int money=n;
        int year=0,judge=0;
        for(int i=2;i<22;i++){
            total*=1+(double)k/100;
            money+=n;
            if(money>=total){
                year=i;
                judge=1;
                break;
            }
        }
        if(judge==1) cout<<year<<endl;
        else cout<<"Impossible"<<endl;
    }
}
```


