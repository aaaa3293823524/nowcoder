import subprocess
import os
import sys
import shutil

cmds = []


cmds.append('git init')
cmds.append('git add .')
cmds.append('git commit -m "Auto Deployment"')
cmds.append('git remote add origin git@github.com:aaaa3293823524/nowcoder.git')
cmds.append('git push -u origin master')

for cmd in cmds:
    try:
        ret = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).decode('utf-8').strip()
        if ret:
            print(ret)
    except subprocess.CalledProcessError:
        break