let leap_year year = 
    let factor m = 
        year mod m == 0 
    in 
    factor 4 && (factor 400 || not @@ factor 100)
