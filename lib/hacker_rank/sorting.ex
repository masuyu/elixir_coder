defmodule Sorting do
  @moduledoc """
  HackerRank Question
  """

  def do_sorting([head|tail], swap_count, acc) do
    cond do
      tail == []
        -> [Enum.concat(acc, [head]), swap_count]
      head <= hd(tail)
        -> do_sorting(tail ,swap_count, Enum.concat(acc, [head]))
      head > hd(tail)
        -> Enum.concat([acc, [hd(tail)], [head], tl(tail)]) |> do_sorting(swap_count+1, [])
    end
  end

  def exec do
    n = IO.gets("") |> String.trim |> String.to_integer
    l = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    [acc, swap_count] = do_sorting(l, 0, [])
    IO.puts("Array is sorted in #{swap_count} swaps.")
    IO.puts("First Element: #{Enum.at(acc, 0)}")
    IO.puts("Last Element: #{Enum.at(acc, n-1)}")
  end
end
