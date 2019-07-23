import os
import json
question={}
solution={}
language=[]

solutions = []
questions = []
LP_PREFIX = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
ques_file=os.path.join(LP_PREFIX,'nowcoder-publisher', 'nowcoder', 'question.json')
for i in range(2):

    question['title_id'] = i


    questions.append(question)
    with open(ques_file, 'r', encoding='utf-8') as f:
        question = f.readline()
    with open(ques_file, 'a+', encoding='utf-8') as f:
        json.dump(questions, f)


print(questions)