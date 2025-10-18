import re


def abbreviate(words: str) -> str:
    trim_underscore = [frag.lstrip("_") for frag in re.split(r"[ -]", words)]
    return "".join(frag[0].upper() for frag in trim_underscore if frag != "")
