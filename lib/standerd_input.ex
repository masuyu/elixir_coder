defmodule SI do
  @moduledoc """
  Get value form standard input
  """
  defp s(v), do: v |> String.trim
  defp i(v), do: v |> String.trim |> String.to_integer
  defp f(v), do: v |> String.trim |> String.to_float

  defp s_ls(v), do: v |> String.trim |> String.split
  defp i_ls(v), do: v |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
  defp f_ls(v), do: v |> String.trim |> String.split |> Enum.map(&String.to_float/1)

  @doc """
  get simpel value from standard input.
  """
  def val(:str), do: IO.gets("") |> s
  def val(:int), do: IO.gets("") |> i
  def val(:float), do: IO.gets("") |> f

  @doc """
  get simpel list from standard input.
  """
  def lst(:str), do: IO.gets("") |> s_ls
  def lst(:int), do: IO.gets("") |> i_ls
  def lst(:float), do: IO.gets("") |> f_ls

  @doc """
  get variable length list,
  only number of input value at first from standard input.
  """
  def by_iter(:str) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> s
  end
  def by_iter(:int) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> i
  end
  def by_iter(:float) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> f
  end

  @doc """
  get multi array as variable length list,
  only number of input value at first from standard input.
  """
  def multi(:str) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> s_ls
  end
  def multi(:int) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> i_ls
  end
  def multi(:float) do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> f_ls
  end
end