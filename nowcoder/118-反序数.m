# 118. |反序数

## Question description


设N是一个四位数，它的9倍恰好是其反序数（例如：1234的反序数是4321） 求N的值


## Solution

Language: **['Java']**

```


public class Main {
    public static void main(String[] args) {
        for(int i=1000;i<9999;i++){
            int re = i*9;
            if(re>9999){
                continue;
            }
            StringBuffer sb = new StringBuffer(String.valueOf(re));
            if(i == Integer.valueOf(sb.reverse().toString())){
                System.out.println(i);
            }
        }
    }
}
```


