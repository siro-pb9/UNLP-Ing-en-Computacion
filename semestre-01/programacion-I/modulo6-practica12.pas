{Se dispone de un módulo que carga un vector con a lo sumo 600 nombres de personas, ordenados de forma ascendente.
Implemente módulos que reciban dicho vector y permitan:
a) Devolver la posición en la que se encuentra una persona cuyo nombre se recibe como parámetro.
Tener en cuenta que dicha persona puede no existir.
b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres
repetidos.
d) Modifique c) considerando ahora que puede haber repetidos (elimine todas las ocurrencias). }

program modulo6practica12;

const
  ini = 1;
  max = 600;

type
  str = string;
  vNombres = array [ini..max] of str;

  nombres = record
    v: vNombres;
    DimL: 0..max;
  end;

function devolverPosicion(const n: nombres; nombre: str): integer;
  var
    pri, medio, ult: integer;
  begin
    pri := 1;
    ult := n.DimL;
    medio := (pri + ult) div 2;

    while (pri <= ult) and (n.v[medio] <> nombre) do begin
      if (nombre < n.v[medio]) then
        ult := medio - 1
      else 
        pri := medio + 1;
      medio := (pri + ult) div 2;
    end;
    if (pri <= ult) then
      devolverPosicion := medio
    else
      devolverPosicion := -1;
  end;

procedure insertarOrdenado(var n: nombres; nombre: str);
  var
    i, pos: integer;
  begin
    if (n.DimL < max) then begin
      pos := 1;
      while (pos <= n.DimL) and (n.v[pos] < nombre) do
        pos := pos + 1;
      for i := n.DimL downto pos do
        n.v[i + 1] := n.v[i];
      n.v[pos] := nombre;
      n.DimL := n.DimL + 1
    end else
      writeln('No hay espacio');
  end;

procedure eliminarNombre(var n: nombres; nombre: str);
  var
    i, pos: integer;
  begin
    pos := devolverPosicion(n, nombre);
    if (pos <> -1) then begin
      for i := pos to (n.DimL - 1) do 
        n.v[i] := n.v[i + 1];
      n.DimL := n.DimL - 1;
    end else
      writeln('el nombre no esta en la lista');
  end;

procedure eliminarRepetidos(var n: nombres; nombre: str);
  var    
    i, pos, cant: integer;
  begin
    cant := 0;
    pos := devolverPosicion(n, nombre);
    if (pos <> -1) then begin
      while (pos > 1) and (n.v[pos - 1] = nombre) do
        pos := pos - 1;
      i := pos;
      while (i <= n.DimL) and (n.v[i] = nombre) do begin
        cant := cant + 1;
        i := i + 1;
      end;
      for i := pos to (n.DimL - cant) do
        n.v[i] := n.v[i + cant];
      n.DimL := n.DimL - cant;
    end else
      writeln('El nombre no esta en la lista');
  end;


var
  n: nombres;
  nombre: str;
begin
  cargarNombres(n);
  readln(nombre);
  devolverPosicion(n, nombre);
  insertarOrdenado(n, nombre);
  eliminarNombre(n, nombre);
  eliminarRepetidos(n, nombre);
  readln;
end.