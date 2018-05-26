# 15-mutiltask.py
# Created by Alexcai at 2018/5/26
""" 多任务
"""

from time import sleep
import os

def sing():
    for _ in range(3):
        print("sing....")
        # os.getpid()    # 获得当前进程的pid
        # os.getppid() # 获取父进程的pid
        sleep(1)

def dance():
    for _ in range(3):
        print("dance.....")
        sleep(1)


if __name__ == '__main__':
    # sing()
    # dance()
    ret = os.fork()     # 开启子进程 ,返回值是子进程的pid
    if ret == 0:
        while True:
            print('===1===')
            sleep(1)
    else:
        while True:
            print('====2===')
            sleep(1)
