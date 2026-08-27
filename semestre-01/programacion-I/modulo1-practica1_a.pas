{Calcular e imprimir el promedio de 2 números que se leen del teclado.}

program modulo1practica1;

var
  n1, n2: integer;

begin
  writeln('Ingrese el primer numero');
  readln(n1);
  writeln('Ingrese el segundo numero');
  readln(n2);
  writeln('El promedio es: ', (n1 + n2) / 2:0:2);
  readln;
end.
