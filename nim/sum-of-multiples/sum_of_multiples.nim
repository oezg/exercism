import sequtils, sugar

proc sum*(limit: int, factors: openArray[int]): int =
  for n in 1..<limit:
    if factors.any((factor) => factor > 0 and n mod factor == 0):
      inc result, n
