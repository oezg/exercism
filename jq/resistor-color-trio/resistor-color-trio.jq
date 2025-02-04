include "lib/resistor-color";

def resistor_value:
    .[:3] | map(colors[.]) | (10 * .[0] + .[1]) * pow(10; .[2]);

def factor: if . > 0 then log10 / 3 | floor end;

def prefix: ["", "kilo", "mega", "giga"][factor];

def value: . * pow(1000; -factor) | floor;

.colors
| resistor_value
| {"value": value, "unit": "\(prefix)ohms"}
