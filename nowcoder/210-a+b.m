# 210. |a+b

## Question description


计算a+b的和    每行包含两个整数a和b  对于每行输入对应输出一行a和b的和  输入  1 5  输出  6


## Solution

Language: **['Java']**

```
	import java.util.Scanner;
	
	public class Main {
	
	    public static void main(String[] args) {
	        Scanner scanner = new Scanner(System.in);
	        
	        while(scanner.hasNext()){
                int a=scanner.nextInt();
                int b=scanner.nextInt();
                System.out.println(a+b);
	        }
		}
	
	
	}
```


