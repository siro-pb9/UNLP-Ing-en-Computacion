{Simular el funcionamiento de un conjunto de caracteres de la ‘a’ a la ‘z’ utilizando un arreglo. Defina
un tipo de datos adecuado e implemente módulos que realicen las operaciones de unión y diferencia
de dos conjuntos y una función que permite determinar si una letra pertenece al conjunto.
Nota: realice los chequeos correspondientes en cada módulo para procesar solo letras. }

program modulo6practica9;

type
  conjuntoLetras = 'a'..'z';
  conjunto = array [conjuntoLetras] of boolean;

function pertenece(const c: conjunto; car: char): boolean; begin
  pertenece := false;
  if (car in conjuntoLetras) then
   if (c[car]) then
      pertenece := true;
end;

procedure unirConjuntos(const c1, c2: conjunto; var c3: conjunto);
  var
    i: char;
  begin
    for i := 'a' to 'z' do begin
      c3[i] := ((c1[i]) or (c2[i]));
    end;
  end;

procedure diferencia(const c1, c2: conjunto; var c3: conjunto);
  var
    i: char;
  begin
    for i := 'a' to 'z' do begin
      c3[i] := ((c1[i]) and not (c2[i]));
    end;
  end;
