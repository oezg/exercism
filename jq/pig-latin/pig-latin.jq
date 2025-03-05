def index_vowel:
    [index("a", "e", "i", "o", "u") // empty] | min // 0;

.phrase / " "
| map(index_vowel as $i
| if test("^[^aeiou]*qu") then
    .[$i + 1:] + .[:$i + 1]  # + 1 for 'u'
elif test("^[^aeiou]+y") then
    index("y") as $y | .[$y:] + .[:$y]
elif test("^(?!xr|yt)[^aeiou]") then
    .[$i:] + .[:$i]
end + "ay")
| join(" ")