# 12-day
# Created by Alexiuce at 2018/5/22

""" 元类
* 类也是对象
* 使用type 创建类:  type(类名, 由父类名称组成的元组(针对继承情况)可以为空, 包含属性的字典(key=value))
* __metaclass__ : 如果类中明确设置了这个属性,则创建类时,会根据这个属性指定的方法创建该类.
* __metaclass__ = func(classname,fathername,attribute) : 这个方法必须有三个参数: 类名, 父类名,属性

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

Cat = type("Cat", (Animal,), {"name": "kitty"})

cat = Cat()
print(cat.name)

# __metaclass__ demo


def upper_attr(classname, fathername, old_attr):
    new_attr = {}
    a = ""
    a.upper()
    for name, value in old_attr.items():
        if not name.startswith("__"):
            new_attr[name.upper()] = value
    # 调用type创建类
    return type(classname, fathername, new_attr)


class Tai(object, metaclass=upper_attr):
    # __metaclass__ = upper_attr
    bar = "tip"


print(hasattr(Tai, 'bar'))
print(hasattr(Tai, "BAR"))


