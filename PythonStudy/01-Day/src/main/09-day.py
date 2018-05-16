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


p = Person()
p.__age = 5
print(p.__age)
