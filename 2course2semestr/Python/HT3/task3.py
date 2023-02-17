def main(a, n, b, m, y):
    sum1 = 0
    sum2 = 0
    for c in range(1, n+1):
        for i in range(1, a+1):
            sum1 += 27 * pow(c, 18) - 2 * pow(i, 4)
    for i in range(1, a+1):
        for c in range(1, m+1):
            for k in range(1, b+1):
                one = pow(k, 6)
                two = pow(pow(i, 3) / 25 - 15 * y, 6)
                three = 25 * pow(c, 4)
                sum2 += one + two + three
    return sum1 - sum2

print(main(3,3,7,8,0.98))
