local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local arm = 0
    local s = tostring(number)
    string.gsub(s, "%d", function(d)
        arm = arm + tonumber(d) ^ #s
    end)
    return arm == number
end

return ArmstrongNumbers
