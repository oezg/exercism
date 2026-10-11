local Hamming = {}

function Hamming.compute(a, b)
    if #a ~= #b then
        error('strands must be of equal length')
    end
    local out = 0
    for i = 1, #a do
        if string.sub(a, i, i) ~= string.sub(b, i, i) then
            out = out + 1
        end
    end
    return out
end

return Hamming
