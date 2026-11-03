{2. *Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A del 
cual se suprimen las componentes que se encuentran entre las posiciones I y J (inclusive las 
componentes de dichas posiciones).}

program modulo7practica2;

type
  vA = array [1..100] of integer;

  vector = record
    v: vA;
    DimL: 0..100;
  end;

procedure suprimir(var v: vector; i, j: integer);
  var
    ind, k: integer;
  begin
    if (1 <= i) and (i <= j) and (j <= v.DimL) then begin
      ind := i;
      for k := (j + 1) to v.diml do begin
        v.v[ind] := v.v[k];
        ind := ind + 1;
      end;
      v.DimL := v.DimL - (j - i + 1);
    end;
  end;