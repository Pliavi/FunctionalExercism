defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&anagram?(&1, base))
  end

  def anagram?(str1, str2) do 
    str1 = str1 |> String.downcase
    str2 = str2 |> String.downcase

       str1 != str2
    && String.length(str1)      == String.length(str2)
    && String.to_charlist(str1) -- String.to_charlist(str2) == []
  end
    
end
