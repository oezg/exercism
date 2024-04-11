'Parse and evaluate simple math word problems returning the answer as an integer.'

import re
import operator

ops = {
    'minus': operator.sub,
    'plus': operator.add,
    'multiplied by': operator.mul,
    'divided by': operator.truediv,
}

def answer(question: str) -> int:
    'Parse and evaluate simple math word problems returning the answer as an integer.'
    a = re.match(r'What is( \d+)?\?', question)
    if a:
        if a.group(1) is None:
            raise ValueError("syntax error")
        return int(a.group(1))
    p = r'What is(( -?\d+){0,2}) ?(minus|plus|multiplied by|divided by)?(( -?\d+){0,2})( (minus|plus|multiplied by|divided by)? ?(-?\d+))?\?'
    b = re.match(p, question)
    if b:
        if  b.group(1).count(' ') != 1:
            raise ValueError("syntax error")
        try:

            r = ops[b.group(3)](int(b.group(2)), int(b.group(4)))
            if b.group(6):
                r = ops[b.group(7)](r, int(b.group(8)))
            return r
        except:
            raise ValueError("syntax error")
    raise ValueError("unknown operation")


def zero(q: str) -> re.Match[str] | None:
    return re.match(r'What is (\d+)\?', q)

def one(q: str) -> re.Match[str] | None:
    return re.match(r'What is (\d+) plus (\d+)\?', q)

def due(q: str) -> re.Match[str] | None:
    return re.match(r'What is (\d+) (\w+)( by)? (\d+)\?', q)