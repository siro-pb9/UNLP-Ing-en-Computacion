{3. *Realizar un módulo que reciba dos vectores A y B y un valor I, y que devuelva el vector A en el que 
se insertan las componentes del vector B entre las componentes I e I+1 del vector A. Se debe validar 
que el parámetro I esté en un rango permitido.}

program modulo7practica3;

const
  MAX = 50;

type
  vectorA = array [1..MAX] of integer;
  vectorB = array [1..10] of integer;

  vector = record
    v: vectorA;
    DimL: 0..MAX;
  end;

procedure insertar(var vA: vector; const vB: vectorB; i: integer);
  var
    j, k: integer;
  begin
    if (1 <= i) and (vA.DimL + 10 <= MAX) and (i <= vA.DimL) then begin 
      k := 0;
      for j := vA.DimL downto (i + 1) do 
        vA.v[j + 10] := vA.v[j];
      for j := i + 1 to (i + 10) do begin
        k := k + 1;
        vA.v[j] := vB[k];
      end;
      vA.DimL := vA.DimL + 10;
    end;
  end;