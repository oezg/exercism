import std/sets

proc sum*(limit: int, factors: openArray[int]): int =
  var multiples = initHashSet[int]()
  for factor in factors:
    if factor == 0:
      continue
    var temp = factor
    while temp < limit:
      multiples.incl(temp)
      temp += factor

  for multiple in multiples.items:
    result += multiple
