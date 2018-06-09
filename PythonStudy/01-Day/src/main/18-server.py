# 18-server.py
# Created by Alexcai at 2018/6/9
"""  服务器 单进程 非阻塞

"""


from socket import *


if __name__ == '__main__':
    sc = socket(AF_INET,SOCK_STREAM)
    port = ('',23456)
    sc.bind(port)
    sc.setblocking(False)  # 设置套接字非阻塞
    sc.listen(5)
