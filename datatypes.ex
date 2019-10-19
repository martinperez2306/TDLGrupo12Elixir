#Vamos a printear Hola Mundo!
IO.puts "Hola Mundo!";
IO.puts "Soy Tincho!";

IO.puts :hola;

saludo = "Hola gente!"
IO.puts(saludo);

x = 12;
x = "Hello";
IO.puts(x);


list = [1,2,true,3];
listASCII = [104,101,108, 108,111];
IO.puts(listASCII);

IO.puts(length([1, 2, :true, "str"]));

#Esto es un ATOM
#Su valor es su propio nombre
:apple;
#Usualmente para determinar estatus
:ok;
:error;

#Booleanos son atoms y vicebersa
result = :true == true;
IO.puts(result);
IO.puts(is_atom(false));
IO.puts(is_boolean(:false));

#Alias
#Los alias son cosas que se pueden construir con mayus al inicio. Tambien son atomos.
Hello
IO.puts(is_atom(Hello))
