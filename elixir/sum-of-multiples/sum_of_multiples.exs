defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
    |> Enum.reduce(0, fn(number, acc) -> acc + get_factor(number, factors) end)
  end

  defp get_factor(number, factors) do
    case Enum.any?(factors, fn(x) -> number >= x && rem(number, x) == 0 end) do
      false -> 0
      true -> number
    end
  end
end
