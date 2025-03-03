def undigits:
    .inputBase as $base 
    .digits |= reverse | to_entries | 
    | map(until(.key == 0; .value *= $base | .key -= 1) | .value)
    | add;

def digits:
    while(.digits > 0; )