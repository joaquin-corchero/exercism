defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / get_seconds_in_year(planet)
  end

  defp get_seconds_in_year(:earth), do: 31_557_600
  defp get_seconds_in_year(:mercury), do: 7_600_525
  defp get_seconds_in_year(:venus), do: 19_411_026
  defp get_seconds_in_year(:mars), do: 59_359_776
  defp get_seconds_in_year(:jupiter), do: 374_222_565
  defp get_seconds_in_year(:saturn), do: 928_792_569
  defp get_seconds_in_year(:uranus), do: 2_652_994_591
  defp get_seconds_in_year(:neptune), do: 5_196_280_668
end
