defmodule CollatzConjecture do
  @moduledoc false

  import Integer, only: [is_even: 1]

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: steps(0, input)

  @spec steps(non_neg_integer(), pos_integer()) :: non_neg_integer()
  defp steps(acc, 1), do: acc
  defp steps(acc, n) when is_even(n), do: steps(acc + 1, div(n, 2))
  defp steps(acc, n), do: steps(acc + 1, 3 * n + 1)
end
