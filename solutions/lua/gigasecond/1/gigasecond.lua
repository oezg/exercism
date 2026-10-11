local gigasecond = {}

function gigasecond.anniversary(any_date)
    return os.date('!%x', any_date + 1000000000)
end

return gigasecond
