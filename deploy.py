import subprocess
import os
import sys
import shutil
sys.path.append(os.path.abspath(os.path.dirname(__file__)))
cmds = []


cmds.append('git init')
cmds.append('git add .')
cmds.append('git commit -m "Auto Deployment"')
# cmds.append('git remote add origin git@github.com:aaaa3293823524/nowcoder.git')
cmds.append('git push -f -q aaaa3293823524@nowcoder.git master:master')
# cmds.append('git push -u origin master')
# git push -f -q aaaa3293823524@nowcoder.git master:master
for cmd in cmds:
    try:
        ret = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).decode('utf-8').strip()
        if ret:
            print(ret)
    except subprocess.CalledProcessError:
        break

# '%s-%s.md' % (_question['questionFrontendId'], slug)
#
#
#     def render_readme(self):
#         summary = self.user.summary()
#         console('> Render README.md')
#         # This determines how to sort the problems
#         ques_sort = sorted(
#             [(ques['questionFrontendId'], ques['questionTitleSlug']) for ques in self.questions.values()],
#             key=lambda x: int(x[0]))
#         # You can customize the template
#         tmpl = Template(open(os.path.join(__class__.LP_PREFIX, 'templ', 'README.md.txt'), encoding='utf-8').read())
#         readme = tmpl.render(questions=[self.questions[slug] for _, slug in ques_sort], likes=self.likes,
#                              date=datetime.now(), summary=summary, conf=self.conf)
#         with open(os.path.join(__class__.LP_PREFIX, 'repo', 'README.md'), 'w', encoding='utf-8') as f:
#             f.write(readme)
#
#     def render_problems(self):
#         console('> Render problems')
#         # You can customize the template
#         tmpl = Template(
#             open(os.path.join(__class__.LP_PREFIX, 'templ', 'question.md.txt'), encoding='utf-8').read())
#         for slug in self.solutions:
#             _question = self.questions[slug]
#             _note = self.notes[slug]
#             _solutions = self.solutions[slug]
#             question = tmpl.render(question=_question, note=_note, solutions=_solutions,
#                                    date=datetime.now(), conf=self.conf)
#             if sys.platform != 'win32':
#                 question = question.replace('\r\n', '\n')
#             _filename = '%s-%s.md' % (_question['questionFrontendId'], slug)
#             print(_filename)
#             with open(os.path.join(__class__.LP_PREFIX, 'repo', 'problems', _filename), 'w', encoding='utf-8') as f:
#                 f.write(question)
#
#
#
# solu_file = os.path.join(__class__.LP_PREFIX, '_cache', 'solutions.json')
#         if os.path.exists(solu_file):
#             with open(solu_file, 'r', encoding='utf-8') as f:
#                 self.solutions = json.load(f)
#         console('> Get solutions')
#         for title, sublist in self.new_ac_submissions.items():
#             console(title)
#             for sub in sublist[::-1]:
#                 solu = self.user.solution(sub['id'])
#                 slug = solu['title_slug']
#                 self.new_ac_title_slugs.add(slug)
#                 if slug not in self.solutions:
#                     self.solutions[slug] = [solu]
#                 else:
#                     for i in range(len(self.solutions[slug]) - 1, -1, -1):
#                         if self.solutions[slug][i]['language'] == solu['language']:
#                             self.solutions[slug].pop(i)
#                     self.solutions[slug].insert(0, solu)
#         with open(solu_file, 'w', encoding='utf-8') as f:
#             json.dump(self.solutions, f)