def equilateral(sides: list[int]) -> bool:
    a, b, c = sides
    return a > 0 and a == b and b == c


def isosceles(sides: list[int]) -> bool:
    return triangle(sides) and any(sides[i] == sides[(i+1) % len(sides)] for i in range(len(sides)))


def scalene(sides: list[int]) -> bool:
    return triangle(sides) and all(sides[i] != sides[(i+1) % len(sides)] for i in range(len(sides)))


def triangle(sides: list[int]) -> bool:
    a, b, c = sides
    return all(sides) and a + b >= c and b + c >= a and a + c >= b
