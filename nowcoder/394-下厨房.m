# 394. |下厨房

## Question description


牛牛想尝试一些新的料理，每个料理需要一些不同的材料，问完成所有的料理需要准备多少种不同的材料。


## Solution

Language: **['Java']**

```


import java.util.HashSet;
import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		String string1[];
		String string2;
		HashSet<String> set=new HashSet<>();
        while(scanner.hasNext()){
        	string2=scanner.nextLine();
        	string1=string2.split(" ");
        	for (int i = 0; i < string1.length; i++) {
				set.add(string1[i]);
			}
        }
		System.out.println(set.size());
	}
}


```


