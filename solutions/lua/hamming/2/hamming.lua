local Hamming = {}

function Hamming.compute(a, b)
    assert(#a == #b, 'strands must be of equal length')
    local out = 0
    for i = 1, #a do
        out = out + (a:byte(i) == b:byte(i) and 0 or 1)
    end
    return out
end

return Hamming
