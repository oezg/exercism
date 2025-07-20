defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(odd) when Integer.is_odd(odd), do: 1 + calc(3 * odd + 1)
  def calc(even) when is_integer(even) and even > 0, do: 1 + calc(div(even, 2))
end
