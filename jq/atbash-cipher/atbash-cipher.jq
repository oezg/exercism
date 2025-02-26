def atbash: "abcdefghijklmnopqrstuvwxyz" / "" | [., reverse] | transpose | map({(first): last}) | add;

def code: ascii_downcase / "" | map(atbash[.] // if test("\\D") then "" end) | add;

(.property == "encode") as $encode
| .input.phrase | code | if $encode then [scan(".{1,5}")] | join(" ") end