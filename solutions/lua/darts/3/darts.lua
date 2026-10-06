local Darts = {}

function Darts.score(x, y)
    local r = (x ^ 2 + y ^ 2) ^ 0.5
    return r <= 1 and 10 or
        r <= 5 and 5 or
        r <= 10 and 1 or
        0
end

return Darts
