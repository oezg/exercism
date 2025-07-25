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
  def age_on(planet, seconds) do
    case orbital_period_in_earth_years(planet) do
      {:ok, ratio} when is_float(ratio) -> {:ok, seconds / @earth_year_in_seconds / ratio}
      error -> error
    end
  end

  @spec orbital_period_in_earth_years(planet) :: {:ok, float} | {:error, String.t()}
  defp orbital_period_in_earth_years(:mercury), do: {:ok, 0.2408467}
  defp orbital_period_in_earth_years(:venus), do: {:ok, 0.61519726}
  defp orbital_period_in_earth_years(:earth), do: {:ok, 1.0}
  defp orbital_period_in_earth_years(:mars), do: {:ok, 1.8808158}
  defp orbital_period_in_earth_years(:jupiter), do: {:ok, 11.862615}
  defp orbital_period_in_earth_years(:saturn), do: {:ok, 29.447498}
  defp orbital_period_in_earth_years(:uranus), do: {:ok, 84.016846}
  defp orbital_period_in_earth_years(:neptune), do: {:ok, 164.79132}
  defp orbital_period_in_earth_years(_), do: {:error, "not a planet"}
end
