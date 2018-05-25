# 09-day
# Created by Alexiuce at 2018/5/16
"""私有化
xx : 共有属性或方法
_xx: 私有属性或方法, from module import * 时不会导入此属性或方法,类对象或子类可以访问  (对 import module 方式无效)
__xx: 私有属性或方法,无法在外部直接使用   (对 import module 方式无效)
__xx__ : python 提供的方法,不建议自己使用这种方式命名
xx_ : 后置下划线,避免与系统的某些关键字重名

私有属性或方法: 名字改编机制

私有属性或方法实际上被重新命名: 规则 _类名__私有属性或方法

"""


class Person(object):
    def __init__(self):
        self.__age = 100

    # property 方式1
    # def set_age(self, new_age):
    #     self.__age = new_age
    #
    # def get_age(self):
    #     return self.__age
    # age = property(get_age, set_age)

    # property 方式2

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, new_age):
        self.__age = new_age


p = Person()
# print(p.__age)
p.age = 120
print(p.age)

""" Property : 相当于 Objective-C 中的点语法对setter 和getter 的封装   
property(get方法名, set方法名)  : 第一个参数为get方法,第二个参数为set方法

"""


"""迭代器(在上一个的基础上继续....)


"""

from collections import Iterable
from collections import Iterator


it = isinstance("abc", Iterable)   # 判断是否可以迭代
print(it)

it1 = isinstance([1, 2, 3], Iterator)  # 判断是否是迭代器, 迭代器可以调用next方法来获取下一个元素
print(it1)

it2 = iter("abc")   # 将可迭代对象转换为迭代器对象,
print(next(it2))
print(next(it2))

"""闭包
在一个外函数中定义了一个内函数，内函数里运用了外函数的临时变量，并且外函数的返回值是内函数的引用。这样就构成了一个闭包
"""


def outside_func(func):

    def inner_func():
        print("添加装饰效果....")
        func()
    return inner_func


# a = outside_func()
# a()

""" 装饰器
一种遵循开放封闭原则的语法糖
对已有功能进行扩展
* 多个装饰器对同一个方法的效果是从下到上的顺序执行(离被装饰方法最近的最先获得执行效果)
装饰器执行时刻: 解释器解析的时候就会执行装饰器代码,而不是等到函数调用的时候.

* 装饰器装饰的时候是从下向上进行装饰, 执行的时候是从上到下的顺序执行, 就像装箱(装饰)和拆箱(调用)的顺序刚刚相反一样

"""


def decorate_func(func):
    def wap1():
        print("decorating....")
        func()
    return wap1


@decorate_func
@outside_func              # @闭包 即为装饰器, 它等价于 test_example = outside_func(test_example)
def test_example():
    print("test.....")


@outside_func
def test_example1():
    print("test.....1")


test_example()
""" 带参数的函数进行装饰  : 使用 *args 和 **kwargs 接收可变参数

带参数的装饰器:需要对装饰器再使用一个函数进行封装,并且由此函数来接收外界传递的参数: 即相当于对一个装饰器又使用了一层装饰

"""


def func_args(v):
    print(v)

    def decorator_func(func):
        def inner_func():
            func()
        return inner_func
    return decorator_func


def common(func):
    def inner_func(*args, **kwargs):
        print("common func decorator")
        # 如果func 有返回值,则需要处理返回值
        result = func(*args, **kwargs)
        return result
    return inner_func


@common
def test1(a):
    print(a)


@common
def test2(a, b, c):
    print("a = %d, b=%d, c= %d" % (a, b, c))


@func_args("hello ...")
def test3():
    print("test3....")


test1(10)
test2(1, 11, 111)
test3()

