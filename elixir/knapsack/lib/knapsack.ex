defmodule Knapsack do
  @moduledoc false

  @type item :: %{value: integer, weight: integer}
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [item], limit :: integer) :: integer

  def maximum_value([], _limit), do: 0

  def maximum_value([%{weight: weight} | items], limit) when weight > limit,
    do: maximum_value(items, limit)

  def maximum_value([%{weight: weight, value: value} | items], limit),
    do: max(value + maximum_value(items, limit - weight), maximum_value(items, limit))
end
