include "helper";

def chunk(size):
    def _chunk:
        if length > size then
            .[:size], (.[size:] | _chunk)
        end;
    _chunk;

def translate:
    codons[.] // ("Invalid codon" | halt_error);

def chain:
    if . == [] or (first | translate == "STOP") then
        empty
    else
        (first | translate), (.[1:] | chain)
    end;

.strand / "" | [chunk(3) | add // empty] | [chain]