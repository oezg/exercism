import names

ZERO = 0
TEN = 10
TWENTY = TEN + TEN
HUNDRED = TEN * TEN
THOUSAND = TEN * HUNDRED


def say(number: int) -> str:
    if number < ZERO or number >= names.LIMIT or not isinstance(number, int):
        raise ValueError(names.OUT_OF_RANGE)
    if number == ZERO:
        return names.ZERO
    return names.SEPARATOR.join(chunks_of_thousands(number))


def chunks_of_thousands(number):
    result = []
    for tillion in names.TILLIONS:
        mode_thousand = number % THOUSAND
        if mode_thousand > ZERO:
            hundreds = chunk_hundreds(mode_thousand)
            if tillion is not None:
                hundreds.append(tillion)
            result = hundreds + result
        number //= THOUSAND
    return result


def chunk_hundreds(mode_thousand):
    result = []
    if mode_thousand >= HUNDRED:
        result.append(names.TENS[mode_thousand // HUNDRED])
        result.append(names.HUNDRED)
        mode_thousand %= HUNDRED
    if mode_thousand > ZERO:
        result.append(chunk_tens(mode_thousand))
    return result


def chunk_tens(mode_hundred):
    if mode_hundred < TEN:
        return names.TENS[mode_hundred]
    if mode_hundred < TWENTY:
        return names.TEEN[mode_hundred]
    if mode_hundred % TEN > ZERO:
        return f"{names.TIES[mode_hundred//TEN]}-{names.TENS[mode_hundred%TEN]}"
    return names.TIES[mode_hundred // TEN]
