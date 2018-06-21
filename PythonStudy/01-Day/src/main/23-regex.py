# 23-regex
# Created by Alexiuce at 2018/6/21
""" 正则模块 re

. 匹配任意一个字符(除了\n)

\d 任意一个数字0-9
\D 非数字

\s 任意空白字符 : 空格 tab符  \r \t 等

\w  单词字符: 字母 数字 下划线  可以参考标识符命名规则

"""

import re


def test():
    """ re.match(正则,字符串) """


    pattern = "\w"
    result = re.match(pattern," hi hello world hello alex")
    print(result)


def main():
    test()



if __name__ == '__main__':
    main()

