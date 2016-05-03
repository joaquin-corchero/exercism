defmodule Words do
  import Map
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do     
      sentence
      |> String.downcase
      |> String.split(~r/[\s_&!?:@$%^,\.]+/, trim: true)
      |> Enum.reduce(Map.new, 
        fn word, map ->
             Map.update(map, word, 1, &(&1 + 1))
        end
      )
  end
end
