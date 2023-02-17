import math
from decimal import Decimal


def main(x, z):
    firstsqr = math.sqrt(94 * pow((z + math.pow(x,3) + 1), 7))
    secondsqr = math.sqrt(
        (94 * pow((67 * z + math.pow(x, 3) / 20), 4))
        / (75 * pow((11 * math.pow(z, 3) - 30 * x), 2) - 83 * pow(z, 6))
    )
    return firstsqr + secondsqr
    
print(main(0.31, 0.68))
print(main(0.28, -0.52))
print(main(-0.7, 0.71))
print(main(0.33, 0.44))
print(main(-0.29, -0.47))

