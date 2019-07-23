# 133. |全排列

## Question description


给定一个由不同的小写字母组成的字符串，输出这个字符串的所有全排列。
我们假设对于小写字母有'a' < 'b' < ... < 'y' < 'z'，而且给定的字符串中的字母已经按照从小到大的顺序排列。


## Solution

Language: **['Python']**

```


#通过递归交换数组，得到一个无重复列表的全排列
#需要注意几点，输入字母未排序，输出最后还要加一个空格（应该是利于某些算法）
 
#这函数输入如果是有序的可以得到按顺序的全排列
def allPermute(array):
    result = []
    tempArray = list(array)
    def exchange(num):
        nonlocal tempArray
        nonlocal result
        if num == len(tempArray)-1:
             result.append(list(tempArray))
        else:
            for j in range(num,len(tempArray)):
                tempArray[num],tempArray[j] = tempArray[j],tempArray[num]
                exchange(num+1)
                tempArray[num], tempArray[j] = tempArray[j], tempArray[num]
    exchange(0)
    return result
try:
    while True:
        string = list(input())
        temp = allPermute(string)
        temp.sort()
        for i in temp:
            print("".join(i))
        print()
except Exception:
    pass
```


