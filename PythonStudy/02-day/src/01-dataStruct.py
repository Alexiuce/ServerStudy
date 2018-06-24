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
            c = 1000 - q - b
            if  a**2 + b**2 == c**2:
                print("a=%d b=%d c=%d" %(a,b,c))








if __name__ == '__main__':
    sample_1()