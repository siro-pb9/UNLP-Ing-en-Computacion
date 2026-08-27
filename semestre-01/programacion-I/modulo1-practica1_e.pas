{Leer 2 números por teclado e imprimir el mayor.}

program modulo1practica5;

var
  num1, num2: real;
begin
  writeln('Ingrese num 1: ');
  readln(num1);
  writeln('Ingrese num 2:');
  readln(num2);

  if num1 > num2 then 
    writeln(num1:0:2)
  else
    writeln(num2:0:2);
  readln;
end.
