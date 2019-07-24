defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) when list == [] do
    []
  end
  def keep(list, fun) do
    map = list
          |> Enum.group_by(fun)
    map[true]
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) when list == [] do
    list
  end
  def discard(list, fun) do
    map = list
          |> Enum.group_by(fun)
    map[false]
  end
end
