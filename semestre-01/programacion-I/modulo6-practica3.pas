{3. * Se requiere analizar un fragmento de código fuente que contiene 1024 caracteres. 
Realizar un programa que lea de teclado y cargue un vector los caracteres por teclado. 
Finalizada la carga informar: 
a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
b) La cantidad y porcentaje de caracteres que son: dígitos, letras mayúsculas y letras minúsculas sobre 
el total de caracteres ingresados.}

program modulo6practica3;

const
  DimF = 1024;

type
  secuencia = array [1..DimF] of char;
  letras = set of char;

procedure leer(var s: secuencia);
  var
    i: integer;
  begin
    writeln('Ingrese secuencia de 1024 caracteres');
    for i := 1 to DimF do begin
      read(s[i]);
    end;
  end;

procedure incisos(const s: secuencia; conso: letras);
  var
    sumacon, sumaletras, sumamay, sumamin, sumanum, i: integer;

  begin
    sumacon := 0;
    sumaletras := 0;
    sumamay := 0;
    sumamin := 0;
    sumanum := 0;

    for i := 1 to DimF do begin    
      if (s[i] in ['A'..'Z']) then
      begin
        sumamay := sumamay + 1;
        if (s[i] in conso) then
          sumacon := sumacon + 1;
      end
      else if (s[i] in ['a'..'z']) then
      begin
        sumamin := sumamin + 1;
        if (s[i] in conso) then
          sumacon := sumacon + 1;
      end
      else if (s[i] in ['0'..'9']) then
        sumanum := sumanum + 1;
    end;

  sumaletras := sumamay + sumamin;
  if (sumaletras > 0) then
    writeln(sumacon * 100 / sumaletras:0:2); writeln(sumacon);
  writeln();
  writeln(sumamay * 100 / DimF:0:2); writeln(sumamay);
  writeln();
  writeln(sumamin * 100 / DimF:0:2); writeln(sumamin);
  writeln();
  writeln(sumanum * 100 / DimF:0:2); writeln(sumanum);
  writeln();
end;

var
  s: secuencia;
  l: letras;
begin
  leer(s);
  l := ['a'..'z', 'A'..'Z'] - ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  incisos(s, l);
end.