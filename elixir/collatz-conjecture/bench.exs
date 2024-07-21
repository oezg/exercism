Mix.install([:benchee])

import Integer, only: [is_even: 1]

defmodule TailRecursion do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: steps(0, input)

  @spec steps(non_neg_integer(), pos_integer()) :: non_neg_integer()
  defp steps(acc, 1), do: acc
  defp steps(acc, n) when is_even(n), do: steps(acc + 1, div(n, 2))
  defp steps(acc, n), do: steps(acc + 1, 3 * n + 1)
end

defmodule StreamIterate do
  defp collatz(n) when is_even(n), do: div(n, 2)
  defp collatz(n), do: 3 * n + 1

  def calc(input) when is_integer(input) and input > 0 do
    input
    |> Stream.iterate(&collatz/1)
    |> Enum.reduce_while(0, fn n, acc ->
      if n == 1, do: {:halt, acc}, else: {:cont, acc + 1}
    end)
  end
end

Benchee.run(
  %{
    "tail recursion" => fn input -> Enum.each(input, fn x -> TailRecursion.calc(x) end) end,
    "stream iterate" => fn input -> Enum.each(input, fn x -> StreamIterate.calc(x) end) end
  },
  inputs: %{
    "small" => Enum.to_list(1..20),
    "large" => Enum.to_list(1..400)
  }
)
