def alphabet: [range("A" | explode[]; "Z" | explode[] + 1)] | implode;
def atoi: . as $letter | alphabet | index($letter);
def itoa: alphabet[.:.+1];
def slice: alphabet[:atoi + 1];
def dots: [range(.) | "."];
def undot:

def main:
    slice as $letters
    | slice / ""
    | map($letters | mask())
    |
