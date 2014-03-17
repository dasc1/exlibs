defmodule XutilsTest do
  use ExUnit.Case

  test "tally" do
    assert Xutils.tally([1,3,3,2,3,2]) == [{1,1}, {2,2}, {3,3}]
    assert Xutils.tally([]) == []
    assert Xutils.tally([:hey]) == [{:hey, 1}]
    assert Xutils.tally([:ho, :ho, :ho]) == [{:ho, 3}]
    assert Xutils.tally([0,3,2,1,0,-1,0]) ==
      [{-1,1}, {0,3}, {1,1}, {2,1}, {3,1}]
  end

end
