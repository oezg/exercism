defmodule NameBadge do
  @moduledoc """
  Exercise on `if` and `nil`
  """

  def print(id, name, department) do
    department = (department && String.upcase(department)) || "OWNER"

    if id do
      "[#{id}] - #{name} - #{department}"
    else
      "#{name} - #{department}"
    end
  end
end
