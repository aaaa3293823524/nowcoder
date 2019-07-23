# 40. |区间表达

## Question description


牛牛的老师给出了一个区间的定义:对于x ≤ y,[x, y]表示x到y之间(包括x和y)的所有连续整数集合。例如[3,3] = {3}, [4,7] = {4,5,6,7}.牛牛现在有一个长度为n的递增序列,牛牛想知道需要多少个区间并起来等于这个序列。 例如: {1,2,3,4,5,6,7,8,9,10}最少只需要[1,10]这一个区间 {1,3,5,6,7}最少只需要[1,1],[3,3],[5,7]这三个区间


## Solution

Language: **['Python']**

```


n, arr = int(input()), list(map(int, input().split()))
res = 1
for i in range(1, n):
    if arr[i] - arr[i - 1] > 1:
        res += 1
print(res)
```


