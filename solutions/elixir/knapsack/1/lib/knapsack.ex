defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value(items, maximum_weight) do
    fill_knapsack(items, maximum_weight, %{value: 0, weight: 0}).value
  end

  defp fill_knapsack([], _limit, knapsack), do: knapsack

  defp fill_knapsack(
         [%{value: _item_value, weight: item_weight} | _rest],
         limit,
         %{value: _knapsack_value, weight: knapsack_weight} = knapsack
       )
       when knapsack_weight + item_weight > limit,
       do: knapsack

  defp fill_knapsack(
         [%{value: item_value, weight: item_weight} | rest],
         limit,
         %{value: knapsack_value, weight: knapsack_weight} = knapsack
       ) do
    with_item =
      fill_knapsack(rest, limit, %{
        value: knapsack_value + item_value,
        weight: knapsack_weight + item_weight
      })

    without_item = fill_knapsack(rest, limit, knapsack)

    if with_item.value > without_item.value do
      with_item
    else
      without_item
    end
  end
end
