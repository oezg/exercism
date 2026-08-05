return function(n)
    local function isDivisibleBy(m) return n % m == 0 end
    local result = ''
    if isDivisibleBy(7) then result = 'Plong' .. result end
    if isDivisibleBy(5) then result = 'Plang' .. result end
    if isDivisibleBy(3) then result = 'Pling' .. result end
    if result == '' then result = tostring(n) .. result end
    return result
end
