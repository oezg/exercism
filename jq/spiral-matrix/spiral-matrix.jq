.size as $size
| []
| until(
    length == $size;
    length as $len
    | (($size + $len) * ($size - $len) - $len + 1) as $k
    | reverse
    | map(reverse)
    | [., [range($k; $k + $len)]]
    | transpose
    | map([first[], last])
    | [[range($k - $len - 1; $k)], .[]]
)