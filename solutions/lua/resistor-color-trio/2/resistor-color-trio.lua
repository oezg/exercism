local codes = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9,
}

return {
  label = function(c1, c2, c3)
    local value = (codes[c1] * 10 + codes[c2]) * math.tointeger(10 ^ codes[c3])
    local exponent = value == 0 and 0 or math.floor(math.log(value, 10))
    local prefix = ({ "", "kilo", "mega", "giga" })[exponent // 3 + 1]
    local reducer = 10 ^ (exponent // 3 * 3)
    return value // reducer, prefix .. 'ohms'
  end
}
