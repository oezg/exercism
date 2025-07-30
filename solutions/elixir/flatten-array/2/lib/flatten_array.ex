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
  def flatten(list), do: tailrec([], list) |> Enum.reverse()

  def tailrec(acc, []), do: acc
  def tailrec(acc, [nil | tail]), do: tailrec(acc, tail)
  def tailrec(acc, [head | tail]) when is_list(head), do: tailrec(acc, head) |> tailrec(tail)
  def tailrec(acc, [head | tail]), do: tailrec([head | acc], tail)
end
