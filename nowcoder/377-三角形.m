# 377. |三角形

## Question description


给定三条边，请你判断一下能不能组成一个三角形。


## Solution

Language: **['Java']**

```


import java.math.BigInteger;
import java.util.*;
 
public class Main{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        while(sc.hasNext()){
            BigInteger a=sc.nextBigInteger();
            BigInteger b=sc.nextBigInteger();
            BigInteger c=sc.nextBigInteger();
            if(a.add(b).compareTo(c)>0 && a.add(c).compareTo(b)>0 && b.add(c).compareTo(a)>0)
                System.out.println("Yes");
            else
                System.out.println("No");
        }
    }
}
```


