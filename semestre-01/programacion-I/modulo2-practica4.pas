{*4.- Escriba un programa que lea de teclado un número entero e imprima el número resultante de invertir la posición de todos sus dígitos. 
Informe si el número es capicúa. 
Por ejemplo, si se lee el número 1234 deberá imprimirse en pantalla el número 4321 e informar que no es capicúa.
 Si se lee el número 1221, deberá imprimirse el mismo número 1221 e informar que es capicúa.}

program modulo2practica4;

var
  num, copia, nuevonum: integer;

begin
  nuevonum := 0;
  writeln('ingrese numero');
  readln(num);
  copia := num;
  while (copia <> 0) do begin
    nuevonum := (nuevonum * 10) + (copia mod 10);
    copia := copia div 10;
  end;
  writeln('Numero invertido: ', nuevonum);
  if (nuevonum = num) then
    writeln('es capicua')
  else
    writeln('no es capicua');
end.
