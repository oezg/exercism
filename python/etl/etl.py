def transform(legacy_data: dict[int, list[str]]) -> dict[str, int]:
    return {
        letter.lower(): score
        for score, letters in legacy_data.items()
        for letter in letters
    }
