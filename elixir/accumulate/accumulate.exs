defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate([head | list], fun) do
    # as the docs says, it's faster
    [fun.(head) | accumulate(list, fun)]
    # than this:
    #[fun.(head)] ++ accumulate(list, fun)
    # https://hexdocs.pm/elixir/List.html
    # I`ve consumed 9gb of my ram and the time was the same xD,
    # maybe the listsize is not a problem haha
  end

  def accumulate([], _), do: []
end
