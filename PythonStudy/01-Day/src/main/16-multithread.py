# 16-multithread
# Created by Alexiuce at 2018/5/28
""" 多线程 threading 模块 Thread

- 使用Thread(target) 创建子线程
- 使用类,并且继承Thread,实现run方法(与Process 类实现相似)

- 多线程数据共享: 互斥锁
from threading import Lock
acquire(block,timeout) : 加锁 block=True 阻塞, timeout = 超时时长
release() : 解锁

"""

from threading import Thread, Lock
import time

def say():
    print("sorry....")
    time.sleep(1)

class MThread(Thread):
    def run(self):
        for i in range(3):
            print(i)
            print(self.name)  # 输出当前线程名
            time.sleep(1)


"""线程同步"""
lock1 = Lock()     # 创建互斥锁1
lock2 = Lock()     # 创建互斥锁2
lock2.acquire()    # 设置加锁状态
lock3 = Lock()     # 创建互斥锁3
lock3.acquire()     # 设置加锁状态



class Task_one(Thread):

    def run(self):
        while True:
            if lock1.acquire():
                print("doing...task one.....")
                time.sleep(0.5)
                lock2.release()   # 解锁lock2

class Task_two(Thread):
    def run(self):
        while True:
            if lock2.acquire():
                print("doing task two.....")
                time.sleep(0.5)
                lock3.release()   # 解锁lock3

class Task_three(Thread):
    def run(self):
        while True:
            if lock3.acquire():
                print("doing task three....")
                time.sleep(0.5)
                lock1.release()


def sync_test():
    t1 = Task_one()
    t2 = Task_two()
    t3 = Task_three()

    t1.start()
    t2.start()
    t3.start()

def test():
    for _ in range(5):
        th = MThread()
        th.start()

if __name__ == '__main__':
    t = Thread(target=say)
    t.start()
    print("----")
    test()
    help(Thread)
    print("main")
    sync_test()
