"""The Caesar cipher is a simple shift cipher that relies on transposing all the letters in the
alphabet using an integer key between 0 and 26. Using a key of 0 or 26 will always yield the same
output due to modular arithmetic. The letter is shifted for as many values as the value of the key.
"""


ALPHABET =  "abcdefghijklmnopqrstuvwxyz"

def rotate(text: str, key: int) -> str:
    "Create an implementation of the rotational cipher, also sometimes called the Caesar cipher."
    translation = ALPHABET[key:] + ALPHABET[:key]
    source = ALPHABET + ALPHABET.upper()
    destination = translation + translation.upper()
    return text.translate(str.maketrans(source, destination))
