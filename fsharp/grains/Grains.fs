module Grains

let square (n: int) : Result<uint64, string> =
    if n < 1 || n > 64 then
        Error "square must be between 1 and 64"
    else
        Ok(uint64 (2.0 ** (float n - 1.0)))

let total: Result<uint64, string> = Ok System.UInt64.MaxValue
