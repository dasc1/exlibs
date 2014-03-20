defmodule Xfile do

  @moduledoc """
  Convenience functions for dealing with files
  """

  @doc """
  Reads a file, and returns it as a list of strings (one per line).

  Trailing \\n characters are removed, as are empty lines from the
  beginning and end of the file
  """
  def file_to_lines(filename) do
    File.open!(filename, [:utf8])
    |> IO.stream(:line)
    |> Enum.to_list
    |> Enum.map(&String.rstrip/1)      # remove trailing \n
    |> Enum.drop_while(&(&1 == ""))  # lop empty lines from the front
    |> Enum.reverse
    |> Enum.drop_while(&(&1 == ""))  # lop empty lines from the back
    |> Enum.reverse
  end

  @doc """
  Reads a file, and returns it as a single string.

  Lines will be separated by the \\n character in the resulting string.
  All leading and trailing whitespace (in the file) is removed.
  """
  def file_to_string(filename) do
    File.open!(filename, [:utf8])
    |> IO.stream(:line)
    |> Enum.join
    |> String.strip
  end

end # defmodule Xfile
