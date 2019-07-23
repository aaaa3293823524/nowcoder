# 68. 记票统计 

## Question description


请实现接口：
unsigned int  AddCandidate (char* pCandidateName);功能：设置候选人姓名输入： char* pCandidateName 候选人姓名输出：无返回：输入值非法返回0，已经添加过返回0 ，添加成功返回1
 
Void Vote(char* pCandidateName);功能：投票输入： char* pCandidateName 候选人姓名输出：无返回：无

unsigned int  GetVoteResult (char* pCandidateName);
功能：获取候选人的票数。如果传入为空指针，返回无效的票数，同时说明本次投票活动结束，释放资源输入： char* pCandidateName 候选人姓名。当输入一个空指针时，返回无效的票数
输出：无返回：该候选人获取的票数
 
void Clear()
// 功能：清除投票结果，释放所有资源// 输入：// 输出：无// 返回

 




## Solution

