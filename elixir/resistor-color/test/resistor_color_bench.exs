Mix.install([:benchee])

input =
  Enum.take_random(
    [
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
    ],
    1000
  )

colors = {
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

code = fn color -> Enum.find(0..(tuple_size(colors) - 1), &(elem(colors, &1) == color)) end

colors_map = %{
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

code_map = fn color -> colors_map[color] end

colors_keyword = [
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

code_keyword = fn color -> Keyword.fetch!(colors_keyword, color) end

Benchee.run(%{
  "find in tuple" => fn -> Enum.each(input, fn x -> code.(x) end) end,
  "lookup in map" => fn -> Enum.each(input, fn x -> code_map.(x) end) end,
  "keyword list " => fn -> Enum.each(input, fn x -> code_keyword.(x) end) end
})
