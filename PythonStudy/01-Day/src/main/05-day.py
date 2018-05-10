

"""
 对象创建的过程 : __new__ --> __init__ --> return obj

  __new__ 方法:  必须有返回值    相当于oc 的 alloc 方法


"""

class Person(object):

    __share = None

    def __init__(self):
        print("init")

    def __str__(self):
        return "this is str"

    def __del__(self):
        print("dealloc")

    def __new__(cls, *args, **kwargs):    # cls是类对象
        print(cls)
        print(args)
        print(kwargs)
        if cls.__share is None:
            cls.__share =  super().__new__(cls)
        return cls.__share


p = Person()
e = Person()
print(id(p))
print(id(e))

""" 单利
class Person(object):

    __share = None

    def __new__(cls, *args, **kwargs):    # cls是类对象
        if cls.__share is None:
            cls.__share =  super().__new__(cls)
        return cls.__share

"""

# 异常处理
"""
try:
    xxx
except 异常类型名1:
    异常处理1...
except 异常类型名:
    异常处理2...
else:
    没有异常时才会执行
finally:
    无论是否异常,都会执行
    
    
多个异常处理

try:
    xxx
excepte (异常类型1, 异常类型2, 异常类型3 ....):
    处理代码
    
    Exception : 表示所有异常类型
"""

try:
    print(abc)
    print("123")
except NameError:
    print("name not exist")

try:
    11/ 0
except Exception as error:
    print(error)