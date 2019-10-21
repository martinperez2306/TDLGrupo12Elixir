defmodule User do
  defstruct name: "Martin", age: 24

  def print_info(user) do
    printName = "Name: " <> user.name
    printAge = "Age: " <> to_string(user.age)
    IO.puts(printName)
    IO.puts(printAge)
  end

end
