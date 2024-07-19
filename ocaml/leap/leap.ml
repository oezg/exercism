let leap_year year = 
    let year_is_divisible_by m = 
        year mod m == 0 
    in 
    year_is_divisible_by 4 && (year_is_divisible_by 400 || not @@ year_is_divisible_by 100)
