Mix.install([:benchee])

defmodule ResistorColorBench do
  @colors_tuple {
    :black,
    :brown,
    :red,
    :orange,
    :yellow,
    :green,
    :blue,
    :violet,
    :grey,
    :white
  }

  @colors_map %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @colors_keyword [
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  ]

  def generate_input(n) do
    @colors_tuple
    |> Tuple.to_list()
    |> Enum.take_random(n)
  end

  def code_tuple(color),
    do: Enum.find(0..(tuple_size(@colors_tuple) - 1), &(elem(@colors_tuple, &1) == color))

  def code_map(color), do: @colors_map[color]
  def code_keyword(color), do: Keyword.fetch!(@colors_keyword, color)
end

Benchee.run(
  %{
    "find in tuple" => fn input ->
      Enum.each(input, fn x -> ResistorColorBench.code_tuple(x) end)
    end,
    "lookup in map" => fn input ->
      Enum.each(input, fn x -> ResistorColorBench.code_map(x) end)
    end,
    "keyword list " => fn input ->
      Enum.each(input, fn x -> ResistorColorBench.code_keyword(x) end)
    end
  },
  inputs: %{
    "Small" => ResistorColorBench.generate_input(10),
    "Medium" => ResistorColorBench.generate_input(100),
    "Large" => ResistorColorBench.generate_input(1000)
  },
  save: [path: "result.benchee", tag: "first-try"]
)
