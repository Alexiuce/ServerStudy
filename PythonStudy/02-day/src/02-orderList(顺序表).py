# 02-orderList(顺序表)
# Created by Alexiuce at 2018/6/27

"""顺序表
1. 基本顺序表: 存储相同类型长度的数据(根据起始地址和偏移量可以计算任意位置的数据地址),数据在内存中连续存储.
2. 数据外置:  存储数据的地址,通过地址获取数据内容,数据在内存中非连续存储

 顺序表结构
* 表头信息:总容量,当前容量
* 数据区:

一体式: 表头信息与数据区连续存储,获取数据时跳过表头信息
分离式: 表头信息增加一个字段,用来存储数据地址

"""


#################
""" 栈与队列
1. 栈的特点:
2. 队列的特点: 

"""

class MStack(object):

    def __init__(self):
        self.__list = []

    def push(self, item):
        self.__list.append(item)

    def pop(self):
        return self.__list.pop()

    def peek(self):
        """返回顶部元素"""
        if self.__list:
            return self.__list[-1]
        else:
            return  None

    def is_empty(self):
        return self.__list == []

    def size(self):
        return len(self.__list)





def main():
    s = MStack()


if __name__ == '__main__':
    main()