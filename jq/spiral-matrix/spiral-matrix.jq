def matrix($n; t):
    if $n == 0 then []
    else
        def row: [range(t; t + $n)];
        def column: [range(t + $n; t + $n * 2 - 1)];
        def spire: reverse | map(reverse);
        def inner: matrix($n-1; t + 2*$n - 1);
        def prepend_row: [row] + .;
        def append_column: [., column] | transpose | map(first + [last]);
        inner | spire | append_column | prepend_row
    end;

matrix(.size; 1)

def content($n): [range($n * $n; 0; -1)];
def col_row($n): [range($n) | {col: ., row: . + 1}]