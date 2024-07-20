Mix.install([:benchee])

# some code to call ResistorColor.code with 1000 different valid random arguments.

input = List.init 1000 (fn _ -> Random.choose(ResistorColor.@colors) end)

# some code to measure how long it takes and how much memory it takes.

Benchee.run(
  %{
    "my bench" => Enum.each(input, fn i -> ResistorColor.code(i) end)
  }
)
