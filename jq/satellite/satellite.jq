def fail_unequal(b; f; msg): if (.preorder | f) != (b | f) then msg | halt_error end;

def validate:
    fail_unequal(.inorder; length; "traversals must have the same length")
    | fail_unequal(.inorder; sort; "traversals must have the same elements")
    | fail_unequal(.preorder | unique; length; "traversals must contain unique items");

def build_tree:
    if .preorder == [] or .inorder == [] then 
        {} 
    else 
        (.preorder | first) as $root
        | (.inorder | index($root)) as $position
        | {
            v: $root, 
            l: (.preorder |= .[1:$position + 1] | .inorder |= .[:$position] | build_tree),
            r: (.preorder |= .[$position + 1:] | .inorder |= .[$position + 1:] | build_tree)
        }
    end;

validate | build_tree