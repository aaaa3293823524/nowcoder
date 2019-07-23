import subprocess
import os
import sys
import shutil
from jinja2 import Template
import yaml
import json
sys.path.append(os.path.abspath(os.path.dirname(__file__)))
LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
# tmpl = Template(open(os.path.join(LP_PREFIX,'nowcoder-publisher', 'solution.txt'), encoding='utf-8').read())
question={}
solution={}
language=[]

solutions = {}
questions = {}
solu_file = os.path.join(LP_PREFIX,'nowcoder-publisher', 'nowcoder', 'solution.json')
ques_file = os.path.join(LP_PREFIX,'nowcoder-publisher', 'nowcoder', 'question.json')
i=1
# if os.path.exists(solu_file):
#     with open(solu_file, 'r', encoding='utf-8') as f:
#         solution = json.load(f)
solution['title_id'] = i
solution['title']='我是谁'
language.append('JAVA')
language.append('C++')
language.append('python')
solution['language']=language

with open(solu_file, 'a+', encoding='utf-8') as f:
    json.dump(solution, f)



t=1
# if os.path.exists(ques_file):
#     with open(solu_file, 'r', encoding='utf-8') as f:
#         question = json.load(f)
question['title_id'] = t
question['title'] = '我是谁'
question['content']='反倒是大水怪速度大概是'
tmpl = Template(open(os.path.join(LP_PREFIX,'nowcoder-publisher', 'readme.txt'), encoding='utf-8').read())
s = tmpl.render(question=question,solution=solution)
with open(os.path.join(LP_PREFIX,'nowcoder-publisher', 'README.md'), 'w', encoding='utf-8') as f:
    f.write(s)
with open(ques_file, 'a+', encoding='utf-8') as f:
    json.dump(question, f)
filename='ssss.md'
tmpl = Template(open(os.path.join(LP_PREFIX,'nowcoder-publisher', 'solution.txt'), encoding='utf-8').read())
ques = tmpl.render(question=question,solution=solution)

with open(os.path.join(LP_PREFIX,'nowcoder-publisher', filename), 'w', encoding='utf-8') as f:
    f.write(ques)




