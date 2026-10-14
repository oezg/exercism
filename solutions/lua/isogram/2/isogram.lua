return function(s)
    local visited = {}
    for letter in s:lower():gmatch("%a") do
        if visited[letter] then
            return false
        end
        visited[letter] = true
    end
    return true
end
