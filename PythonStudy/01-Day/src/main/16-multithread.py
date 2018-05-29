# 16-multithread
# Created by Alexiuce at 2018/5/28
""" 多线程 threading 模块 Thread

- 使用Thread(target) 创建子线程
- 使用类,并且继承Thread,实现run方法(与Process 类实现相似)

- 多线程数据共享: 互斥锁
from threading import Lock
acquire() : 加锁
release() : 解锁

"""

from threading import Thread
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


def test():
    for _ in range(5):
        th = MThread()
        th.start()

if __name__ == '__main__':
    t = Thread(target=say)
    t.start()
    print("----")
    test()
    print("main")
