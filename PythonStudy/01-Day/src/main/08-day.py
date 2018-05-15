# 08-day
# Created by Alexiuce at 2018/5/15

"""
==  :  判断值是否相同
is  :  判断内存地址是否相同

数值 从-5 ~ : == 与 is 判断是相同的
"""

a = [11, 22, 33]
b = [11, 22, 33]

print(a == b)
print(a is b)

c = 10000
d = 10000

print(c == d)
print(c is d)

import copy
""" 
import copy

深拷贝: 递归调用复制
浅拷贝: 引用复制 ,元组使用copy时,不会创建新元组,因为元组为不可变类型
"""
a1 = copy.deepcopy(a)
print(id(a))
print(id(a1))

c1 = [a, b]
d1 = copy.deepcopy(c1)
a.append(44)
print(c1[0])
print(d1[0])

t1 = (a, b)
t2 = copy.copy(t1)
print(id(t1))
print(id(t2))
a.append(10)
print(t1[0])


