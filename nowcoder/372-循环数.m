# 372. |循环数

## Question description


142857是一个六位数，我们发现：
 142857 * 1 = 142857
 142857 * 2 = 285714
 142857 * 3 = 428571
 142857 * 4 = 571428
 142857 * 5 = 714285
 142857 * 6 = 857142
 即用1到6的整数去乘142857，会得到一个将原来的数首尾相接循环移动若干数字再在某处断开而得到的数字。
 也就是说，如果把原来的数字和新的数字都首尾相接，他们得到的环是相同的。只是两个数的起始数字不一定相同。
 请写一个程序，判断给定的数不是循环数。


## Solution

Language: **['Java']**

```


import java.util.Scanner;
public class Main {
     
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
 
        while(sc.hasNext()){
             
            String str = sc.nextLine();
             
            String twostr = str+str;
            boolean flag = true;
             
            for(int i= 1; i<=6 ;i++)
            {
                String result = mutli(str,i);
                if(!isCircle(twostr,result)){
                    flag = false;
                    break;
                }      
            }
            if(flag)
                System.out.println("Yes");
            else
                System.out.println("No");
        }
    }
 
     public static String mutli(String s,int n)
            {
                char[] ss = s.toCharArray();
                String result = null;
                int jinwei = 0;
                for(int i = s.length()-1;i >= 0;i--)
                {
                    char c = s.charAt(i);
                    int nn = c - '0';
                    int o = nn * n + jinwei;
                    ss[i] = (char) ((o)%10 + '0');
                    jinwei = o / 10;
                }
                if(jinwei==0){
                    result = String.valueOf(ss);
                }else {
                    result = String.valueOf(jinwei)+String.valueOf(ss);
                }
                return result;
            }
 
            private static boolean isCircle(String strcycle,String str) {
                if(strcycle.contains(str)){
                    return true;
                }else{
                    return false;
                }
            }
}

```


