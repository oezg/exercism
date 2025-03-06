def fail_when(cond; msg): if cond then msg  | halt_error end;

def validate:
    fail_when((.digits | length) < .span; "span must be smaller than string length")
    | fail_when(.digits | test("\\D"); "digits input must only contain digits")
    | fail_when(.span < 0; "span must not be negative");

def roll:
    while(.idx + .span <= (.digits | length); .idx += 1) 
    | .digits[.idx:.idx+.span];

validate
| .digits |= (. / "" | map(tonumber))
| [roll | reduce .[] as $d (1; . * $d)]
| max 