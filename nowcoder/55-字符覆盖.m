# 55. |字符覆盖

## Question description


小度有一个小写字母组成的字符串s.字符串s已经被写在墙上了. 小度还有很多卡片,每个卡片上有一个小写字母,组成一个字符串t。小度可以选择字符串t中任意一个字符,然后覆盖在字符串s的一个字符之上。小度想知道在选取一些卡片覆盖s的一些字符之后,可以得到的字典序最大的字符串是什么。


## Solution

Language: **['Java']**

```
import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        while (scanner.hasNext()) {
            String string=scanner.next();
            String string2=scanner.next();
            char c[]=string2.toCharArray();
            Arrays.sort(c);
            int j=string2.length()-1;
//            int tt=1;
            for(int i=0;i<string.length();i++){

                    if(j>=0&&c[j]>string.charAt(i)){
                        string=string.substring(0,i)+c[j]+string.substring(i+1,string.length());
                        j--;
//                        System.out.println("替换第"+tt+"次后的字符串："+string);
//                        tt++;

                    }

            }
            System.out.println(string);
        }

    }


}




```


