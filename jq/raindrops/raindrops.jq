def is_divisible(n):
    . % n == 0;

def drops:
    [
        if is_divisible(3) then "Pling" else empty end,
        if is_divisible(5) then "Plang" else empty end,
        if is_divisible(7) then "Plong" else empty end
    ];

def rain:
    join("");
def jigolo:
    .number as $number | .number | drops | add // $number;


jigolo
# rain as $raindrops |
# if ($raindrops | length) == 0 then
#     $number
# else
#     $raindrops
# end
