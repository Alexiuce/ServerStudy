

'''

from urllib import parse
from urllib import request


url = "https://www.baidu.com/s"

param = {"wd": "富通天下"}

word = parse.urlencode(param)
new_url = url + "?" + word
my_request = request.Request(new_url)
response = request.urlopen(my_request)
print(response.read().decode())
'''


def my_add(a1, b1):
    ''' 完成加法运算 '''
    return a1 + b1

'''

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
'''

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

"""


def my_default_func(a=10, b=9):
    print(a + b)


my_default_func(9)

