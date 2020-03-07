defmodule InputList do
  @moduledoc """
  get value as list form standard input
  """

  @doc """
  get string list from standard input.
  """
  def get_str(), do: IO.gets("") |> String.trim() |> String.split

  @doc """
  get intger list from standard input.
  """
  def get_int(), do: IO.gets("") |> String.trim() |> String.split |> Enum.map(&String.to_integer/1)

  @doc """
  get float list from standard input.
  """
  def get_float(), do: IO.gets("") |> String.trim() |> String.split |> Enum.map(&String.to_float/1)
end