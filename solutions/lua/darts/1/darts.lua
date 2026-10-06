local Darts = {}

function Darts.score(x, y)
    local d = math.sqrt(x * x + y * y)
    if d <= 1 then
        return 10
    elseif d <= 5 then
        return 5
    elseif d <= 10 then
        return 1
    else
        return 0
    end
end

return Darts
