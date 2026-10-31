{Construir un programa que lee desde teclado una secuencia de números reales hasta que se
introduzca el 50. Informar los 8 números mayores de la secuencia.
Nota: Implemente la solución sin almacenar TODOS los números leídos}

program modulo6practica13;

const
  ini = 1;
  max = 8;
  FIN = 50;

type
  vNumeros = array [ini..max] of real;

  numeros = record
    v: vNumeros;
    DimL: 0..max;
  end;

procedure inicializarVector(var n: numeros);
  var
    i: integer;
  begin
    n.diml := 0;
    for i := 1 to max do
      n.v[i] := 0;
  end;

procedure actualizarMax(var n: numeros; num: real);
  var
    i, pos: integer;
  begin
    pos := 1;
    while (pos <= n.DimL) and (n.v[pos] > num) do 
      pos := pos + 1;
    if (pos <= max) then begin
      if (n.DimL < max) then
        n.DimL := n.DimL + 1;
      for i := n.DimL - 1 downto pos do
        n.v[i + 1] := n.v[i];
      n.v[pos] := num;
    end;
  end;

procedure informarMax(const n: numeros);
  var
    i: integer;
  begin
    for i := 1 to n.DimL do
      writeln('Num ',i,': ',n.v[i]:0:2);
  end;


var
  n: numeros;
  num: real;
begin 
  inicializarVector(n);
  writeln('Escriba un numero');
  readln(num);
  while (num <> FIN) do begin
    actualizarMax(n, num);
    writeln('Escriba un numero');
    readln(num);
  end;
  informarMax(n);
  readln;
end.