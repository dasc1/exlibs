defmodule XutilsTest do
  use ExUnit.Case

  test "parmap" do
    assert Xutils.parmap([1,2,3,4,5], &(&1*&1)) == [1,4,9,16,25]
    assert Xutils.parmap([-3,0,3], &abs/1) == [3,0,3]
    assert Xutils.parmap([], &abs/1) == []
  end

  test "parfilter" do
    assert Xutils.parfilter([1,2,3,4,5], &(&1 > 2)) == [3,4,5]
    assert Xutils.parfilter([1,2,3,4,5], &(&1 > 20)) == []
    assert Xutils.parfilter([1,2,3,4,5], &(&1 > 0)) == [1,2,3,4,5]
    assert Xutils.parfilter([3, :hello, [2,8], "d", :world], &is_atom/1)
      == [:hello, :world]
    assert Xutils.parfilter([], &is_atom/1) == []
  end
  
  test "tally" do
    assert Xutils.tally([1,3,3,2,3,2]) == [{1,1}, {2,2}, {3,3}]
    assert Xutils.tally([]) == []
    assert Xutils.tally([:hey]) == [{:hey, 1}]
    assert Xutils.tally([:ho, :ho, :ho]) == [{:ho, 3}]
    assert Xutils.tally([0,3,2,1,0,-1,0]) ==
      [{-1,1}, {0,3}, {1,1}, {2,1}, {3,1}]
  end

end
