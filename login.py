import requests

from requests.cookies import RequestsCookieJar

import urllib3
import re
urllib3.disable_warnings()
# import sys
# import shutil
from bs4 import BeautifulSoup


import http.cookiejar as HC
session = requests.session()
session.cookies = HC.LWPCookieJar(filename='cookies')
try:
  session.cookies.load(ignore_discard=True)
except:
  print('未找到cookies文件')
def mafengwoLogin():

    userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
    header = {

    'origin': 'https: // www.nowcoder.com',
    'referer': '''https://www.nowcoder.com/login?callBack=%2Fprofile%2F4102679%2Fmockexam%2Fsign%3F%26headNav%3Dwww''',


        'User-Agent': userAgent,
    }
    print ("开始模拟登录牛客网")
    postUrl = "https://www.nowcoder.com/nccommon/login/do?token="
    postData = {
        'email': '3293823524 @ qq.com',
        'remember':'true',
        'cipherPwd':'bhC + ONR4m0Az5y3ZcR9wKvqUgWGZ0xluoIy7bTygEpU8FUYgzxOUh9UtvsbPcaW9si2wiC / Ku5OVuc8oI6sSqpCpB + KfFMjt9oCUSeci3hWUEC2eoSZbaIJP46SgprwtyG8pvQoDPMHYPOk7GFhJRbS + YRYxxk08CyvCwzXx / 1Q =',
    }

    responseRes = session.post(postUrl, data = postData, headers = header)
    for key,value in responseRes.cookies.items():
        print(key+"  =="+value)
    # 无论是否登录成功，状态码一般都是 statusCode = 200
    print(f"statusCode = {responseRes.status_code}")
    # print(f"text = {responseRes.text}")
    # session.cookies.save()
    return responseRes



urls='https://www.nowcoder.com/profile/4102679/codeBooks?q=&onlyAcc=0&page=50'
if __name__ == "__main__":
    # 从返回结果来看，有登录成功
    res=mafengwoLogin()
    url='https://www.nowcoder.com/nccommon/token/login-other-place?token=&_=1563788244874'
    # c=sess.headers.get('cookie')
    userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
    session.cookies.load(ignore_discard=True)
    res2 = session.get(url=url)
    # print(f"text = {res.status_code}")
    # print(res.headers)
    print(res2.text)
    print(res.cookies.get('NOWCODERUID'))
    # print(res.text)

    # soup=BeautifulSoup(res.text,'html.parser')
    # print(soup.find('div'))

