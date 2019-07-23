class Solution:
    def plusOne(self, digits):
        digits=digits[::-1]
        d=[]

        sum = digits[0] + 1
        carry = sum // 10
        d.append(sum%10)
        for i in digits[1:]:
            sum=i+carry
            carry=sum//10
            d.append(sum%10)
        if(carry!=0):
            d.append(carry)
        return d[::-1]

s=Solution()
l=[9]
print(s.plusOne(l))

print('{}ss{}'.format('='*20,'='*20))