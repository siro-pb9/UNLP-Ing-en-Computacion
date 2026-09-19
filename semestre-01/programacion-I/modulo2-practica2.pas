{2.- Se lee una sucesión de números enteros que termina en 9999. 
Obtener e informar la suma de todas las unidades y los dos dígitos mayores en cada número.
Ejemplo: si se lee 5 52 8507 412 26054 9999 (no se procesa)
 Los dígitos mayores de cada número a informar son 5 5-2 8-7 4-2 6-4 respectivamente
 La suma de las unidades a informar es 20}

program modulo2practica2;
  const
    FIN = 9999;
  
  var
    sucesion, may1, may2, suma: integer;

  begin
    suma := 0;
    writeln('Ingrese el numero');
    readln(sucesion);
    while (sucesion <> FIN) do begin
      suma := suma + sucesion mod 10;
      may1 := -1;
      may2 := -1;
      while (sucesion <> 0) do begin
        if (sucesion mod 10 > may1) then begin
          may2 := may1;
          may1 := sucesion mod 10
        end else if (sucesion mod 10 > may2) then 
          may2 := sucesion mod 10;
        if (sucesion <> 0) then
          sucesion := sucesion div 10;
      end;
      writeln(may1,' - ',may2);
      writeln('Ingrese el numero');
      readln(sucesion);
    end;
    writeln(suma);
    readln;
  end.