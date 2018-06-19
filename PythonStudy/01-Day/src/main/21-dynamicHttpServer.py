# 21-dynamicHttpServer.py
# Created by Alexcai at 2018/6/16

"""
dynamic web server

"""

from socket import *
from multiprocessing import Process
import re
import sys

PY_DIR = "./msgkit"

res = """HTTP/1.1 200 OK

<html>
Hello Python ...
</html>
"""

class WebServer(object):

    def __init__(self,port):
        self.__port__ = port
        server_sock = socket(AF_INET,SOCK_STREAM)
        server_sock.bind(('',port))
        self.__server_sock__ = server_sock

    def start(self):
        self.__server_sock__.listen(5)
        while True:
            client_sock,client_addr = self.__server_sock__.accept()
            p = Process(target=self.handle_resquest,args=(client_sock,))
            p.start()
            client_sock.close()

    def start_response(self,status_code,response_headers):
        pass


    def handle_resquest(self,client):
        request_data = client.recv(1024)
        print(request_data)
        filename = request_data.decode('utf8')
        filename = filename[1:-3]
        if filename.endswith('.py'):

            m = __import__(filename)
            env = {}
            response_body = m.application(env,self.start_response)
            print(response_body)

        client.send(res.encode('utf8'))
        client.close()


"""动态导入模块

model = __import__(模块名)   # 根据模块名导入相应的模块并返回导入的模块

*python 先从当前目录导入py文件,如果没有,会到系统默认的路径中寻找

* import sys 后,可以通过sys.path 添加模块搜索路径,便于找到我们自定目录下的py文件

"""

def test():
    sys.path.insert(1,PY_DIR)
    print(sys.path)

    m = __import__('HelloModel')
    m.say()

def reg_test():
    str = "http://192.168.0.111/hello.py?id=12&code=abc"
    print(re.match(r'\w+:', str).group(0))
    header = "GET / HTTP1.1"
    print(re.match(r'\w+', header).group(0))


def main():
    web = WebServer(6789)
    web.start()

if __name__ == '__main__':
    # main()
    test()
    # reg_test()




