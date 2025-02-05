def hamming:
    map(explode)
    | transpose
    | map(select(first != last))
    | length
;

def valid:
    if unique_by(length) | length > 1 
        then "strands must be of equal length" | halt_error(1)
    end;

[.strand1, .strand2]
| valid
| hamming
