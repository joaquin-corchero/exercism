defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> get_first_letters
    |> Enum.join
    |> String.upcase
    
  end

  defp get_first_letters(input) do
    Regex.scan(~r/\b[a-z]|[A-Z]/, input)
  end
end
