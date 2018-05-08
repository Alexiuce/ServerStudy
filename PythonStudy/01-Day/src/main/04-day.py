

"""

类的定义
class 类名:
    属性
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

"""


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
print(sp)
# print(sp.__s)

rf = sys.getrefcount(sp)
print(rf)

# 继承


class Animal:

    def eat(self):
        print("eat")

    def run(self):
        print("run")

    def sleep(self):
        print("sleep")


""" 使用()表示继承某个类
class 类名(父类):
    pass
"""


class Dog(Animal):

    def bark(self):
        print("wangwang...")


d = Dog()
d.eat()
