defmodule Scrabble do
  @spec score(String.t) :: non_neg_integer
  def score(str), do: str |> String.upcase |> to_charlist |> do_score

  @spec do_score(String.Chars.t) :: non_neg_integer
  def do_score([])         , do: 0
  def do_score([char|word]), do: points(char) + do_score(word)

  @spec points(non_neg_integer) :: non_neg_integer
  def points(char) when char in 'AEIOULNRST', do: 1
  def points(char) when char in 'DG',         do: 2
  def points(char) when char in 'BCMP',       do: 3
  def points(char) when char in 'FHVWY',      do: 4
  def points(char) when char in 'JX',         do: 8
  def points(char) when char in 'QZ',         do: 10
  def points(?K), do: 5
  def points(_)  , do: 0
end
