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

    def __getattr__(self, item):
        pass
    def __getattribute__(self, item):
        pass


""" getattr 

** 当在对象属性中查询不到相应属性时,会调用getattr方法进行进一步的查找
* __getattribute__ 方法是访问对象属性时,就会调用这个方法
获取对象的属性内容:
getattr(objc, attrname) : 获取对象objc的attrname属性

* 新式类(object)与旧式类
多继承时, 新式类查找按照广度优先,而旧式类按照深度优先

A--> B,C --> D

新式类时, 查找D的属性时,会先找B,再找C,最后找A
旧式类时, 查找D的属性时,先找B,再找A






"""





def application(env,start_response):
    urls = [
        ('/hello',handle_hello)
    ]







def main():
    pass


if __name__ == '__main__':
    main()