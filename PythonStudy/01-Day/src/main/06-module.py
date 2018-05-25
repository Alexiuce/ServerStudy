
import sys  # 导入系统模块
import msgkit
import hashlib
import pdb

print(sys.argv)   #获取应用传递进来的参数 列表类型,第一个参数是应用文件本身
print("06 ")
msgkit.HelloModel.say()

help(hashlib.md5)

pdb.set_trace()   # 开启pdb 进行调试后面的代码
p = hashlib.md5(b"joinf")

print(p.hexdigest())

