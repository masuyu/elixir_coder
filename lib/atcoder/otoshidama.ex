defmodule Otoshidama do
  @moduledoc """
  AtCoder's C question.
  """

  @doc """
  ## Examples
      iex> Otoshidama.do_otoshidama(10, 80000)
      "6 4 0"

      iex> Otoshidama.do_otoshidama(20, 89000)
      "1 15 4"
  """
  def do_otoshidama(n, yen) do
    for i <- 0..n,
        j <- 0..(n - i) do
      {i, j, n-i-j}
    end
    |> Enum.filter(fn {i, j, k} -> i*10000 + j*5000 + k*1000 == yen end)
    |> Enum.at(0, {-1, -1, -1})
    |> case do
      {a, b, c} -> "#{a} #{b} #{c}"
    end
  end

  def exec() do
    [n, yen] = IO.gets("") |> String.trim |> String.strip |> Enum.map(&String.to_integer/1)
    do_otoshidama(n, yen)
  end
end