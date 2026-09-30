return function(n)
    local out = string.format(
        "%s%s%s",
        n % 3 == 0 and "Pling" or "",
        n % 5 == 0 and "Plang" or "",
        n % 7 == 0 and "Plong" or ""
    )
    return out == "" and tostring(n) or out
end
