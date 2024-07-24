Mix.install([:benchee])

Code.eval_file("lib/resistor_color_duo.ex")

defmodule MapApproach do
  @colors %{
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

  def value(bands),
    do: bands |> Enum.take(2) |> Enum.map(fn x -> @colors[x] end) |> Integer.undigits()

  def value_conventional([band1, band2 | _]), do: @colors[band1] * 10 + @colors[band2]

  def colors(), do: @colors
end

colors = MapApproach.colors() |> Map.keys()

Benchee.run(
  %{
    "map + undigits" => fn input -> Enum.each(input, fn x -> MapApproach.value(x) end) end,
    "map + times 10" => fn input ->
      Enum.each(input, fn x -> MapApproach.value_conventional(x) end)
    end,
    "multiclause + undigits" => fn input ->
      Enum.each(input, fn x -> ResistorColorDuo.value(x) end)
    end,
    "multiclause + times 10" => fn input ->
      Enum.each(input, fn x -> ResistorColorDuo.value_conventional(x) end)
    end
  },
  inputs: %{
    "small - 20" =>
      1..20
      |> Enum.map(fn _ -> [Enum.random(colors), Enum.random(colors)] end),
    "large - 40" =>
      1..40
      |> Enum.map(fn _ -> [Enum.random(colors), Enum.random(colors)] end)
  }
)
