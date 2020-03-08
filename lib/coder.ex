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
    case Enum.all?(l, fn(n) -> rem(n, 2) == 0 end) do
      :true -> l |> Enum.map(fn(n) -> div(n, 2) end) |> do_div_by_two(r+1)
      _ -> r
    end
  end
end