defmodule SomeSums do
  @moduledoc """
  AtCoder's B question.
  """

  @doc """
  ## Examples
      iex> SomeSums.do_some_sums(10, 1, 3)
      16

      iex> SomeSums.do_some_sums(20, 8, 10)
      71

      iex> SomeSums.do_some_sums(100,4,16)
      4554
  """
  def do_some_sums(n, min, max) do
    1..n
    |> Enum.filter(&(min <= do_digits_sum(&1) and do_digits_sum(&1) <= max))
    |> Enum.sum()
  end
  defp do_digits_sum(a) do
    a |> Integer.digits() |> Enum.sum()
  end

  def exec do
    n = IO.gets("") |> String.trim |> String.to_integer
    a = IO.gets("") |> String.trim |> String.to_integer
    b = IO.gets("") |> String.trim |> String.to_integer
    do_some_sums(n, a, b)
  end
end
