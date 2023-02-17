def main(n):
    return 0.48 if n == 0 else -0.53 if n == 1 else 1 - pow(main(n-2), 2) - pow(main(n-1), 3)
print(main(3))
