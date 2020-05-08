defmodule TwoDArray do
  @moduledoc """
  HackerRank Question
  """

  defp make_hourglass([t, m, b]) do
    top = for ti <- 0..3, do: [Enum.at(t, ti), Enum.at(t, ti+1),  Enum.at(t, ti+2)]
    mid = for mi <- 1..4, do: [Enum.at(m, mi)]
    bot = for bi <- 0..3, do: [Enum.at(b, bi), Enum.at(b, bi+1),  Enum.at(b, bi+2)]
    l = for hi <- 0..3, do: Enum.concat([Enum.at(top, hi), Enum.at(mid, hi),  Enum.at(bot, hi)])
      |> Enum.sum
    Enum.max(l)
  end

  def exec do
    a = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    b = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    c = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    d = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    e = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    f = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)

    [[a, b, c], [b, c, d], [c, d, e], [d, e, f]]
      |> Enum.map(fn x -> make_hourglass(x) end)
      |> Enum.max
      |> IO.puts
  end
end