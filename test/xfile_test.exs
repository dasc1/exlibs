defmodule XfileTest do
  use ExUnit.Case

  test "file_to_lines" do
    assert Xfile.file_to_lines("resource/onetwothree.txt") ==
      ["One","Two","Three"]
  end

  test "file_to_string" do
    assert Xfile.file_to_string("resource/onetwothree.txt") ==
      "One\nTwo\nThree"
  end

end
