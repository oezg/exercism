defmodule SquareRoot do
  @moduledoc """
  Find the square root using binary search. Only works for perfect square numbers.
  """

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) when radicand > 0 and is_integer(radicand) do
    calculate(radicand, 1, div(radicand, 2))
  end

  defp calculate(radicand, lower, upper) do
    middle = lower + div(upper - lower, 2)

    case middle * middle do
      ^radicand -> middle
      square when square < radicand -> calculate(radicand, middle + 1, upper)
      _ -> calculate(radicand, lower, middle - 1)
    end
  end
end
