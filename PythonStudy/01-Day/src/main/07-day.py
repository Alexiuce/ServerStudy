# 07-day.py
# Created by Alexcai at 2018/5/12


""" 列表推导式
[x for x in range(1, 10) if 条件]
生成一个推导公式 每次取值时,根据推导计算后生成
"""
# 生成 包含 1~100 的列表

arr = []
i = 1
while i <= 100:
    arr.append(i)
    i += 1
print(arr)
arr.clear()

for i in range(1, 100):
    arr.append(i)
print("#" * 50)
print(arr)

a = range(10, 20, 3)
print(a)
for i in a:
    print(i)
# 列表生成式
b = [i for i in range(0, 23)]
print(b)
c = ["dell" for _ in range(0, 10)]
print(c)

d = [i for i in range(9) if i % 3 == 0]
print(d)



