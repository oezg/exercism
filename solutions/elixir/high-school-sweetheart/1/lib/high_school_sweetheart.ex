defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim_leading(name) |> String.first()
  end

  def initial(name) do
    "#{first_letter(name) |> String.upcase()}."
  end

  def initials(full_name) do
    String.split(full_name) |> Enum.map_join(" ", &initial/1)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
