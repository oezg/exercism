import string

def encode(plain_text: str):
    x = [x for x in plain_text if x.isalnum()]
    y = map(atbash, x)

def atbash(x: str):
    origin = string.ascii_uppercase + string.lo + string.digits

    str.maketrans(string.ascii_lowercase + s, string.ascii_lowercase[::-1])

def decode(ciphered_text):
    pass
