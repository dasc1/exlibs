defmodule Xutils do

  @moduledoc """
  General purpose utility functions.
  """

  @doc """
  A parallel version of Enum.map, which invokes a separate actor for each
  element.

  Performs the supplied function on each member of the supplied collection.

  ## Examples

      iex> Xutils.parmap [1,2,3,4,5], &(&1 * &1)
      [1, 4, 9, 16, 25]

      iex> Xutils.parmap [-3,-1,5], &abs/1
      [3, 1, 5]

      iex> Xutils.parmap [], &abs/1
      []

  """
  def parmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, {self, fun.(elem)}) end
       end)
    |> Enum.map(fn (pid) ->
         receive do { ^pid, result } -> result end
       end)
  end # def parmap

  @doc """
  A parallel version of Enum.filter, which invokes a separate actor for each
  element.

  Applies the supplied predicate on each member of the supplied collection,
  and returns a list of all elements that return true.

  ## Examples

      iex> Xutils.parfilter [1,2,3,4,5], &(&1 > 3)
      [4, 5]

      iex> Xutils.parfilter [:a, 4, [7, "a"], 5, :b], &is_atom/1
      [:a, :b]

  """
  def parfilter(collection, pred) do
    collection
    |> parmap(fn (elem) -> {elem, pred.(elem)} end)
    |> Enum.filter(fn {_, x} -> x end) # keep only if pred is true
    |> Enum.map(fn {x, _} -> x end) # strip out result of pred
  end

  @doc """
  Counts the number of times each element of a collection appears in a
  list.

  Returns a list of tuples, each tuple containing an an element, and how
  often that element appeared in the list.  The result is sorted in order
  of the elements (not the frequencies).

  ## Examples

      iex> Xutils.tally [1,5,5,3,5]
      [{1,1}, {3,1}, {5,3}]

      iex> Xutils.tally [:a, :b, 3, :a, 3, "hello", :a]
      [{3,2}, {:a,3}, {:b,1}, {"hello",1}]

      iex> Xutils.tally []
      []

  """
  def tally(collection),
    do: _tally(Enum.sort(collection), [])
  defp _tally([], tallied), do: Enum.reverse(tallied)
  defp _tally([h|tail], tallied) do
    {hs, rest} = Enum.split_while(tail, &(&1 == h))
    _tally rest, [ {h, length(hs) + 1} | tallied ]
  end

end # defmodule Xutils
