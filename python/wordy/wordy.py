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
    expression = question.removeprefix('What is').removesuffix('?').strip()
    if re.search(r'[^\d -]', re.sub('(minus|plus|multiplied by|divided by)', '', expression)):
        raise ValueError("unknown operation")
    value, success = process(expression)
    if success:
        return value
    raise ValueError("syntax error")


def process(expression: str)-> tuple[int, bool]:
    'Parse expression returning the value of the expression and True or 0 and False.'
    value = re.match(r'-?\d+', expression)
    if value:
        return process_help(int(value.group()), expression.removeprefix(value.group()).strip())
    return 0, False


def process_help(val:int, expr: str)-> tuple[int, bool]:
    'Helper to process the expression recursively.'
    if expr=='':
        return val, True
    valid = re.match(r'(minus|plus|multiplied by|divided by) (-?\d+)', expr)
    if not valid:
        return 0, False
    result = ops[valid.group(1)](val, int(valid.group(2)))
    nexpr = expr.removeprefix(valid.group()).strip()
    return process_help(result, nexpr)
