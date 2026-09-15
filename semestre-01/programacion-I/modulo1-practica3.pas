{Realizar un programa que lea por teclado valores que representan 
la inflación de la provincia de Buenos Aires en los últimos 12 meses.
Se pide:
a) Informar la máxima inflación registrada en un mes.
b) Agregar al inciso a) el código necesario para informar el mes en que se produjo la máxima inflación.}

program modulo1practica3;

var
  max, inflacion, i, maxmes: integer;
begin
  max := 0;
  for i := 1 to 12 do begin
    writeln('Ingrese inflacion del mes ', i);
    readln(inflacion);
    if (inflacion > max) then begin
      max := inflacion;
      maxmes := i;
    end;
  end;
  writeln('Inflacion maxima: ',max,'% del mes ',maxmes);
  readln;
end.