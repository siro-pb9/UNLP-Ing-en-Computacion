{6. *Una cátedra dispone de información de sus 1000 estudiantes. De cada estudiante se conoce: número 
de legajo, apellido, nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada 
por apellido de manera ascendente. Se pide que implemente: 
a) Un módulo que retorne la posición del estudiante con un número de legajo recibido por parámetro 
o debe retornar -1 si no existe. 
b) Un módulo que informe apellido, nombre y número de legajo de todos los estudiantes cuyo número 
de legajo es múltiplo de un número que se recibe como parámetro.
c) Un módulo que retorne la cantidad de estudiantes con cantidad de asistencias a clase en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos.}

program modulo6practica6;
const
  ini = 1;
  DimF = 1000;


type
  str = string[30];

  estudiante = record
    apellido: str;
    nombre: str;
    legajo: longint;
    asistencias: integer;
  end;

  vector = array [ini..DimF] of estudiante;

function buscarLegajo(const v: vector; num: longint): integer;
  var
    pos: integer;
    encontre: boolean;
  begin
    pos := ini;
    encontre := false;
    while (pos <= DimF) and not (encontre) do begin
      if (v[pos].legajo = num) then
        encontre := true
      else
        pos := pos + 1;
    end;
    if (encontre) then
      buscarLegajo := pos
    else 
      buscarLegajo := -1;
  end;

procedure informarInfo(const v: vector; num: longint);
  var
    i: integer;
  begin
    if (num = 0) then 
      writeln('Numero invalido')
    else begin
      for i := ini to DimF do begin
        if (v[i].legajo mod num = 0) then begin
          writeln(v[i].nombre);
          writeln(v[i].apellido);
          writeln(v[i].legajo);
        end;
      end;
    end;
  end;

function ceroAsistencias(const v: vector): integer;
  var
    i, suma: integer;
  begin
    suma := 0;
    for i := ini to DimF do begin
      if (v[i].asistencias = 0) then 
        suma := suma + 1;
    end;
    ceroAsistencias := suma;
  end;

var
  v: vector;
  n: longint;

begin
  writeln('Ingrese legajo a buscar');
  readln(n);
  writeln(buscarLegajo(v, n));
  writeln('Ingrese numero');
  readln(n);
  informarInfo(v, n);
  writeln(ceroAsistencias(v));
  readln;
end.