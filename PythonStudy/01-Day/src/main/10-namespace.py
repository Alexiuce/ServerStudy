# 10-namespace.py
# Created by Alexcai at 2018/5/20

""" 命名空间
globals:  显示全局信息
locals:   显示局部信息
LEGB规则: local-->encoding (闭包) --> global --> build_in
"""


a = 100
# print(globals())


def test(self):
    b = 10
    print(locals())


# test()


""" Python 的动态性
* 运行时给对象添加属性和方法
* 给实例添加方法时需要 import types
* 给类添加类方法或静态方法时,只需要使用赋值的方式即可: Person.new_func = 方法名
"""


class Person(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def eat(self):
        print("%s eating ...." % self.name)


zs = Person("zhangsan", 20)
zs.eat()
print(zs.name)

zs.run = test
# zs.run()
import types

zs.run = types.MethodType(test, zs)  # 将在调用test的时候,将zs当作self传递过去

zs.run()
""" 限制动态性
__slot__ : 定义class的使用,使用__slot__这个变量来指定该类只能使用的属性,不允许动态添加

"""


class Student(object):
    __slots__ = ("name", "age")


stu = Student()
stu.name = "alex"
stu.age = 33
print("%s age is %d" % (stu.name, stu.age))

stu.add = "bj"    # 这行代码会出错, 由于__slot__ 限制了动态给类添加属性的功能

