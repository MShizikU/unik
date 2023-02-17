import math

def main(*lst):
    def fun(a, b):
        return ((math.tan(99 * a**3 - 88 - b / 78)) ** 3) / 15
    x, z = lst
    res = 0
    for i in range(1, len(x) + 1):
        res += fun(x[len(x) - math.ceil(i/4)],z[len(x) - math.ceil(i/3)])
    return 97 * res

print(main([0.18, 0.73, -0.35],[0.26, -0.22, 0.55]))
