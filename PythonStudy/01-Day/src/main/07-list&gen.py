# 07-list&gen.py
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

""" 集合
{元素}  : 集合中的元素都不会重复(重复添加没有效果)
"""

j = {11, 22, 33, 11, 44}
print(j)

# 列表去重

t = [1, 32, 44, 1, 5, 32]
b = []
for i in t:
    if i not in b:
        b.append(i)
print(b)

# 使用集合对数组进行去重 : set转换-> list 转换
df = set(t)
da = list(df)
print(da)




