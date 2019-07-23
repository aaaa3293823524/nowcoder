# 168. |整数和

## Question description


编写程序，读入一个整数N。若N为非负数，则计算N 到2N 之间的整数和；若N为一个负数，则求2N 到N 之间的整数和。


## Solution

Language: **['Java']**

```
import java.util.Scanner;

public class Main {


		public static void main(String[] args) {
		        Scanner in = new Scanner(System.in);
		        int m=in.nextInt();
		        for(int i=0;i<m;i++){
		        	int n=in.nextInt();
		        	int sum=0;
			        if(n>=0){
			        	for (int j = n; j <=2*n; j++) {
							sum+=j;
						}
			        }else{
			        	for (int j = 2*n; j <=n; j++) {
							sum+=j;
						}
			        }
			        System.out.println(sum);
		        }
		        
		    }
		
}

```


