import names

ZERO = 0
TEN = 10
TWENTY = TEN + TEN
HUNDRED = TEN * TEN
THOUSAND = TEN * HUNDRED
LIMIT = THOUSAND * THOUSAND * THOUSAND * THOUSAND


def say(number: int) -> str:
    if number < ZERO or number >= LIMIT or not isinstance(number, int):
        raise ValueError(names.OUT_OF_RANGE)
    if number == ZERO:
        return names.ZERO
    return names.SEPARATOR.join(chunks_of_thousands(number))


def chunks_of_thousands(number: int) -> list[str]:
    assert 0 < number < LIMIT
    result = []
    for tillion in names.TILLIONS:
        mode_thousand = number % THOUSAND
        if mode_thousand > ZERO:
            hundreds = chunk_hundreds(mode_thousand)
            if tillion is not None:
                hundreds.append(tillion)
            result = hundreds + result  # reverse order
        number //= THOUSAND
    return result


def chunk_hundreds(mode_thousand: int) -> list[str]:
    assert 0 < mode_thousand < 1000
    result = []
    if mode_thousand >= HUNDRED:
        result.append(names.TENS[mode_thousand // HUNDRED])
        result.append(names.HUNDRED)
    mode_hundred = mode_thousand % HUNDRED
    if mode_hundred > ZERO:
        result.append(chunk_tens(mode_hundred))
    return result


def chunk_tens(mode_hundred: int) -> str:
    assert 0 < mode_hundred < 100
    if mode_hundred < TEN:
        return names.TENS[mode_hundred]
    if mode_hundred < TWENTY:
        return names.TEEN[mode_hundred]
    if mode_hundred % TEN > ZERO:
        return f"{names.TIES[mode_hundred//TEN]}-{names.TENS[mode_hundred%TEN]}"
    return names.TIES[mode_hundred // TEN]
