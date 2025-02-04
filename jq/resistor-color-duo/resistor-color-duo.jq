include "lib/resistor-color";

.colors | map(colors[.]) | 10 * .[0] + .[1]