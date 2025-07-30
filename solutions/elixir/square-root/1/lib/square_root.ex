defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) when radicand > 0 and is_integer(radicand) do
    calculate(radicand, 0, radicand)
  end

  def calculate(radicand, lower, upper) do
    middle = lower + div(upper - lower, 2)
    square = middle * middle

    cond do
      square == radicand -> middle
      square < radicand -> calculate(radicand, middle + 1, upper)
      true -> calculate(radicand, lower, middle - 1)
    end
  end
end
