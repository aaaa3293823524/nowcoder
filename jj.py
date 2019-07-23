import requests
import re
import os
from bs4 import BeautifulSoup
userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
header = {

'origin': 'https: // www.nowcoder.com',
'referer': '''https://www.nowcoder.com/profile/4102679/codeBookDetail?submissionId=28761884''',
'accept-encoding': 'gzip, deflate, br',
'cookie': '''NOWCODERUID=7738182C80C368980C57ACD2AB22551C;NOWCODERCLINETID=5B66441346C1CEDE1DDD5DFDC2B09CEE; Hm_lvt_a808a1326b6c06c437de769d1b85b870=1563151743,1563675809,1563785393; callBack=https%3A%2F%2Fwww.nowcoder.com%2Fprofile%2F4102679; t=D693B1BBD522C30BD92980D0522CCD0C; Hm_lpvt_a808a1326b6c06c437de769d1b85b870=1563794048;SERVERID=9e4b74fdb43c9945205776603264d280|1563794280|1563785391''',

    'User-Agent': userAgent,
'x-requested-with': 'XMLHttpRequest'

}
url='https://www.nowcoder.com/profile/4102679/codeBookDetail?submissionId=28761884'


html=requests.get(url=url,headers=header)
# print(html.status_code)
# print(html.text)
html=html.text
# with open('魔圣提交代码.txt','w',encoding='utf-8')as f:
#     f.write(html.text)

soup=BeautifulSoup(html,'html.parser')
# problem_title=soup.find("span",class_='crumbs-end js-question-title').text
# problem_detail=soup.find('div',class_='subject-question').text
#
# is_True=soup.find('span',class_='font-green').text
# daima=soup.find('pre').text
# print(problem_title)
# print(problem_detail)
#
# print(is_True)
#
# print(daima)
#
#
# print(re.findall(r'语言：(\S+<)',html)[0].strip('<'))
# LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
# print(LP_PREFIX)


language=re.findall(r'语言：(\w+)', html)

print("".join(language))