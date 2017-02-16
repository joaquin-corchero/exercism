defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @rain_map [
    Pling: 3,
    Plang: 5,
    Plong: 7
  ]

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factors = Enum.filter(@rain_map, fn({key, value}) -> rem(number, value) == 0 end)
    do_convert(number, factors)
  end

  defp do_convert(number, []) do
    "#{number}"
  end

  defp do_convert(_, factors) do
    Enum.reduce(factors, "", fn({key, value}, res) -> res <> Atom.to_string(key) end)
  end
end
