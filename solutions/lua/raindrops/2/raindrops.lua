return function(n)
    local result = {}
    for _, t in ipairs({ { 3, "i" }, { 5, "a" }, { 7, "o" } }) do
        if n % t[1] == 0 then
            table.insert(result, string.format("Pl%sng", t[2]))
        end
    end
    return #result == 0 and tostring(n) or table.concat(result)
end
