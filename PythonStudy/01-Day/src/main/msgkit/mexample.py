


""" 模块导入方式

import 模块名

from 模块名 import 具体功能1,功能2,....

from 模块名 import *   # 导入模块中的所有功能

import 模块名 as 新别名   # 导入模块并起个别名

"""

import HelloModel


def test1():
    print("module test.... 1")
    HelloModel.say()


print(__name__)


if __name__ == '__main__':
    print("ddddd")
    test1()

