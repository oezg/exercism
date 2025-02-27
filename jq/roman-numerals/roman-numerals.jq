include "digits";


def toroman: ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"][.];

def degree: [{I: "I", V: "V", X: "X"}, {I: "X", V: "L", X: "C"}, {I: "C", V: "D", X: "M"}, {I: "M"}][.];

def substitute(order): gsub("I"; order["I"]) | gsub("V"; order["V"]) | gsub("X"; order["X"]);

# .number | [digits(10)] | reverse | to_entries | map((.key | degree) as $order | .value | toroman | substitute($order)) | add