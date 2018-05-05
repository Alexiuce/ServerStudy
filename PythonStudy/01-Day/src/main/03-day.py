# 03-day.py
# Created by Alexcai at 2018/5/5

""" 文件操作
open("文件名",方式) : 打开文件

r  :  只读  (默认方式,可省略)
w  : 写
a  : 追加

write() : 写入内容
read(size) : 从文件中读取内容  size表示读取多少 默认为全部 并移动文件指针,下次read时会从上一次的位置开始向后取内容



f = open("abc.txt", "w")
f.close()

# f.write("hello file")
# r = f.read(1)
# print(r)

filename = "abc.txt"
ns = filename.rsplit(".", 1)

position = filename.rfind(".")
print(filename[0:position])
print(filename[position:])
print(ns)

"""

# read & readlinse
"""
read(size)  : 默认全部读取,返回字符串 
readline():  读取一行
readlines() : 按行读取,返会列表(包含所有行)
"""

# 文件定位读写
"""
seek(offset, from) : 文件偏移
offset: 偏移量
from: 0 -- 文件开始位置  1 -- 文件当前位置  2 --- 文件末尾

tell(): 获取当前读取的文件位置

"""