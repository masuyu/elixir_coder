defmodule Daydream do
  @moduledoc """
  AtCoder's C question.
  """

  @doc """
  ## Examples
      iex> Daydream.do_daydream("dreamdreamer")
      :YES

      iex> Daydream.do_daydream("hogedream")
      :NO
  """
  def do_daydream(s) do
    cond do
      Regex.match?(~r/dream$/, s) -> do_daydream(String.slice(s, 0..-6))
      Regex.match?(~r/dreamer$/, s) -> do_daydream(String.slice(s, 0..-8))
      Regex.match?(~r/erase$/, s) -> do_daydream(String.slice(s, 0..-6))
      Regex.match?(~r/eraser$/, s) -> do_daydream(String.slice(s, 0..-7))
      s == "" -> :YES
      :true -> :NO
    end
  end

  def exec() do
    s = IO.gets("") |> String.trim
    do_daydream(s)
  end
end