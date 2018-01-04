#/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
import http.server

def startServer(port):
    httpd = http.server.HTTPServer(('',port),http.server.SimpleHTTPRequestHandler)
    httpd.serve_forever()


if __name__ == '__main__':
    startServer(8999)