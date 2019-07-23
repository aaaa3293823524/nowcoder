# 325. |Emacs计算器

## Question description


Emacs号称神的编辑器，它自带了一个计算器。与其他计算器不同，它是基于后缀表达式的，即运算符在操作数的后面。例如“2 3
+”等价于中缀表达式的“2 + 3”。
 请你实现一个后缀表达式的计算器。


## Solution

Language: **Java**

```Java


import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.Stack;


public class Main {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        
        Stack<Integer>stack=new Stack<>();
        while(scanner.hasNext()){
            int n=scanner.nextInt();
            String string[]=new String[n];
            for (int i = 0; i < n; i++) {
                string[i]=scanner.next();
                if (string[i].charAt(0)>='0'&&string[i].charAt(0)<='9') {
                    stack.push(Integer.parseInt(string[i]));
                    //System.out.println(Integer.parseInt(string[i]));
                }else{
                    int a2=stack.pop();
                    int a1=stack.pop();
                    if (string[i].charAt(0)=='+') {
                        stack.push(a1+a2);
                    }
                    if (string[i].charAt(0) == '-') {
                        stack.push(a1-a2);
                    }
                    if (string[i].charAt(0) == '*') {
                        stack.push(a1*a2);
                    }
                    if (string[i].charAt(0) == '/') {
                        stack.push(a1/a2);
                    }
                }
                }
            System.out.println(stack.pop());
            }
            
        }
        
    
}

```


