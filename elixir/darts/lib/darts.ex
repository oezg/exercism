defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = :math.pow(x, 2) + :math.pow(y, 2)
    distance = :math.sqrt(distance)
    cond do
      distance <= 1 -> 10
      distance <= 5 -> 5
      distance <= 10 -> 1
      true -> 0
    end
  end
end
