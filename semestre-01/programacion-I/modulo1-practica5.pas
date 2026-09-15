{Se desea procesar la información de alumnos de diez carreras universitarias. 
Por cada carrera se ingresa su código y cantidad de años de duración. 
Para cada año correspondiente a la duración de la carrera, se ingresa la cantidad de alumnos
que cursa. Realizar un programa que lea por teclado e informe la carrera que tiene el menor 
promedio de alumnos de sus años.}

program modulo1practica5;

const
  alum = 10;

var
  cod, anos, i, j, suma, cantalumnos, mincar: integer;
  min: real;

begin
  min := 9999;
  for i := 1 to alum do begin
    suma := 0;
    writeln('Ingrese codigo de carrera');
    readln(cod);
    writeln('ingrese anios de la carrera');
    readln(anos);
    for j := 1 to anos do begin
      writeln('Ingrese la cantidad de alumnos del anio ',j);
      readln(cantalumnos);
      suma := suma + cantalumnos;
    end;
    if (suma / anos < min) then begin
      min := (suma / anos);
      mincar := cod;
    end;
  end;
  writeln('la carrera codigo ',mincar,' Tiene un promedio de ',min:0:2,' alumnos por anio');
  readln;
end.
