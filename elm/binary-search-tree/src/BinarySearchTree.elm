module BinarySearchTree exposing (BinaryTree(..), makeTree, sort)


type BinaryTree
    = Empty
    | Tree BinaryTree Int BinaryTree


makeTree : List Int -> BinaryTree
makeTree =
    List.foldl add Empty


sort : List Int -> List Int
sort =
    makeTree >> backToList []


backToList : List Int -> BinaryTree -> List Int
backToList acc tree =
    case tree of
        Empty ->
            acc

        Tree left value right ->
            backToList (value :: backToList acc right) left


add : Int -> BinaryTree -> BinaryTree
add number tree =
    case tree of
        Empty ->
            Tree Empty number Empty

        Tree left value right ->
            if number > value then
                Tree left value (add number right)

            else
                Tree (add number left) value right
