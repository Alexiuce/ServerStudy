

'''

from urllib import parse
from urllib import request


url = "https://www.baidu.com/s"

param = {"wd": "富通天下"}

word = parse.urlencode(param)
new_url = url + "?" + word
my_request = request.Request(new_url)
response = request.urlopen(my_request)
print(response.read().decode())
'''


def my_add(a, b):
    return a + b


print(my_add(10, 2))
