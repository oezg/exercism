import strutils

func isShout(s: string): bool =
  for letter in s:
    if letter.isUpperAscii:
      result = true
    elif letter.isLowerAscii:
      result = false
      break

func hey*(s: string): string =
  if s.strip.endsWith('?') and s.isShout:
    "Calm down, I know what I'm doing!"
  elif s.strip.endsWith('?'):
    "Sure."
  elif s.isEmptyOrWhitespace:
    "Fine. Be that way!"
  elif s.isShout:
    "Whoa, chill out!"
  else:
    "Whatever."
