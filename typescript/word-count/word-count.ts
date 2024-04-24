export function count(s: string): Map<string, number> {
  let frequency = new Map<string, number>();
  s
  .split(/[\s,]/)
  .filter(Boolean)
  .map(token => token.replace(punctuation_regex, ''))
  .map(trimmed => trimmed.toLowerCase())
  .forEach(word => frequency.set(word, 1 + (frequency.get(word) ?? 0)))
  return frequency;
}

const punctuation_regex = /^[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]+|[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]+$/g;