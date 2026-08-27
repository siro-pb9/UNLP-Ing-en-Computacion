{Leer un número e imprimir si es o no múltiplo de 3}

program modulo1practica1_g;

var
  num: integer;
begin
  writeln('Introduzca un numero');
  readln(num);

  if (num mod 3 = 0) then
    writeln('es multiplo')
  else
    writeln('No es multiplo');
  readln;
end.