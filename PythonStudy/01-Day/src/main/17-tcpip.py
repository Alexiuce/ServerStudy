# 17-tcpip
# Created by Alexiuce at 2018/5/31

""" TCP/IP  Socket
"""
from socket import *
import time
from threading import Thread

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
        rece_data,client_info1 = sc.recvfrom(1024)
        text = rece_data.decode('gb2312')
        client_host,client_port = client_info1
        if text == "quit":
            break
        print("receive message from %s:%d ->%s "%(client_host,client_port,text) )
        sc.sendto(rece_data,client_info1)   # 将接收到的信息返回给发送者
    sc.close()

client_info = None

def receive_task(sc):
    global client_info
    while True:
        receiveInfo,client_info = sc.recvfrom(1024)
        text = receiveInfo.decode('gb2312')
        print("receive message: %s"%text)

def send_task(sc):
    while True:
        msg = input("please input message for send:")
        sc.sendto(msg.encode('gb2312'),client_info)


def chat_test():
    sc = socket(AF_INET,SOCK_DGRAM)
    port = ('',8899)
    sc.bind(port)
    t1 = Thread(target=receive_task,args=(sc,))
    t1.start()
    t2 = Thread(target=send_task,args=(sc,))
    t2.start()
""" TFTP 协议

读写请求:
  1(下载):2(上传)
     RD/WD | file name | 0 | mode | 0
     2Byte   nB string   1B  nB     1B
     
数据包:
    操作码(3) | 数据编号 |  数据
    2Bytes    2B      512Bytes
ACK:
    操作码(4) | 数据编号
    2Bytes  2Bytes
ERROR:
    操作码(5) | 错误码 | 错误信息 | 0
     2Bytes    2Bytes   nB       1Bytes 

* 大端序: 低位内存地址保持数据的高位内容
* 小端序: 低位内存地址保存数据的低位内容

import struct

pack: 数据包 ,将数据按照指定的格式进行封装
unpack: 解包 , 将指定的数据按照约定的格式进行解包
pack(fmt) : 以!开始表示网络数据格式, H表示2Byte; s表示一个Byte; b表示1Byte字节 
"""
import struct


def udp_broast_test():
    sc = socket(AF_INET,SOCK_DGRAM)
    # 设置套接字属性,允许发送广播数据
    sc.setsockopt(SOL_SOCKET,SO_BROADCAST,1)
    dest = ('<broadcast>', 8888)  # <broadcast> 代表当前网络的广播地址,有通用性
    sc.sendto(b"hello", dest)
""" TCP 套接字
* 默认情况下,tcp方式的套接字为主动套接字(可以发送数据)
* 如果需要接收数据,需要设置套接字变为被动套接字(可以接受数据)

* tcp server model
  def server(){
    socket = socket(AF_INET,SOCK_STREAM)
    socket.bind(port)
    socket.listen()
    while True:
        client_socket,client_info = socket.accept()
        #  如果需要多任务,可以将下面的while循环放到新的线程中执行即可
        while True:
            data = client_socket.recv(Buffer)
            ....
        client_socket.close()
    socket.close()        
  }

* 十种状态:
          client       |       server
            |                   |   listen()
    syn_sent|       syn-->      |
            |    <--syn+ack     |  syn_recv
            |       ack-->      |  established      
established |                   |
            |   <-- data -->    |
            |   <-- data -->    |
            |   <-- data -->    |
            |        ...        |
Fin_wait1   |    FIN --->       |   close_wait
Fin_wait2   |     <-- ack       |
            |     <-- Fin       |  last_ack
time_wait   |                   |
 2MSL       |     ack--->       |
  close     |                   |   close
            |                   |
            
            
* TTL : 最大转发次数(经过路由器) 
* MSL : 数据包在网络中的最长存活时间            

"""




def tcp_server_demo():
    # 创建tcp 套接字 : SOCK_STREAM
    tcp_sc = socket(AF_INET,SOCK_STREAM)
    tcp_sc.setsockopt(SOL_SOCKET,SO_REUSEADDR,1) # 运行socket 支持对端口的重新绑定
    port = ('', 23456)
    tcp_sc.bind(port)
    tcp_sc.listen(5)  # 已建立和未建立链接的队列长度, 并且套接字为被动套接字模式
    while True:
        tcp_client_socket,tcp_client_info = tcp_sc.accept()   # 阻塞式方法,开启接收数据, 一旦监听到有连接建立,返回一个元组(客户端套接字,客户端info(地址+端口))
        tcp_data = tcp_client_socket.recv(1024)
        print(tcp_data)





def tcp_client_demo():
    tcp_sc = socket(AF_INET,SOCK_STREAM)
    server = ('10.211.55.3',23456)
    tcp_sc.connect(server)
    tcp_sc.send(b"hello you ...")
    tcp_data = tcp_sc.recv(1024)
    tcp_sc.close()




def tcp_recv_task(sc):
    try:
        while True:
            data = sc.recv(1024)
            if len(data) > 0:
                print(data)
            else:
                break
    finally:
        sc.close()

def tcp_send_task(sc):
    pass


def tcp_mulit_task():
    sc = socket(AF_INET,SOCK_STREAM)
    sc.bind(('',9909))
    sc.listen(5)
    while True:
        csc,cinfo = sc.accept()
        t = Thread(target=tcp_recv_task,args=(csc,))
        t.start()
    sc.close()

""" raw socket 

"""

def raw_socket():
    pass

    
if __name__ == '__main__':

    # upd_socket_test()

    # upd_receive_test()

    # udp_chat_test()

    # print(time.ctime())

    # chat_test()

    send_data = struct.pack("!H8sb5sb", 1, b"test.png", 0, b"octet", 0)
    print(send_data)
    # tcp_server_demo()
    # tcp_client_demo()
