def f(y):
    if (y < -41):
        return pow(y,5)
    elif (y >= -41 and y < 29):
        return 1 + pow((22 + y * y + 25 * y * y * y), 6) / 58
    else:
        return pow(y, 5)/46

print(f(-44))
print(f(93))
print(f(-62))
print(f(22))
print(f(-1))
