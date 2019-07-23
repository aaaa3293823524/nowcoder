class Solution:
    def reverseString(self, s) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        return sorted(s,reverse=True)

s=Solution()
ss=["h","e","l","l","o"]
print(s.reverseString(ss))
