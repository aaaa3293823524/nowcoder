# 321. |统计一

## Question description


NowCoder总是力争上游，凡事都要拿第一，所以他对“1”这个数情有独钟。爱屋及乌，他也很喜欢包含1的数，例如10、11、12……。你能帮他统计一下整数里有多少个1吗？


## Solution

Language: **['Java']**

```


import java.util.Scanner;
 
public class Main{
 
    public static void main(String[] args){
 
        Scanner in=new Scanner(System.in);
 
        while(in.hasNext()){
 
            int n=in.nextInt();
 
            int sum=0;
 
            for(int i=1;n/i!=0;i*=10) sum+=(n/i+8)/10*i+(n/i%10==1?n%i+1:0);
 
            System.out.println(sum);
 
        }
 
        in.close();
 
    }
 
}
```


