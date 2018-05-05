# 03-day.py
# Created by Alexcai at 2018/5/5

""" 文件操作
open("文件名",方式) : 打开文件

r  :  只读
w  : 写
a  : 追加

write() : 写入内容
read(size) : 从文件中读取内容  size表示读取多少 默认为全部 并移动文件指针,下次read时会从上一次的位置开始向后取内容



f = open("abc.txt", "w")
f.close()

# f.write("hello file")
# r = f.read(1)
# print(r)
"""

filename = "abc.txt"
ns = filename.rsplit(".", 1)

position = filename.rfind(".")
print(filename[0:position])
print(filename[position:])
print(ns)



