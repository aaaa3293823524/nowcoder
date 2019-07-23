# 297. |买苹果

## Question description


小易去附近的商店买苹果，奸诈的商贩使用了捆绑交易，只提供6个每袋和8个每袋的包装(包装不可拆分)。 可是小易现在只想购买恰好n个苹果，小易想购买尽量少的袋数方便携带。如果不能购买恰好n个苹果，小易将不会购买。


## Solution

Language: **['Java']**

```


import java.awt.List;
import java.math.BigInteger;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class Main {
    public static int recv(int n){
    	int sum=0;
    	while(n!=0){
    		sum=sum*10+n%10;
    		n/=10;
    	}
    	return sum;
    }
    public static void main(String[] args) {
    	Scanner in = new Scanner(System.in);
    	//Node root=new Node(0);
        while (in.hasNext()) {
            int n=in.nextInt();
            int sum=0;
            boolean flag=true;
            if (n%2==1) {
				System.out.println(-1);
				flag=false;
			}else{
				for (int i = 12; i >=0; i--) {
					if ((n-8*i)>=0&&(n-8*i)%6==0) {
						flag=false;
						System.out.println((n-8*i)/6+i);
						break;
					}
				}
			}
            if (flag) {
				System.out.println(-1);
			}
        }
	}
}
class Node{
	Node left,right;
	int num;
	Node(int num){
		left=right=null;
		this.num=num;
	}
	void setLeft(Node left){
		this.left=left;
	}
	void setRight(Node right){
		this.right=right;
	}
	
	Node(Node left,Node right,int num){
		this.num=num;
		this.left=left;
		this.right=right;
	}
	int getMaxHeight(){
		int max1=0,max2=0;
		if (right!=null) {
			max2=right.getMaxHeight();
		}
		if (left!=null) {
			max1=left.getMaxHeight();
		}
		return 1+Math.max(max1, max2);
	}
}
```


