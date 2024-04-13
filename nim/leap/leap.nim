func isLeapYear*(year: int): bool =
  year mod 4 == 0 and (not (year mod 100 == 0) or year mod 400 == 0)
