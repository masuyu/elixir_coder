defmodule Coins do
  @moduledoc """
  AtCoder's B question.
  """

  @doc """
  ## Examples
      iex> Coins.do_coins(2, 3, 10, 1000)
      5

      iex> Coins.do_coins(50, 20, 20, 15550)
      42
  """
  def do_coins(a, b, c, x) do
    for i <- 0..a,
        j <- 0..b,
        k <- 0..c do
      i * 500 + j * 100 + k * 50
    end
    |> Enum.count(&(&1 == x))
  end

  def exec() do
    a = IO.gets("") |> String.trim |> String.to_integer
    b = IO.gets("") |> String.trim |> String.to_integer
    c = IO.gets("") |> String.trim |> String.to_integer
    x = IO.gets("") |> String.trim |> String.to_integer
    do_coins(a, b, c, x)
  end
end