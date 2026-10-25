{4. Realizar todas las modificaciones necesarias al ejercicio 3 para el caso que la carga de caracteres 
termine cuando se lea el carácter ‘.’ o hasta que se almacenen los 1024 caracteres (tener en cuenta 
que en el vector se pueden cargar como máximo 1024 valores). Declare una constante que 
represente el valor de fin de la lectura desde teclado (en este caso el punto).}

program modulo6practica4;

const
  DimF = 1024;
  FIN = '.';

type
  secuencia = array [1..DimF] of char;
  letras = set of char;

procedure leer(var s: secuencia; var dimL: integer);
var
  car: char;
begin
  dimL := 0;
  writeln('Ingrese secuencia de caracteres (terminada en punto "." o maximo 1024):');
  read(car);
  while (car <> FIN) and (dimL < DimF) do
  begin
    dimL := dimL + 1;
    s[dimL] := car;
    if (dimL < DimF) then
      read(car);
  end;
end;

procedure incisos(const s: secuencia; dimL: integer; conso: letras);
var
  sumacon, sumaletras, sumamay, sumamin, sumanum, i: integer;
begin
  sumacon := 0;
  sumaletras := 0;
  sumamay := 0;
  sumamin := 0;
  sumanum := 0;

  for i := 1 to dimL do
  begin
    if (s[i] in ['A'..'Z']) then
    begin
      sumamay := sumamay + 1;
      if (s[i] in conso) then
        sumacon := sumacon + 1;
    end
    else if (s[i] in ['a'..'z']) then
    begin
      sumamin := sumamin + 1;
      if (s[i] in conso) then
        sumacon := sumacon + 1;
    end
    else if (s[i] in ['0'..'9']) then
      sumanum := sumanum + 1;
  end;

  sumaletras := sumamay + sumamin;

  if (sumaletras > 0) then
    writeln('Consonantes: ', sumacon, ' (', (sumacon * 100) / sumaletras:0:2, '% del total de letras alfabeticas)')
  else
    writeln('No se ingresaron caracteres alfabeticos.');

  if (dimL > 0) then
  begin
    writeln('Letras Mayusculas: ', sumamay, ' (', (sumamay * 100) / dimL:0:2, '% del total ingresado)');
    writeln('Letras Minusculas: ', sumamin, ' (', (sumamin * 100) / dimL:0:2, '% del total ingresado)');
    writeln('Digitos numericos: ', sumanum, ' (', (sumanum * 100) / dimL:0:2, '% del total ingresado)');
  end
  else
    writeln('El vector esta vacio (no se ingresaron caracteres).');
end;

var
  s: secuencia;
  dimL: integer;
  l: letras;
begin
  leer(s, dimL);
  l := ['a'..'z', 'A'..'Z'] - ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  incisos(s, dimL, l);
  readln;
end.
