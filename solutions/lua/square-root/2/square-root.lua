local SquareRoot = {}

local function root(n, lower, upper)
    assert(lower <= upper, 'integer root not found')
    local middle = (upper - lower + 1) // 2 + lower
    local square = middle * middle
    return
        square < n and root(n, middle + 1, upper) or
        square > n and root(n, lower, middle - 1) or
        middle
end
function SquareRoot.square_root(radicand)
    return root(radicand, 1, math.ceil(radicand / 2))
end

return SquareRoot
