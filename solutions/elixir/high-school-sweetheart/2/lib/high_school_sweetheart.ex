defmodule HighSchoolSweetheart do
  def first_letter(name),
    do: String.first(String.trim_leading(name))

  def initial(name),
    do: String.upcase(first_letter(name)) <> "."

  def initials(full_name),
    do: Enum.map_join(String.split(full_name), " ", &initial/1)

  def pair(full_name1, full_name2),
    do: """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
end
