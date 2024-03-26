const COLORS = [
  'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'
] as const;

type Color = typeof COLORS[number]

const colorCode = (color: Color): number => COLORS.indexOf(color)

export function decodedValue(colors: Color[]): number {
  if (colors.length < 2) {
    throw new Error('"colors" must contain at least 2 colors.')
  } else {
    return 10 * colorCode(colors[0]) + colorCode(colors[1]);
  }
}
