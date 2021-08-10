defmodule App do
  @moduledoc """
  Documentation for `App`.
  """

  @spec hello :: :world
  @doc """
  Hello world.

  ## Examples

      iex> App.hello()
      :world
  """
  def hello do
    :world
  end

  @doc """
  Add a to b.

  ## Examples

      iex> App.add(10, 15)
      25
  """
  @spec add(integer, integer) :: integer
  def add(a, b) do
    a + b
  end
end
