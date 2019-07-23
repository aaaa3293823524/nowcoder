# 199. |连通图

## Question description


    给定一个无向图和其中的所有边，判断这个图是否所有顶点都是连通的。


## Solution

Language: **['Java']**

```


//并查集
import java.util.Scanner;
public class Main {
     static int[] root;
     public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        while(in.hasNext()){
            int n = in.nextInt();
            int m = in.nextInt();
            root = new int[n+1];
            for(int i=0;i<=n;i++)
                root[i] = -1;
            for(int i=0;i<m;i++){
                int x = in.nextInt();
                int y = in.nextInt();
                int a = findRoot(x);
                int b = findRoot(y);
                if(a!=b) root[a] = b;
            }
            int cnt=0;
            for(int i=1;i<=n;i++)
                if(root[i]==-1) cnt++;
            if(cnt==1) System.out.println("YES");
            else System.out.println("NO");
        }
    }
     
    public static int findRoot(int x){
        if(root[x]==-1) return x;
        int tmp = findRoot(root[x]);
        root[x] = tmp;
        return tmp;
    }
  
}
```


