# jq -sRf codons.jq input.txt > codons.json

[
    splits("\n")
    | split("\t")
    | .[1] as $prot
    | (
        first
        | splits(", ")
        | {key: ., value: $prot}
    )
] | from_entries