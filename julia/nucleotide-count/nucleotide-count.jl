"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    result = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for nucleotide in strand
        if haskey(result, nucleotide)
            result[nucleotide] += 1
        else
            throw(DomainError(nucleotide, "invalid nucleotide"))
        end
    end
    return result
end
