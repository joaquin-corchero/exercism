defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  # @matches %{
  #   "}": "{",
  #   "]": "[",
  #   "(": ")"
  # }

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    arr = String.split(str, "", trim: true)
   
    result = Enum.reduce(arr, [], fn(c, acc) -> add_or_remove(c, acc) end)

    Enum.count(result) == 0
  end

  defp add_or_remove(item, []) do
    [item]
  end

  defp add_or_remove(item, [head | tail] = acc) do
    cond do
      is_opening(item) == true -> [item] ++ acc
      is_valid_closing(item, acc) == true -> tail
      true -> acc
    end
  end

  defp is_opening(item) when item in ["[", "{", "("], do: true
  defp is_opening(_), do: false

  defp is_valid_closing("}", [head | _]) when head == "{", do: true
  defp is_valid_closing("]", [head | _]) when head == "[", do: true
  defp is_valid_closing(")", [head | _]) when head == "(", do: true
  defp is_valid_closing(_, _), do: false

end
