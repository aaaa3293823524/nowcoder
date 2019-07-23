# 123. |ZOJ

## Question description


读入一个字符串，字符串中包含ZOJ三个字符，个数不一定相等，按ZOJ的顺序输出，当某个字符用完时，剩下的仍然按照ZOJ的顺序输出。


## Solution

Language: **['Python']**

```


try:
    while True:
        string = input()
        numZ = string.count('Z')
        numO = string.count('O')
        numJ = string.count('J')
        result = ""
        for i in range(max(numZ,numO,numJ)):
            if numZ:    #如果该数字不为0
                result += "Z"
                numZ -= 1
            if numO:
                result += "O"
                numO -= 1
            if numJ:
                result += "J"
                numJ -= 1
        print(result)
except Exception:
    pass
```


