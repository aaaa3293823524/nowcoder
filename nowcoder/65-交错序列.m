# 65. |交错序列

## Question description


       我们定义一个由数字 0 和 1 组成的序列是交错序列，当且仅当在这个序列中 0 和 1 是轮流 出现的，比如，0，010，10101 都是交错序列。         现在给出了一个由数字 0 和 1 组成的序列𝐴，它可能不是一个交错序列，但是你可以从这个 序列中选择一些数字出来，按他们在序列𝐴中原有的相对顺序排列(即选取𝐴的一个子序列)， 使得你最后得到的是一个交错序列。问这样能得到的交错序列的最长长度是多少。                                                 


## Solution

Language: **['C']**

```
//其实说白了就是找序列中的交错，反转一次就count++，比如一个序列总共反转了3次，则最后组成的最长长度为4

#include <iostream>
using namespace std;
int main(void)
{
    int len, count = 1;
    cin >> len;
    int a, b;
    cin >> a;
    for (int i = 0; i < len-1; i++)
    {
        cin >> b;
        if (a != b)
            count++;
        a = b;
    }
    cout << count << endl;
    return 0;
}
```


