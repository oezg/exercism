include "codons";

def translate:
    codons[.] // ("Invalid codon" | halt_error);

def chain:
    if . == [] or (first | translate == "STOP") then
        empty
    else
        (first | translate), (.[1:] | chain)
    end;

.strand | [scan(".{1,3}")] | [chain]