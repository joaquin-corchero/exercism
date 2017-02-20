defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @alphabet [
    "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","w","x","y","z"
  ]

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    !has_all_letters(String.downcase(sentence))
  end

  defp has_all_letters(sentence) do
    @alphabet
    |> Enum.any?(fn(letter) -> !String.contains?(sentence, letter) end)
  end
end
