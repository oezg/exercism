local Hamming = {}

function Hamming.compute(a, b)
    assert(#a == #b, 'strands must be of equal length')
    local out = 0
    a = { a:byte(1, #a) }
    b = { b:byte(1, #a) }
    for i = 1, #a do
        out = out + (a[i] == b[i] and 0 or 1)
    end
    return out
end

return Hamming
