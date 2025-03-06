def find_anagrams(word, candidates):
    wala = word.lower()
    bala = sorted(wala)
    return [
        candidate
        for candidate in candidates
        if candidate.lower() != wala and sorted(candidate.lower()) == bala
    ]
