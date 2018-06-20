# 22-webframework
# Created by Alexiuce at 2018/6/20

"""Web 框架"""




class Application(object):

    def __init__(self,routers):
        self.__routers__ = routers


    def __call__(self, env, start_response):
        path = env.get('PATH_INFO','/')
        # 路由逻辑判断
          # 1. 判断静态文件

        # 遍历路由,查找匹配的执行方法
        for url, handle in self.__routers__:
            if url == path:
                return handle(env,start_response)
        # 错误处理
        status = "404 Not Found"
        headers = []
        start_response(status,headers)
        return "Path not exist"


""" getattr 

获取对象的属性内容:
getattr(objc, attrname) : 获取对象objc的attrname属性

"""



def application(env,start_response):
    urls = [
        ('/hello',handle_hello)
    ]







def main():
    pass


if __name__ == '__main__':
    main()