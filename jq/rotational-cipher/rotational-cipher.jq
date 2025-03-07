(.shiftKey % 26) as $idx
| (
    "abcdefghijklmnopqrstuvwxyz"
    | [., .[$idx:] + .[:$idx] | . + ascii_upcase | . / ""]
    | transpose
    | map({key: first, value:last}) 
    | from_entries
) as $table
| .text / ""
| map($table[.] // .)
| add