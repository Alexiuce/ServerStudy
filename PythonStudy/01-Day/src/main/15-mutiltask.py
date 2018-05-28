# 15-mutiltask.py
# Created by Alexcai at 2018/5/26
""" 多任务
fork : 仅能在类Unix系统上使用
通用方式 : from multiprocessing import Process
"""

from multiprocessing import Process

from time import sleep
import os

def sing(q):
    for _ in range(3):
        print("sing....")
        q.put("222..")
        # os.getpid()    # 获得当前进程的pid
        # os.getppid() # 获取父进程的pid
        sleep(1)

def dance(q):
    for _ in range(3):
        print("dance.....%d " % os.getpid())
        print(q.get())
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
""" 
默认Process的主进程会等待子进程执行结束后才会结束,但代码的执行不会等待子进程

join(): 主进程会等待子进程结束后才会结束
"""

def test1():
    p = Process(target=sing)
    p.start()    # 启动子进程
    # p.join()    # join方法会等待子进程执行结束后再继续执行后面的语句( 即阻塞效果) ,可以传递参数用来表示阻塞的时长
    print('test....')
    # p.terminate():  结束子进程

"""  使用类(继承Process)实现多进程
1. 定义一个类继承自Process
2. 重写run方法

"""

class MProcess(Process):
    def __init__(self, interval):
        super().__init__()
        self.interval = interval

    # 重写父类的run 方法 当代用对象的start 方法时,系统会自动调用run方法
    def run(self):
        while True:
            print("MProcess ... run")
            sleep(1)



""" 进程池
from multiprocess import Pool
"""
from multiprocessing import Pool

""" 进程间通信 Queue

from queue import Queue
get(): 获取最新的队列消息
put(): 添加消息到队列
qsize(): 获取队列当前消息数
empty(): 判断队列是否已空
full():  判断队列是否已满
put_nowait(): 立即添加消息到队列
get_nowait(): 立即获取队列中的消息

* 进程池中的Queue
- 必须使用Manager().Queue() 的队列才可以

"""

from multiprocessing import Manager

from queue import Queue
def queue_test():
    q = Queue(3)
    q.put("hh")

    print(q.qsize())
    print(q.get())



def queue_reqd(q):
    print("read queue: %s" % q.get())

def queue_write(q,t):
    print("write queue: %s" % t)
    q.put(t)


if __name__ == '__main__':
    # test1()

    # 使用继承类实现多进程
    # mp = MProcess(2)
    # mp.start()   # 开启子进程
    # mp.join()   等待子进程结束后再执行后续代码

    # 使用进程池
    pool = Pool(3)       # 创建进程池, 有3个子进程
    pq = Manager().Queue()


    for i in range(2):    # 添加任务
        pool.apply_async(queue_write, (pq,str(i)))   # 异步方式添加任务
        pool.apply_async(queue_reqd, (pq,))  # 同步方式执行任务

    pool.close()   # 关闭进程池后, 不能再向进程池中添加任务
    pool.join()    # 进程池阻塞,等待进程池中的任务结束再继续
    print("main")