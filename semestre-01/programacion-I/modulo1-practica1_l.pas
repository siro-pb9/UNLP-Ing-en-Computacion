{Leer la cantidad de kilómetros de un viaje y tipo de pasajero, 
y calcular e informar el costo del boleto: hasta 10 km: $1.200 entre 11 y 30 km: $1.800, 
más de 30 km: $2.500. Si el pasajero es estudiante, tiene un descuento del 50%.}

program modulo1practica1_l;

const
  b10km = 1200;
  b11y30km = 1800;
  b30km = 2500;

var
  kilometros: integer;
  pasajero: char;

begin
  writeln('Ingrese cantidad de kilometros');
  readln(kilometros);
  writeln('¿Es usted estudiante? S/N');
  readln(pasajero);

  if (kilometros <= 10) then  begin
    if (pasajero = 'S') then 
      writeln('Costo: ',b10km / 2:0:2)
    else
      writeln('Costo: ',b10km);
  end
  else if (kilometros >= 11) and (kilometros <= 30) then begin
    if (pasajero = 'S') then 
      writeln('Costo: ',b11y30km / 2:0:2)
    else
      writeln('Costo: ',b11y30km);
  end
  else   if (kilometros >= 31) then  begin
    if (pasajero = 'S') then 
      writeln('Costo: ',b30km / 2:0:2)
    else
      writeln('Costo: ',b30km);
  end;
  readln;
end.