defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn(possible_anagram) ->
      is_anagram(split_down(base), split_down(possible_anagram)) 
    end)
  end

  defp split_down(string) do
    string
    |> String.downcase
    |> String.split("", trim: true)
  end

  defp is_anagram(split_base, split_possible) do
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