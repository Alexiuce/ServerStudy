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

# 使用类的方式实现多线程
def test():
    for _ in range(5):
        th = MThread()
        th.start()


""" 生产者消费者模式 (解耦)
python2: from Queue import Queue
python3: from queue import Queue


"""
from queue import Queue

class Producter(Thread):
    def run(self):
        count = 0
        while True:
            if my_queue.qsize() < 1000:
                for i in range(100):
                    count += 1
                    msg = "制作产品" + str(count)
                    my_queue.put(msg)
                    print(msg)
            time.sleep(1)

class Customer(Thread):

    def run(self):
        while True:
            if my_queue.qsize() > 100:
                for i in range(3):
                    print(self.name + "消费产品" + my_queue.get())
            time.sleep(1)

def pc_test():
    for i in range(500):
        my_queue.put("初始产品" +  str(i))
    for _ in range(2):
        p = Producter()
        p.start()
    for _ in range(5):
        c = Customer()
        c.start()

"""ThreadLocal 线程全局对象 """
import threading

tl = threading.local()  # 创建全局的线程对象, 不同线程该对象的同一个属性的修改不会影响其他线程在此属性上的赋值和取值...
def local_task(name):
    tl.name = name
    proce_name()

def proce_name():
    n = tl.name
    print("hi, %s in thread: %s" % (n, threading.current_thread().name))



def local_test():
    t1 = Thread(target=local_task,args=("alex",),name="Tha")
    t2 = Thread(target=local_task,args=("xiuce",),name="Thb")
    t1.start()
    t2.start()
    t1.join()
    t2.join()

"""进程异步回调"""

from multiprocessing import Pool
import os

def atest():
    print("进程池中的进程 %d , ppid= %d" % ( os.getpid(), os.getppid()))
    for i in range(3):
        print("i = %d " % i)
        time.sleep(1)
    return "good"

def btest(args):
    print("callback pid = %d" % os.getpid())
    print("args = %s" % args)


def async_callback():
    pool = Pool(3)
    pool.apply_async(atest,callback=btest)
    pool.close()
    pool.join()


if __name__ == '__main__':
    # 多线程任务实现方式1
    # t = Thread(target=say)
    # t.start()

    # 使用类实现多线程
    #  test()


    # 线程同步
    # sync_test()

    # 生产者,消费者模式
    # my_queue = Queue()
    # pc_test()

    # 全局线程对象
    # local_test()

    # 进程 异步回调
    async_callback()

