defmodule Traveling do
  @moduledoc """
  AtCoder's C question.
  """

  @doc """
  ## Examples
      iex> Traveling.do_traveling([[1, 1, 0], [5, 2, 1], [10, 2, 6]])
      :Yes

      iex> Traveling.do_traveling([[100,100,0], [102,0,0]])
      :No
  """
  def do_traveling(l) do
    Enum.map_reduce(l, [0, 0, 0], fn [t2, x2, y2], [t1, x1, y1] ->
      {[t2 - t1, abs(x2 - x1) + abs(y2 - y1)], [t2, x2, y2]}
    end)
    |> elem(0)
    |> Enum.all?(fn [dt, dist] -> dt >= dist and rem(dist, 2) == rem(dt, 2) end)
    |> case do
      true -> :Yes
      _ -> :No
    end
  end

  def exec() do
    n = IO.gets("") |> String.trim |> String.to_integer
    l = for _ <- 1..n, do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    do_traveling(l)
  end
end
