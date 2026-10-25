{El torneo “Pixel Cup” llegó a la fase de grupos. Participan 8 equipos, y cada uno jugó 5 rondas durante esta
fase. Además, cada equipo tiene un capitán, y a lo largo del torneo se fueron registrando los jugadores
expulsados por conducta antideportiva.
Se dispone de una estructura que almacena para los 8 equipos el puntaje obtenido en cada una de las 5 rondas.
1 - Leer la siguiente información:
• Almacenar para cada uno de los 8 equipos: el nickname de su capitán. El nickname se ingresa
carácter a carácter y finaliza con un punto ('.'). Tiene como máximo 20 caracteres.
• Generar una lista de jugadores expulsados, que contenga el nombre del jugador expulsado y el número
de equipo (1 a 8) al que pertenecía. La carga de la lista finaliza cuando se ingresa la palabra “FIN”
como nombre del jugador expulsado. Esta lista debe quedar ordenada por número de equipos.
2 - Una vez finalizada la carga. Calcular e informar:
a. Para cada equipo: el puntaje total obtenido sumando sus 5 rondas, y el número de la ronda en la que
logró su mayor puntaje.
b. La cantidad de capitanes cuyo nickname es válido. Un nickname es válido si contiene solamente letras
minúsculas y números (mismo criterio que en la Etapa 1).
c. El número del equipo con mayor puntaje total del torneo, y el nombre del primer jugador expulsado
(aprovechar el orden de la listas) que haya pertenecido a ese equipo. Si ningún expulsado perteneció a
ese equipo, informar que no hay expulsados de ese equipo.}

program ViolaCiroEtapa3;

const
  CANT_EQ = 8;
  CANT_RONDAS = 5;
  MAX_NICK = 20;
  FIN_CHAR = '.';
  CORTE_EXP = 'FIN';

type
  rangoEq = 1..CANT_EQ;
  rangoRonda = 1..CANT_RONDAS;
  str = string[20];

  matPunt = array[rangoEq, rangoRonda] of integer;

  vecChar = array[1..MAX_NICK] of char;
  tNick = record
    v: vecChar;
    dl: integer;
  end;
  vecCap = array[rangoEq] of tNick;

  expulsado = record
    nom: str;
    eq: rangoEq;
  end;

  lista = ^nodo;
  nodo = record
    dato: expulsado;
    sig: lista;
  end;

procedure cargarMat(var m: matPunt);
var
  e: rangoEq;
  r: rangoRonda;
begin
  for e := 1 to CANT_EQ do
    for r := 1 to CANT_RONDAS do
      m[e, r] := (e * 10) + r * 5;
end;

procedure leerNick(var n: tNick);
var
  c: char;
begin
  n.dl := 0;
  read(c);
  while (c <> FIN_CHAR) do // punto pq fin es por EXP
  begin
    if (n.dl < MAX_NICK) then
    begin
      n.dl := n.dl + 1;
      n.v[n.dl] := c;
    end;
    read(c);
  end;
  readln;
end;

procedure leerCapitanes(var caps: vecCap);
var
  i: rangoEq;
begin
  for i := 1 to CANT_EQ do
    leerNick(caps[i]);
end;

function esCarVal(c: char): boolean;
begin
  esCarVal := ((c >= 'a') and (c <= 'z')) or ((c >= '0') and (c <= '9'));
end;

function validarNick(const n: tNick): boolean;
var
  i: integer;
  ok: boolean;
begin
  if (n.dl = 0) then
    validarNick := false
  else
  begin
    i := 1;
    ok := true;
    while (i <= n.dl) and ok do
    begin
      if not esCarVal(n.v[i]) then
        ok := false;
      i := i + 1;
    end;
    validarNick := ok;
  end;
end;

function contarCapsVal(const caps: vecCap): integer;
var
  i: rangoEq;
  cant: integer;
begin
  cant := 0;
  for i := 1 to CANT_EQ do
    if validarNick(caps[i]) then
      cant := cant + 1;
  contarCapsVal := cant;
end;

procedure insertarOrdenado(var l: lista; e: expulsado);
var
  nue, ant, act: lista;
begin
  new(nue);
  nue^.dato := e;
  ant := nil;
  act := l;
  while (act <> nil) and (act^.dato.eq <= e.eq) do // ordenar por equipo
  begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = nil) then
  begin
    nue^.sig := l;
    l := nue;
  end
  else
  begin
    ant^.sig := nue;
    nue^.sig := act;
  end;
end;

procedure leerExpulsado(var e: expulsado);
begin
  readln(e.nom);
  if (e.nom <> CORTE_EXP) then // este es FIN
    readln(e.eq);
end;

procedure cargarExpulsados(var l: lista);
var
  e: expulsado;
begin
  l := nil;
  leerExpulsado(e);
  while (e.nom <> CORTE_EXP) do 
  begin
    insertarOrdenado(l, e);
    leerExpulsado(e);
  end;
end;

procedure procFilaEq(const m: matPunt; eq: rangoEq; var totPunt: integer; var maxRonda: rangoRonda);
var
  r: rangoRonda;
  maxPunt: integer;
begin
  totPunt := 0;
  maxPunt := -1;
  maxRonda := 1;
  for r := 1 to CANT_RONDAS do
  begin
    totPunt := totPunt + m[eq, r];
    if (m[eq, r] > maxPunt) then
    begin
      maxPunt := m[eq, r];
      maxRonda := r;
    end;
  end;
end;

function buscarPrimerExp(l: lista; eqBuscado: rangoEq; var nom: str): boolean;
var
  act: lista;
begin
  act := l;
  while (act <> nil) and (act^.dato.eq < eqBuscado) do
    act := act^.sig;
  if (act <> nil) and (act^.dato.eq = eqBuscado) then
  begin
    nom := act^.dato.nom;
    buscarPrimerExp := true;
  end
  else
    buscarPrimerExp := false;
end;

var
  mat: matPunt;
  caps: vecCap;
  lExp: lista;
  i, maxEqTorneo: rangoEq;
  totPuntEq, maxPuntTorneo: integer;
  maxRondaEq: rangoRonda;
  nomPrimerExp: str;

begin
  cargarMat(mat);
  leerCapitanes(caps);
  cargarExpulsados(lExp);

  maxPuntTorneo := -1;
  maxEqTorneo := 1;

  for i := 1 to CANT_EQ do
  begin
    procFilaEq(mat, i, totPuntEq, maxRondaEq);
    writeln('Eq ', i, ': ', totPuntEq, ' R', maxRondaEq);
    if (totPuntEq > maxPuntTorneo) then
    begin
      maxPuntTorneo := totPuntEq;
      maxEqTorneo := i;
    end;
  end;

  writeln('Caps val: ', contarCapsVal(caps));

  writeln('Eq max: ', maxEqTorneo);
  if buscarPrimerExp(lExp, maxEqTorneo, nomPrimerExp) then
    writeln('Exp: ', nomPrimerExp)
  else
    writeln('Sin exp');

  readln;
end.