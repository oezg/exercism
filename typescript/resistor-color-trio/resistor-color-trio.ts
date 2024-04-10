const RESISTOR_COLORS: readonly string[] = [
  'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white',
] as const;

type Color = typeof RESISTOR_COLORS[number];

const colorCode = (color: Color): number => RESISTOR_COLORS.indexOf(color);

export function decodedResistorValue(colors: Color[]): string {
  if (colors.length < 3) {
    throw new Error('"colors" must contain at least 3 colors.');
  }

  const baseValue = 10 * colorCode(colors[0]) + colorCode(colors[1]);
  const multiplier = Math.pow(10, colorCode(colors[2]));
  const value = baseValue * multiplier;

  const metricPrefixes: readonly string[] = ['', 'kilo', 'mega', 'giga'];
  for (let index = metricPrefixes.length - 1; index >= 0; index--) {
    const threshold = Math.pow(1000, index);
    if (value >= threshold) {
      return `${value/threshold} ${metricPrefixes[index]}ohms`;
    }
  }

  return '0 ohms';
}