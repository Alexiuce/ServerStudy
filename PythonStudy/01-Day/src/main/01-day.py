

# print("hello python")

########################################################################
# a = input("input your age....")
# print(type(a))
# if int(a) > 20:
#     print("adult")
# else:
#     print("yang")


########################################################################

# if int(input("input your age: \n")) > 20:
#     print("adult")
# else:
#     print("so yang")
########################################################################

"""
+ - * / //(取商运算) %(取余运算) **(幂运算)

a = 17
b = 4
print("%d / %d = %f" % (a, b, a / b))
print("a * b = %d" % (a * b))
print("a // b = %d" % (a // b))
print("a %% b = %d" % (a % b))
print("+" * 20)
"""

# ======================= 逻辑运算 and / or / not ======================= #
'''
a = 30
r = True

if not r:
    print("r not true")
elif a > 50:
    print("a than ....")
else:
    print("r is true")

if 0 < a < 100:
    print("a is good")
else:
    print("a not better")

if a > 5 or a < -5:
    print("a maybe ...")
else:
    print("a not +_5")
'''

# =========================== loop example (循环) =====================

'''
num = 80
while num < 90:
    print("num is : %d" % num)
    num += 1
name = "hello"
for c in name:
    print(c)
'''

# =========================== String slice(字符串切片) =====================

'''
first = 'hello'
middle = 'good' + '{"url":"baidu"}'
print(first + middle)
# 字符串切片 '字符串'[起始序号:结束序号:步长]
print(middle[2:5])
print(middle[2::3])

'''
# =========================== List(列表) 增删改查 =====================


'''
persons = ['alex', 'job', 'tom', 'leo']   # 定义了一个数组,python中列表可以存储各种不同的数据类型

print(persons)

# 列表添加元素
persons.append('gates')  # 添加对象到列表中
persons.insert(1, 'steve')  # 插入对象到列表的指定位置
print(persons)

webs = ["bai", "google", "facebook"]

pw = persons + webs    # + 返回合并后新的列表
persons.extend(webs)   # extend 合并列表  改变原列表,没有返回值
print(pw)

#  列表删除元素
# pw.pop()         # 删除最后一个元素
# pw.pop(2)         # 删除指定位置的元素
# pw.remove("job")    # 删除指定元素
# del pw[0]        # 删除指定下标位置的元素  pop(index)
# print(pw)
#  列表修改
pw[0] = "xiuce"
print(pw)

# 列表查找 in / not in
if "xiuce" in pw:
    print("already add xiuce")

if "bai11" not in pw:
    print('pw not include bai')

'''
# =========================== Dictionary(字典) 增删改查 =====================
info = {"name": "alex", "age": 18, "job": "dev"}
print(info)
info['gender'] = 'man'

info.pop('name')

for key in info:
    print(info[key])

# =========================== for - else =====================

'''
for xxx :
    pass
else:
    pass   # 仅当for循环中使用了break,才会不执行else中的语句 

'''

