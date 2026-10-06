local Darts = {}

function Darts.score(x, y)
    local r = math.sqrt(x * x + y * y)
    return r > 10 and 0 or
        r > 5 and 1 or
        r > 1 and 5 or
        10
end

return Darts
