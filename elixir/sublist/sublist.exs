defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b do
    :equal
  end

  def compare([], [nil]) do
    :sublist
  end

  def compare([nil], []) do
    :superlist
  end

  def compare(a, b) when a != b do
    a_flat = a |> join_me
    b_flat = b |> join_me
    cond do
      String.contains?(a_flat, b_flat) -> :superlist
      String.contains?(b_flat, a_flat) -> :sublist
      true -> :unequal
    end
  end

  defp join_me(list) do
     result = list
     |> Enum.map(fn(x) -> stringify(x) end)
     |> Enum.join(",")
     (result <> ",")
  end

  defp stringify(x) when is_integer(x), do: Integer.to_string(x)
  defp stringify(x) when is_float(x), do: Float.to_string(x)
  defp stringify(x), do: x

end
