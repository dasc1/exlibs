defmodule Xutils do

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

  def parfilter(collection, pred) do
    collection
    |> parmap(fn (elem) -> {elem, pred.(elem)} end)
    |> Enum.filter(fn {_, x} -> x end) # keep only if pred is true
    |> Enum.map(fn {x, _} -> x end) # strip out result of pred
  end

end # defmodule Xutils
