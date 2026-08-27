{Leer un número desde teclado e imprimir si es par o no.}

program modulo1practica1_f;

var 
  num: integer;
begin
  writeln('Ingrese numero');
  readln(num);

  if (num mod 2 <> 0) then
    writeln('es impar')
  else
    writeln('es par');
  readln;
end.