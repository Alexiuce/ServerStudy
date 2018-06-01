# 17-tcpip
# Created by Alexiuce at 2018/5/31

""" TCP/IP  Socket


"""
from socket import *
import time


def upd_socket_test():
    s = socket(AF_INET,SOCK_DGRAM)   # 创建socket 对象, 使用udp协议
    host = ("10.211.55.3",8080)    # 设置目标主机与端口
    """
    sendto(bytes,port): 
    当发送字符串时,需要使用encode('utf-8') 对字符串进行编码后才可以发送
    可以在字符串前使用b来作为编码标识
    
    接收到字符串时,如果需要解码,需要使用decode("编码格式") 进行解码
    """
    s.sendto(b"hello",host)     # 发送数据到目标主机
    s.sendto(b'world',host)
    s.close()   # 关闭socket

def upd_receive_test():
    sc = socket(AF_INET, SOCK_DGRAM)
    port = ("", 9988)    # 默认地址为"" 表示本机的任意网络接口
    sc.bind(port)     # socket 绑定本机端口
    rece_data = sc.recvfrom(1024)
    print(rece_data)


def udp_chat_test():
    sc = socket(AF_INET,SOCK_DGRAM)
    port = ('', 9999)
    sc.bind(port)
    while True:
        rece_data,client_info = sc.recvfrom(1024)
        text = rece_data.decode('gb2312')
        client_host,client_port = client_info
        if text == "quit":
            break
        print("receive message from %s:%d ->%s "%(client_host,client_port,text) )
        sc.sendto(rece_data,client_info)   # 将接收到的信息返回给发送者
    sc.close()


if __name__ == '__main__':
    # upd_socket_test()
    # upd_receive_test()
    udp_chat_test()
    print(time.ctime())