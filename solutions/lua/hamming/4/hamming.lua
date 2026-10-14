local Hamming = {}

function Hamming.compute(a, b)
    assert(#a == #b, 'strands must be of equal length')
    local out = 0
    local strand = { b:byte(1, #a) }
    for index, value in ipairs({ a:byte(1, #a) }) do
        out = out + (value == strand[index] and 0 or 1)
    end
    return out
end

return Hamming
