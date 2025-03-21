def distance(strand_a: str, strand_b: str) -> int:
    """
    Calculate the Hamming distance between two DNA strands.
    """
    try:
        return sum(a != b for a, b in zip(strand_a, strand_b, strict=True))
    except ValueError:
        raise ValueError("Strands must be of equal length.")
