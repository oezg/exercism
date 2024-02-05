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


  defp zone(position) do
    case distance(position) do
      outside when outside > 10 -> :outside
      outer_circle when outer_circle > 5 -> :outer_circle
      middle_circle when middle_circle > 1 -> :middle_circle
      _inner_circle -> :inner_circle
    end
  end

  defp distance({x, y}), do: :math.sqrt(x*x + y*y)

  defp points(:inner_circle), do: 10
  defp points(:middle_circle), do: 5
  defp points(:outer_circle), do: 1
  defp points(:outside), do: 0

end
