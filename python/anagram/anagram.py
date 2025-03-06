def find_anagrams(word, candidates):
    return list(
        filter(
            lambda candidate: candidate.lower() != word.lower()
            and sorted(list(candidate.lower())) == sorted(list(word.lower())),
            candidates,
        )
    )
