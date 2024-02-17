defmodule NameBadge do
  @moduledoc """
  Print name badges for factory employees.
  Learning exercise for if and nil.
  """

  @doc """
  Print a badge for an employee, for a new employee and for the owner.
  """
  @spec print(id::integer()|nil, name:: String.t(), department::String.t()|nil) :: String.t()
  def print(id, name, department) do
    id_replacement = if id, do: "[#{id}] - ", else: ""
    dept_replacement = if department, do: String.upcase(department), else: "OWNER"
    "#{id_replacement}#{name} - #{dept_replacement}"
  end
end
