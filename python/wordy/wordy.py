'Parse and evaluate simple math word problems returning the answer as an integer.'

import re
import operator
from typing import Callable


def answer(question: str) -> int:
    'Parse and evaluate simple math word problems returning the answer as an integer.'

    expression = _trim_left(question.removesuffix('?'), 'What is')
    if _is_unknown_operation(expression):
        raise ValueError("unknown operation")

    success, value = _process(expression)
    if not success:
        raise ValueError("syntax error")

    return value



def _process(expression: str)-> tuple[bool, int]:
    'Try parse the whole expression. If successful return its value.'

    success, value, rest = _parse_int(expression)
    if not success:
        return False, 0

    return _process_rest(value, rest)



def _process_rest(acc: int, s: str) -> tuple[bool, int]:
    'Try parse the next expression. If successful, repeat with the rest and return accumulated result.'

    if s == '':
        return True, acc

    success, operation, rest = _parse_operation(s)

    if not success:
        return False, 0

    success, value, rest = _parse_int(rest)

    if not success:
        return False, 0

    return _process_rest(operation(acc, value), rest)


def _parse_int(s: str) -> tuple[bool, int, str]:
    'Try parse integer at the beginning. If successful returns the value and the rest of the input.'

    token = _int_regex.match(s)
    if token is None:
        return False, 0, ""

    return True, int(token.group()), _trim_left(s, token.group())


def _parse_operation(s: str) -> tuple[bool, Callable[[int, int], int], str]:
    'Try parse operation at the beginning. If successful returns the operation and the rest.'

    operation = _operation_regex.match(s)
    if operation is None:
        return False, None, ''

    return True, _operations[operation.group()], _trim_left(s, operation.group())


def _is_unknown_operation(s: str) -> bool:
    'Check if the input is a valid operation.'

    return re.search(r'[^\d -]', _operation_regex.sub('', s)) is not None


def _trim_left(s: str, prefix: str) -> str:
    'Remove the prefix and whitespace from left.'

    return s.removeprefix(prefix).lstrip()


_int_regex = re.compile(r'-?\d+')
_operation_regex = re.compile(r'(minus|plus|multiplied by|divided by)')
_operations: dict[str, Callable[[int, int], int]] = {
    'minus': operator.sub,
    'plus': operator.add,
    'multiplied by': operator.mul,
    'divided by': operator.truediv,
}
