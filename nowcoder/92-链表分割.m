# 92. |链表分割

## Question description


编写代码，以给定值x为基准将链表分割成两部分，所有小于x的结点排在大于或等于x的结点之前
给定一个链表的头指针 ListNode* pHead，请返回重新排列后的链表的头指针。注意：分割以后保持原来的数据顺序不变。


## Solution

Language: **['Java']**

```


import java.util.*;
 
/*
public class ListNode {
    int val;
    ListNode next = null;
 
    ListNode(int val) {
        this.val = val;
    }
}*/
public class Partition {
    public ListNode partition(ListNode pHead, int x) {
        // write code here
        ListNode dummyHead1 = new ListNode(0);
        ListNode dummyHead2 = new ListNode(0);
        ListNode p1 = dummyHead1;
        ListNode p2 = dummyHead2;
        while (pHead != null) {
            if (pHead.val < x) {
                p1.next = pHead;
                p1 = p1.next;
            }
            else {
                p2.next = pHead;
                p2 = p2.next;
            }
            pHead = pHead.next;
        }
        p2.next = null;// prevent [x+1, x-1, x-2]
        p1.next = dummyHead2.next;
         
        return dummyHead1.next;
    }
}

```


