module Test.Generated.Main exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 358820642485582
        , processes = 4
        , globs =
            []
        , paths =
            [ "/home/oezg/code/exercism/elm/hello-world/tests/Tests.elm"
            ]
        }
        [ ( "Tests"
          , [ Test.Runner.Node.check Tests.tests
            ]
          )
        ]