def index_vowel:
    [index("a", "e", "i", "o", "u") // empty] | min // 0;

def rotate_when(regex; idx): 
    if test(regex) then (.[idx:] + .[:idx]) end;

.phrase / " "
| map(
    rotate_when("^[^aeiou]*qu"; index("u") + 1)
    | rotate_when("^[^aeiou]+y"; index("y"))
    | rotate_when("^(?!xr|yt)[^aeiou]"; index_vowel)
    | . + "ay"
) 
| join(" ")