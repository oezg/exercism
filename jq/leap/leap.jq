def is_divisible(n):
    . % n == 0;

def is_leap:
    is_divisible(4) and ((is_divisible(100) | not) or is_divisible(400));

.year | is_leap