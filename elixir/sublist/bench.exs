Mix.install([:benchee])
Code.eval_file("lib/sublist.ex")

defmodule Sublist.Oezg.Iter4 do
  @moduledoc false
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list(), list()) :: :equal | :sublist | :superlist | :unequal
  def compare(a, a), do: :equal

  def compare(a, b) do
    cond do
      length(a) < length(b) and subsequence?(a, b) -> :sublist
      length(b) < length(a) and subsequence?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec subsequence?(list(), list()) :: boolean()
  defp subsequence?([], _), do: true
  defp subsequence?(_, []), do: false

  defp subsequence?([x | _xs] = a, [y | ys] = b) do
    if x === y and compare(a, Enum.slice(b, 0, length(a))) == :equal do
      true
    else
      subsequence?(a, ys)
    end
  end
end

late_sublist = [999_997, 999_998, 999_999]
huge_list = Enum.to_list(1..1_000_000)
huge_equal = [hd(huge_list) | tl(huge_list)]
huge_different = Enum.reverse(huge_list)

Benchee.run(
  %{
    "Oezg Iter4" => fn test -> test.(&Sublist.Oezg.Iter4.compare/2) end,
    "Oezg Iter9" => fn test -> test.(&Sublist.compare/2) end
  },
  warmup: 0.2,
  time: 0.5,
  memory_time: 0.5,
  inputs: [
    {"sublist: partially matching sublist at end",
     fn sut -> :sublist = sut.([1, 1, 2], [1, 1, 1, 2]) end},
    {"sublist:  a late in huge list b", fn sut -> :sublist = sut.(late_sublist, huge_list) end},
    {"superlist: b late in huge list a",
     fn sut -> :superlist = sut.(huge_list, late_sublist) end},
    {"equal: huge identical lists", fn sut -> :equal = sut.(huge_list, huge_list) end},
    {"equal: huge equal, but not identical lists",
     fn sut -> :equal = sut.(huge_list, huge_equal) end},
    {"unequal: huge different", fn sut -> :unequal = sut.(huge_list, huge_different) end}
  ]
)
