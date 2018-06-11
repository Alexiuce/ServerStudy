# 18-server.py
# Created by Alexcai at 2018/6/9
"""  服务器 单进程 非阻塞

select 服务器 : 使用linux底层技术进行对连接的socket进行检测,并返回可以接受数据的socket (跨平台)

import select
select.select([收数据的套接字列表],[发数据的套接字列表],[套接字异常列表])  这个方法是阻塞式的.

"""


from socket import *
import select

def single_task():
    sc = socket(AF_INET,SOCK_STREAM)
    port = ('',23456)
    sc.bind(port)
    sc.setblocking(False)  # 设置套接字非阻塞
    sc.listen(5)
    

def select_server():
    server_socket = socket(AF_INET,SOCK_DGRAM)
    port = ('',9999)
    server_socket.bind(port)
    server_socket.listen(5)

    inputs = [server_socket]

    read_sockets,write_sockets,excepts = select.select(inputs,[],[])   # 使用select 进行检查套接字是否可以收数据 阻塞方式

    for sock in read_sockets:
        if sock == server_socket:
            client_socket,client_info = server_socket.accept()
            inputs.append(client_socket)
        else:
            data = sock.recv(1024)
            if len(data) > 0:
                sock.send(data)
            else:
                inputs.remove(sock)
                sock.close()







if __name__ == '__main__':
    pass
