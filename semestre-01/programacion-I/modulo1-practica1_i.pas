{Leer la edad de un estudiante e informar si pertenece al preescolar (edad menor a 7), 
primaria (entre 7 y 12), secundaria (entre 13 y 18) y universitario (mayor que 18).}

program modulo1practica1_i;

var
  edad: integer;
begin
  writeln('introduzca edad');
  readln(edad);

  case edad of
    0..6:
      writeln('preescolar');
    7..12:
      writeln('primaria');
    13..18:
      writeln('secundaria');
    else
      writeln('universidad');
  end;
  readln;
end.