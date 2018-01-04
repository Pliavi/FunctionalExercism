defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text 
      |> String.codepoints
      |> Enum.map(&(rotate_char(&1, shift)))
      |> List.to_string
  end

  @spec rotate_char(char :: String.t(), shift :: integer) :: String.t()
  def rotate_char(char, shift) do
    if (String.match? char, ~r/[a-zA-Z]/) do
      shift = rem shift, 26
      <<char::utf8>> = char
      diff = if char < ?a, do: ?A, else: ?a

      <<rem(char - diff + shift, 26) + diff>>
    else
      char
    end
  end
end

