module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )


type Complex
    = Complex Float Float


fromPair : ( Float, Float ) -> Complex
fromPair pair =
    Complex (Tuple.first pair) (Tuple.second pair)


fromReal : Float -> Complex
fromReal float =
    Complex float 0


real : Complex -> Float
real z =
    case z of
        Complex a _ ->
            a


imaginary : Complex -> Float
imaginary z =
    case z of
        Complex _ b ->
            b


conjugate : Complex -> Complex
conjugate z =
    case z of
        Complex a b ->
            Complex a -b


abs : Complex -> Float
abs z =
    case z of
        Complex a b ->
            sqrt (sqrd a b)


sqrd : number -> number -> number
sqrd a b =
    a ^ 2 + b ^ 2


add : Complex -> Complex -> Complex
add z1 z2 =
    let
        (Complex a b) =
            z1

        (Complex c d) =
            z2
    in
    Complex (a + c) (b + d)


sub : Complex -> Complex -> Complex
sub z1 z2 =
    let
        (Complex a b) =
            z1

        (Complex c d) =
            z2
    in
    Complex (a - c) (b - d)


mul : Complex -> Complex -> Complex
mul z1 z2 =
    let
        (Complex a b) =
            z1

        (Complex c d) =
            z2
    in
    Complex (a * c - b * d) (b * c + a * d)


div : Complex -> Complex -> Complex
div z1 z2 =
    let
        (Complex a b) =
            z1

        (Complex c d) =
            z2
    in
    scalarDivision (Complex (a * c + b * d) (b * c - a * d)) (sqrd c d)


exp : Complex -> Complex
exp z =
    let
        (Complex a b) =
            z
    in
    scalarMultiplication (e ^ a) (Complex (cos b) (sin b))


scalarDivision : Complex -> Float -> Complex
scalarDivision z f =
    scalarMultiplication (1 / f) z


scalarMultiplication : Float -> Complex -> Complex
scalarMultiplication f z =
    let
        (Complex a b) =
            z
    in
    Complex (a * f) (b * f)
