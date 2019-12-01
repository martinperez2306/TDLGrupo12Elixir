#Vamos a printear Hola Mundo!
IO.puts "Hola Mundo!";
IO.puts "Soy Tincho!";

IO.puts :hola;

saludo = "Hola gente!"
IO.puts(saludo);

x = 12;
x = "Hello";
IO.puts(x);

#Los operadores de listas nunca modifican la lista existente.
#Concatenar o eliminar elementos de una lista devuelve una nueva lista.
#Decimos que las estructuras de datos de Elixir son inmutables.
#Una ventaja de la inmutabilidad es que conduce a un código más claro.
#Puede pasar libremente los datos con la garantía de que nadie los mutará en la memoria, solo los transformará.
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

#Strings
#Los strings son cadenas de caracteres y estan representados por el tipo BINARIO. Se usa con ""
IO.puts(is_binary("Hello"))
IO.puts(byte_size("Hello"))

#Para concatenar strings o binarios se usa <>
saludo = "Hello" <> "World"
IO.puts(saludo)

#Charlist. Son listas de caracteres. Se usa con ''
to_charlist "hello"
#'hello'
to_string 'hello'
#"hello"
to_string :hello
#"hello"
to_string 1
#"1"

#Funciones anonimas
add = fn a, b -> a + b end
#Function<12.71889879/2 in :erl_eval.expr/5>
add.(1, 2)
#Result=3
is_function(add)
#Result=true
