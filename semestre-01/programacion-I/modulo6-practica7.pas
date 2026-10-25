{7. *Se procesa información de las farmacias del Gran La Plata correspondiente a un mes determinado. 
De cada farmacia se conoce: código, nombre, dirección, localidad y todas las obras sociales con las 
que trabaja. Para cada obra social se dispone de su código (1: IOMA, 2: PAMI, ..., 35: Swiss Medical) 
y la facturación correspondiente a dicha obra social durante ese mes. Además, se dispone de una 
estructura que permite acceder al nombre de la obra social a partir de su código.
a) Se deben leer y almacenar las farmacias hasta que se ingrese una casa cuyo nombre sea "ZZZ". 
Esta farmacia también debe procesarse. Utilizar una estructura adecuada sabiendo que a lo 
sumo hay 120 farmacias.
b) Con la estructura generada en a), calcular la facturación total acumulada para cada obra social 
(códigos 1 a 35), considerando únicamente aquellas farmacias cuyo código, interpretado como 
un número entero, no contiene dígitos repetidos.}

program modulo6practica7;

const
  ini = 1;
  DimF = 120;
  FIN = 'ZZZ';

type
  str = string[30];

  obras = array [1..35] of str;
  facturacion = array [1..35] of real;
  verificacion = array [0..9] of boolean;

  farmacia = record  // Ficha de farmacia
    codigo: integer;
    nombre: str;
    direccion: str;
    localidad: str;
    mensual: facturacion;
  end;

  farmacias = array [ini..DimF] of farmacia; // 120 Fichas de farmacia

  vFarmacia = record // Registro con 120 Fichas y DimL, este se usa.
    v: farmacias;
    DimL: 0..DimF;
  end;

procedure inicializarCeros(var v: facturacion);
  var
    i: integer;
  begin
    for i := 1 to 35 do
      v[i] := 0;
  end;

procedure leerFarmacias(var v: vFarmacia; const os: obras);
  var
    i, j: integer;
  begin
    i := 0;
    repeat
      i := i + 1;
      writeln('Introduzca nombre');
      readln(v.v[i].nombre);
      writeln('Introduzca codigo');
      readln(v.v[i].codigo);
      writeln('Introduzca direccion');
      readln(v.v[i].direccion);
      writeln('Introduzca localidad');
      readln(v.v[i].localidad);
        for j := 1 to 35 do begin
          writeln('Introduzca la facturacion del mes por obra social ',os[j]);
          readln(v.v[i].mensual[j]);
        end;
    until (i = DimF) or (v.v[i].nombre = FIN);
    v.diml := i;
  end;

function sinRepetidos(n: integer): boolean;
  var
    act, i: integer;
    ver: verificacion;
  begin
    sinRepetidos := true;
    n := abs(n);
    for i := 0 to 9 do 
      ver[i] := false;
    while n <> 0 do begin
      act := n mod 10;
        if (ver[act]) then begin
          sinRepetidos := false;
          n := 0;
        end 
        else begin
          ver[act] := true;
          n := n div 10;
        end;
    end;
  end;

procedure sumarTotal(const f: vFarmacia; var os: facturacion);
  var
    i, j: integer;
  begin
    for i := 1 to f.DimL do begin
      if (sinRepetidos(f.v[i].codigo)) then begin
        for j := 1 to 35 do begin
          os[j] := os[j] + f.v[i].mensual[j];
        end;
      end;
    end;
  end;

var
  os: obras;
  fact: facturacion;
  farm: vFarmacia;

begin
  inicializarCeros(fact);
  leerFarmacias(farm, os);
  sumarTotal(farm, fact);
  readln;
end.