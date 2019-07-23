# 362. |一笔画

## Question description


咱们来玩一笔画游戏吧，规则是这样的：有一个连通的图，能否找到一个恰好包含了所有的边，并且没有重复的路径。


## Solution

Language: **['Java']**

```
// write your code here


import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            int n = sc.nextInt();
            int m = sc.nextInt();
            int[] arr = new int[n];
            for (int i = 0; i < 2 * m; i ++ ) {
                arr[sc.nextInt() - 1] ++ ;
            }
            int count = 0;
            for (int i:arr) {
                if(i % 2 != 0) count ++ ;
            }
            if(count == 0 || count == 2) System.out.println("Yes");
            else System.out.println("No");
        }
    }
}
```


