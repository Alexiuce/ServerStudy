# 15-mutiltask.py
# Created by Alexcai at 2018/5/26
""" 多任务
fork : 仅能在类Unix系统上使用
通用方式 : from multiprocessing import Process
"""

from multiprocessing import Process

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


def test():
    # sing()
    # dance()
    a = 100  # 全局变量在不同进程中,并不共享,每个进程单独维护一个全局变量
    ret = os.fork()  # 开启子进程 ,返回值是子进程的pid
    if ret == 0:
        while True:
            print('===1===')
            a = 20
            print(a)
            sleep(1)
    else:
        while True:
            print('====2===')
            print("a = %d" % a)
            sleep(1)


# 使用multiprocessing 中的   Process 创建多进程

def test1():
    p = Process(target=sing)
    p.start()

if __name__ == '__main__':
    test1()
    print("main")
