"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    result = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for n in strand
        try
            result[n] = result[n] + 1
        catch KeyError
            throw(DomainError(n))
        end
    end
    return result
end
