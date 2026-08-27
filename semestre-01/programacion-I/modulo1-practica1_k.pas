{Leer la cantidad de horas que un vehículo permaneció en un estacionamiento.
La tarifa es: primera hora: $2.000, cada hora adicional: $1.000. Informar el importe a pagar.
si permanece más de 8 horas, paga una tarifa fija de $10.000.}

program modulo1practica1_k;

var
  horas: integer;

begin
  writeln('Ingrese cantidad de horas:');
  readln(horas);

  case horas of
    1:
      writeln('paga 2000$');
    2..8:
      writeln('paga ',2000 + (1000 * (horas - 1)),'$');
    else
      writeln('paga 10000$');
  end;
  readln;
end.