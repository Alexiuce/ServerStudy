# 13-garbagecollection
# Created by Alexiuce at 2018/5/23
""" python 垃圾回收

1. 小整数对象池:(常驻内存) [-5, 257) : Pycharm 会对python进行优化,超过此对象池时,依然不会创建新对象,验证需要使用python命令行确认.
2. 大整数对象池: 每一个大整数,都会创建一个新对象
3. intern 机制(常驻内存): 对不包含特殊符号(空格以及不可见字符)的字符串,不会多次创建 仅保留一份数据


* 回收机制:
1. 引用计数: 引用计数为0的对象会自动回收释放
2. 隔代回收: 使用链条隔代清除解决循环引用的问题.
"""
# 下面代码需要使用命令行模式
a = 100
b = 100
c = 100
print(id(a))
print(id(b))
print(id(c))

A = 100000
B = 100000
print(id(A))
print(id(B))

import gc

# gc.collect()  # 显示的调用垃圾回收

print(gc.get_count())    # 获取隔代链条的元素个数

print(gc.get_threshold())   # 隔代链条刷新清理的频率

