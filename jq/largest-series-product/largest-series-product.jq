def fail_when(cond; msg): if cond then msg  | halt_error end;
def product: reduce .[] as $item (1; . * $item);

fail_when((.digits | length) < .span; "span must be smaller than string length")
| fail_when(.digits | test("\\D"); "digits input must only contain digits")
| fail_when(.span < 0; "span must not be negative")
| [
    def slice($idx): .digits[$idx : $idx + .span] / "";
    slice(range((.digits | length) - .span + 1))
    | map(tonumber)
    | product
] | max