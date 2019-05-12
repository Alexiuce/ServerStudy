#coding=utf8

import re

s = 'Hello worlds for your python'
print("hello  python")
# print("世界 你好")
m = re.match('world',s)
if m is not None:
    print(m.group())


n = re.search('world',s)
if n is not None:
    print(n.group())
#  分组 | 模式
ps = "the dog sit down on the bat back~"
pt = 'bat|bet|bit'
pm = re.match(pt,'bit')
if pm is not None: 
    print(pm.group())
sm = re.search(pt,ps)
if sm is not None: 
    print(sm.group())

#  . 匹配除\n之外的任何字符(空白字符除外)
pd = '.the'
pdm = re.match(pd,ps)
if pdm is not None:
    print(pdm.group())
