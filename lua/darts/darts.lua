local Darts = {}

function Darts.score(x, y)
    local r = x * x + y * y
    return r > 100 and 0 or
        r > 25 and 1 or
        r > 1 and 5 or
        10
end

return Darts
