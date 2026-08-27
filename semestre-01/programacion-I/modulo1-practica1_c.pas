{Leer base B y altura H de un rectángulo e imprimir el área y perímetro de este. 
(área = B * H y perímetro = (2 * B) + (2 * H)).}

program modulo1practica3;

var
  Base, Altura: real;
begin
  writeln('ingrese Base:');
  readln(Base);
  writeln('Ingrese Altura');
  readln(Altura);
  writeln('El area es de ', Altura * Base:0:2, ' y el perimetro de ',(2 * Base) + (2 * Altura):0:2);
  readln;
end.