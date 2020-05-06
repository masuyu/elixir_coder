defmodule KagamiMochi do
  @moduledoc """
  AtCoder's B question.
  """

  @doc """
  ## Examples
      iex> KagamiMochi.do_kagami_mochi([10, 11, 3, 4, 5])
      5

      iex> KagamiMochi.do_kagami_mochi([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      10
  """
  def do_kagami_mochi(l) do
    l |> Enum.uniq() |> length()
  end

  def exec() do
    n = IO.gets("") |> String.trim |> String.to_integer
    l = for _ <- 1..n, do: IO.gets("") |> i
    do_kagami_mochi(l)
  end
end