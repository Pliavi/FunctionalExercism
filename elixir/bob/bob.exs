defmodule Bob do
  def hey(input) do
    input = String.trim input
    cond do
      silence?(input)  -> "Fine. Be that way!"
      question?(input) -> "Sure."
      normal?(input)   -> "Whatever."
      yell?(input)     -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end

  defp silence?(input), do: input == ""

  defp question?(input), do: String.ends_with? input, "?"

  defp yell?(input), do: input == String.upcase(input)
  
  defp normal?(input), do: input == String.downcase(input)
end