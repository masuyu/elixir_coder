defmodule Product do
  @moduledoc """
  AtCoder's A question.
  """

  @doc """
  ## Examples
      iex> Product.do_product(7, 2)
      "Even"

      iex> Product.do_product(7, 3)
      "Odd"
  """
  def do_product(a, b) when rem(a * b, 2) == 0, do: "Even"
  def do_product(_, _), do: "Odd"

  def exec() do
    [a, b] = IO.gets("")
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
    do_product(a, b)
  end
end