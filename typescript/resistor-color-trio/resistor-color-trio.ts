const COLORS = [
  'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white',
] as const;

type Color = typeof COLORS[number];

const colorCode = (color: Color): number => COLORS.indexOf(color);

const METRIC_PREFIXES = ['', 'kilo', 'mega', 'giga'] as const;

type MetricPrefix = typeof METRIC_PREFIXES[number];

export function decodedResistorValue(colors: Color[]) {
  if (colors.length < 3) {
    throw new Error('"colors" must contain at least 3 colors.');
  } else {
    let value = decodedValue(colors.slice(0,2));
    value *= Math.pow(10, colorCode(colors[2]));
    let prefix: MetricPrefix = METRIC_PREFIXES[0];
    if (value >= Math.pow(1000, 3)) {
      prefix = METRIC_PREFIXES[3];
      value /= Math.pow(1000, 3);
    } else if (value >= Math.pow(1000, 2)) {
      prefix = METRIC_PREFIXES[2];
      value /= Math.pow(1000, 2);
    } else if (value >= Math.pow(1000, 1)) {
      prefix = METRIC_PREFIXES[1];
      value /= Math.pow(1000, 1);
    }

    return `${value} ${prefix}ohms`;
  }
}

function decodedValue(colors: Color[]): number {
  if (colors.length != 2) {
    throw new Error('"colors" must contain 2 colors.')
  } else {
    return 10 * colorCode(colors[0]) + colorCode(colors[1]);
  }
}