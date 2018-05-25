

"""


from urllib import parse
from urllib import request


url = "https://www.baidu.com/s"

param = {"wd": "富通天下"}

word = parse.urlencode(param)
new_url = url + "?" + word
my_request = request.Request(new_url)
response = request.urlopen(my_request)
print(response.read().decode())


def my_add(a1, b1):
    return a1 + b1


def print_line():
    print(a)


def modify_a():
    global a   # 声明a 是全局变量 ,否则下面的代码就会定义局部变量
    a = 200


nums = [1, 2, 3, 4, 5, 6]


def array_example():
    for num in nums:
        print(num)

    nums[1] = 90
    nums.append(89)
全局变量
a = 100

# print(my_add(10, 2))
print_line()
modify_a()
print_line()


help(my_add)

"""

# array_example()
# print(nums)

"""
函数多个返回值
def get_numbers():
    return 1, 2, 3, 4
print(get_numbers())
"""

"""函数的默认参数
设置默认参数的方向: 从右向左



def my_default_func(a=10, b=9):
    print(a + b)


my_default_func(9)
"""

""" 可变参数
* args  : 使用* 表示以元组的方式接收剩余参数 ,要放在形参的最后位置
** kwargs : 以字典方式接收参数


def mutil_add(a, b, *args, **kwargs):
    print(a)
    print(b)
    print(args)
    print(kwargs)
    total = a + b
    for num in args:
        total += num
    print(total)


mutil_add(1, 2, 3, 4, 5, 6)
mutil_add(1, 2, 3, 5, name=12, age=30)

"""
""" 拆包
* 可以对元组或数组进行拆解,变为一个一个元素
  对字典表示拆解出key
** 对字典进行拆解: 方式为key=value 仅用于传递参数用


ma = [1, 2, 5, 8]

dict1 = {"name": "alex", "age": 30}

mutil_add(1, 2, *ma, **dict1)
"""
#  引用
'''
id(变量) : 获取变量的引用地址

q = 100
p = q
print(id(q))
print(id(p))

a1 = [1, 2]
b1 = a1
a1.append(3)
print(b1)
'''
# 递归

"""
def mulity_nums(n):
    if n == 1:
        return 1
    else:
        return n * mulity_nums(n-1)


print(mulity_nums(5))
"""
# 匿名函数  lambda 表达式
"""
lambda 参数: 语句
 * 语句前默认有return ,所以lambda 仅支持一个简单的表达式



l1 = lambda x, y: x + y
print(l1(1, 2))

perInfos = [{"name": "alex", "age": 18}, {"name": "blex", "age": 108}, {"name": "clex", "age": 28}]


# 根据key值进行排序
perInfos.sort(key=lambda x: x["age"])
print(perInfos)


def lamb_func(a, b, func):       # 参数func 接收一个lambda 表达式
    r = func(a, b)
    print(r)


lamb_func(9, 2, lambda x, y: x + y)    # 传递一个lambda 到函数中


fn = input("please input a func to do ")
fn = eval(fn)   # python3 中 eval 去掉字符串的最外层的"",
lamb_func(10, 20, fn)

# 列表的 + 和 += 是不同的操作 : += 不会改变地址 +后结果会改变引用新的地址
t1 = [100]
print(id(t1))
t1 += t1
print(id(t1))
t1 = t1 + [200]
print(id(t1))
"""

# 字符串的操作  find
my_str = "this is hello world for python"
"""
result = my_str.find("is")
print(result)
r1 = my_str.rfind("is")   # 从右向左查找
print(r1)
new_str = my_str.replace("is", "at")  # 替换后返回新的字符串
print(new_str)
items = my_str.split(" ")   # 切割字符串
print(items)

print(my_str.title())         # 每个单词的首字母大写
print(my_str.capitalize())    # 第一个单词首字母大写
print(my_str.lower())         # 小写
print(my_str.upper())         # 大写

print(my_str.center(100))      #文字居中 ,总宽度100
print(my_str.rjust(100))       # 宽度100,文字右对齐
print(my_str.ljust(100))       # 文字左对齐,宽度100

print(my_str.lstrip())       # 去除左边的空白字符
print(my_str.strip())       # 去除左右两边的空白字符
"""


print(my_str.partition("world"))   # 以world 为中心 进行左右分割

print(my_str.isalpha())
print(my_str.isdigit())
print(my_str.isalnum())

s1 = "123"
s2 = "abd"
print(s1 + s2)


