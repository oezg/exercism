local gigasecond = {}

function gigasecond.anniversary(any_date)
    return os.date('!%x', any_date + 1e9)
end

return gigasecond
