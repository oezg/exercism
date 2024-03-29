module BinarySearch


let find input value =
    let rec needle ground hay =
        if Array.isEmpty hay then
            None
        else
            let middle = (Array.length hay) / 2

            match hay.[middle] with
            | found when found = value -> Some(ground + middle)
            | small when small < value -> needle (ground + middle + 1) hay.[(middle + 1) ..]
            | large -> needle ground hay.[.. (middle - 1)]

    needle 0 input
