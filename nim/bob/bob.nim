import strutils

func isShout(s: string): bool =
  for letter in s:
    if letter.isUpperAscii:
      result = true
    elif letter.isLowerAscii:
      result = false
      break

func hey*(s: string): string =
  if s.isShout:
    if s.strip.endsWith('?'):
      "Calm down, I know what I'm doing!"
    else:
      "Whoa, chill out!"
  elif s.strip.endsWith('?'):
    "Sure."
  elif s.isEmptyOrWhitespace:
    "Fine. Be that way!"
  else:
    "Whatever."
