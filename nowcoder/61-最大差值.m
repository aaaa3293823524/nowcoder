# 61. |最大差值

## Question description


给定一个未排序的数列，找到此数列在已排序状态下的两个相邻值的最大差值，少于两个值时返回0。例如：给定数列 [1,3,2,0,1,6,8] 则 最大差值为3。注意：请尽量使用时间复杂度为O(n)的方案。


## Solution

Language: **['C']**

```


//O(n)的话可以使用桶排序，空间换时间
//如下代码是先O(n)sort成升序后进行差值检验
#include <bits/stdc++.h>
using namespace std;
class Solution{
public:
    int get_ans(vector<int>& nums){
        base_sort(nums);
        int res=0;
        //找两者之间的差值即可
        for(int i=1;i<(int)nums.size();++i)
            res=max(res,nums[i]-nums[i-1]);
        return res;
    }
private:
    //计数+放桶 ,总体思想就是从低位开始每位进行比较排序，一直放到最高位
    void base_sort(vector<int>& nums){
        int base=10,exp=1; //base表示10进制，可自己修改
        vector<int> vec(nums.size()); //辅助数组
        int max_num=*max_element(nums.begin(),nums.end());
        while(max_num/exp>0){
            vector<int> cnt(base,0); //用于计数
            for(auto num:nums)
                cnt[(num/exp)%base]++;
            for(int i=1;i<(int)cnt.size();++i)
                cnt[i]+=cnt[i-1]; //累加计数
            for(int i=(int)nums.size()-1;i>=0;i--)
                vec[--cnt[(nums[i]/exp)%base]]=nums[i]; //放桶，但是这里注意序号，因此先进行--
            for(int i=0;i<(int)nums.size();++i)
                nums[i]=vec[i]; //放回到原来的数组
            exp*=10; //往高位走
        }
    }
};
int main(){
    int N;
    cin>>N;
    int cur;
    vector<int> nums;
   while(~scanf("%d",&cur))
        nums.push_back(cur);
    if((int)nums.size()<2){
        cout<<0;
        return 0;
    }
    Solution sol;
    cout<<sol.get_ans(nums);
    return 0;
}
```


