

"""

类的定义
class 类名:
    属性:(这里的都是类属性)   使用: 类名.属性 获取
    方法 : 方法参数必须有self
    def 方法名(self):
        方法体

"""

""" example
class Cat:

    # 初始化方法
    def __init__(self, name, age):
        print("init ....")
        self.name = name
        self.age = age

    # 描述方法,相当于的 oc 中的 description
    def __str__(self):
        return "%s 的年龄%d" % (self.name, self.age)

    # 自定义方法
    def eat(self):
        print("cat eat fish...")

    def sleep(self):
        print("cat sleep on ground")

    def say(self):
        print("%s 的年龄是%d" % (self.name, self.age))


c = Cat("tom", 13)
c.eat()
c.sleep()
c.name = "blue cat"
c.friends = "steven"
c.say()
print(c)
print(c.friends)



class SweetPotato:

    def __init__(self):
        self.cookedString = "生的"
        self.cookedTimer = 0
        self.__s = ""   # 定义私有属性

    def __test(self):
        print("这个是私有方法")

    def cooked(self, time):
        self.__test()
        self.cookedTimer += time
        if 0 < self.cookedTimer < 3:
            self.cookedString = "半生"
        elif 3 < self.cookedTimer < 5:
            self.cookedString = "半熟"
        elif 5 < self.cookedTimer < 8:
            self.cookedString = "熟了"
        else:
            self.cookedString = "糊了"

    def __str__(self):
        return "烤了 %d 分钟 已经 %s" % (self.cookedTimer, self.cookedString)

    # 等价于oc的dealloc方法
    def __del__(self):
        print("对象释放了")

import sys
sp = SweetPotato()
sp.cooked(1)
print(sp.cookedString)
sp.cooked(3)
print(sp.cookedString)
sp.cooked(5)
print(sp.cookedString)

ar = ["23", "ab", "mo"]
sta = str(ar)
print(sta)
# print(sp.__s)

# rf = sys.getrefcount(sp)
# print(rf)

# 继承


class Animal:

    def eat(self):
        print("eat")

    def run(self):
        print("run")

    def sleep(self):
        print("sleep")

    # 私有方法
    def __say(self):
        print("say something...")
"""


""" 使用()表示继承某个类
支持多继承
class 类名(父类1, 父类2, 父类3....):
    pass
    
    
__mro__ : C3算法,决定多继承时,父类方法重名时的查找顺序     


class Dog(Animal):

    def bark_for_someone(self):
        print("wangwang...")

    # 重写父类方法
    def run(self):
        print("---fly on the sky---")
        # 调用父类被重写的方法 方式1
        # Animal.run(self)
        # 调用父类被重写的方法 方式2
        super().run()

    def __init__(self):
        print("init func ...")


d = Dog()
d.eat()
d.run()

print(id(Dog))

"""
# d.__say()     : 父类的私有属性和私有不能被继承

""" 类方法, 实例方法, 静态方法
类方法调用: 1, 使用类名调用 2 ,使用对象调用

Example
"""


class Game(object):

    level = 0   # 类属性,使用类名访问
    
    #实例方法
    def play(self):
        print("play game")

    @classmethod  # 使用@classmethod 将方法声明为类方法( @classmethod 本质是装饰器)
    def configured(cls):
        print("setup ...")
        cls.level = 100

    @staticmethod  # 静态方法, 可以没有参数
    def test():
        print("star play")


g = Game()
# Game.configured()
g.configured()
print(Game.level)
Game.test()
g.test()