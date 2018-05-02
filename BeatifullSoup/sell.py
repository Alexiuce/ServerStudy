
# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup


# import BeautifulSoup

# import httplib2
import urllib2
import re
import time

def getData(url):

    headers = {"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
               "Accept": "*/*"}
    # h = httplib2.Http()
    request = urllib2.Request(url, headers=headers)
    # resp, content = h.request(url, headers=head)
    response = urllib2.urlopen(request)
    content = response.read()
    soup = BeautifulSoup(content, 'html.parser')

    # 读取房屋信息
    list_txt = soup.find_all(class_="list_txt fl")
    # print(list_txt)
    shequ = []
    for temp in list_txt:
        p_set = temp.find_all('p')
        text = p_set[1].get_text().split()

        # 读取户型及建造时间
        time = p_set[2].get_text().split()
        # print(time)
        # print(time[4][:-1])
        # print(len(time))
        try:
            if len(time) == 8:
                shequ.append(
                    [text[0], text[1][1:], text[2][:-1], text[3], time[0], time[1], '1Œ¿', time[3][:-1], time[4][:-1],
                     time[5], time[7]])
            elif len(time) == 7:
                shequ.append(
                    [text[0], text[1][1:], text[2][:-1], text[3], time[0], '', '', time[2][:-1], time[3][:-1], time[4],
                     time[6]])
            else:
                shequ.append(
                    [text[0], text[1][1:], text[2][:-1], text[3], time[0], time[1], time[2], time[4][:-1], time[5][:-1],
                     time[6], time[8]])
        except IndexError:
            # print(text)
            # print(time)
            print(IndexError)
            # pass
            continue
        # print('shequ')
        # print(shequ)

    # 读取总价和均价，括号里的内容从网易源代码中获取
    list_price = soup.find_all(class_="list_price fr")
    price = []
    for temp in list_price:
        pp_set = temp.get_text().split('\n')
        pp_id = temp.contents[1].attrs['value']  # 读取透明网上房屋ID
        price.append([pp_set[2], pp_set[3], pp_id])
        # print('price')
    # print(price)

    # 名称，城区，板块，位置，室，厅，卫，总面积，楼层，建成时间，总价，平均价
    i = 0
    while i < (len(shequ)):
        shequ[i].extend(price[i])
        i = i + 1
    # print(shequ)

    return shequ


startUrl = 'http://www.tmsf.com/esf/esfnSearch_csnew.htm'
# 根据具体网址做相应修改
print('开始读取第1页数据')
z = getData(startUrl)
print('第1页数据读取完毕')

