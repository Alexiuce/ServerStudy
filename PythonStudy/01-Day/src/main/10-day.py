# 10-day.py
# Created by Alexcai at 2018/5/20

""" 命名空间
globals:  显示全局信息
locals:   显示局部信息
LEGB规则: local-->encoding (闭包) --> global --> build_in
"""


a = 100
print(globals())


def test():
    b = 10
    print(locals())


test()


