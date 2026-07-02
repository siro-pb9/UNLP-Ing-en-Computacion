{Realice un programa que lea la información de los empleados administrativos de la Facultad, sabiendo
que a lo sumo existen 1200 empleados. De cada empleado se conoce: DNI, Apellido, Nombre, fecha
de nacimiento (día, mes, año), área administrativa (existen 8 áreas nombradas de la A a H) y el número
de oficina en la que trabaja (existen 20 oficinas que se numeran de 1 a 20). Además, se dispone de
una estructura que almacena el bono de productividad (monto en pesos) de cada área y oficina. La
lectura de la información finaliza cuando llega el empleado con DNI 0, el cual no se procesa. Luego de
leer la información de los empleados, se pide:
a) Informar el Apellido y Nombre de los empleados que trabajan en la oficina número 1.
b) Calcular e informar el total de empleados por área.
c) Informar el bono de productividad y DNI de los empleados del mes. Un empleado del mes tiene
un DNI que cumple con que la suma de sus dígitos múltiplos de 3 es mayor a la suma de sus
dígitos pares.
d) Informar el nombre de los empleados que cumplen años en un mes que se ingresa desde
teclado.}

program modulo7practica9;

const
  FIN = 1200;
  FIN2 = 0;

type
  fichaFecha = record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  end;

  fichaEmpleado = record
    DNI: longint;
    apellido: string[30];
    nombre: string[30];
    nacimiento: fichaFecha;
    area: 'A'..'H';
    oficina: 1..20;
  end;

  bono = array['A'..'H', 1..20] of real;
  vEmpleado = array[1..FIN] of fichaEmpleado;
  totalEmpleados = array['A'..'H'] of integer;

  empleado_DimL = record
    vector: vEmpleado;
    dimL: 0..FIN;
  end;

procedure leerFichaEmpleado(var emp: fichaEmpleado);
  begin
    write('Ingrese DNI: ');
    readln(emp.DNI);
    if (emp.DNI <> 0) then begin
      writeln('Ingrese el apellido');
      readln(emp.apellido);
      writeln('Ingrese el nombre');
      readln(emp.nombre);
      writeln('Ingrese la fecha de nacimiento');
      readln(emp.nacimiento.dia);
      readln(emp.nacimiento.mes);
      readln(emp.nacimiento.anio);
      writeln('ingrese el area administrativa');
      readln(emp.area);
      writeln('Ingrese el numero de oficina');
      readln(emp.oficina);
    end;
  end;

procedure cargarEmpleado(var eDimL: empleado_Diml); 
  var
    emp: fichaEmpleado;
  begin
    eDimL.dimL := 0;
    leerFichaEmpleado(emp);
    while (emp.DNI <> 0) and (eDimL.dimL < FIN) do begin
      eDimL.dimL := eDimL.dimL + 1;
      eDimL.vector[eDimL.dimL] := emp;
      if eDimL.dimL < FIN then
        leerFichaEmpleado(emp);
    end;
  end;

procedure inventarBonos(var bono: bono);
  var
    i: 'A'..'H';
    j: 1..20;
    num: real;
  begin
    for i := 'A' to 'H' do
      for j := 1 to 20 do begin
        num := random(10000) + 1000;
        bono[i, j] := num / 100;
      end;
  end;

procedure informarEmpleadosOficinaUno(const empleado: empleado_DimL);

  var
    i: integer;
  begin
    for i := 1 to empleado.dimL do begin
      if (empleado.vector[i].oficina = 1) then 
        writeln('El nombre y apellido del empleado DNI: ',empleado.vector[i].DNI,' es: ',empleado.vector[i].nombre, empleado.vector[i].apellido);
    end;
  end;

procedure InformarTotal(const emp: empleado_DimL);
  var
    i: integer;
    J: 'A'..'H';
    tot: totalEmpleados;
  begin
    for j := 'A' to 'H' do
      tot[j] := 0;
    for i := 1 to emp.dimL do begin
      tot[emp.vector[i].area] := tot[emp.vector[i].area] + 1;
    end;
    for j := 'A' to 'H' do
      writeln('El total de empleados del area ',j,' es de ',tot[j]);
  end;

function esEmpleadoDelMes(dni: longint): boolean;
  var
    act, pares, multiplos: integer;
    auxDNI: longint;
  begin
    pares := 0;
    multiplos := 0;
    auxDNI := dni;
    while auxDNI > 0 do begin
      act := (auxDNI mod 10);
      if (act mod 3 = 0) then
        multiplos := multiplos + act;
      if (act mod 2 = 0) then
        pares := pares + act;
      auxDNI := (auxDNI div 10);
    end;
    esEmpleadoDelMes := (multiplos > pares);
  end;

procedure informarBono(const emp: empleado_DimL; const bon: bono);
  var
    i: integer;
  begin
    for i := 1 to emp.dimL do begin
      if (esEmpleadoDelMes(emp.vector[i].DNI)) then
        writeln('El empleado DNI ',emp.vector[i].DNI,' tiene un bono de ',bon[emp.vector[i].area, emp.vector[i].oficina]:2:0);
    end;
  end;

procedure informarCumpleanios(const emp: empleado_DimL; mes: integer);
  var
    i: integer;
  begin
    for i := 1 to emp.diml do begin
      if emp.vector[i].nacimiento.mes = mes then
        writeln(emp.vector[i].nombre, emp.vector[i].apellido);
    end;
  end;

// ==========================================
var
  empleado: empleado_DimL;
  b: bono;
  mes: integer;
begin
  randomize;
  cargarEmpleado(empleado);
  informarEmpleadosOficinaUno(empleado);
  InformarTotal(empleado);
  inventarBonos(b);
  informarBono(empleado, b);
  writeln('Ingrese un mes');
  readln(mes);
  informarCumpleanios(empleado, mes);
  readln;
end.