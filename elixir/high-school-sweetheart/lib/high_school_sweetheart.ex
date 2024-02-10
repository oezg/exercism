defmodule HighSchoolSweetheart do
  @heart_template """
       ******       ******
     **      **   **      **
   **         ** **         **
  **            *            **
  **                         **
  **     P. 1.  +  P. 2.     **
   **                       **
     **                   **
       **               **
         **           **
           **       **
             **   **
               ***
                *
  """

  @spec first_letter(String.t()) :: String.t()
  def first_letter(name),
    do: String.first(String.trim_leading(name))

  @spec initial(String.t()) :: String.t()
  def initial(name),
    do: String.upcase(first_letter(name)) <> "."

  @spec initials(String.t()) :: String.t()
  def initials(full_name),
    do:
      full_name
      |> String.split(" ")
      |> Enum.map_join(" ", &initial/1)

  @spec pair(String.t(), String.t()) :: String.t()
  def pair(full_name1, full_name2),
    do:
      @heart_template
      |> String.replace("P. 1.", initials(full_name1))
      |> String.replace("P. 2.", initials(full_name2))
end
