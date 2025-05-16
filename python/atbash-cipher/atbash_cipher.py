import string

SIZE = 5
CIPHER = string.ascii_lowercase[::-1]
TABLE = str.maketrans(
    string.ascii_lowercase, CIPHER, string.whitespace + string.punctuation
)


def encode(plain_text: str) -> str:
    return " ".join(batch(decode(plain_text.lower())))


def decode(ciphered_text: str) -> str:
    return ciphered_text.translate(TABLE)


def batch(iterable: str) -> list[str]:
    return [iterable[i : i + SIZE] for i in range(0, len(iterable), SIZE)]
