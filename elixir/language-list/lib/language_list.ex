defmodule LanguageList do
  @moduledoc """
  This is the Language List module. A learning exercise about lists.

  Implement some functions to manipulate a list of programming languages.
  """

  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list), do: tl(list)

  def first(list), do: hd(list)

  def count(list), do: length(list)

  def functional_list?(list), do: "Elixir" in list
end
