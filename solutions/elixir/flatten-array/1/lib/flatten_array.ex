defmodule FlattenArray do
  @moduledoc """
  Take a nested array of any depth and return a fully flattened array.
  """

  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten([x | xs]) when is_list(x), do: flatten(x) ++ flatten(xs)
  def flatten([nil | xs]), do: flatten(xs)
  def flatten([x | xs]), do: [x | flatten(xs)]
end
