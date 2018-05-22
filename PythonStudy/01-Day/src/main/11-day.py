# 11-day
# Created by Alexiuce at 2018/5/21

""" 生成器
*  保存的是生成元素的计算方法,获取元素时,根据计算结果生成需要的元素
"""

arr = [x for x in range(10, 34)]     # 列表推导式, 会一次性创建包含所有元素的列表,占用内存
print(arr)

# 生成器方式1
gen_arr = (x for x in range(10))    # 生成器, 保存的是生成元素的计算方法,获取元素时,根据计算结果生成需要的元素
print(gen_arr)


ag = next(gen_arr)   # next(生成器) 等价于 生成器.__next__()


# 生成器的方式2
""" 使用yield 关键字
* 只要使用了yield的函数,就会变成生成器
* 若使用变量接收yield 的返回值,则表示接收调用生成器的send方法时传递的参数, send方法会继续执行yield后续的代码
* 若对生成的首次访问时是使用send(之前没有对生成器使用过next方法),会报错,解决方式有两种: 1, 先调用生成器的next, 2. send方法的参数传None
"""


def gen_number():
    a, b = 0, 1
    for _ in range(10):
        yield b         # 对生成器使用next()方法时, yield 会阻塞函数运行,并返回yield 后的值返回,若再次调用next(方法),会从yield阻塞的地方继续执行,直到再次遇到yield时阻塞
        a, b = b, a + b


n = gen_number()

for num in n:
    print(num)

"""yield 多任务示例 ( 协程 )
"""
import time


def task_one():
    while True:
        print("task one doing....")
        yield None


def task_two():
    while True:
        print("task two doing ....")

        yield None


t1 = task_one()
t2 = task_two()

while True:
    next(t1)
    time.sleep(1)
    next(t2)

