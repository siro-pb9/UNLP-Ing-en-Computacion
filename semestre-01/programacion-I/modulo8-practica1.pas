{1. Escribir un pequeño programa que reserve espacio en memoria dinámica para un entero, lea su valor 
desde teclado, lo imprima en pantalla y luego libere la memoria alocada.}

program modulo8practica1;

type
  ptrEntero = ^integer;

var
  p: ptrEntero;

begin
  new(p);
  writeln('ingrese un valor');
  readln(p^);

  writeln('el valor es ', p^);
  dispose(p);
  readln;
end.
