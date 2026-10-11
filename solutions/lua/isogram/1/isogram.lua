return function(s)
    local visited = {}
    for letter in string.gmatch(s, "%a") do
        local key = string.lower(letter)
        if visited[key] then
            return false
        end
        visited[key] = true
    end
    return true
end
