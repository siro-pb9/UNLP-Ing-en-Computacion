{2. Una estación de servicio tiene 5 surtidores. Se requiere implementar un programa que 
lea datos de la carga de combustible por teclado (monto cargado y número de surtidor). 
La entrada de datos termina cuando se ingresa el surtidor 0. Finalizada la carga se 
pide calcular e informar: 
a) Monto total vendido por cada surtidor.
b) Surtidor que más vendió.
c) Promedio de venta entre todos los surtidores.}

program modulo6practica2;
const
  FIN = 0;

type
  surtidor = array [1..5] of real;

procedure ini(var v: surtidor);
var
  i: integer;
begin
  for i := 1 to 5 do
    v[i] := 0;
end;

var
  i, maxsur: integer;
  suma, monto, max: real;
  v: surtidor;
begin
  max := 0;
  suma := 0;
  ini(v);
  writeln('ingrese num del surtidor');
  readln(i);
  while (i <> FIN) do begin
    writeln('ingrese monto');
    readln(monto);
    v[i] := v[i] + monto;
    writeln('ingrese numero de surtidor');
    readln(i);
  end;
  for i := 1 to 5 do begin
    writeln('monto del surtidor ',i,': ',v[i]:0:2);
    if (v[i] > max) then begin
      max := v[i];
      maxsur := i;
    end;
    suma := suma + v[i];
  end;
  writeln('surtidor que mas vendio: ',maxsur);
  writeln('promedio: ',suma/5:0:2);
  readln;
end.