export const count = (subtitle: string): Map<string, number> =>
  subtitle.toLowerCase()
  .split(/[\s,]/)
  .map(token => token.replace(/^\W+|\W+$/g, ''))
  .reduce((acc, current) => current ? acc.set(current, 1 + (acc.get(current) ?? 0)) : acc, new Map<string, number>());
