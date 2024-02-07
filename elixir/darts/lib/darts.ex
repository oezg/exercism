defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score(position), do:
    position
    |> zone()
    |> points()


  defp zone(position), do: circle(distance(position))

  defp circle(inner) when inner <= 1, do: :inner_circle
  defp circle(middle) when middle <= 5, do: :middle_circle
  defp circle(outer) when outer <= 10, do: :outer_circle
  defp circle(_outside), do: :outside

  defp distance({x, y}), do: :math.sqrt(x*x + y*y)

  defp points(:inner_circle), do: 10
  defp points(:middle_circle), do: 5
  defp points(:outer_circle), do: 1
  defp points(:outside), do: 0

end
