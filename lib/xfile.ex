defmodule Xfile do

  def file_to_lines(filename) do
    File.open!(filename, [:utf8])
    |> IO.stream(:line)
    |> Enum.to_list
  end

  def file_to_string(filename) do
    file_to_lines(filename)
    |> Enum.join
  end

end # defmodule Xfile
