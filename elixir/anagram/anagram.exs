defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    split_base = base
    |> String.downcase
    |> String.split("", trim: true)

    candidates
    |> Enum.filter(fn(possible_anagram) ->
      is_anagram(split_base, possible_anagram) 
    end)
  end

  defp is_anagram(split_base, possible_anagram) do
    split_possible = possible_anagram
    |> String.downcase
    |> String.split("", trim: true)
    
    cond do
      split_base == split_possible -> false
      (map(split_base) == map(split_possible)) == true -> true
      true -> false
    end
  end

  defp map(split_word) do
    split_word
    |> Enum.reduce(%{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end

end