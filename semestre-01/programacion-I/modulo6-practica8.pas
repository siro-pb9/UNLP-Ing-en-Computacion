{8. Se dispone de un vector con a lo sumo 150 nombres de flores. Realizar un programa que lea desde el 
teclado un nombre de una flor e informe:
a) la posición del vector que coincida con este nombre. 
b) Ídem a) pero asumiendo que los nombres están ordenados.
Nota: Tener en cuenta que dicho nombre puede no existir.}

program modulo6practica8;

const
  ini = 1;
  fin = 150;

type
  str = string[30];
  vFlores = array [ini..fin] of str;

  flores = record
    v: vFlores;
    DimL: 0..fin;
  end;

function incisoA(const f: flores; n: str): integer;
  var
    i: integer;
    encontrado: boolean;
  begin  
    i := 0;
    encontrado := false;
    while not (encontrado) and (i < f.DimL) do begin
      i := i + 1;
      if (n = f.v[i]) then 
        encontrado := true
    end;
    
    if encontrado then
      incisoA := i
    else
      incisoA := -1;
  end;

function incisoB(const f: flores; n: str): integer;
  var
    pri, ult, medio: integer;
  begin
    pri := 1;
    ult := f.DimL;
    medio := (pri + ult) div 2;

    while (pri <= ult) and (n <> f.v[medio]) do begin
      if (n < f.v[medio]) then
        ult := medio - 1
      else
        pri := medio + 1;
      medio := (pri + ult) div 2;
    end;

    if (pri <= ult) then
      incisoB := medio
    else
      incisoB := -1;
  end;

var
  f: flores;
  n: str;
begin
  readln(n);
  incisoA(f, n);
  incisoB(f, n);
  readln;
end.
