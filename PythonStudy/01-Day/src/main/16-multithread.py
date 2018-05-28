# 16-multithread
# Created by Alexiuce at 2018/5/28
""" 多线程 threading 模块


"""

from threading import Thread
import time

def say():
    print("sorry....")
    time.sleep(1)


if __name__ == '__main__':
    t = Thread(target=say)
    t.start()
    print("main")
