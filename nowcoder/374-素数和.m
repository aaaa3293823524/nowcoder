# 374. |素数和

## Question description


NowCoder发现某些整数可以拆分成两个不同的素数的和。例如7=2+5、20=3+17=7+13等。他想知道每个正整数都有几种拆分的方法，你能帮他解决吗？


## Solution

Language: **['Java']**

```

	
import java.awt.List;
import java.math.BigInteger;
import java.util.Scanner;
	
	public class Main {
	    public static void main(String[] args) {
			Scanner scanner=new Scanner(System.in);
			int a[]=new int[100001];
			boolean flag[]=new boolean[100001];
			
			int count=0;
			for (int i = 2; i < flag.length; i++) {
				if (!flag[i]) {
					a[count++]=i;
					//System.out.println(i);
				}
				for (int j = i; j < 100001; j+=i) {
					flag[j]=true;
				}
			}
			int k[]=new int[100001];
			for (int i = 0; i < k.length; i++) {
				k[i]=0;
			}
			for (int i = 0; i < count; i++) {
				for (int j = i+1; j < count; j++) {
					if (a[i]+a[j]>100000) {
						break;
						
					}
					else{
						k[a[i]+a[j]]++;
					}
				}
			}

			while(scanner.hasNext()){
				int n=scanner.nextInt();
				
								System.out.println(k[n]);
			}
		}
	}

```


