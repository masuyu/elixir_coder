defmodule Main do
  @moduledoc """
  Main.
  there is call functions, with Input module.
  """

  @doc """
  calling product
  """
  def product() do
    [a, b] = InputList.get_int()
    Coder.do_product(a, b)
  end
end
