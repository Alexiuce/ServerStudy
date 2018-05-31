# 17-tcpip
# Created by Alexiuce at 2018/5/31

""" TCP/IP  Socket


"""
from socket import *



def upd_socket_test():
    s = socket(AF_INET,SOCK_DGRAM)   # 创建socket 对象, 使用udp协议
    host = ("10.211.55.3",8080)    # 设置目标主机与端口
    s.sendto(b"hello",host)     # 发送数据到目标主机
    s.sendto(b'world',host)
    s.close()   # 关闭socket

def upd_receive():
    sc = socket(AF_INET, SOCK_DGRAM)
    port = ("", 9988)
    sc.bind(port)
    rece_data = sc.recvfrom(1024)
    print(rece_data)

if __name__ == '__main__':
    upd_socket_test()