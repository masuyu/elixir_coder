defmodule RepeatedString do
  @moduledoc """
  HackerRank Question
  """

  @doc """
  ## Examples
      iex> Coder.do_repeated_string("aba", 10)
      7

      iex> Coder.do_repeated_string("a", 1000000000000)
      1000000000000
  """
  def do_repeated_string(s, n) do
    count_quotient(s, n) + count_rem(s, n)
  end
  defp count_quotient(s, n), do: s |> String.codepoints |> Enum.filter(&(&1 == "a")) |> Enum.count |> cal_repeated_string1(div(n, String.length(s)))
  defp cal_repeated_string1(a_count, quotient), do: a_count * quotient
  defp count_rem(s, n), do: s |> String.codepoints |> cal_repeated_string2(rem(n, String.length(s)))
  defp cal_repeated_string2(ls, remainder) when remainder > 0, do: ls |> Enum.slice(0, remainder) |> Enum.filter(&(&1 == "a")) |> Enum.count
  defp cal_repeated_string2(_, _), do: 0

  def exec() do
    s = IO.read(:stdio, :line) |> String.trim
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    do_repeated_string(s, n)
  end
end
