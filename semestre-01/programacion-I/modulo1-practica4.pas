{Realizar un programa que lea por teclado la cantidad de ciudades de cada uno de los 135 partidos 
de la provincia de Buenos Aires. Además, por cada ciudad debe leer la cantidad de habitantes. Adicionalmente, se pide:
a) Informar la cantidad promedio de habitantes por partido.
b) Modificar el inciso a) agregando las instrucciones necesarias para informar el menor 
y mayor número de habitantes promedio de los partidos.
c) Modificar el inciso b) para que además se informe el porcentaje de partidos cuyo valor promedio de habitantes superó los 20.000.
d) Modificar el inciso a) para que en lugar de leerse desde teclado la cantidad de ciudades 
de cada partido, la condición dependa de que la cantidad de habitantes de cada ciudad sea mayor que 0.}

program modulo1practica4;

const
  partidos = 5; // 5 para probar, luego se cambia a 135

var
  i, j, ciudades, sumaveinte: integer;
  suma, habitantes: longint;
  max, min, prom: real;

begin
  max := 0;
  min := 9999999;
  sumaveinte := 0;

  for i := 1 to partidos do begin
    suma := 0;
    writeln ('ingrese ciudades del partido ', i);
    readln(ciudades);

    for j := 1 to ciudades do begin
      writeln('Ingrese habitantes de la ciudad ', j);
      readln(habitantes);
      suma := suma + habitantes;
    end;
    prom := suma/ciudades;
    writeln('El promedio de habitantes por ciudad del partido ',i,' es de ',prom:0:2,' personas por ciudad');
    writeln;

    if (prom > max) then 
      max := prom;
    if (prom < min) then
      min := prom;
    if (prom > 20000) then 
      sumaveinte := sumaveinte + 1;
  end;
  writeln('El mayor promedio fue ',max:0:2,' Habitantes P/C y el menor fue ',min:0:2,' Habitantes P/C');
  writeln('La cantidad de partidos con mas de 20.000 habitantes es del ',(sumaveinte*100)/partidos:0:2,'%');
  readln;
    
end.