# 37. |数字构造

## Question description


        对于一个十进制数而言，它的数位和等于将它各位数字相加得到的和。比如 231 的数位和 是 6，3179 的数位和是 20。 现在你知道某个十进制数的数位和等于 s，并且这个数不包含 0，且任意相邻的数位是不同 的，比如 112 或者 102 都是不满足条件的。现在你想知道满足这样的条件的最大的数是多少?       


## Solution

Language: **['Java']**

```


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
 
/**
 * @author wylu
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println(generate(Integer.parseInt(br.readLine())));
    }
 
    private static String generate(int s) {
        StringBuilder sb = new StringBuilder();
        if (s % 3 == 1) sb.append(1);
        for (int i = 0; i < s / 3; i++) sb.append("21");
        if (s % 3 == 2) sb.append(2);
        return sb.toString();
    }
}
```


