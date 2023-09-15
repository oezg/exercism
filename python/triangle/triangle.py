"Functions about triangle types"


def equilateral(sides: list[int]) -> bool:
    """
    Returns true if a triangle with given sides exists and is equilateral
    """

    a, b, c = sides
    return a > 0 and a == b and b == c


def isosceles(sides: list[int]) -> bool:
    """
    Returns true if a triangle with given sides exists and is isosceles
    """

    return triangle(sides) and any(sides[i] == sides[(i+1) % len(sides)] for i in range(len(sides)))


def scalene(sides: list[int]) -> bool:
    """
    Returns true if a triangle with given sides exists and is scalene
    """

    return triangle(sides) and all(sides[i] != sides[(i+1) % len(sides)] for i in range(len(sides)))


def triangle(sides: list[int]) -> bool:
    """
    Returns true if a triangle with given sides exists
    """

    a, b, c = sides
    return a > 0 and b > 0 and c > 0 and a + b >= c and b + c >= a and a + c >= b
