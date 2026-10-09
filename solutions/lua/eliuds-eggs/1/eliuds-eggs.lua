local EliudsEggs = {}

function EliudsEggs.egg_count(number, acc)
    acc = acc or 0
    if number == 0 then return acc end
    return EliudsEggs.egg_count(number >> 1, acc + (number & 1))
end

return EliudsEggs
