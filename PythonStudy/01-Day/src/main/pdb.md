""" pdb 调试  (命令方式)

python -m pdb xxxx.py

"""

l : 显示当前代码 (list)
n : 执行下一步 (next)
c : 继续执行代码 (continue) ,针对断点
b 数字 : 给指定行数添加断点
clear 断点序号: 删除断点

s : 跳入代码内部 (step in)
p 变量: 显示变量值(print)
a : 显示所有参数 (args)
r : 快速执行到return 语句 (方法和函数内常用)
q : 退出调试 (quit)


""" (交互方式)

import pdb
pdb.run("待调试的方法以及参数")
此时会打开pdb进行调试, 使用s命令跳进方法内部进行debug

"""

""" (埋点设置)

import pdb
pdb.set_trace()  # 执行到这句时,开启pdb 调试
"""