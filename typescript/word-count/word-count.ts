export const count = (s: string): Map<string, number> =>
  s.toLowerCase()
  .split(/[\s,]/)
  .map(token => token.replace(/^\W+|\W+$/g, ''))
  .filter(Boolean)
  .reduce((acc, current) => acc.set(current, 1 + (acc.get(current) ?? 0)), new Map<string, number>());
