# TDLGrupo12Elixir
Repositorio Privado del Grupo 12 de la materia Teoria del Lenguaje - FIUBA

## Estructura usual de proyecto Elixir
Para nuestro primer proyecto usaremos la estrucutra usual de Elixir

   * ebin - contains the compiled bytecode
   * lib - contains elixir code (usually .ex files)
   * test - contains tests (usually .exs files)

## Tipos de archivos
   * beam - Contiene los binarios a ejecutar
   * ex - Son los archivos fuente de elixir. Requieren ser compilados (archivo fisico) y luego ejecutados.
   * exs - Elixir Script Files. Son codigos fuente que se compilan en memoria y son ejecutados. En general usados para test.

## Manejador de Proyecto Mix
Para nuestro proyecto de Chat usaremos el manejador de proyecto de Mix

	* Manejador de Proyectos
	* Manjeador de Dependencias
	* Manejador de Ambientes
	* Compilacion y Pruebas
	* Aplicaciones

## Ambientes de Mix
  * DEV: Nuestro para trabajar y compilar
  * TEST: Compila los codigos para pruebas y luego ejecutar
  * PROD: Para la muestra

## Contenido estatico
  * Dejar en assets los contenidos
  * Ejecutar mix phx.digest assets -o priv/static para aplicar los cambios
