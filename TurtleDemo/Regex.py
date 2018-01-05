#/usr/bin/env python
# -*- coding: UTF-8 -*-

import re


def text_match(text):

    result = re.match('a',text)
    if result is not None:
        print result.group()

    print result


def text_search(text):
    result = re.search('a',text)
    if result is not None:
        print result.group()


def text_findall(text):
    result = re.findall('(th\w+)',text)

    print result

if __name__ == '__main__':
    text = 'this and that'
    # text_match(text)
    # text_search(text)
    text_findall(text)