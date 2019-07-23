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
# print(html.text)
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
print("len:"+str(len(list)))
g=0

all_submissions = []

new_ac_title_slugs = set()
question={}
solution={}
language=[]

solutions = []
questions = []


LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
solu_file = os.path.join(LP_PREFIX,'nowcoder-publisher', 'nowcoder', 'solution.json')
ques_file = os.path.join(LP_PREFIX,'nowcoder-publisher', 'nowcoder', 'question.json')
for i in list:

    html = requests.get(url=i, headers=header)
    html = html.text
    soup = BeautifulSoup(html, 'html.parser')
    is_True = soup.find('span', class_='font-green')
    if(is_True==None):
        continue
    else:
        is_True=is_True.text

    if(is_True!='答案正确'):
        continue



    print(i+':答案:')
    language=[]
    problem_title = soup.find("span", class_='crumbs-end js-question-title').text
    print(problem_title)
    problem_detail = soup.find('div', class_='subject-question').text
    print(problem_detail)
    daima = soup.find('pre').text
    print(daima)
    lan=re.findall(r'语言：(\w+)', html)
    # for ques in questions:
    #     if ques['title']==problem_title and ques['lan']==lan:
    #         continue
    g += 1
    print(g)
    question['title_id'] = g
    question['title']=problem_title
    question['content']=problem_detail
    question['lan']=lan
    question['code']=daima
    question['link']=i
    questions.append(question)

    ques_file = os.path.join(LP_PREFIX, 'nowcoder-publisher', 'nowcoder', 'question.json')
    tmpl = Template(open(os.path.join(LP_PREFIX, 'nowcoder-publisher', 'readme.txt'), encoding='utf-8').read())
    s = tmpl.render(questions=questions)
    filename = 'README.md'
    with open(os.path.join(LP_PREFIX, 'nowcoder-publisher', filename), 'a+', encoding='utf-8') as f:
        f.write(s)
    # print(re.findall(r'语言：(\S+<)', html)[0].strip('<'))

    # solution['title_id'] = i
    # solution['title'] = '我是谁'
    # language.append('JAVA')
    # language.append('C++')
    # language.append('python')
    # solution['language'] = language


    filename='%s-%s.md' % (g, problem_title)
    tmpl = Template(open(os.path.join(LP_PREFIX, 'nowcoder-publisher', 'solution.txt'), encoding='utf-8').read())
    ques = tmpl.render(question=question)

    with open(os.path.join(LP_PREFIX,'nowcoder-publisher','nowcoder', filename[0:9]), 'w+', encoding='utf-8') as f:
        f.write(ques)
    # with open(r'%s-%s.md' % (g, problem_title[0:8]), 'a+', encoding='utf-8') as f:
    #     f.write('{0}{0}\n'.format('='*20))
    #     f.write("#" + problem_title + '\n')
    #     f.write(problem_detail)
    #     f.write(">" + ''.join(language) + '\n')
    #     f.write("```" + '\n')
    #     f.write(daima + '\n')
    #     f.write("```" + '\n')




sys.path.append(os.path.abspath(os.path.dirname(__file__)))
cmds = []


cmds.append('git init')
cmds.append('git add .')
cmds.append('git commit -m "Auto Deployment"')
cmds.append('git remote add origin git@github.com:aaaa3293823524/nowcoder.git')
cmds.append('git push -f -q origin master')

for cmd in cmds:
    try:
        ret = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).decode('utf-8').strip()
        if ret:
            print(ret)
    except subprocess.CalledProcessError:
        break