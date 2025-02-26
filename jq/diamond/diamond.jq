def alphabet: [range("A" | explode[]; "Z" | explode[] + 1)] | implode;
def atoi: . as $letter | alphabet | index($letter);
def itoa: alphabet[.:.+1];
def undot($inds): . as $i | $inds | map(if . == $i then itoa else "." end);
def mirror_vertical_axis: (.[1:] | reverse) + . | add;
def mirror_horizontal_axis: . + (.[:-1] | reverse) | join("\n");

.letter
| [range(atoi + 1)]
| . as $inds
| map(undot($inds) | mirror_vertical_axis)
| mirror_horizontal_axis