#/usr/bin/env python
# -*- coding: UTF-8 -*-

import tornado.web
import tornado.ioloop

class MainHandle(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.write('hello work123')


class HomeHandle(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.write('home worked!')


application = tornado.web.Application([(r'/index',MainHandle),(r'/home',HomeHandle)],)


if __name__ == '__main__':
    application.listen(9999)
    tornado.ioloop.IOLoop.instance().start()