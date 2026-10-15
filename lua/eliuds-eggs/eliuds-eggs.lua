local EliudsEggs = {}

local function count(n, acc)
    return n == 0 and acc or count(n >> 1, acc + (n & 1))
end

function EliudsEggs.egg_count(number)
    return count(number, 0)
end

return EliudsEggs
