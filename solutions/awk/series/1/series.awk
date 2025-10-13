@include "util"

{
    seriesLength = length($0)
    assert(seriesLength > 0, "series cannot be empty")
    assert(len > 0 && len <= seriesLength, "invalid length")

    for (i = 1; i <= seriesLength - len + 1; i++) {
        result = (i > 1 ? result " " : "") substr($0, i, len)
    }

    print result
}
