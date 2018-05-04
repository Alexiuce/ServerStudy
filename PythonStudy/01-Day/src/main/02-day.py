

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

"""
"""

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


def mulity_nums(n):
    if n == 1:
        return 1
    else:
        return n * mulity_nums(n-1)


print(mulity_nums(5))



