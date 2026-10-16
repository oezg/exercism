local SquareRoot = {}

function SquareRoot.square_root(radicand)
    local function root(lower, upper)
        assert(lower <= upper, 'integer root not found')
        local middle = (upper - lower + 1) // 2 + lower
        local square = middle * middle
        return
            square < radicand and root(middle + 1, upper) or
            square > radicand and root(lower, middle - 1) or
            middle
    end

    return root(1, math.ceil(radicand / 2))
end

return SquareRoot
