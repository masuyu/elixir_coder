defmodule PlancingMarbles do
  @moduledoc """
  AtCoder's A question.
  """

  @doc """
  ## Examples
      iex> PlancingMarbles.do_plancing_marbles("111")
      3

      iex> PlancingMarbles.do_plancing_marbles("101")
      2
  """
  def do_plancing_marbles(a) do
    a |> String.codepoints |> Enum.count(fn(x) -> x == "1" end)
  end

  def exec() do
    a = IO.gets("")
      |> String.trim
    do_plancing_marbles(a)
  end
end