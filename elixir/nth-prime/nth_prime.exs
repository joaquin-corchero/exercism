defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    get_n_primes([2, 3], count, 5)
    |> Enum.at(count - 1)
  end

  defp get_n_primes(primes, count, candidate) do
    cond do
      count < 1 -> raise "Error"
      Enum.count(primes) >= count -> primes
      is_prime(primes, candidate) == true -> 
        get_n_primes(primes ++ [candidate], count, candidate + 2)    
      true -> 
        get_n_primes(primes, count, candidate + 2)    
    end    
  end

  defp is_prime(primes, candidate) do
    !Enum.any?(primes, fn(x) -> x <= :math.sqrt(candidate) && rem(candidate, x) == 0 end)
  end

end