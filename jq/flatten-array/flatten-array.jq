def is_array: type == "array";

def rest: .[1:];

def is_not_empty: length > 0;

def fltn:
    if is_not_empty then
        if first | is_array then
            first | fltn
        else
            [first]
        end 
        + (rest | fltn)
    end;

def main:
    .array | fltn | map(select(. != null));

main