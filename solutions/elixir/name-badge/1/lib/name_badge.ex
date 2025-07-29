defmodule NameBadge do
  @moduledoc """
  Exercise on `if` and `nil`
  """

  def print(id, name, department) do
    department = (department && String.upcase(department)) || "OWNER"

    (id && "[#{id}] - #{name} - #{department}") || "#{name} - #{department}"
  end
end
