# 144. |中位数

## Question description


中位数定义：一组数据按从小到大的顺序依次排列，处在中间位置的一个数（或最中间两个数据的平均数）.
给出一组无序整数，求出中位数，如果求最中间两个数的平均数，向下取整即可（不需要使用浮点数）


## Solution

Language: **['Python']**

```


while True:
    try:
        a,res=int(input()),[]
        if a!=0:
            for i in range(a):
                res.append(int(input()))
            res.sort()
            resLen=len(res)
            print(res[resLen//2] if resLen%2==1 else (res[resLen//2]+res[resLen//2-1])//2)
    except:
        break
```


