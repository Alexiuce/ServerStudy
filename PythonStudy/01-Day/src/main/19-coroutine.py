# 19-coroutine
# Created by Alexiuce at 2018/6/12

""" 协程
* 计算密集型 : python 中因为GIL的存在,使用多进程效率比多线程高
* io密集型 : 建议使用多线程或者协程

* 协程的切换由开发者控制

"""


import time
from greenlet import greenlet
import gevent


def fun_a():
    while True:
        print('A-----')
        yield
        time.sleep(1)

def fun_b(t):
    while True:
        print('B-----')
        next(t)    # python3中,使用next(t); python2 中使用t.next()
        time.sleep(1)

""" greenlet 版本
"""

def func_c():
    while True:
        print("C------")
        g2.switch()
        time.sleep(0.5)

def func_d():
    while True:
        print("D------")
        g1.switch()
        time.sleep(0.5)


""" gevent 版本 

* 自动切换协程

"""
def func_e(n):
    for i in range(n):
        print(gevent.getcurrent())
        gevent.sleep(0.5)



if __name__ == '__main__':
    # 生成器方式(协程原理)
    # a = fun_a()
    # fun_b(a)

    # greenlet 方式的协程切换
    # g1 = greenlet(func_c)
    # g2 = greenlet(func_d)
    # g1.switch()

    # gevent 方式的协程切换
    ge1 = gevent.spawn(func_e,4)
    ge2 = gevent.spawn(func_e,4)
    ge3 = gevent.spawn(func_e,4)

    ge1.join()
    ge2.join()
    ge3.join()