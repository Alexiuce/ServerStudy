# 12-day
# Created by Alexiuce at 2018/5/22

""" 元类
* 类也是对象
* 使用type 创建类:  type(类名, 由父类名称组成的元组(针对继承情况)可以为空, 包含属性的字典(key=value))
"""


class Person(object):
    country = "china"
    print(country)

    def __init__(self):
        self.name = "alex"


class Animal(object):
    def __init__(self):
        self.age = 100


def select_class(name):
    if name == "p":
        return Person     # 返回类对象
    else:
        return Animal     # 同上


c1 = select_class("p")
print(type(c1))

T = type("Teacher", (), {"name": "alex"})    # 使用type 创建类对象 name是类属性
t1 = T()
print(T.name)
print(t1.name)

