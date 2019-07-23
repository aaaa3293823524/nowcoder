# 217. |二叉树

## Question description






    如上所示，由正整数1，2，3……组成了一颗特殊二叉树。我们已知这个二叉树的最后一个结点是n。现在的问题是，结点m所在的子树中一共包括多少个结点。

    比如，n = 12，m = 3那么上图中的结点13，14，15以及后面的结点都是不存在的，结点m所在子树中包括的结点有3，6，7，12，因此结点m的所在子树中共有4个结点。


## Solution

Language: **['Java']**

```
import java.util.LinkedList;
import java.util.Map;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        while(scanner.hasNext()){
            int m=scanner.nextInt();
            int n=scanner.nextInt();
            LinkedList<Integer>queue=new LinkedList<>();
            queue.add(m);
            int sum=0;
            while(!queue.isEmpty()){
            	int pop=queue.poll();
            	//System.out.println(pop);
            	sum++;
            	if (2*pop<=n) {
					queue.add(2*pop);
					//System.out.println(2*pop);
					
				}
            	if (2*pop+1<=n) {
					queue.add(2*pop+1);
					//System.out.println(2*pop+1);
				}
            }
            System.out.println(sum);
        }
        
	}


}
```


