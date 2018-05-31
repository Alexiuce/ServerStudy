# 17-tcpip
# Created by Alexiuce at 2018/5/31

""" TCP/IP  Socket


"""
from socket import *



def upd_socket_test():
    s = socket(AF_INET,SOCK_DGRAM)   # 创建socket 对象, 使用udp协议
    host = ("10.211.55.3",8080)    # 设置目标主机与端口
    s.sendto(b"hello",host)     # 发送数据到目标主机
    s.close()   # 关闭socket


if __name__ == '__main__':
    upd_socket_test()