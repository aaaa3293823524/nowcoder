# 280. |螺旋数

## Question description


下图是一个4阶的螺旋数阵：
 1 2 3 4
 12 13 14 5
 11 16 15 6
 10 9 8 7
 数字从1开始，沿着顺时针方向依次填满整个矩阵。
 现在给你矩阵的规模n，请你输出n阶螺旋数阵。


## Solution

Language: **['C']**

```


#include <stdio.h>
#include <string.h>
int main(void)
{
    int n=0;
    while(scanf("%d", &n)!=EOF){
        int x=0,y=0,j=1;
        int array[1024][1024];
        memset(array,0,sizeof(array));
        array[x][y]=j;
        j++;
        while(j<=n*n)
        {
            while(y<n-1 && array[x][y+1]==0){y++;array[x][y]=j;j++;}//y=4
            while(x<n-1 && array[x+1][y]==0){x++;array[x][y]=j;j++;}
            while(y>0 && array[x][y-1]==0){y--;array[x][y]=j;j++;}
            while(x>0 && array[x-1][y]==0){x--;array[x][y]=j;j++;}
        }
        for (int i = 0; i < n; ++i)
        {
            for (int j = 0; j < n-1; ++j)
            {
                printf("%d ", array[i][j]);
            }
            printf("%d\n", array[i][n-1]);
        }
        printf("\n");
    }
    return 0;
}
```


