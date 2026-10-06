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
    local value = codes[c1] * 10 + codes[c2]
    value = value * 10 ^ codes[c3]
    if value < 10 ^ 3 then
      return value, 'ohms'
    elseif value < 10 ^ 6 then
      return value // 10 ^ 3, 'kiloohms'
    elseif value < 10 ^ 9 then
      return value // 10 ^ 6, 'megaohms'
    else
      return value // 10 ^ 9, 'gigaohms'
    end
  end
}
