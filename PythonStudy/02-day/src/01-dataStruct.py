# 01-dataStruct.py
# Created by Alexcai at 2018/6/24

""" 练习题1
如果a + b + c = 1000 ,且a^2 + b^2 = c^2 (a,b,c 为自然数),如何求出所有a,b,c的组合

"""

def sample_1():

    # r1 = (x for x in range(1001))
    # r2 = (x for x in range(1001))
    # r3 = (x for x in range(1001))
    rang1 = range(1001)


    """时间复杂度T
    大O记法: 
    
    复杂度顺序:
    
    O(1) < O(log n) < O(n) < O(n* log n) < O(n^2) <O(n^3) < O(2^n) < O(n!) < O(n^n)
    
    """
    # T = 1000 * 1000 * 1000 *2
      # T(n) = N * N * N * 2 时间复杂度,n 代表范围规模
      # T(n) = k* N^3

    # for a in rang1:
    #     for b in rang1:
    #         for c in rang1:
    #             if a + b + c == 1000 and a**2 + b**2 == c**2:
    #                 print("a=%d b=%d c=%d" %(a,b,c))


    for a in rang1:
        for b in rang1:
            c = 1000 - a - b
            if  a**2 + b**2 == c**2:
                print("a=%d b=%d c=%d" %(a,b,c))



""" timeit 模块 (代码执行时间测量模块)
class timeit.Timer(stmt='',setup='',timer=<func>)
* stmt : 需要测试的代码语句
* setup: 运行代码的设置
* timer: 定时器函数


timeit.Timer.timeit(number=100)


"""
from timeit import Timer

def test():
    l = []
    for i in range(100):
        l.append(i)

def tet1():
    l = []
    for i in range(100):
        l += [i]

def tet2():
    l = [i for i in range(100)]

def tet3():
    l = list(range(100))

def timer_sample():
    timer1 = Timer('test()','from __main__ import test')
    tr = timer1.timeit(10000)
    print("append:",tr)

    timer2 = Timer('tet1()','from __main__ import tet1')
    tr2 = timer2.timeit(10000)
    print("array += :",tr2)

    timer3 = Timer('tet2()','from __main__ import tet2')
    tr3 = timer3.timeit(10000)
    print("list generator:",tr3)

    timer4 = Timer('tet3()','from __main__ import tet3')
    tr4 = timer4.timeit(10000)
    print("list ():",tr4)



if __name__ == '__main__':
    # sample_1()
    timer_sample()