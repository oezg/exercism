def equilateral(sides: list[int]) -> bool:
    return triangle(sides) and len(set(sides)) == 1


def isosceles(sides: list[int]) -> bool:
    return triangle(sides) and len(set(sides)) < 3 


def scalene(sides: list[int]) -> bool:
    return triangle(sides) and len(set(sides)) == 3 


def triangle(sides: list[int]) -> bool:
    a, b, c = sides
    return a > 0 and b > 0 and c > 0 and a + b >= c and b + c >= a and a + c >= b
