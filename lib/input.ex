defmodule Input do
  @moduledoc """
  input module, get simple value form standard input
  """

  @doc """
  get string from standard input.
  """
  def get_str(), do: IO.gets("") |> String.trim()

  @doc """
  get int from standard input.
  """
  def get_int(), do: IO.gets("") |> String.trim() |> String.to_integer

  @doc """
  get float from standard input.
  """
  def get_float(), do: IO.gets("") |> String.trim() |> String.to_float
end