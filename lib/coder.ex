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
end