defmodule Coder do
  @moduledoc """
  Coder is answer of AtCoder's Questions.
  those functions called from Main modules and executed.
  """

  @doc """
  ## Examples
      iex> Coder.do_product(7, 2)
      "Even"

      iex> Coder.do_product(7, 3)
      "Odd"
  """
  def do_product(a, b) when rem(a * b, 2) == 0, do: "Even"
  def do_product(_, _), do: "Odd"

  @doc """
  ## Examples
      iex> Coder.do_plancing_marbles("111")
      3

      iex> Coder.do_plancing_marbles("101")
      2
  """
  def do_plancing_marbles(a) do
    a |> String.codepoints |> Enum.count(fn(x) -> x == "1" end)
  end

  @doc """
  ## Examples
      iex> Coder.do_shift_only([2, 4, 6])
      1

      iex> Coder.do_shift_only([8, 16, 12])
      2

      iex> Coder.do_shift_only([8, 24, 40])
      3
  """
  def do_shift_only(l) do
    do_div_by_two(l, 0)
  end
  defp do_div_by_two(l, r) do
    case Enum.all?(l, &(rem(&1, 2) == 0)) do
      :true -> do_div_by_two(Enum.map(l, &(div(&1, 2))), r+1)
      _ -> r
    end
  end

  @doc """
  ## Examples
      iex> Coder.do_coins(2, 3, 10, 1000)
      5

      iex> Coder.do_coins(50, 20, 20, 15550)
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

  @doc """
  ## Examples
      iex> Coder.do_some_sums(10, 1, 3)
      16

      iex> Coder.do_some_sums(20, 8, 10)
      71

      iex> Coder.do_some_sums(100,4,16)
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

  @doc """
  ## Examples
      iex> Coder.do_card_game_for_two(5, [1, 2, 3, 4, 5])
      3

      iex> Coder.do_card_game_for_two(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      5
  """
  def do_card_game_for_two(_, card_list) do
    dsc_ls = card_list |> Enum.sort(&(&1 >= &2))
    (dsc_ls |> Enum.take_every(2) |> Enum.sum()) - (dsc_ls |> Enum.drop_every(2) |> Enum.sum())
  end
end