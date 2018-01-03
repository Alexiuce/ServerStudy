#/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
import http.server



def startServer():
    httpd = http.server.HTTPServer(('',8989),http.server.SimpleHTTPRequestHandler)
    httpd.serve_forever()



if __name__ == '__main__':
    startServer()