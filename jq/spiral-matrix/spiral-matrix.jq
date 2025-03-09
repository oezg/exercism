def matrix($size):
    {step: range($size)}
    | .rowstart = ($size + .step) * ($size - .step) - 2 * .step
    | .colstart = .rowstart + .step + 1
    | {
        row: [range(.rowstart; .colstart)],
        col: [range(.colstart; .colstart + .step)]
    };

def append(column): [., column] | transpose[] | [first[], last];

reduce matrix(.size) as $item ([]; reverse | map(reverse) | [$item.row, append($item.col)])
