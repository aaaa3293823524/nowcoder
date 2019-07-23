# 46. |数字字符

## Question description


在十进制表示中，任意一个正整数都可以用字符’0’-‘9’表示出来。但是当’0’-‘9’这些字符每种字符的数量有限时，可能有些正整数就无法表示出来了。比如你有两个‘1’，一个‘2’，那么你能表示出11，12，121等等，但是无法表示出10，122，200等数。  现在你手上拥有一些字符，它们都是’0’-‘9’的字符。你可以选出其中一些字符然后将它们组合成一个数字，那么你所无法组成的最小的正整数是多少？


## Solution

Language: **['Python']**

```


nums = input()
num_count = [0,0,0,0,0,0,0,0,0,0]
for n in nums:
    d = (int)(n)
    if d==0:
        num_count[9] += 1
    else:
        num_count[d-1] += 1
         
min_digit = num_count[0]
min_di = 0
for i in range(1,10):
    if num_count[i] < min_digit:
        min_digit = num_count[i]
        min_di = i
 
if min_di == 9:
    print('1'+'0'*(min_digit+1))
else:
    print(str(min_di+1)*(min_digit+1))

```


