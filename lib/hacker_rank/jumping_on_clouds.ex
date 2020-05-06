defmodule JumpingOnCloud do
  @moduledoc """
  HackerRank Question
  """
  @doc """
  ## Examples
      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 0, 1, 0, 0, 1, 0])
      4

      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 0, 0, 0, 0])
      2

      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 1, 1, 0, 0])
      :false

      iex> JumpingOnCloud.do_jumping_on_the_clouds([1, 0, 0, 0, 0])
      :false

      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 0, 0, 0, 1])
      :false

      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      5

      iex> JumpingOnCloud.do_jumping_on_the_clouds([0, 0, 0, 1, 0, 0])
      3
  """
  def do_jumping_on_the_clouds([head|tail]) do
    case head do
      0 -> do_count(tail, 0, 0, 0)
      1 -> :false
    end
  end
  defp do_count([head|tail], c, t, d) when d == 1 do
    case head do
      0 -> do_count(tail, c+1, 0, 0)
      1 -> :false
    end
  end
  defp do_count([head|tail], c, t, d) when t == 2 do
    case head do
      0 -> do_count(tail, c, 1, 0)
      1 -> do_count(tail, c-1, 0, d+1)
    end
  end
  defp do_count([head|tail], c, t, d) do
    case head do
      0 -> do_count(tail, c+1, t+1, 0)
      1 -> do_count(tail, c, 0, d+1)
    end
  end
  defp do_count([], _, _, d) when d == 1, do: :false
  defp do_count([], c, t, _) when t == 2, do: c-1
  defp do_count([], c, _, _), do: c

  def exec() do
    n = IO.read(:stdio, :line) |> String.trim |> String.to_integer
    l = IO.read(:stdio, :line) |> String.split |> Enum.map(&String.to_integer/1)
    case n == Enum.count(l) do
      :true -> do_jumping_on_the_clouds(l)
      :false -> :false
    end
  end
end