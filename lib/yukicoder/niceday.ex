defmodule NiceDay do
  defp maximun_nice_day([n, m]) when n > m, do: m * 2
  defp maximun_nice_day([n, m]) when n < m, do: n * 2
  defp maximun_nice_day([n, m]) when n == m, do: n * 2 - 1
  def main() do
    IO.gets("")
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
      |> maximun_nice_day
      |> IO.puts
  end
end