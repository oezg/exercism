def find_anagrams(word: str, candidates: list[str]) -> list[str]:
    """
    Given a target word and one or more candidate words,
    return the candidates that are anagrams of the target.
    """
    word_lower = word.lower()
    word_sorted = sorted(word_lower)
    return [
        candidate
        for candidate in candidates
        if (candidate_lower := candidate.lower()) != word_lower
        and sorted(candidate_lower) == word_sorted
    ]
