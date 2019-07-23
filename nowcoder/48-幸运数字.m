# 48. |幸运数字

## Question description


  小雅同学认为6,8是她的幸运数字,而其他数字均不是,一个幸运数是指在十进制表示下只含有幸运数字的数。给定你一个区间（a,b）a和b之间（其中包括a和b幸）运数的个数。 


## Solution

Language: **['C']**

```
//        1.求a到b区间的幸运数，那么只要分别求出0到a和0到b的幸运数然后作差就可以了
//        2.因为范围是 0到1e10，所以幸运数的数量应该是2e10
//        3.幸运数可以通过画一颗二叉树发现规律，层次遍历是这样的，
//        6，8，66，68，86，88，666，668，686，688，866，868，886，888....
//        可以发现对于每个节点，左子树是×10+6，右子树是×10+8，然后用数组模拟一个队列，把所有的值存进去，
//        然后刚好就是从小到大，然后用a和b表示刚好大于或者等于的一个幸运数，然后做差就行

#include<iostream>
#include<algorithm>
using namespace std;
const int maxn = 1e5+5;
#define MAX 1000000000
int lucky[maxn];
int top;
void init();
int main()
{
    init();
    int a,b,ansa=0,ansb=0;
    cin>>a>>b;
    for(int i=0;i<top;++i)
    {
        if(a<lucky[i])
        {
            ansa=i;
            break;
        }
    }
    for(int i=0;i<top;++i)
    {
        if(b<lucky[i])
        {
            ansb=i;
            break;
        }
    }
    //cout<
    if(ansb-ansa>0)
    {
        cout<<ansb-ansa<<endl;
    }else 
    {
        cout<<"-1"<<endl;
    }
    return 0;
}
void init()
{
    int i=0;
    top=2;
    lucky[0]=6;
    lucky[1]=8;
    while(1)
    {
        if(i>512) break;
        lucky[top++]=lucky[i]*10+6;
        lucky[top++]=lucky[i]*10+8;
        i++;
    }
}
```


