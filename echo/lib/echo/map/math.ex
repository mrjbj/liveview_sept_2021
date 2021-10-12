defmodule Echo.Map.Math do
  @moduledoc """
  Implements an increment decrement functions for counter button.
  """
  def initial, do: 0

  def inc(n), do: n + 1

  def dec(n), do: n - 1

  # converter function
  def message(n) do
    "The treasure is at #{n}."
  end
end
