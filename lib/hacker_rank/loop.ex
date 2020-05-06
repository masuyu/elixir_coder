defmodule Loop do
  @moduledoc """
  HackerRank Question
  """
  def do_loops(i) do
    1..10 |> Enum.map(&(IO.puts("#{i} x #{&1} = #{i * &1}")))
  end

  def exec() do
    i = IO.gets("") |> String.trim |> String.to_integer
    do_loops(i)
  end
end
