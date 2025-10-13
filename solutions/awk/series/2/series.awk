@include "util"

{
    series = $0
    seriesLength = length(series)
    assert(seriesLength > 0, "series cannot be empty")
    assert(len > 0 && len <= seriesLength, "invalid length")

    for (i = 1; i <= seriesLength - len + 1; i++) {
        $i = substr(series, i, len)
    }

    print
}
