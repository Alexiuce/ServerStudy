#coding=utf8

import re

s = 'Hello world for your python'
print("hello  python")
# print("世界 你好")
m = re.match('H',s)
if m is not None:
    print(m.group())