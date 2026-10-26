{ Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo de
caracteres con un máximo de 130 elementos:
a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la
posición del último carácter.
b) Implementar una versión del módulo que asuma que el último carácter es punto.
Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud máxima.}

program modulo6practica10;
	
const
	ini = 1;
	DimF = 130;
	FIN = '.';

type
  vSecuencia = array [ini..DimF] of char;

	secuencia = record	
		v: vSecuencia;
		DimL: 0..DimF;
	end;

function contarPalabrasDimL(const s: secuencia): integer;
	var
		ant, act: char;
		suma, i: integer;
	begin
		suma := 0;
		if (s.DimL > 0) then begin
			ant := ' ';
			for i := 1 to s.DimL do begin
				act := s.v[i];
				if (ant = ' ') and (act <> ' ') then
					suma := suma + 1;
				ant := act;
			end;
		end;
		contarPalabrasDimL := suma;
	end;

function contarPalabrasPunto(const s: secuencia): integer;
	var
		ant, act: char;
		suma, i: integer;
	begin
		suma := 0;
			ant := ' ';
			act := ' ';
			i := 0;
			while (i < DimF) and (act <> FIN) do begin
				i := i + 1;
				act := s.v[i];
				if (ant = ' ') and (act <> ' ') and (act <> FIN) then
					suma := suma + 1;
				ant := act;
			end;
		contarPalabrasPunto := suma;
	end;

var
	s: secuencia;
begin
	writeln(contarPalabrasDimL(s));
	writeln(contarPalabrasPunto(s));
	readln;
end.

