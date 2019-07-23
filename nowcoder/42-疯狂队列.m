# 42. |疯狂队列

## Question description


小易老师是非常严厉的,它会要求所有学生在进入教室前都排成一列,并且他要求学生按照身高不递减的顺序排列。有一次,n个学生在列队的时候,小易老师正好去卫生间了。学生们终于有机会反击了,于是学生们决定来一次疯狂的队列,他们定义一个队列的疯狂值为每对相邻排列学生身高差的绝对值总和。由于按照身高顺序排列的队列的疯狂值是最小的,他们当然决定按照疯狂值最大的顺序来进行列队。现在给出n个学生的身高,请计算出这些学生列队的最大可能的疯狂值。小易老师回来一定会气得半死。


## Solution

Language: **['C']**

```


#include <iostream>
#include <vector>
#include <deque>
#include <algorithm>
using namespace std;
 
int main()
{
    int n;
    cin>>n;
    vector<int> a;
    for (int i=0;i<n;i++){
        int temp;
        cin>>temp;
        a.push_back(temp);
    }
    sort(a.begin(),a.end());
    deque<int> b;
    int i=0;
    int j=n-1;
    int cnt=0;
    while(i<j){
        if (cnt%2==0 && i<j)
        {
            b.push_back(a[j--]);
            b.push_front(a[i++]);}
        else if (cnt%2==1 && i<j)
        {
            b.push_back(a[i++]);
            b.push_front(a[j--]);
        }
        cnt++;
    }
    if(i==j)//如果i=j，就是有奇数个的情况
    {
        if(abs(a[i]-b[0])>abs(a[i]-b[n-2])){
            b.push_front(a[i]);}
        else{
            b.push_back(a[i]);}
    }
    int res=0;
    for (int i=1;i<b.size();i++){
        res+=abs(b[i]-b[i-1]);
    }
    cout<<res<<endl;
    return 0;
}

```


