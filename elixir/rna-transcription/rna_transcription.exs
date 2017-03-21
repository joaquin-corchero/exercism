defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @map %{
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    |> to_string
    |> String.split("", trim: true)
    |> Enum.reduce([], fn(c, acc) -> 
       acc ++ [to_string @map[c] ]
    end)
    |> Enum.join
    |> to_charlist
  end
    
end
