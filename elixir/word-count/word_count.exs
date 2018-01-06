defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words = 
      sentence 
      |> String.trim
      |> String.downcase
      |> (&Regex.replace(~r/[^\p{L}\-0-9]+/, &1, " ")).()
      |> String.split

    IO.inspect words

    words
    |> Enum.uniq 
    |> Enum.map(&count_in(&1, words))
    |> Enum.reduce(%{}, fn(x, acc) -> Map.merge(acc, x) end)
  end

  defp count_in(word, words) do
    %{ word => Enum.count(words, fn(x) -> x == word end) }
  end

end
