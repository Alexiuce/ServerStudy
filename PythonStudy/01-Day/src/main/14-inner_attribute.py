# 14-inner_attribute
# Created by Alexiuce at 2018/5/24
""" 内建属性和方法

__repr__ :  与 __str__ 作用相同,但是显示的是不是可读性
__dir__ :
__dict__:
__getattribute__ : 属性/方法拦截器  ()
"""


a = 100
print(a.__dir__)


class Person(object):
    def __init__(self, name):
        self.name = name
        self.age = 20

    # 属性和方法拦截处理
    def __getattribute__(self, item):
        if item == "name":
            return "xiuce"
        else:
            return object.__getattribute__(self, item)


p = Person("alex")
print(p.name)
r = range(0, 10, 3)
for i in r:
    print(i)
help(range)
print(type(r))

""" map  & filter  & reduce 
map(func, iter,iter2...) : 第一个参数为函数或者lambda, 第二个参数为可迭代对象 : 每个迭代元素作为参数传递到func中执行
filter():
reduce():

"""
arr = [1, 3, 4, 5]
res = map(lambda x: x+2, arr)
for i in res:
    print(i)

r1 = filter(lambda x: x > 2, arr)

print('-------filter-------')
for i in r1:
    print(i)

""" function tools
常用函数: 
partial(): 偏函数, 通常用来给一下函数设置默认固定的调用参数, 简化使用. 它的返回值就是带固定默认参数的新函数
wraps(): 在装饰器的使用过程中,会丢失一些关于原方法的文档信息, 使用wraps可以消除这种副作用

"""
import functools

def deca(func):

    @functools.wraps(func)      # 对原函数的信息进行保留
    def inner(*args, **kwargs):
        """this is inner"""
        return func(*args, **kwargs)
    return inner

@deca
def test(*args, **kwargs):
    """this is test """
    print(args)
    print(kwargs)


p1 = functools.partial(test, 1, 2, 3)

p1()
p1(4, 5, 6)

help(test)    # 使用help 查看test 的相关说明信息


