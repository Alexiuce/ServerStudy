

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
    print(aaaa)
    print("123")
except NameError:
    print("name not exist")

try:
    11/ 0
except Exception as error:
    print(error)


# 自定义异常
"""
  raise 自定义类(): 抛出自定义的异常, 自定义异常类必须继承Exception 才可以被raise 抛出  
"""


class CustomException(Exception):

    def __init__(self, name):
        self.name = name


try:
    print("begin....")
    raise CustomException("hello")
except CustomException as result:
    if result.name == "hello":
        print("happend exception")
        print(result.name)
    else:
        raise     # 将异常继续抛出

# if 判断 真假
"""
空的字符串/元组/列表/字典 以及none,0 都表示假
"""
if "":
    print("ok")
if []:
    print("[]")
if {}:
    print("{}")
if ():
    print("()")
if 0:
    print("0")
if None:
    print("none")


