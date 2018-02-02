defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.to_charlist
    |> (&check([], &1)).()
  end

  def check([], bracket) when bracket in ')}]', do: false
  def check([], []), do: true
  def check(_, []), do: false
  def check(brackets, [bracket | str]) do
    case type(bracket) do
      :open ->
        check(brackets ++ [bracket], str)
      :close ->
        if brackets_match?(List.last(brackets), bracket),
          do: check(pop(brackets), str),
          else: false
      :unexpected -> check(brackets, str)
    end
  end

  defp pop([]) , do: []
  defp pop(lst), do: Enum.take(lst, length(lst)-1)

  def type(bracket) when bracket in '({[', do: :open
  def type(bracket) when bracket in ')}]', do: :close
  def type(_)  , do: :unexpected

  def brackets_match?(?{, ?}), do: true
  def brackets_match?(?[, ?]), do: true
  def brackets_match?(?(, ?)), do: true
  def brackets_match?( _,  _), do: false

end
