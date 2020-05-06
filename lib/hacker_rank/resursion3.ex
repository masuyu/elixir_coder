defmodule Resursion3 do
  @moduledoc """
  HackerRank Question
  """
  defp do_resursion3(i) do
    factorial(i, 1)
  end

  defp factorial(0, acc) do
    IO.puts(acc)
  end

  defp factorial(i, acc) do
    factorial(i-1, acc*i)
  end

  def exec() do
    i = IO.gets("")
    |> String.trim
    |> String.to_integer
    do_resursion3(i)
  end
end