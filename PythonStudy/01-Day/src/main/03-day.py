# 03-day.py
# Created by Alexcai at 2018/5/5

import os

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
# 文件操作
"""
导入 os 
os.mkdir()  : 创建文件夹
os.getcwd(): 获取当前路径
os.rename(old,new) : 重命名文件
os.remove(filename) : 删除文件(当前文件夹内)
os.chdir(path) : 变更当前路径
os.listdir(path) : 获取路径下的内容列表
os.rmdir(path) : 删除文件夹

"""

print(os.getcwd())
print(os.listdir())



