defmodule Bob do
  def hey(input) do
    trimmed = String.strip(input)
    cond do
        isEmpty? trimmed -> "Fine. Be that way!"
        isQuestion? trimmed -> "Sure."
        isShouting? trimmed->  "Whoa, chill out!"
        true -> "Whatever."
    end
  end
    
  defp isEmpty?(""), do: true
  
  defp isEmpty?(input), do: false
  
  defp isQuestion?(input) do
      String.ends_with? input, "?"
  end     
  defp isShouting?(input) do
      String.upcase(input) == input && Regex.run(~r/\p{L}/,  input) 
  end
end
