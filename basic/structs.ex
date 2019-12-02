defmodule Person do
  defstruct name: "Martin", age: 24

  def print_info(person) do
    printName = "Name: " <> person.name
    printAge = "Age: " <> to_string(person.age)
    IO.puts(printName)
    IO.puts(printAge)
  end

  def drink_alcohol(person, alcohol) do
    if person.age > 17 do
      IO.puts("Tomare un poco de " <> alcohol)
    else
      IO.puts("Soy menor de edad, no puedo tomar!")
    end
  end

end
