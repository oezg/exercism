defmodule EliudsEggs do
  @moduledoc false

  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(n), do: rem(n, 2) + egg_count(div(n, 2))
end
