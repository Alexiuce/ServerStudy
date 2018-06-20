# 22-webframework
# Created by Alexiuce at 2018/6/20

"""Web 框架"""




class Application(object):

    def __init__(self,routers):
        self.__routers__ = routers


    def __call__(self, *args, **kwargs):
        pass






def application(env,start_response):
    urls = [
        ('/hello',handle_hello)
    ]







def main():
    pass


if __name__ == '__main__':
    main()