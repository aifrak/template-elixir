defmodule AppTest do
  use ExUnit.Case
  doctest App

  test "greets the world" do
    assert App.hello() == :world
  end

  test "adds a and b" do
    assert App.add(4, 5) == 9
  end
end
