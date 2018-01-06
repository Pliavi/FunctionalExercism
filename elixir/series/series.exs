defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    if (size > String.length(s) || size < 1),
      do: [],
      else: do_slice(String.codepoints(s), size)
  end

  def do_slice([x], _), do: [x]
  def do_slice([], _), do: []
  def do_slice(s, size) do
    seg = Enum.take(s, size) |> List.to_string
    [_|s] = s

    if (length(s) >= size) do
      [ seg | do_slice(s, size) ]
    else
      [ seg ]
    end
  end

end

