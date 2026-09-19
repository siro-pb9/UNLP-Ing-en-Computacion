{En el torneo clasificatorio “Pixel Cup” se registran los resultados de 20 jugadores que compitieron en
una partida. Se desea realizar un análisis estadístico de los resultados obtenidos.
Realizar un programa que lea los datos de los 20 jugadores. Para cada jugador se ingresan, en este
orden:
• El puntaje obtenido en la partida (número entero entre 0 y 1000).
• El código de jugador: un número entero de exactamente 4 cifras (entre 1000 y 9999).
• El nickname del jugador, ingresado carácter a carácter y finalizado con un punto ('.'),
compuesto únicamente por letras minúsculas y números.
Al finalizar la lectura de los 20 jugadores, se debe informar:
a. El primero y segundo puntaje máximo obtenido en el torneo.
b. Para el código del jugador que obtuvo el puntaje máximo, la suma de sus cifras y cuántas de
esas cifras son impares.
c. La cantidad de nicknames que son válidos. Un nickname es válido si contiene solamente
letras minúsculas, y números.}

program Integrador1CiroViola;

const
  FIN = '.';
  jugadores = 20;

type
  puntaje = 0..1000;
  codigo = 1000..9999;

function esCaracterVal(c: char): boolean;
begin
  esCaracterVal := ((c >= 'a') and (c <= 'z')) or ((c >= '0') and (c <= '9'));
end;

procedure procesarNick(var valido: boolean);
var
  c: char;
  cant: integer;
begin
  valido := true;
  cant := 0;
  read(c);
  while (c <> FIN) do
  begin
    cant := cant + 1;
    if not esCaracterVal(c) then 
      valido := false;
    read(c);
  end;
  readln;
  if (cant = 0) then
    valido := false;
end;

procedure leerJugador(var p: puntaje; var c: codigo; var nickValido: boolean; i: integer);
begin
  writeln('Introduzca puntaje del jugador ', i);
  readln(p);
  writeln('Introduzca codigo del jugador ', i);
  readln(c);
  writeln('Introduzca nick del jugador ', i);
  procesarNick(nickValido);
end;

procedure actualizarMaximos(p: puntaje; c: codigo; var max1, max2, maxCod: integer);
begin
  if (p > max1) then
  begin
    max2 := max1;
    max1 := p;
    maxCod := c; // codigo a procesar
  end
  else if (p > max2) then
    max2 := p;
end;

procedure procesarCodigo(c: integer; var impares, suma: integer);
var
  act: integer;
begin
  impares := 0;
  suma := 0;
  while (c <> 0) do
  begin
    act := c mod 10;
    if (act mod 2 <> 0) then
      impares := impares + 1;
    suma := suma + act;
    c := c div 10; // fin
  end;
end;

var
  p: puntaje;
  c: codigo;
  max1, max2, maxCod, cantValidos, i, sumaCifras, cantImpares: integer;
  nickValido: boolean;

begin
  max1 := -1;
  max2 := -1;
  maxCod := -1;
  cantValidos := 0;

  for i := 1 to jugadores do
  begin
    leerJugador(p, c, nickValido, i);
    actualizarMaximos(p, c, max1, max2, maxCod);
    if nickValido then
      cantValidos := cantValidos + 1;
  end;

  writeln('maximo 1: ', max1);
  writeln('maximo 2: ', max2);

  procesarCodigo(maxCod, cantImpares, sumaCifras); // 73
  writeln('Suma de cifras: ', sumaCifras);
  writeln('Cantidad de cifras impares: ', cantImpares);

  writeln('Cantidad de nicks validos: ', cantValidos);
end.
