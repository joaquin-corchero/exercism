defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @translation [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    do_convert(number, @translation, "")
  end

  defp do_convert(0, _translations, result), do: result
  defp do_convert(number, [{latin, arabic} | rest] = translations, result) do
    if(number >= arabic) do
      do_convert(number - arabic, translations, result <> latin)
    else
      do_convert(number, rest, result)
    end
  end
end
