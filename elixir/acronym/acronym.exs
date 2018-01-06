defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> (&Regex.scan(~r/[A-Z]+|[ \p{P}]+[a-zA-Z]|^[a-z]/, &1)).()
    |> List.flatten
    |> Enum.map(fn(x) -> String.last(x) end)
    |> List.to_string
    |> String.upcase
  end
end
