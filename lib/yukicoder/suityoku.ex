defmodule Suityoku do
  def main do
    i = IO.gets("")
      |> String.trim
      |> String.to_integer
    case rem(i, 360) do
      90 -> "Yes"
      270 -> "Yes"
      _ -> "No"
    end |> IO.puts
  end
end