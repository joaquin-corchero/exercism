defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @map %{
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    
    result = @map
    |> Map.fetch(dna)
    |> get_match(dna)
  end

  defp get_match({:ok, char}, _), do: char
  defp get_match(_, _) do
    IO.inspect "*******************************************"
    IO.inspect "*******************************************"
    IO.inspect Map.values(@map)
    IO.inspect "*******************************************"
    IO.inspect "*******************************************"

  end

  
end
