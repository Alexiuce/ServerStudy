

"""

类的定义
class 类名:
    属性
    方法 : 方法参数必须有self
    def 方法名(self):
        方法体

"""


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



c = Cat("tom",13)
c.eat()
c.sleep()
c.name = "bluecat"
c.say()
print(c)

