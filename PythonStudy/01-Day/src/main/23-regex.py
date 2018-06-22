# 23-regex
# Created by Alexiuce at 2018/6/21
""" 正则模块 re

. 匹配任意一个字符(除了\n)

\d 任意一个数字0-9
\D 非数字

\s 任意空白字符 : 空格 tab符  \r \t 等

\w  单词字符: 字母 数字 下划线  可以参考标识符命名规则

[] 匹配[]中的任意一个元素
[^] 同上相反,匹配不包含在[]中的元素
=====================================================
数量描述

* : 任意个
+ : 至少1个
? : 0个或者1个
{n} : 重复n个
{m,} : 至少m个
{m,n}: m~n 个

re.match 方法

* 默认情况下,match 方法从左向右的检查字符串,一旦不匹配,就结束并返回结果

"""

import re


def test():
    """ re.match(正则,字符串) """

    pattern = "[a-z]+\d{4}"
    result = re.match(pattern,"abc123")
    print(result)

    print("*"*30)
    s = r'\nabc'   # 原始字符串
    print(s)



def main():
    test()



if __name__ == '__main__':
    main()

