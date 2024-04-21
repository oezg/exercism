module BinarySearch


let find input value =
    let rec needle bottom hay =
        if Array.isEmpty hay then
            None
        else
            let midheight = (Array.length hay) >>> 1
            let bite = hay[midheight]

            if bite = value then Some(bottom + midheight)
            elif bite > value then needle bottom hay[.. (midheight - 1)]
            else needle (bottom + midheight + 1) hay[(midheight + 1) ..]

    needle 0 input
