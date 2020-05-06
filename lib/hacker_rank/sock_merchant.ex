defmodule SockMerchant do
  @moduledoc """
  HackerRank Question
  """

  @doc """
  ## Examples
      iex> SockMerchant.do_sock_merchant([1, 2, 1, 2, 1, 2, 3])
      2

      iex> SockMerchant.do_sock_merchant([10, 20, 10, 10, 30, 20, 30])
      3
  """
  def do_sock_merchant(l) do
    l |> Enum.sort(&(&1 < &2)) |> rec_pair([])
  end
  defp rec_pair([], r), do: r |> Enum.count
  defp rec_pair([head|tail], r) do
    case Enum.member?(tail, head) do
      :false -> rec_pair(tail, r)
      :true -> rec_pair(
        tl(tail),
        [{head, hd(tail)} | r]
      )
    end
  end

  def exec() do
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    l = IO.read(:stdio, :line) |> String.split |> Enum.map(&String.to_integer/1)
    case n == Enum.count(l) do
      :true -> do_sock_merchant(l)
      :false -> :false
    end
  end
end