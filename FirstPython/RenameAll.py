# -*- coding: UTF-8 -*-

import os
import sys
import io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='utf-8')



folder = "/Users/caijinzhu/资料/直播/第02天"

files = os.listdir(folder)
os.chdir(folder)


for filename in files:
    start_index = filename.find("_")
    if start_index != -1:
        os.rename(filename,filename[:start_index] + ".flv")

