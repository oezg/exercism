defmodule SpaceAge do
  @earth_year_in_seconds 31_557_600
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds), do: age_on(planet).(seconds)
  defp age_on(:mercury), do: &{:ok, &1 / @earth_year_in_seconds / 0.2408467}
  defp age_on(:venus), do: &{:ok, &1 / @earth_year_in_seconds / 0.61519726}
  defp age_on(:earth), do: &{:ok, &1 / @earth_year_in_seconds / 1.0}
  defp age_on(:mars), do: &{:ok, &1 / @earth_year_in_seconds / 1.8808158}
  defp age_on(:jupiter), do: &{:ok, &1 / @earth_year_in_seconds / 11.862615}
  defp age_on(:saturn), do: &{:ok, &1 / @earth_year_in_seconds / 29.447498}
  defp age_on(:uranus), do: &{:ok, &1 / @earth_year_in_seconds / 84.016846}
  defp age_on(:neptune), do: &{:ok, &1 / @earth_year_in_seconds / 164.79132}
  defp age_on(_), do: fn _ -> {:error, "not a planet"} end
end
