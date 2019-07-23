# 319. |All-in-Al

## Question description


有两个字符串s 和t，如果即从s 中删除一些字符，将剩余的字符连接起来，即可获得t。则称t是s 的子序列。
 请你开发一个程序，判断t是否是s的子序列。


## Solution

Language: **Java**

```Java


import java.util.Scanner;
 
public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        while(in.hasNext()){
            String s1=in.next();
            String s2=in.next();
            int len1=s1.length();
            int len2=s2.length();
            char[] cA1 = s1.toCharArray();
            char[] cA2 = s2.toCharArray();
            int i = 0, j = 0;
            for(; i<len1 && j<len2;)
            {
                if(cA1[i] == cA2[j])
                {
                    j++;
                }
                i++;
            }
              
            if(j == len2)
            {
                System.out.println("Yes");
            }
            else
            {
                System.out.println("No");
            }
        }
    }
}
```


