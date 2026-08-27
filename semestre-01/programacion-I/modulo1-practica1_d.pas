{Leer el diámetro D de un círculo e imprimir el radio (R) 
(la mitad del diámetro), el área (área = PI x R^2), el perímetro 
(perímetro = D*PI (o también PI*R*2)).}

program modulo1practica4;

var
  Diam, rad: real;

begin
  writeln('Introduzca el Radio:');
  readln(Diam);
  rad := Diam / 2;

  writeln('radio ',rad:0:2);
  writeln('Area ',3.14 * rad * rad:0:2);
  writeln('Perimetro ',Diam * 3.14:0:2);
  readln;
end.