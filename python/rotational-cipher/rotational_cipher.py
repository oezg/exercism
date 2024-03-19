"""The Caesar cipher is a simple shift cipher that relies on transposing all the letters in the
alphabet using an integer key between 0 and 26. Using a key of 0 or 26 will always yield the same
output due to modular arithmetic. The letter is shifted for as many values as the value of the key.
"""

def _currier(interval: int, key: int, code: int) -> int:
    "Return closure with bound interval and key and code, only argument floor."
    def wrapped(floor):
        return floor + (code + key - floor) % interval
    return wrapped


def _rotater(key: int, code: int, floor_upper=ord('A'), floor_lower=ord('a'), interval=26) -> int:
    "Return code point of the rotated code point."
    curried = _currier(interval, key, code)
    if floor_lower <= code < floor_lower + interval:
        return curried(floor_lower)
    if floor_upper <= code < floor_upper + interval:
        return curried(floor_upper)
    return code


def rotate(text: str, key: int) -> str:
    "Create an implementation of the rotational cipher, also sometimes called the Caesar cipher."
    def rotate_cipher(c):
        return chr(_rotater(key, ord(c)))
    return "".join(map(rotate_cipher, text))
