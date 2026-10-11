local grains = {}

function grains.square(n)
    if n < 1 or n > 64 then
        error('square must be between 1 and 64')
    end
    return 2 ^ (n - 1)
end

function grains.total()
    return 2 ^ 64 - 1
end

return grains
