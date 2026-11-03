{5. *Dada una matriz de números enteros de 50 x 50, realizar un programa para:
a) Imprimir los elementos de las filas impares de la matriz.
b) Imprimir los elementos de las columnas pares de la matriz.
c) Imprimir los elementos de la diagonal principal.}

program modulo7practica5;

const
  ini = 1;
  max = 50;

type 
  rango = ini..max;
  mNum = array [rango, rango] of integer;

procedure incisoA(const m: mNum);
  var
    i, j: integer;
  begin
    i := 1;
    while (i < max) do begin
      for j := 1 to max do
        writeln(m[i,j]);
      i := i + 2;
    end;
  end;

procedure incisoB(const m: mNum);
  var
    i, j: rango;
  begin 
    j := 2;
    while (j <= max) do begin
      for i := 1 to max do
        writeln(m[i, j]);
      j := j + 2;
    end;
  end;

procedure incisoC(const m: mNum);
  var
    i: rango;
  begin
    for i := 1 to max do
      writeln(m[i, i]);
  end;

var
  m: mNum;
begin
  incisoA(m);
  incisoB(m);
  incisoC(m);
  readln;
end.