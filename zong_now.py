import requests
import re
from bs4 import BeautifulSoup
import os
import subprocess
from jinja2 import Template
import yaml
import sys
import json
userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
header = {

'origin': 'https: // www.nowcoder.com',
'referer': '''https://www.nowcoder.com/profile/4102679/codeBookDetail?submissionId=28761884''',
'accept-encoding': 'gzip, deflate, br',
'cookie': '''NOWCODERUID=7738182C80C368980C57ACD2AB22551C;NOWCODERCLINETID=5B66441346C1CEDE1DDD5DFDC2B09CEE; Hm_lvt_a808a1326b6c06c437de769d1b85b870=1563151743,1563675809,1563785393; callBack=https%3A%2F%2Fwww.nowcoder.com%2Fprofile%2F4102679; t=D693B1BBD522C30BD92980D0522CCD0C; Hm_lpvt_a808a1326b6c06c437de769d1b85b870=1563794048;SERVERID=9e4b74fdb43c9945205776603264d280|1563794280|1563785391''',

    'User-Agent': userAgent,
'x-requested-with': 'XMLHttpRequest'

}
url='https://www.nowcoder.com/profile/4102679/codeBooks?q=&onlyAcc=0&page=1'


html=requests.get(url=url,headers=header)
print(html.status_code)
print(html.text)
html=html.text
# with open('魔圣提交代码.txt','w',encoding='utf-8')as f:
#     f.write(html.text)

soup=BeautifulSoup(html,'html.parser')

hrefs=soup.find_all('a',class_='test-subject')
for i in hrefs:
    print(i.get('href'))

ye=soup.find('li',class_='txt-pager js-last-pager').a
ye_maxNum=ye.get('data-page')


print(ye_maxNum)


list=[]
ye_maxNum=int(ye_maxNum)
s='https://www.nowcoder.com'
for i in range(ye_maxNum):
    url = 'https://www.nowcoder.com/profile/4102679/codeBooks?q=&onlyAcc=0&page='
    url+=str(i+1)
    print(url)
    html = requests.get(url=url, headers=header)
    html=html.text
    soup = BeautifulSoup(html, 'html.parser')
    hrefs = soup.find_all('a', class_='test-subject')
    for j in hrefs:
        list.append(s+j.get('href'))

# LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
# print(LP_PREFIX)
# print("len:"+len(list))
g=0
for i in list:
    g+=1;
    print(g)
    html = requests.get(url=i, headers=header)
    html = html.text
    soup = BeautifulSoup(html, 'html.parser')
    is_True = soup.find('span', class_='font-green').text
    if(is_True!='答案正确'):
        break
    print(i+':答案:')
    problem_title = soup.find("span", class_='crumbs-end js-question-title').text
    print(problem_title)
    problem_detail = soup.find('div', class_='subject-question').text
    print(problem_detail)
    daima = soup.find('pre').text
    print(daima)
    language=re.findall(r'语言：(\S+<)', html)[0].strip('<')
    problem_detail = soup.find('div', class_='subject-question').text
    print(re.findall(r'语言：(\S+<)', html)[0].strip('<'))
    LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))


    with open('README.md', 'a+', encoding='utf-8') as f:
        f.write('{}'.format('='*20))
        f.write("#" + problem_title + '\n')
        f.write(problem_detail)
        f.write(">" + language + '\n')
        f.write("```" + '\n')
        f.write(daima + '\n')
        f.write("```" + '\n')

