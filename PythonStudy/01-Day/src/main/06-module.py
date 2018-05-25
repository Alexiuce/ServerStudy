
import sys  # 导入系统模块
import msgkit
import hashlib


print(sys.argv)   #获取应用传递进来的参数 列表类型,第一个参数是应用文件本身
print("06 ")
msgkit.HelloModel.say()

help(hashlib.md5)
p = hashlib.md5("joinf".encode("utf8"))
print(p.hexdigest())

