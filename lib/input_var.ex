defmodule InputVar do
  @moduledoc """
  get value as variable length list form standard input
  """

  @doc """
  get variable length string list from standard input.
  """
  def get_str() do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> String.trim
  end

  @doc """
  get variable length intger list from standard input.
  """
  def get_int() do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> String.trim |> String.to_integer
  end

  @doc """
  get variable length float list from standard input.
  """
  def get_float() do
    n = IO.gets("") |> String.trim |> String.to_integer
    for _ <- 1..n, do: IO.gets("") |> String.trim |> String.to_float
  end
end