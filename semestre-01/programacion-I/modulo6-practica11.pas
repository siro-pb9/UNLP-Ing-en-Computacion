{11. Construir un programa que implemente y use:
a) un módulo que lea números desde el teclado y los almacene en un vector hasta ingresar el valor 
9999 (asuma como máximo 80 números).
b) un módulo que informe los números almacenados en las posiciones impares.
c) un módulo que retorne la posición en que se encuentra el primer elemento par. Si no hay ningún 
componente par deberá devolver el valor 0.}

program modulo6practica11;

const 
	ini = 1;
	max = 80;
	FIN = 9999;

type
	vNumeros = array [ini..max] of integer;

	numeros = record
		v: vNumeros;
		DimL: 0..max; // Ini porque DimL nunca puede ser 0, ya que como minimo el numero 9999 sera ingresado siempre
	end;

procedure cargarVector(var n: numeros);
	var
		num: integer;
	begin
		n.DimL := 0;
			writeln('ingrese numero ',n.DimL + 1);
			readln(num);
		while (num <> FIN) and (n.DimL < max) do begin
			n.DimL := n.DimL + 1;
			n.v[n.DimL] := num;
			if (n.DimL < max) then begin
				writeln('Ingrese numero ',n.DimL + 1);
				readln(num);
			end;
		end;
	end;

procedure informarImpares(const n: numeros);
	var
		i: integer;
	begin
		i := 1;
		while (i <= n.DimL) do begin
			writeln('numero en posicion ',i,': ',n.v[i]);
			i := i + 2;
		end;
	end;

function posicionPar(const n: numeros): integer;
	var
		i, pos: integer;
	begin
		pos := 0;
		i := 0;
		while (i < n.DimL) and (pos = 0) then begin
			i := i + 1;
			if (n.v[i] mod 2 = 0) then
				pos := i;
		end;
		posicionPar := pos;
	end;

var
	n: numeros;

begin
	cargarVector(n);
	informarImpares(n);
	writeln(posicionPar(n));
	readln;
end.