# 10-day.py
# Created by Alexcai at 2018/5/20

""" 命名空间
globals:  显示全局信息
locals:   显示局部信息
LEGB规则: local-->encoding (闭包) --> global --> build_in
"""


a = 100
# print(globals())


def test():
    b = 10
    print(locals())


# test()


""" Python 的动态性
* 运行时给对象添加属性和方法


"""


class Person(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age


zs = Person("zhangsan", 20)

print(zs.name)