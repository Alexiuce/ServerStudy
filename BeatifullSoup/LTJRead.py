#/usr/bin/env python
# -*- coding: UTF-8 -*-

from bs4 import BeautifulSoup
import urllib2


def getHtml(main_url):
    user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
    headers = {'User-Agent': user_agent}
    req = urllib2.Request(main_url, headers=headers)
    response = urllib2.urlopen(req)
    html = response.read()
    return html.decode('gbk')

def parseHtml(html):
    formated_html = BeautifulSoup(html,'lxml')
    dt_tag = formated_html.find_all("dl")[0]
    result = []
    flag = 0
    # print dt_tag
    for child_node in dt_tag.children:
        # print type(child_node)
        # print child_node.name
        # print child_node
        # print "=="*30
        if child_node.name == 'dt':
            flag += 1
        if flag ==2 and child_node.name == 'dd':
            # print "~"*10
            result.append(child_node.a)
    return result

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
    # 获取所有章节列表
    charpters = parseHtml(getHtml("http://www.biquge5200.com/2_2247/"))

    for charpter in charpters:
        charpter_url = charpter['href'].encode('utf-8')
        charpter_title = charpter.getText().encode('utf-8')
        text = parseTextInHtml(charpter_url)
        save_to_file(charpter_title,text)





