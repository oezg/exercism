defmodule BinarySearch do
  @moduledoc false
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)

  defp search(_numbers, _key, left, right) when left > right, do: :not_found

  defp search(numbers, key, left, left),
    do: if(elem(numbers, left) == key, do: {:ok, left}, else: :not_found)

  defp search(numbers, key, left, right) do
    middle = left + div(right - left, 2)

    case compare(elem(numbers, middle), key) do
      :eq ->
        {:ok, middle}

      :lt ->
        search(numbers, key, middle + 1, right)

      :gt ->
        search(numbers, key, left, middle - 1)
    end
  end

  defp compare(x, x), do: :eq
  defp compare(x, y) when x < y, do: :lt
  defp compare(_x, _y), do: :gt
end
