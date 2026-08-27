{Leer un número del 0 al 9 e imprimir la tabla de multiplicar de ese número (sin usar iteración).}

program modulo1practica1_h;

var
  num, i: integer;

begin;
  writeln('Introduzca un numero del 1 al 9');
  readln(num);

  for i := 1 to 10 do 
    writeln(num,' * ',i,' = ',num * i);
  readln;
end.