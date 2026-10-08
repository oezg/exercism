local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
    local arm, s = 0, tostring(number)
    string.gsub(s, "%d", function(d)
        arm = arm + tonumber(d) ^ #s
    end)
    return arm == number
end

return ArmstrongNumbers
