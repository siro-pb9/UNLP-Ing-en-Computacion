{
El torneo clasificatorio “Pixel Cup” avanzó a la fase de equipos. Cada jugador pertenece a un equipo, y durante la partida
recolecta “power-ups” (mejoras) identificados con letras entre la 'A' y la 'F'. Se desea analizar el desempeño de cada
equipo y del torneo en su conjunto.
Los datos de los jugadores se leen ordenados por equipo: primero se ingresan, uno a uno, todos los jugadores de un
equipo, y luego los del siguiente equipo, y así. Para cada jugador se ingresan, en este orden:
• El nombre del equipo al que pertenece (cadena de hasta 20 caracteres).
• El nombre del jugador (cadena de hasta 20 caracteres).
• El puntaje obtenido en la partida (número entero entre 0 y 1000).
• Los power-ups recolectados, ingresados carácter a carácter (letras entre 'A' y 'F', pudiendo repetirse o venir en
cualquier orden) y finalizados con un punto ('.'). No almacenar repetidos.
La carga de datos de jugadores finaliza cuando se ingresa la palabra “FIN” como nombre de equipo, que debe procesarse.
Se debe informar:
a. El puntaje total acumulado por el equipo y el nickname del jugador con mayor puntaje dentro de ese equipo.
b. La cantidad de jugadores del equipo que recolectaron simultáneamente los power-ups 'A' y 'C'.
c. El nombre del equipo con mayor puntaje total acumulado en todo el torneo, y el promedio general de puntaje
considerando a todos los jugadores ingresados.
Requerimientos de implementación:
• Realizar el diseño top-down del ejercicio propuesto.
• Realizar los módulos necesarios para leer y procesar los datos de cada jugador.
• El ingreso del power-ups finaliza al procesar el carácter punto ('.').
• Representar los power-ups recolectados por cada jugador mediante un conjunto (set of char) con elementos entre
'A' y 'F'.
• Utilizar el tipo string para el nombre del equipo y nombre del jugador (en la próxima entrega se validará
nuevamente el nickname).
• Implementar un módulo específico que, dado un conjunto de power-ups, determine si contiene simultáneamente
a 'A' y a 'C' .
}

program ViolaCiroEtapa2;

const
  CORTE_EQ = 'FIN';
  FIN_POWERS = '.';

type
  str = string[20];
  subPunt = 0..1000;
  conjPowers = set of 'A'..'F';

  jugador = record
    equipo: str;
    nombre: str;
    puntaje: subPunt;
    powers: conjPowers;
  end;

procedure leerPowers(var powers: conjPowers);
var
  c: char;
begin
  powers := [];
  read(c);
  while (c <> FIN_POWERS) do
  begin
    if (c in ['A'..'F']) then
      powers := powers + [c];
    read(c);
  end;
  readln;
end;

procedure leerJugador(var j: jugador);
begin
  readln(j.equipo);
  readln(j.nombre);
  readln(j.puntaje);
  leerPowers(j.powers);
end;

function tieneAyC(powers: conjPowers): boolean;
begin
  tieneAyC := ('A' in powers) and ('C' in powers);
end;

procedure actMaxJug(nom: str; punt: integer; var maxPunt: integer; var maxNom: str);
begin
  if (punt > maxPunt) then
  begin
    maxPunt := punt;
    maxNom := nom;
  end;
end;

procedure actMaxEq(eq: str; punt: integer; var maxPunt: integer; var maxEq: str);
begin
  if (punt > maxPunt) then
  begin
    maxPunt := punt;
    maxEq := eq;
  end;
end;

var
  j: jugador;
  actEq, maxJugEq, maxEqTorneo: str;
  puntEq, maxPuntJug, cantAyCEq: integer;
  maxPuntEq, totPuntTorneo, totJugTorneo: integer;
  esUltEq: boolean;

begin
  maxPuntEq := -1;
  maxEqTorneo := '';
  totPuntTorneo := 0;
  totJugTorneo := 0;
  esUltEq := false;

  leerJugador(j);

  while not esUltEq do
  begin
    actEq := j.equipo;
    if (actEq = CORTE_EQ) then
      esUltEq := true;

    puntEq := 0;
    maxPuntJug := -1;
    maxJugEq := '';
    cantAyCEq := 0;

    while (j.equipo = actEq) do
    begin
      puntEq := puntEq + j.puntaje;
      totJugTorneo := totJugTorneo + 1;
      totPuntTorneo := totPuntTorneo + j.puntaje;

      actMaxJug(j.nombre, j.puntaje, maxPuntJug, maxJugEq);

      if tieneAyC(j.powers) then
        cantAyCEq := cantAyCEq + 1;

      if esUltEq then
        break
      else
        leerJugador(j);
    end;

    writeln('Puntaje total del equipo ', actEq, ': ', puntEq);
    writeln('Jugador con mayor puntaje: ', maxJugEq);
    writeln('Cantidad de jugadores con A y C: ', cantAyCEq);

    actMaxEq(actEq, puntEq, maxPuntEq, maxEqTorneo);
  end;

  writeln('Equipo con mayor puntaje total: ', maxEqTorneo);
  if (totJugTorneo > 0) then
    writeln('Promedio general de puntaje: ', (totPuntTorneo / totJugTorneo):0:2)
  else
    writeln('No se registraron jugadores.');
  readln;
end.
