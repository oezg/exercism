def matrix(size; start; topleft):
    if size == 0 then
        []
    else
        def row: [range(start; start + size)];
        def column: [range(start + size; start + size * 2 - 1)];
        def inner: matrix(size - 1; start + size * 2 - 1; (topleft | not));
        if topleft then
            [row] + ([inner, column] | transpose | map(first + [last]))
        else
            ([inner, (column | reverse)] | transpose | map([last] + first)) + [row | reverse]
        end
    end;

matrix(.size; 1; true)
