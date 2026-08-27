{Leer el año de nacimiento de una persona e indicar a qué generación pertenece 
(Baby Boomers: 1946-1964, Generación X: 1965-1980, Millennials: 1981-1996, 
Generación Z: 1997-presente).}

program modulo1practica1_j;

var
  ano: integer;

begin
  writeln('Ingrese año');
  readln(ano);

  case ano of
    1946..1964:
      writeln('Baby Boomer');
    1965..1980:
      writeln('Generacion X');
    1981..1996:
      writeln('Millennials');
    1997..2026:
      writeln('Generazion z');
    else
      writeln('Pre Baby Boomer');
  end;
  readln;
end.