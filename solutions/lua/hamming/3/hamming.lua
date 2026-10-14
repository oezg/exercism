local Hamming = {}

local function hamming(t1, t2, acc)
    if #t1 == 0 then return acc end
    local dist = t1[1] == t2[1] and 0 or 1
    local _t1 = table.pack(table.unpack(t1, 2))
    local _t2 = table.pack(table.unpack(t2, 2))
    return hamming(_t1, _t2, acc + dist)
end

function Hamming.compute(a, b)
    assert(#a == #b, 'strands must be of equal length')
    return hamming({ a:byte(1, #a) }, { b:byte(1, #a) }, 0)
end

return Hamming
