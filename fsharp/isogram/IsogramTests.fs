module IsogramTests

open FsUnit.Xunit
open Xunit

open Isogram

[<Fact>]
let ``Empty string`` () =
    isIsogram "" |> should equal true

[<Fact>]
let ``Isogram with only lower case characters`` () =
    isIsogram "isogram" |> should equal true

[<Fact>]
let ``Word with one duplicated character`` () =
    isIsogram "eleven" |> should equal false

[<Fact>]
let ``Word with one duplicated character from the end of the alphabet`` () =
    isIsogram "zzyzx" |> should equal false

[<Fact>]
let ``Longest reported english isogram`` () =
    isIsogram "subdermatoglyphic" |> should equal true

[<Fact>]
let ``Word with duplicated character in mixed case`` () =
    isIsogram "Alphabet" |> should equal false

[<Fact>]
let ``Word with duplicated character in mixed case, lowercase first`` () =
    isIsogram "alphAbet" |> should equal false

[<Fact>]
let ``Hypothetical isogrammic word with hyphen`` () =
    isIsogram "thumbscrew-japingly" |> should equal true

[<Fact>]
let ``Hypothetical word with duplicated character following hyphen`` () =
    isIsogram "thumbscrew-jappingly" |> should equal false

[<Fact>]
let ``Isogram with duplicated hyphen`` () =
    isIsogram "six-year-old" |> should equal true

[<Fact>]
let ``Made-up name that is an isogram`` () =
    isIsogram "Emily Jung Schwartzkopf" |> should equal true

[<Fact>]
let ``Duplicated character in the middle`` () =
    isIsogram "accentor" |> should equal false

[<Fact>]
let ``Same first and last characters`` () =
    isIsogram "angola" |> should equal false

[<Fact>]
let ``Word with duplicated character and with two hyphens`` () =
    isIsogram "up-to-date" |> should equal false
