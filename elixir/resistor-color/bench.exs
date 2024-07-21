Mix.install([:benchee])

defmodule ResistorColorBench do
  @elements_n 100

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

  def generate_input() do
    @colors_tuple
    |> Tuple.to_list()
    |> Enum.take_random(@elements_n)
  end

  def code_tuple(color), do: Enum.find(0..(tuple_size(@colors_tuple) - 1), &(elem(@colors_tuple, &1) == color))
  def code_map(color), do: @colors_map[color]
  def code_keyword(color), do: Keyword.fetch!(@colors_keyword, color)
end

input = ResistorColorBench.generate_input()

Benchee.run(%{
  "find in tuple" => fn -> Enum.each(input, fn x -> ResistorColorBench.code_tuple(x) end) end,
  "lookup in map" => fn -> Enum.each(input, fn x -> ResistorColorBench.code_map(x) end) end,
  "keyword list " => fn -> Enum.each(input, fn x -> ResistorColorBench.code_keyword(x) end) end
})

"""
Name                    ips        average  deviation         median         99th %
lookup in map        2.76 M      362.00 ns ±10505.35%         307 ns         587 ns
keyword list         2.36 M      424.33 ns ±13111.93%         326 ns         616 ns
find in tuple        0.37 M     2696.52 ns  ±1049.72%        2199 ns        3999 ns

Comparison:
lookup in map        2.76 M
keyword list         2.36 M - 1.17x slower +62.33 ns
find in tuple        0.37 M - 7.45x slower +2334.52 ns
"""
