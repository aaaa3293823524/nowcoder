# 220. |八进制

## Question description


输入一个整数，将其转换成八进制数输出。


## Solution

Language: **['Java']**

```
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        while(scanner.hasNext()){
        	String t="";
            int n=scanner.nextInt();
            while(n!=0){
            	t=n%8+t;
            	n/=8;
            }
            System.out.println(t);
        }
        
	}
}
```


