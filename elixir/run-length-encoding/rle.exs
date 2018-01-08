defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> do_encode
  end

  defp do_encode([]), do: "" 
  defp do_encode(str_list) do 
    [char | _] = str_list
    new_list = 
      str_list
      |> Enum.drop_while(fn x -> x == char end)
    
    count = length(str_list) - length(new_list)
    
    (if count > 1, 
    do: Integer.to_string(count),
    else: ""
    ) <> char <> do_encode(new_list)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.split(~r/[0-9]*[\p{L} ]/, [include_captures: true])
    |> Enum.map(fn str -> 
      if(String.length(str) > 1) do
        {count, char} = String.split_at(str, -1)
        [ String.to_integer(count), char ]
      else
        [ 1, str ]
      end
    end)
    |> List.flatten
    |> do_decode
    |> List.to_string
  end

  defp do_decode([]), do: []
  defp do_decode([count, char | xs]) do
    Stream.cycle([char])
    |> Enum.take(count) 
    |> Kernel.++(do_decode(xs))
  end
end
