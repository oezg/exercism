defmodule SpaceAge do
  @moduledoc """
  Given an age in seconds, calculate how old someone would be on a planet.
  """
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @earth_year_seconds 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet(), pos_integer()) :: {:error, binary()} | {:ok, float()}
  def age_on(:mercury, seconds), do: orbit_year(0.2408467).(seconds)
  def age_on(:venus, seconds), do: orbit_year(0.61519726).(seconds)
  def age_on(:earth, seconds), do: orbit_year(1.0).(seconds)
  def age_on(:mars, seconds), do: orbit_year(1.8808158).(seconds)
  def age_on(:jupiter, seconds), do: orbit_year(11.862615).(seconds)
  def age_on(:saturn, seconds), do: orbit_year(29.447498).(seconds)
  def age_on(:uranus, seconds), do: orbit_year(84.016846).(seconds)
  def age_on(:neptune, seconds), do: orbit_year(164.79132).(seconds)

  def age_on(_, _), do: {:error, "not a planet"}

  defp orbit_year(orbit), do: &{:ok, &1 / @earth_year_seconds / orbit}
end
