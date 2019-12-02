#KeywordsList
#Son listas de tuplas de 2 elementos
#Representan una estrucutra de datos par KEY-VALUE
#En particular, en Elixir cuando esta clave es un atomo se lo llama KeywordList.
#Ejemplo: [{:key, value}]

list = [{:a, 1}, {:b, 2}]
list2 = [a: 1, b: 2]
IO.puts(list == list2)
list3 = list ++ [c: 3]
IO.puts(list == list2)

#Las keyword list pueden tener mas de una vez la misma clavve
list4 = [a: 0] ++ list3

#Keyword lists are important because they have three special characteristics:

#    Keys must be atoms.
#    Keys are ordered, as specified by the developer.
#    Keys can be given more than once.

hd(list4)
tl(list4)

#Mapas
#iex> %{} = %{:a => 1, 2 => :b}
#%{2 => :b, :a => 1}
#iex> %{:a => a} = %{:a => 1, 2 => :b}
#%{2 => :b, :a => 1}
#iex> a
#1
#iex> %{:c => c} = %{:a => 1, 2 => :b}
#** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}
