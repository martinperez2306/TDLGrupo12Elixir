#The match operator

#Asignacion (=)
x = 1
IO.puts(x)

#Match operator (=)
1 = x
#Esta linea tirará error porque no matchea el 2 con el valor de x
#2 = x

#PatterMatching
{a,b,c} = {:hello, "world", 42}
IO.puts(a)
IO.puts(b)
IO.puts(c)
#Falla al comparar el mismo tipo (tupla) pero distinto tamaño
#{a,b,c} = {:hello, "wolrd"}
#O de distinto tipo (Tupla vs Lista)
#{a,b,c} = [:hello, "wolrd", 42]

#Head Tail
[head | tail] = [1, 2, 3]
#head [1]
#tail [2,3]

#Renombrar variables y patter matchin
y = 1
#Renombramiento
y = 2
#PM
^y = 2