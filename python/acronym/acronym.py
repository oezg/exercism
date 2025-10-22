import re


def abbreviate(words: str) -> str:
    return "".join(frag.lstrip("_")[0].upper() for frag in re.split(r"[ -]+", words))
