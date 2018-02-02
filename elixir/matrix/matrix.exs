defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input),
  do: %Matrix{ matrix: input |> String.split("\n") |> Enum.map(&to_integer_list/1) }

  @spec to_integer_list(String.t()) :: list(integer)
  def to_integer_list(value), 
  do: value |> String.split(" ") |> Enum.map(&String.to_integer/1)

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix),
  do: matrix |> rows |> Enum.map_join("\n", &line_to_string/1)

  #@spect line_to_string(list(integer)) :: String.t()
  def line_to_string(list), 
  do: list |> Enum.join(" ")

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix), 
  do: matrix.matrix

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index), 
  do: Enum.at rows(matrix), index

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix),
  do: matrix |> rows |> transpose

  @spec columns(list(list(integer))) :: list(list(integer))
  def transpose(matrix), 
  do: matrix |> List.zip |> Enum.map(&Tuple.to_list/1)

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index), 
  do: matrix |> columns |> Enum.at(index)
end

