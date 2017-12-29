#/usr/bin/env python
# -*- coding: UTF-8 -*-

from bs4 import BeautifulSoup
import urllib2
import os
from threading import Thread


def getHtml(main_url):
    user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
    headers = {'User-Agent': user_agent}
    req = urllib2.Request(main_url, headers=headers)
    response = urllib2.urlopen(req)
    html = response.read()
    return html.decode('gbk','ignore')

def parseHtml(html):
    formated_html = BeautifulSoup(html,'lxml')
    dt_tag = formated_html.find_all("dl")[0]
    result = []
    flag = 0

    for child_node in dt_tag.children:

        if child_node.name == 'dt':
            flag += 1
        if flag ==2 and child_node.name == 'dd':
            result.append(child_node.a)
    return result

def parseTitleInHtml(html):
    html_soup = BeautifulSoup(html,'lxml')
    title = html_soup.find_all(id="info")[0]
    tcontext = title.h1.getText().encode('utf-8')
    return tcontext


def parseTextInHtml(tUrl = ""):
    html = getHtml(tUrl)
    html_soup = BeautifulSoup(html,'lxml')
    html_content = html_soup.find_all(id="content")[0]
    total_text = ""
    for item in html_content.strings:
        segment_text = item.encode('utf-8')
        total_text += segment_text
        total_text += '\n'

    return total_text


def save_to_file(filename,data):

    file = open(filename,'a')
    file.write(data)
    file.closed




if __name__ == '__main__':

    target_url = "http://www.biquge5200.com/0_857/"
    # 根据url 获取html内容
    html_text = getHtml(target_url)
    # 解析文章名称
    title = parseTitleInHtml(html_text)
    # 获取所有章节列表
    charpters = parseHtml(html_text)

    # 根据文章名称创建文件夹(在当前文件夹下创建)
    if os.path.exists(title) == False:
        os.mkdir(title)
    os.chdir(title)

    # 遍历所有章节的元素
    for charpter in charpters:
        # 获取章节的url地址
        charpter_url = charpter['href'].encode('utf-8')
        # 获取章节的名称
        charpter_title = charpter.getText().encode('utf-8')

        if charpter_title.find("第") != 0:
            continue
        print charpter_title
        text = parseTextInHtml(charpter_url)

        save_to_file(charpter_title + '.txt' ,text)













