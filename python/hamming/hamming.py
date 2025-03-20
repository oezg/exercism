def distance(strand_a: str, strand_b: str) -> int:
    """
    Calculate the Hamming distance between two DNA strands.
    """
    length = len(strand_a)
    if length != len(strand_b):
        raise ValueError("Strands must be of equal length.")

    def _distance(index: int, count: int) -> int:
        if index == length:
            return count

        return _distance(
            index=index + 1, count=count + int(strand_a[index] != strand_b[index])
        )

    return _distance(index=0, count=0)
